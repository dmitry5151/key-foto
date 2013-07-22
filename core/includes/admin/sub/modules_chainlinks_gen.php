<?php
/*
  Модуль "Перелинковка кольцевыми ссылками для ShopCMS"

  2009-2012 (c) http://shopcms-moduli.com/
  Техническая поддержка - soulmare@gmail.com
  Лицензия: MIT - http://www.opensource.org/licenses/mit-license.php
  hash=1842853355
  version=20120319
*/


if (!strcmp($sub, "chainlinks_gen")) {
	if ( CONF_BACKEND_SAFEMODE != 1 && (!isset($_SESSION["log"]) || !in_array(13,$relaccess))) //unauthorized
	{
		$smarty->assign("admin_sub_dpt", "error_forbidden.tpl");
	} else {


		if( !empty( $_POST['fACTION'] ) && isset( $_POST['linksCount'] ) ) {
		
			$countLinksGen = 0;
			
			// Get Categories ID list
	    $catIdList = preg_split('/,+\s?/', $_POST['catlist'], -1, PREG_SPLIT_NO_EMPTY);
	    $catIdList = array_map('trim', $catIdList);
	    $catIdList = array_map('intval', $catIdList);
	    $catIdListFiltered = Array();
	    foreach($catIdList as $catId)
	      if(!array_search($catId, $catIdListFiltered) && intval($catId))
	        $catIdListFiltered[] = $catId;
	    $catListStr = count($catIdListFiltered) ? implode(',', $catIdListFiltered) : '';

      // Store categories list
      $sql = '
          UPDATE ' . SETTINGS_TABLE . '
          SET
            settings_value = \'' . $catListStr . '\'
          WHERE
            settings_constant_name = \'CONF_CHAINLINKS_CATLIST\'
          LIMIT 1
          ';
      db_query( $sql );

			// Get all products list
			$whereClause = $catListStr ? " AND categoryID IN ( $catListStr )" : '';
			$q = 'SELECT productID, categoryID 
								FROM '.PRODUCTS_TABLE.'
								WHERE enabled = 1 ' . $whereClause . '
								ORDER BY categoryID, productID';
			$result = db_query( $q );

			// Dump products into array like:
			// 	@products[categoryId][incrIndex] => productID
			$products = Array();
			while( $row = db_fetch_row( $result ) ) {
				$productId = $row['productID'];
				$categoryId = $row['categoryID'];
			
				$products[$categoryId][] = $productId;
			}

			// Get all non-empty categories
			$whereClause = $catListStr ? " AND c.categoryID IN ( $catListStr )" : '';
			$q = 'SELECT c.categoryID, COUNT(productID) AS productsCount
					FROM '.CATEGORIES_TABLE.' c, '.PRODUCTS_TABLE.' p
					WHERE c.categoryID = p.categoryID ' . $whereClause . '
					GROUP BY c.categoryID
					ORDER BY c.categoryID';
			$result = db_query( $q );
			// Dump cathegories list into array like:
			#	@caths[categoryID] => productsCount
			$caths = Array();
			// Cathegory ID which has maximum products count in it
			$maxCountCathId = -1;
			$maxCount = 0;
			while( $row = db_fetch_row( $result ) ) {
				$caths[$row['categoryID']] = $row['productsCount'];
				// Check if new maximum was found
				if( $row['productsCount'] > $maxCount ) {
					$maxCount = $row['productsCount'];
					$maxCountCathId = $row['categoryID'];
				}
			}

			// Generate chain models - ways to go through the caths list
			$chainBranches = ( (int) $_POST['linksCount'] >= 0 ) ? (int) $_POST['linksCount'] : 3;
			$chainBranches = ( $chainBranches <= 10 ) ? $chainBranches : 10;
			$cathList = array_keys( $caths );
			$cathCount = count( $cathList );
			$chainModels = Array();
			for( $i=1; $i<=$chainBranches; $i++ ) {
				$model = Array();
				foreach( $cathList as $cathNum=>$cathId) {
					$index = $cathNum*$i - $cathCount * (int) ($cathNum * $i / $cathCount);
					$model[] = $cathList[$index];
			//		$model[] = $index;
				}
				$chainModels[] = $model;
			}

			// Generate wishlist chains
			$chainId = 0;
			$chainMinLength = 3;
			$chains = Array();
			foreach( $chainModels as $model ) {
				$prodMap = $products;
				// Shuffle products
				foreach( $prodMap as $id=>$prodSet )
					shuffle( $prodMap[$id] );
				while( !$chainId || ( count( $chains[$chainId-1] ) >= $chainMinLength ) ) {
					foreach( $model as $cathId ) {
						if( $prodMap[$cathId] ) $chains[$chainId][] = array_pop( $prodMap[$cathId] );
					}
					$chainId++;
				}
				unset( $chains[$chainId--] );
			}

			// Cleanup chains
			if(intval($_POST['linksCount']) <= 0) {
		    $q = 'TRUNCATE '.RELATED_PRODUCTS_TABLE;
		    db_query( $q );
			}
			
			// Create chains in database
			foreach( $chains as $chainId=>$chain ) {
				for( $i=1; isset($chain[$i]); $i++ ) {
					$query = 'INSERT INTO '.RELATED_PRODUCTS_TABLE." VALUES ({$chain[$i]},{$chain[$i-1]})";
					db_query( $query );
					if( db_query( $query ) ) $countLinksGen++;
				}
				$query = 'INSERT INTO '.RELATED_PRODUCTS_TABLE." VALUES ({$chain[0]},{$chain[$i-1]})";
				if( db_query( $query ) ) $countLinksGen++;
			}

			$smarty->assign( 'resultMsg', sprintf( 'Сгенерировано %d ссылок', $countLinksGen ) );

		}


		if( !defined( 'CONF_CHAINLINKS_AUTO' ) ) {
			echo '<div>First module launch</div>';

			$query = 'insert into '.SETTINGS_TABLE." (settings_groupID,settings_constant_name, settings_value, settings_title,settings_description,settings_html_function, sort_order) VALUES ( 2,'CONF_CHAINLINKS_AUTO','0', 'Перелинковка новых товаров', 'Автоматически генерировать ссылки для товаров, добавляемых в магазин', 'setting_TEXT_BOX(0,',27);";
			db_query( $query );
			define( 'CONF_CHAINLINKS_AUTO', 0 );

			$query = 'insert into '.SETTINGS_TABLE." (settings_groupID,settings_constant_name, settings_value, settings_title,settings_description,settings_html_function, sort_order) VALUES ( 2,'CONF_CHAINLINKS_CATLIST','', 'Список категорий перелинковки', 'Список ID категорий через запятую. Если параметр задан - перелинковка ограничится только этими категориями', 'setting_TEXT_BOX(0,',27);";
			db_query( $query );
			define( 'CONF_CHAINLINKS_CATLIST', '' );

			if( db_insert_id() )
				die('<div style="color:green;">Модуль инсталлирован, обновите страницу</div>');
			else
				die('<div style="color:red;">Модуль не инсталлирован - ошибка при создании конфигурационных констант</div>');
		} 	

		$smarty->assign( 'linksCount', isset( $_POST['linksCount'] ) ? (int) $_POST['linksCount'] : (int) CONF_CHAINLINKS_AUTO );
		$smarty->assign( 'catlist', isset( $_POST['catlist'] ) ? $_POST['catlist'] : CONF_CHAINLINKS_CATLIST );

		// Set sub-department template
		$smarty->assign( 'admin_sub_dpt', 'chainlinks_gen.tpl' );
		}
	}
?>
