<?php
/*
  Модуль "XML Sitemap для ShopCMS"

  2011-2012 (c) http://shopcms-moduli.com/
  Техническая поддержка - soulmare@gmail.com
  Лицензия - MIT http://www.opensource.org/licenses/mit-license.php
  hash=1842853355
*/
//ini_set('display_errors',1);
error_reporting(E_ALL);

define('MODX_SITEMAP_MAX_FILESIZE', 10485760);
define('MODX_SITEMAP_MAX_ITEMS', 50000);

// Check engine version
if(is_dir(dirname($_SERVER['SCRIPT_FILENAME']) . '/core'))
  define('MODX_MODERN_ENGINE', 1);
else
  define('MODX_MODERN_ENGINE', 0);

// Compatibility with Friendly URLs module (autodetection)
define('MODX_FRIENDLY_URLS_COMPATIBILITY', 1);

// Use Friendly URLs module
if(file_exists(dirname($_SERVER['SCRIPT_FILENAME']) . '/url_rewriter.php'))
  require_once(dirname($_SERVER['SCRIPT_FILENAME']) . '/url_rewriter.php');

// Use Articles module
define('MODX_ARTICLES_MODULE', file_exists(dirname($_SERVER['SCRIPT_FILENAME']) . '/core/includes/admin/sub/modules_articles.php') ? 1 : 0);

function modx_get_new_sitemap_file($handle) {
  global $modxError, $smarty, $fileIndex, $sitemapDir, $xmlFile, $str, $itemsCount;

  // Write URLs to file
  if(fwrite($handle, $str . '</urlset>') === false) {
    $modxError = true;
    $smarty->assign('resultError', sprintf('Ошибка при записи в файл %s', $xmlFile));
  }
  fclose($handle);

  // Create next file
  $str = '<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
';
  $xmlFile = $sitemapDir . '/sitemap-' . (++$fileIndex) . '.xml';
  $itemsCount = 0;

  return @fopen($xmlFile, 'w');
}

$modxError = false;

$sitemapDir = dirname($_SERVER['SCRIPT_FILENAME']) . (MODX_MODERN_ENGINE ? '/core' : '') . '/temp';
$fileIndex = 1;
$itemsCount = 0;
$xmlFile = $sitemapDir . '/sitemap-1.xml';

if (!strcmp($sub, "xml_sitemap")) {
  if (CONF_BACKEND_SAFEMODE != 1 && (!isset($_SESSION["log"]) || !in_array(13,$relaccess))) //unauthorized
  {
    $smarty->assign("admin_sub_dpt", "error_forbidden.tpl");
  } else {

      if(isset($_POST['fACTION']) && ('gen_sitemap' == $_POST['fACTION'])) {

        // Delete old file(s)
        for($i = 1; $i < 100; $i++)
          if(file_exists($sitemapDir . '/sitemap-' . $i . '.xml'))
            @unlink($sitemapDir . '/sitemap-' . $i . '.xml');

        if($handle = @fopen($xmlFile, 'w')) {
        
          // File header
          $str = '<?xml version="1.0" encoding="UTF-8"?>
<urlset xmlns:xsi="http://www.w3.org/2001/XMLSchema-instance" xsi:schemaLocation="http://www.sitemaps.org/schemas/sitemap/0.9 http://www.sitemaps.org/schemas/sitemap/0.9/sitemap.xsd" xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
';


          // Catalog
          if(isset($_POST['includeCatalog']) && !$modxError) {

            // Get categories tree
            $catTree = catGetCategoryCListMin();
            // Write categories to file
            $str .= "  <!-- Categories -->\n";
            foreach($catTree as $cat) {
              // Category URL
              $uri = function_exists('fu_make_url') && $cat['uri'] && MODX_FRIENDLY_URLS_COMPATIBILITY ? fu_make_url($cat, true) : (CONF_MOD_REWRITE ? "category_{$cat['categoryID']}.html" : 'index.php?categoryID=' . $cat['categoryID']);
              $str .= "   <url>\n      <loc>http://" . CONF_SHOP_URL . "/$uri</loc>\n   </url>\n";
              $itemsCount++;

              // Check sitemap limitations
              if(($itemsCount >= MODX_SITEMAP_MAX_ITEMS) || (strlen($str) >= (MODX_SITEMAP_MAX_FILESIZE - 1024)))
                $handle = modx_get_new_sitemap_file($handle);

              // Category pagination URLs
              $pagesCount = (int) ($cat['products_count'] / CONF_PRODUCTS_PER_PAGE) + 1;
              if($pagesCount > 1)
                for($page=2; $page <= $pagesCount; $page++) {
                  if(function_exists('fu_make_url') && $cat['uri'] && MODX_FRIENDLY_URLS_COMPATIBILITY) {
                    $catUri = fu_make_url($cat, true);
                    $catUri = substr($catUri, 0, strlen($catUri)-1);
                    $uri =  $catUri . '-offset_' . ($page-1)*CONF_PRODUCTS_PER_PAGE . '/';
                  } else {
                    $offs = ($page-1) * CONF_PRODUCTS_PER_PAGE;
                    $uri = CONF_MOD_REWRITE ? "category_{$cat['categoryID']}_offset_$offs.html" : "index.php?categoryID={$cat['categoryID']}&amp;offset=$offs";
                  }
                  $str .= "   <url>\n      <loc>http://" . CONF_SHOP_URL . "/$uri</loc>\n   </url>\n";
                  $itemsCount++;

                  // Check sitemap limitations
                  if(($itemsCount >= MODX_SITEMAP_MAX_ITEMS) || (strlen($str) >= (MODX_SITEMAP_MAX_FILESIZE - 1024)))
                    $handle = modx_get_new_sitemap_file($handle);

                }
            }


            // Products
            $str .= "  <!-- Products -->\n";
            $fieldsList = function_exists('fu_make_url') && MODX_FRIENDLY_URLS_COMPATIBILITY ? 'productID, categoryID, uri, uri_opt_val' : 'productID';
            $sql = "SELECT $fieldsList
                    FROM " . PRODUCTS_TABLE . "
                    WHERE categoryID != 0
                          AND enabled = 1";
            $result = db_query($sql);

            // Write URLs to file
            while($row = db_fetch_row($result)) {
              $uri = MODX_FRIENDLY_URLS_COMPATIBILITY && function_exists('fu_make_url') && $row['uri'] ? fu_make_url($row, true) : "product_{$row['productID']}.html";
              $str .= "   <url>\n      <loc>http://" . CONF_SHOP_URL . "/$uri</loc>\n   </url>\n";
              $itemsCount++;

              // Check sitemap limitations
              if(($itemsCount >= MODX_SITEMAP_MAX_ITEMS) || (strlen($str) >= (MODX_SITEMAP_MAX_FILESIZE - 1024)))
                $handle = modx_get_new_sitemap_file($handle);

            }

          }


          // News
          if(isset($_POST['includeNews']) && !$modxError) {
            $str .= "  <!-- News -->\n";
            $fieldsList = function_exists('fu_make_url_news') && MODX_FRIENDLY_URLS_COMPATIBILITY ? 'NID, uri' : 'NID';
            $sql = "SELECT $fieldsList
                    FROM " . NEWS_TABLE;
            $result = db_query($sql);

            while($row = db_fetch_row($result)) {
              $uri = MODX_FRIENDLY_URLS_COMPATIBILITY && function_exists('fu_make_url_news') && $row['uri'] ? fu_make_url_news($row, true) : (CONF_MOD_REWRITE ? "show_news_{$row['NID']}.html" : 'index.php?fullnews=' . $row['NID']);
              $str .= "   <url>\n      <loc>http://" . CONF_SHOP_URL . "/$uri</loc>\n   </url>\n";
              $itemsCount++;

              // Check sitemap limitations
              if(($itemsCount >= MODX_SITEMAP_MAX_ITEMS) || (strlen($str) >= (MODX_SITEMAP_MAX_FILESIZE - 1024)))
                $handle = modx_get_new_sitemap_file($handle);

            }
          }


          // Statpages
          if(isset($_POST['includeStatpages']) && !$modxError) {
            $str .= "  <!-- Statpages -->\n";
            $sql = "SELECT aux_page_ID
                    FROM " . AUX_PAGES_TABLE;
            $result = db_query($sql);

            while($row = db_fetch_row($result)) {
              $uri = function_exists('fu_make_url_pages') && MODX_FRIENDLY_URLS_COMPATIBILITY ? fu_make_url_pages($row['aux_page_ID'], true) : (CONF_MOD_REWRITE ? "page_{$row['aux_page_ID']}.html" : 'index.php?show_aux_page=' . $row['aux_page_ID']);
              $str .= "   <url>\n      <loc>http://" . CONF_SHOP_URL . "/$uri</loc>\n   </url>\n";
              $itemsCount++;

              // Check sitemap limitations
              if(($itemsCount >= MODX_SITEMAP_MAX_ITEMS) || (strlen($str) >= (MODX_SITEMAP_MAX_FILESIZE - 1024)))
                $handle = modx_get_new_sitemap_file($handle);

            }
          }


          // Articles
          if(isset($_POST['includeArticles']) && !$modxError) {
            $str .= "  <!-- Articles -->\n";
            $sql = 'SELECT uri
                    FROM '.DB_PRFX.'articles';
            $result = db_query($sql);

            while($row = db_fetch_row($result)) {
              $uri = '/stati/'.$row['uri'].'.html';
              $str .= "   <url>\n      <loc>http://" . CONF_SHOP_URL . "$uri</loc>\n   </url>\n";
              $itemsCount++;

              // Check sitemap limitations
              if(($itemsCount >= MODX_SITEMAP_MAX_ITEMS) || (strlen($str) >= (MODX_SITEMAP_MAX_FILESIZE - 1024)))
                $handle = modx_get_new_sitemap_file($handle);

            }
          }
          

          // Write file footer
          if(!$modxError) {
            if(fwrite($handle, $str . '</urlset>') === false) {
              $modxError = true;
              $smarty->assign('resultError', sprintf('Ошибка при записи в файл %s', $xmlFile));
            }
          }

          fclose($handle);
          
          if(!$modxError)
            $smarty->assign('resultMsg', sprintf('Файл сгенерирован (%d байт)', filesize($xmlFile)));

        } else {
          $modxError = true;
          $smarty->assign('resultError', sprintf('Не могу создать или перезаписать файл %s', $xmlFile));
        }
        
    }

    // Get file modtime
    $xmlFileDate = file_exists($xmlFile) ? date('Y.m.d H:i:s', filemtime($xmlFile)) : null;
    if(is_null($xmlFileDate) && !$modxError) {
      $modxError = true;
      $smarty->assign('resultError', sprintf('Файл пока не сгенерирован %s', $xmlFile));
    } else
      $smarty->assign('sitemapFileDate', $xmlFileDate);

    $smarty->assign('admin_sub_dpt', 'xml_sitemap.tpl');
    $smarty->assign('sitemapUrl', 'http://' . CONF_SHOP_URL . '/sitemap.xml');
  
    if(MODX_ARTICLES_MODULE)
      $smarty->assign('moduleArticles', '1');

  }

}
?>
