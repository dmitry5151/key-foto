<?php
/*
  Модуль "ЧПУ для ShopCMS"

  2009-2012 (c) http://shopcms-moduli.com/
  Техническая поддержка - soulmare@gmail.com
  Лицензия: MIT - http://www.opensource.org/licenses/mit-license.php
  hash=1842853355
  version=20120120
*/


define('AUTO_TRANSLITERATOR_ITEMS_LIMIT', 2000);
//ini_set('display_errors', 1);
require_once('url_rewriter_config.php');


// Returns TRUE, if module is installed
function fu_is_installed() {

  // Check if the `uri` column exists in products table
  $q = db_query('SHOW COLUMNS FROM ' . PRODUCTS_TABLE);
  $cols = array();
  while($row = db_fetch_row($q))
    $cols[$row[0]] = true;
  
  return isset($cols['uri']);
}


function fu_slug_exists($slug, $itemType='cat') {

  if($slug = mysql_real_escape_string($slug)) {

    switch($itemType) {

      case 'cat':
      case 'prod':

          $sql = "SELECT productID AS 'itemID'
              FROM " . PRODUCTS_TABLE . "
              WHERE uri = '$slug'
            
              UNION
            
              SELECT categoryID AS 'itemID'
              FROM " . CATEGORIES_TABLE . "
              WHERE uri = '$slug'";
          $result = db_query($sql);

          return db_num_rows($result["resource"]) > 0;

        break;

      case 'news':
			  $sql = "SELECT NID
					  FROM " . NEWS_TABLE . "
					  WHERE uri = '$slug'
					  LIMIT 1";
        $result = db_query($sql);
        return db_num_rows($result["resource"]) > 0;
        break;

      case 'page':
			  $sql = "SELECT aux_page_ID
					  FROM " . AUX_PAGES_TABLE . "
					  WHERE uri = '$slug'
					  LIMIT 1";
        $result = db_query($sql);
        return db_num_rows($result["resource"]) > 0;
        break;

    } // END switch

  } else
    return 0;

}


/*
 Transliteration
 Copyright (C) 2006-2008 2z project (http://2z-project.com)
*/
function fu_translit($content, $whitespace = '-') {

  $utf2enS = Array('А'=>'A', 'Б'=>'B', 'В'=>'V', 'Г'=>'G', 'Ґ'=>'G', 'Д'=>'D', 'Е'=>'E', 'Ё'=>'JO', 'Є'=>'E', 'Ж'=>'Zh', 'З'=>'Z', 'И'=>'I', 'І'=>'I', 'Й'=>'I', 'Ї'=>'I', 'К'=>'K', 'Л'=>'L', 'М'=>'M', 'Н'=>'N', 'О'=>'O', 'П'=>'P', 'Р'=>'R', 'С'=>'S', 'Т'=>'T', 'У'=>'U', 'Ў'=>'U', 'Ф'=>'F', 'Х'=>'H', 'Ц'=>'C', 'Ч'=>'Ch', 'Ш'=>'Sh', 'Щ'=>'Sz', 'Ъ'=>'', 'Ы'=>'Y', 'Ь'=>'', 'Э'=>'E', 'Ю'=>'Yu', 'Я'=>'Ya');
  $utf2enB = array('а'=>'a', 'б'=>'b', 'в'=>'v', 'г'=>'g', 'ґ'=>'g', 'д'=>'d', 'е'=>'e', 'ё'=>'jo', 'є'=>'e', 'ж'=>'zh', 'з'=>'z', 'и'=>'i', 'і'=>'i', 'й'=>'i', 'ї'=>'i', 'к'=>'k', 'л'=>'l', 'м'=>'m', 'н'=>'n', 'о'=>'o', 'п'=>'p', 'р'=>'r', 'с'=>'s', 'т'=>'t', 'у'=>'u', 'ў'=>'u', 'ф'=>'f', 'х'=>'h', 'ц'=>'c', 'ч'=>'ch', 'ш'=>'sh', 'щ'=>'sz', 'ъ'=>'', 'ы'=>'y', 'ь'=>'', 'э'=>'e', 'ю'=>'yu', 'я'=>'ya', '&quot;'=>'', '&amp;'=>'', 'µ'=>'u', '№'=>'num');

  $content = trim(strip_tags($content));
  $content = strtr($content, $utf2enS);
  $content = strtr($content, $utf2enB);
  $content = preg_replace("/\s+/ms", $whitespace, $content);
  $content = preg_replace("/[ ]+/", $whitespace, $content);

  //$cut = ($allowDash) ? "/[^a-z0-9_\-\.]+/mi" : "/[^a-z0-9_\.]+/mi";
  $cut = "/[^a-z0-9_\-\.]+/mi";
  $content = preg_replace($cut, "", $content);
  $content = preg_replace('|\-+|', $whitespace, $content);
  //$content = preg_replace('|[^\w]+$|', '', $content);

  return $content;
}


function fu_reset_slugs($objectsType='cat') {

  switch($objectsType) {

    case 'cat':
      $sql = 'UPDATE ' . CATEGORIES_TABLE . ' SET uri = NULL';
      db_query($sql);

      $sql = 'UPDATE ' . PRODUCTS_TABLE . ' SET uri = NULL';
      db_query($sql);
      break;

    case 'news':
      $sql = 'UPDATE ' . NEWS_TABLE . ' SET uri = NULL';
      db_query($sql);
      break;

    case 'pages':
      $sql = 'UPDATE ' . AUX_PAGES_TABLE . ' SET uri = NULL';
      db_query($sql);
      break;

  }
}


function fu_get_cats_to_process($limit=10) {
  $limit = (int) $limit;
  $sql = 'SELECT categoryID, name, uri
        FROM ' . CATEGORIES_TABLE . '
        WHERE uri IS NULL
        LIMIT ' . $limit;
  $result = db_query($sql);

  $rows = array();
  while($row = db_fetch_row($result))
    $rows[] = $row;

  return $rows;
}


function fu_get_prods_to_process($limit=10) {
  $limit = (int) $limit;
  $sql = 'SELECT productID, name, uri
        FROM ' . PRODUCTS_TABLE . '
        WHERE uri IS NULL
        LIMIT ' . $limit;
  $result = db_query($sql);

  $rows = array();
  while($row = db_fetch_row($result))
    $rows[] = $row;

  return $rows;
}


function fu_get_news_to_process($limit=10) {
  $limit = (int) $limit;
  $sql = 'SELECT NID, title, uri
        FROM ' . NEWS_TABLE . '
        WHERE uri IS NULL
        LIMIT ' . $limit;
  $result = db_query($sql);

  $rows = array();
  while($row = db_fetch_row($result))
    $rows[] = $row;

  return $rows;
}


function fu_get_pages_to_process($limit=10) {
  $limit = (int) $limit;
  $sql = 'SELECT aux_page_ID, aux_page_name, uri
        FROM ' . AUX_PAGES_TABLE . '
        WHERE uri IS NULL
        LIMIT ' . $limit;
  $result = db_query($sql);

  $rows = array();
  while($row = db_fetch_row($result))
    $rows[] = $row;

  return $rows;
}


function fu_generate_slugs_cat($rewriteExistingSlugs=false, $lowercaseTranslit=false) {

  // Reset slugs
  if($rewriteExistingSlugs)
    fu_reset_slugs();
  
  $countCatsUpdated = 0;
  $countProdsUpdated = 0;

  // Process categories
  while(($items = fu_get_cats_to_process()) && ($countCatsUpdated + $countProdsUpdated < AUTO_TRANSLITERATOR_ITEMS_LIMIT))
    foreach($items as $item) {
      // Get unique slug
      $slugTranslitted = fu_translit($item['name'], FU_WHITESPACE);
      if($lowercaseTranslit)
        $slugTranslitted = strtolower($slugTranslitted);
      $slug = $slugTranslitted;
      $i = 0;
      while(fu_slug_exists($slug))
        $slug = $slugTranslitted . '_' . ++$i;
      // Update slug
      $sql = "UPDATE " . CATEGORIES_TABLE . "
          SET
            uri='$slug'
          WHERE categoryID='{$item['categoryID']}'
          LIMIT 1";
      $result = db_query($sql);
      $countCatsUpdated++;
    }

  // Process products
  while(($items = fu_get_prods_to_process()) && ($countCatsUpdated + $countProdsUpdated < AUTO_TRANSLITERATOR_ITEMS_LIMIT))
    foreach($items as $item) {
      // Get unique slug
      $slugTranslitted = fu_translit($item['name'], FU_WHITESPACE);
      if($lowercaseTranslit)
        $slugTranslitted = strtolower($slugTranslitted);
      $slug = $slugTranslitted;
      $i = 0;
      while(fu_slug_exists($slug))
        $slug = $slugTranslitted . '_' . ++$i;
      // Update slug
      $sql = "UPDATE " . PRODUCTS_TABLE . "
          SET
            uri='$slug'
          WHERE productID='{$item['productID']}'
          LIMIT 1";
      $result = db_query($sql);
      $countProdsUpdated++;
    }

  return Array('catsUpdated' => $countCatsUpdated, 'prodsUpdated' => $countProdsUpdated);
}


function fu_generate_slugs_news($rewriteExistingSlugs=false, $lowercaseTranslit=false) {

  // Reset slugs
  if($rewriteExistingSlugs)
    fu_reset_slugs('news');
  
  $countUpdated = 0;

  // Process items
  while(($items = fu_get_news_to_process()) && ($countUpdated < AUTO_TRANSLITERATOR_ITEMS_LIMIT))
    foreach($items as $item) {
      // Get unique slug
      $slugTranslitted = fu_translit($item['title'], FU_WHITESPACE);
      $slug = $slugTranslitted;
      if($lowercaseTranslit)
        $slug = strtolower($slug);
      $i = 0;
      while(fu_slug_exists($slug))
        $slug = $slugTranslitted . '_' . ++$i;
      // Update slug
      $sql = "UPDATE " . NEWS_TABLE . "
          SET
            uri='$slug'
          WHERE NID='{$item['NID']}'
          LIMIT 1";
      $result = db_query($sql);
      $countUpdated++;
    }

  return $countUpdated;
}


function fu_generate_slugs_pages($rewriteExistingSlugs=false, $lowercaseTranslit=false) {

  // Reset slugs
  if($rewriteExistingSlugs)
    fu_reset_slugs('pages');
  
  $countUpdated = 0;

  // Process items
  while(($items = fu_get_pages_to_process()) && ($countUpdated < AUTO_TRANSLITERATOR_ITEMS_LIMIT))
    foreach($items as $item) {
      // Get unique slug
      $slugTranslitted = fu_translit($item['aux_page_name'], FU_WHITESPACE);
      $slug = $slugTranslitted;
      if($lowercaseTranslit)
        $slug = strtolower($slug);
      $i = 0;
      while(fu_slug_exists($slug))
        $slug = $slugTranslitted . '_' . ++$i;
      // Update slug
      $sql = "UPDATE " . AUX_PAGES_TABLE . "
          SET
            uri='$slug'
          WHERE aux_page_ID='{$item['aux_page_ID']}'
          LIMIT 1";
      $result = db_query($sql);
      $countUpdated++;
    }

  return $countUpdated;
}


function fu_remove_ext_cat() {

  $countCatsUpdated = 0;
  $countProdsUpdated = 0;

  // Process categories
  $sql = "UPDATE " . CATEGORIES_TABLE . "
          SET
            uri = REPLACE(uri, '.html', '')";
  $result = db_query($sql);
  $countCatsUpdated += mysql_affected_rows();

  // Process products
  $sql = "UPDATE " . PRODUCTS_TABLE . "
          SET
            uri = REPLACE(uri, '.html', '')";
  $result = db_query($sql);
  $countProdsUpdated += mysql_affected_rows();

  return Array('catsUpdated' => $countCatsUpdated, 'prodsUpdated' => $countProdsUpdated);
}


function fu_remove_ext_news() {

  $countCatsUpdated = 0;
  $countProdsUpdated = 0;

  // Process categories
  $sql = "UPDATE " . NEWS_TABLE . "
          SET
            uri = REPLACE(uri, '.html', '')";
  db_query($sql);

  return mysql_affected_rows();
}


function fu_remove_ext_pages() {

  // Process categories
  $sql = "UPDATE " . AUX_PAGES_TABLE . "
          SET
            uri = REPLACE(uri, '.html', '')";
  db_query($sql);

  return mysql_affected_rows();
}


if (!strcmp($sub, "url_rewriter")) {

  if (CONF_BACKEND_SAFEMODE != 1 && (!isset($_SESSION["log"]) || !in_array(13,$relaccess)))   { //unauthorized

    $smarty->assign("admin_sub_dpt", "error_forbidden.tpl");

  } else {

      // Check if module is installed
      if(!fu_is_installed()) {

        echo '<div style="color:green;">Первый запуск модуля - инициализация</div>';

        $installedOk = true;

        // Add URI column into content tables
        db_query('ALTER TABLE '.PRODUCTS_TABLE.' ADD COLUMN uri_opt_val varchar(255) NOT NULL DEFAULT \'-1\'');
        db_query('ALTER TABLE '.PRODUCTS_TABLE.' ADD COLUMN uri VARCHAR(255) NULL');
        db_query('ALTER TABLE '.PRODUCTS_TABLE.' ADD UNIQUE KEY (uri)');
        db_query('ALTER TABLE '.CATEGORIES_TABLE.' ADD COLUMN uri VARCHAR(255) NULL');
        db_query('ALTER TABLE '.CATEGORIES_TABLE.' ADD UNIQUE KEY (uri)');
        db_query('ALTER TABLE '.NEWS_TABLE.' ADD COLUMN uri VARCHAR(255) NULL');
        db_query('ALTER TABLE '.NEWS_TABLE.' ADD UNIQUE KEY (uri)');
        db_query('ALTER TABLE '.AUX_PAGES_TABLE.' ADD COLUMN uri VARCHAR(255) NULL');
        db_query('ALTER TABLE '.AUX_PAGES_TABLE.' ADD UNIQUE KEY (uri)');

        // Remove stuff of previous module versions
        db_query('DELETE FROM '.SETTINGS_TABLE.' WHERE settings_constant_name = \'CONF_FU_SETTINGS\'');

        if($installedOk)
          die('<div style="color:green;">Модуль успешно установлен, пожалуйста перезагрузите страницу</div>');
        else
          die('<div style="color:red;">Модуль не установлен - ошибка при инсталяции</div>');
      }   

      if(isset($_POST['object']) && strstr($_POST['object'], 'cat_')) {

        $categoryID = (int) str_replace('cat_', '', $_POST['object']);

      }

      // Perform action
      if(isset($_POST['fACTION']))
        switch($_POST['fACTION']) {

          case 'url_rewriter':
            if($_POST['update_slug']) {
    
              $newSlug = $_POST['newSlug'] ? '\''.mysql_real_escape_string($_POST['newSlug']).'\'' : 'NULL';
              $itemIdData = explode('_', $_POST['itemID']);
              $itemType = $itemIdData[0];
              $itemId = (int) $itemIdData[1];

              switch($itemType) {

                case 'cat':
                case 'prod':
                  if(!fu_slug_exists($_POST['newSlug'])) {

                    if('prod' == $itemType) // Product
                      $sql = "UPDATE " . PRODUCTS_TABLE . "
                          SET
                            uri=$newSlug
                          WHERE productID='$itemId'
                          LIMIT 1";
                    else // Category
                      $sql = "UPDATE " . CATEGORIES_TABLE . "
                          SET
                            uri=$newSlug
                          WHERE categoryID='$itemId'
                          LIMIT 1";
                    $result = db_query($sql);

                    $smarty->assign('resultMsg', 'Адрес объекта успешно изменен');

                  } else
                    $smarty->assign('errorMsg', sprintf('Адрес "%s" уже существует в каталоге', $_POST['newSlug']));
                  break;


                case 'news':
                  if(!fu_slug_exists($_POST['newSlug'], 'news')) {

                    $sql = "UPDATE " . NEWS_TABLE . "
                        SET
                          uri=$newSlug
                        WHERE NID='$itemId'
                        LIMIT 1";
                    $result = db_query($sql);

                    $smarty->assign('resultMsg', 'Адрес объекта успешно изменен');

                  } else
                    $smarty->assign('errorMsg', sprintf('Адрес "%s" уже существует в новостях', $_POST['newSlug']));
                  break;

                case 'page':
                  if(!fu_slug_exists($_POST['newSlug'], 'page')) {

                    $sql = "UPDATE " . AUX_PAGES_TABLE . "
                        SET
                          uri=$newSlug
                        WHERE aux_page_ID='$itemId'
                        LIMIT 1";
                    $result = db_query($sql);

                    $smarty->assign('resultMsg', 'Адрес объекта успешно изменен');

                  } else
                    $smarty->assign('errorMsg', sprintf('Адрес "%s" уже существует в страницах', $_POST['newSlug']));
                  break;

              }
        
            }
            break;

          case 'url_transliterator':

            $smartyResultMsg = Array();

            if(isset($_POST['remHtmlExt']) && $_POST['remHtmlExt']) { // Remove .html

                // Process catalog
                if(isset($_POST['setCatSlugs']) && $_POST['setCatSlugs']) {

                  $result = fu_remove_ext_cat();
                  $smartyResultMsg[] = sprintf('Обновлены адреса для %d товаров и %d категорий', $result['prodsUpdated'], $result['catsUpdated']);

                }

                // Process news
                if(isset($_POST['setNewsSlugs']) && $_POST['setNewsSlugs']) {

                  $countUpdated = fu_remove_ext_news();
                  $smartyResultMsg[] = sprintf('Обновлены адреса для %d новостей', $countUpdated);

                }

                // Process pages
                if(isset($_POST['setPagesSlugs']) && $_POST['setPagesSlugs']) {

                  $countUpdated = fu_remove_ext_pages();
                  $smartyResultMsg[] = sprintf('Обновлены адреса для %d статических страниц', $countUpdated);

                }

            } else { // Generate URLs

              // Process catalog
              if(isset($_POST['setCatSlugs']) && $_POST['setCatSlugs']) {

                $result = fu_generate_slugs_cat(isset($_POST['rewriteExistingSlugs']) && $_POST['rewriteExistingSlugs'],
                                      isset($_POST['lowercase']) && $_POST['lowercase']);
                $smartyResultMsg[] = sprintf('Обновлены адреса для %d товаров и %d категорий', $result['prodsUpdated'], $result['catsUpdated']);

              }

              // Process news
              if(isset($_POST['setNewsSlugs']) && $_POST['setNewsSlugs']) {

                $countUpdated = fu_generate_slugs_news(isset($_POST['rewriteExistingSlugs']) && $_POST['rewriteExistingSlugs'],
                                      isset($_POST['lowercase']) && $_POST['lowercase']);
                $smartyResultMsg[] = sprintf('Обновлены адреса для %d новостей', $countUpdated);

              }

              // Process pages
              if(isset($_POST['setPagesSlugs']) && $_POST['setPagesSlugs']) {

                $countUpdated = fu_generate_slugs_pages(isset($_POST['rewriteExistingSlugs']) && $_POST['rewriteExistingSlugs'],
                                      isset($_POST['lowercase']) && $_POST['lowercase']);
                $smartyResultMsg[] = sprintf('Обновлены адреса для %d статических страниц', $countUpdated);

              }

            }

            $smarty->assign('resultMsg', implode("<br>\n", $smartyResultMsg));
            break;

        }
      
      if(isset($categoryID))
        $objectType = 'cat';
      else $objectType = isset($_POST['object']) ? $_POST['object'] : null;

      // Get categories tree
      $catTree = catGetCategoryCListMin();
      
      // Get objects list
      $objects = Array();
      switch($objectType) {

        case 'cat':
          $count = 3;
          $products = prdGetProductByCategory(array('categoryID'=>$categoryID, 'fullFlag'=>false), $count);
          foreach($catTree as $cat)
            if($cat['parent'] == $categoryID)
              $objects[] = Array('id' => 'cat_' . $cat['categoryID'], 'name' => $cat['name'], 'uri' => $cat['uri'], 'isFolder' => 1 );
          foreach($products as $product)
            $objects[] = Array('id' => 'prod_' . $product['productID'], 'name' => $product['name'], 'uri' => $product['uri'] );
          break;

        case 'news':
          $items = @newsGetAllNews(null, $stub);
          foreach($items as $item)
            $objects[] = Array('id' => 'news_' . $item['NID'], 'name' => $item['title'], 'uri' => $item['uri'] );
          break;

        case 'pages':
          $items = auxpgGetAllPageAttributes();
          foreach($items as $item)
            $objects[] = Array('id' => 'page_' . $item['aux_page_ID'], 'name' => $item['aux_page_name'], 'uri' => $item['uri'] );
          break;

      }
      
      // Strip item names $objects in array
      foreach($objects as $i=>$obj)
        $objects[$i]['name'] = html_entity_decode($obj['name'], ENT_QUOTES);
      
      // Set sub-department template
      $smarty->assign('admin_sub_dpt', 'url_rewriter.tpl');

      $smarty->assign('categoryID', isset($categoryID) ? $categoryID : null);
      $smarty->assign('catTree', $catTree);
      $smarty->assign('objects', $objects);
      $smarty->assign('object', isset($_POST['object']) ? $_POST['object'] : '');

    }
    
}
?>
