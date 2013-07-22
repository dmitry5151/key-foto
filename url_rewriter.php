<?php
/*
  Модуль "ЧПУ для ShopCMS"
  2009-2012 (c) http://shopcms-moduli.com
  Техническая поддержка - soulmare@gmail.com
  Лицензия - MIT http://www.opensource.org/licenses/mit-license.php
*/

  require_once('url_rewriter_config.php');

	define('FU_ROOT_DIR', dirname(__FILE__));
	define('FU_OPTION_ID', 0);

  $phpVersion = phpversion();
  define('FU_PHP_VERSION_MAJOR', $phpVersion[0]);

	// Access items by human readable URLs
	if(isset($_GET['uri'])) {

		$uri = $_GET['uri'];
		$uriEnc = @iconv('UTF-8', 'Windows-1251', $uri);
		if(!$uriEnc) $uriEnc = $uri;
		$uriFor = isset($_GET['uriFor']) && $_GET['uriFor'] ? $_GET['uriFor'] : 'product';

    if(isset($_GET['redirectFromOld'])) { // Redirect old URLs

      // Make new URL from old one
      $uri = str_replace('.html', '', $uri);
      switch($uriFor) {
        case 'product':
          $path = $_GET['category'] . '/' . $uri . '.html';
          break;
        case 'category':
          $path = $_GET['uri'] . '/';
          break;
      }

      // Punycode the domain name
      if(FU_PHP_VERSION_MAJOR > 4) {
        require_once(FU_ROOT_DIR . '/core/classes/class.idna_convert.php');
        $IDN = new idna_convert(array('idn_version' => 2008));
        $domain = $IDN->encode(iconv('Windows-1251', 'UTF-8', CONF_SHOP_URL));
      } else
        $domain = CONF_SHOP_URL;

			$newUrl = "http://$domain/" . $path;

			header('Content-Type: text/html; charset=utf-8');
			header ('HTTP/1.1 301 Moved Permanently');
			header ('Location: '.$newUrl);
?>
<html>
<head>
	<title>301 Moved Permanently<title>
<meta http-equiv="Content-Type" content="text/html; charset=windows-1251">
</head>
<body>
	<h1>301 Moved Permanently</h1>
	<h2>Страница переместилась</h2>
	<p>Если браузер не проследовал автоматически, пожалуйста перейдите на новый адрес этой страницы <a href="<?php echo $newUrl?>"><?php echo $newUrl?></a></p>
	<p><small>Страница сгенирирована модулем "ЧПУ УРЛ для ShopCMS".</small></p>
<body>
</html>
<?php
						die();
    }

		// Try to load item by URI
	
		$uri = mysql_real_escape_string($uri);
		$uriEnc = mysql_real_escape_string($uriEnc);

    switch($uriFor) {

      // Product
      case 'product':

			  $sql = "SELECT productID, categoryID
					  FROM ".PRODUCTS_TABLE."
					  WHERE uri = '$uri'
					  LIMIT 1";
				if(!$row = query_first($sql)) {
			    $sql = "SELECT productID, categoryID
					    FROM ".PRODUCTS_TABLE."
					    WHERE uri = '$uriEnc'
					    LIMIT 1";
					$row = query_first($sql);
				}

				
				if($row) {

          // Check category, if given
          if(isset($_GET['catUri'])) {
            $catUri_ = mysql_real_escape_string($_GET['catUri']);
            $catUriEnc_ = mysql_real_escape_string(@iconv('UTF-8', 'Windows-1251', $_GET['catUri']));
            if(!$catUriEnc_) $catUriEnc_ = $catUri_;
			      $sql = "SELECT categoryID
					      FROM ".CATEGORIES_TABLE."
					      WHERE uri = '$catUri_' OR uri = '$catUriEnc_'
					      LIMIT 1";

            // Check if category exists and product is there
					  $_GET['productID'] = ($rowCat = query_first($sql)) && $rowCat[0] == $row[1] ? $row[0] : -1;
					  if(-1 == $_GET['productID'])
      				$_GET['categoryID'] = -1;
          } else
  					$_GET['productID'] = $row[0];

				} else { // 404 not found
  				$_GET['categoryID'] = -1;
  		  }

        break;


      // Category
      case 'category':

        // Offset
        if(preg_match('|(.+)[-_]{1}offset_(\d+)$|', $uri, $matches)) {
          $uri = $matches[1];
          $offset = $matches[2];
        } elseif(preg_match('|(.+)[-_]{1}show_all$|', $uri, $matches)) {
          $uri = $matches[1];
          $offset = null;
          $showAll = 'yes';
        } else
          $offset = null;

    		$uriEnc = @iconv('UTF-8', 'Windows-1251', $uri);

			  $sql = "SELECT categoryID
					  FROM ".CATEGORIES_TABLE."
					  WHERE uri = '$uri' OR uri = '$uriEnc'
					  LIMIT 1";

				if($row = query_first($sql)) {

					$_GET['categoryID'] = $row[0];
          if(isset($showAll))
            $_GET['show_all'] = $showAll;
          else {
            $_GET['offset'] = $offset;
          }

				} else // 404 not found
  				$_GET['categoryID'] = -1;

        break;


      // News
      case 'news':

			  $sql = "SELECT NID
					  FROM ".NEWS_TABLE."
					  WHERE uri = '$uri' OR uri = '$uriEnc'
					  LIMIT 1";
				
				if($row = query_first($sql)) {

					$_GET['fullnews'] = $row[0];

				} else // 404 not found
  				$_GET['categoryID'] = -1;

        break;


      // Pages
      case 'pages':

			  $sql = "SELECT aux_page_ID
					  FROM ".AUX_PAGES_TABLE."
					  WHERE uri = '$uri' OR uri = '$uriEnc'
					  LIMIT 1";
				
				if($row = query_first($sql)) {

					$_GET['show_aux_page'] = $row[0];

				} else // 404 not found
  				$_GET['categoryID'] = -1;

        break;


    }

    //check_www_prefix();

		// Launch engine

	} else { // No URI

		// Access by ID must be redirected to URI if present
		if((isset($_GET['productID']) || isset($_GET['categoryID']) || isset($_GET['fullnews']) || isset($_GET['show_aux_page'])) && !isset($_GET['search']) && !isset($_GET['discuss']) && !isset($_GET['advanced_search_in_category']) && !isset($_GET['sort']) && !isset($_GET['vote']) && !isset($_GET['sent']) && !isset($_GET['search_with_change_category_ability']) && ($_SERVER['REQUEST_METHOD'] == 'GET')) {
			
			if(isset($_GET['productID'])) { // product

				$itemId = (int) $_GET['productID'];
				$sql = "SELECT p.uri, p.uri_opt_val, c.uri AS 'categorySlug', p.categoryID
						FROM ".PRODUCTS_TABLE." p
						LEFT JOIN ".CATEGORIES_TABLE." c
							ON p.categoryID = c.categoryID
						WHERE productID = '$itemId'
						LIMIT 1";

			} elseif(isset($_GET['categoryID'])) { // category

				$itemId = (int) $_GET['categoryID'];
				$sql = "SELECT uri
						FROM ".CATEGORIES_TABLE."
						WHERE categoryID = '$itemId'
						LIMIT 1";

			} elseif(isset($_GET['fullnews'])) { // news

				$itemId = (int) $_GET['fullnews'];
				$sql = "SELECT uri
						FROM ".NEWS_TABLE."
						WHERE NID = '$itemId'
						LIMIT 1";

			} elseif(isset($_GET['show_aux_page'])) { // pages

				$itemId = (int) $_GET['show_aux_page'];
				$sql = "SELECT uri
						FROM ".AUX_PAGES_TABLE."
						WHERE aux_page_ID = '$itemId'
						LIMIT 1";

			}

			// Get URI by ID
	
			if($queryResult = mysql_query($sql)) {
				if($row = mysql_fetch_row($queryResult)) {

					// Item has valid URI, redirect to it
					if($itemURI = $row[0]) {

						// Load engine settings
						if(!defined('CONF_FU_DEMO_MODE'))
							define('CONF_FU_DEMO_MODE', 1);

						// Generate new URL

            // Punycode the domain name
            if(FU_PHP_VERSION_MAJOR > 4) {
              require_once(FU_ROOT_DIR . '/core/classes/class.idna_convert.php');
              $IDN = new idna_convert(array('idn_version' => 2008));
              $domain = $IDN->encode(iconv('Windows-1251', 'UTF-8', CONF_SHOP_URL));
            } else
              $domain = CONF_SHOP_URL;

						$newUrl = "http://$domain/";

						if(isset($_GET['productID'])) { // Product

							$categorySlug = $row[2] ? $row[2] : 'category_'.$row[3];
							if(FU_ADD_CATEGORY_SLUG)
  							$newUrl .= $categorySlug.'/';
							$newUrl .= FU_OPTION_ID ? fu_get_option_slug($_GET['productID']).'/'.fu_urlencode($itemURI) . '.html' : fu_urlencode($itemURI) . '.html';

						} elseif(isset($_GET['categoryID'])) { // Category
						  if(isset($_GET['offset']) && ($_GET['offset'] > 1))
  							$newUrl .= urlencode($itemURI) . '-offset_' . intval($_GET['offset']) . '/';
						  else
  							$newUrl .= urlencode($itemURI) . '/';
						} elseif(isset($_GET['fullnews'])) { // News
  						$newUrl .= FU_NEWS_ROOT;
							$newUrl .= '/'.fu_urlencode($itemURI) . '.html';
						} elseif(isset($_GET['show_aux_page'])) { // Pages
  						$newUrl .= FU_PAGES_ROOT;
							$newUrl .= '/'.fu_urlencode($itemURI) . '.html';
						}

						header('Content-Type: text/html; charset=utf-8');
						header ('HTTP/1.1 301 Moved Permanently');
						header ('Location: '.$newUrl);
?>
<html>
<head>
	<title>301 Moved Permanently<title>
</head>
<body>
	<h1>301 Moved Permanently</h1>
	<h2>Страница переместилась</h2>
	<p>Если браузер не проследовал автоматически, пожалуйста перейдите на новый адрес этой страницы <a href="<?php echo $newUrl?>"><?php echo $newUrl?></a></p>
	<p><small>Страница сгенирирована модулем "ЧПУ УРЛ для ShopCMS". Разработка модуля <a href="http://trickywebs.org.ua/">trickywebs.org.ua</a></small></p>
<body>
</html>
<?php
						die();

					}
				
				}
			}

			
		}

    //check_www_prefix();

		// Launch engine

	}

	
	function fu_make_url($obj, $forceUrlencode=false) {
		global $fc;

		// Check if it's a correct object
		if(isset($obj['categoryID'])) {

			if(isset($obj['productID'])) { // Product

				if($obj['uri']) { // Rewrite URL

					// Get category slug
					if(isset($fc[$obj['categoryID']]) && $fc[$obj['categoryID']]['uri'])
						$pCatSlug = $fc[$obj['categoryID']]['uri'];
					else
						$pCatSlug = 'category_'.$obj['categoryID'];
					
					// Get option slug
					if(-1 == $obj['uri_opt_val']) { // undefined - define option slug
						// Get slug and update slug field
						$pOptSlug = fu_get_option_slug($obj['productID']);
					} else // Slug already defined, just use it
						$pOptSlug = $obj['uri_opt_val'];

          // ! something strange, url is encoded here sometimes
          $obj['uri'] = urldecode($obj['uri']);

					$url = ( FU_ADD_CATEGORY_SLUG ? fu_urlencode($pCatSlug, $forceUrlencode) : '') . '/' . fu_urlencode($obj['uri'], $forceUrlencode).'.html';

				} else { // Common URL
					$url = "product_{$obj['productID']}.html";
				}

			} else { // Category

				if($obj['uri']) { // Rewrite URL
					$url = fu_urlencode($obj['uri'], $forceUrlencode) . '/';
				} else { // Common URL
					$url = "category_{$obj['categoryID']}.html";
				}

			}

		} else
			$url = '';

		return $url;
	}
	
	
	function fu_make_url_news($obj, $forceUrlencode=false) {

		// Check object
		if(isset($obj['NID'])) {

			if($obj['uri']) { // Rewrite URL

				$url = FU_NEWS_ROOT . '/' . fu_urlencode($obj['uri'], $forceUrlencode) . '.html';

			} else { // Common URL
				$url = "show_news_{$obj['NID']}.html";
			}

		} else
			$url = '';

		return $url;
	}


	function fu_make_url_pages($pageId, $forceUrlencode=false) {
	  
    $pagesUriTable = get_pages_uri_table();

		// Check object
		if(isset($pagesUriTable[$pageId]) && $pagesUriTable[$pageId]) {

			$url = FU_PAGES_ROOT . '/' . fu_urlencode($pagesUriTable[$pageId], $forceUrlencode) . '.html';

		} else
			$url = "page_$pageId.html";

		return $url;
	}
	
	
	// Get associated array of pages' URIs
	function get_pages_uri_table() {
	  global $pagesUriTable;

    if(isset($pagesUriTable) && $pagesUriTable) return $pagesUriTable;
    else $pagesUriTable = Array();

	  $sql = 'SELECT aux_page_ID, uri
			  FROM ' . AUX_PAGES_TABLE;
	  
	  $result = db_query($sql);
	  while($row = db_fetch_assoc($result))
	    $pagesUriTable[$row['aux_page_ID']] = $row['uri'];
	  
	  return $pagesUriTable;
	}


	// Get slug and update slug field
	function fu_get_option_slug($productID) {
	
		// Get option value
		$productID = (int) $productID;
		$sql = "SELECT povvt.option_value AS optionValue
					FROM ".PRODUCTS_OPTIONS_SET_TABLE." AS post
					LEFT JOIN ".PRODUCTS_OPTIONS_VALUES_VARIANTS_TABLE." AS povvt
						ON povvt.variantID=post.variantID
					WHERE povvt.optionID=".FU_OPTION_ID." AND post.productID='$productID'

					UNION
					
					SELECT povt.option_value AS optionValue
					FROM ".PRODUCT_OPTIONS_VALUES_TABLE." AS povt
					LEFT JOIN ".PRODUCT_OPTIONS_TABLE." AS pot
					  ON pot.optionID = povt.optionID
					WHERE povt.productID = '$productID'

					LIMIT 1";
		$q = db_query($sql);

		if($row = db_fetch_assoc($q)) {
		  $decoded = function_exists('htmlspecialchars_decode') ? htmlspecialchars_decode(fu_translit($row['optionValue'])) : html_entity_decode(fu_translit($row['optionValue']));
			$optionValue = fu_urlencode(strtolower($decoded));
		} else
			$optionValue = '';

    if(!$optionValue) $optionValue = 'unknown';
		
		// Update slug field
		$optionValueSql = mysql_real_escape_string($optionValue);
		$sql = "UPDATE ".PRODUCTS_TABLE."
					SET uri_opt_val = '$optionValueSql'
					WHERE productID = '$productID'
					LIMIT 1";
		db_query($sql);
		
		return $optionValue;
	}


	// from http://www.softtime.ru/scripts/translit.php
	function fu_translit($st)	{

		// Сначала заменяем "односимвольные" фонемы.
		$st=strtr($st,"абвгдеёзийклмнопрстуфхъыэ_",
				"abvgdeeziyklmnoprstufh'iei");
		$st=strtr($st,"АБВГДЕЁЗИЙКЛМНОПРСТУФХЪЫЭ_",
				"ABVGDEEZIYKLMNOPRSTUFH'IEI");

		// Затем - "многосимвольные".
		$st=strtr($st, 
				array(
						"ж"=>"zh", "ц"=>"ts", "ч"=>"ch", "ш"=>"sh", 
						"щ"=>"shch","ь"=>"", "ю"=>"yu", "я"=>"ya",
						"Ж"=>"ZH", "Ц"=>"TS", "Ч"=>"CH", "Ш"=>"SH", 
						"Щ"=>"SHCH","Ь"=>"", "Ю"=>"YU", "Я"=>"YA",
						"ї"=>"i", "Ї"=>"Yi", "є"=>"ie", "Є"=>"Ye"
				   )
		);

		// Возвращаем результат.
		return $st;
	}


	function fu_punycode_encode($domainName) {
    if(FU_PHP_VERSION_MAJOR > 4) {
      require_once(FU_ROOT_DIR . '/core/classes/class.idna_convert.php');
      $IDN = new idna_convert(array('idn_version' => 2008));
      return $IDN->encode(iconv('Windows-1251', 'UTF-8', $domainName));
    } else
      return $domainName;
	}
	
	
	function query_first($sql) {

		if($queryResult = mysql_query($sql))
			if($row = mysql_fetch_row($queryResult))
			  return $row;

	}


	function query_first_assoc($sql) {

		if($queryResult = db_query($sql))
			if($row = db_fetch_assoc($queryResult))
			  return $row;

	}
	
	
	function fu_urlencode($url, $forceUrlencode=false) {
	  return (FU_URLENCODE || $forceUrlencode) ? urlencode(iconv('Windows-1251', 'UTF-8', $url)) : $url;
	}


?>
