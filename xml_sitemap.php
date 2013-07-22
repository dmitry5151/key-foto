<?php
/*
  Модуль "XML Sitemap для ShopCMS"
  2011 (c) http://shopcms-moduli.com/
  Техническая поддержка - soulmare@gmail.com
  Лицензия - MIT http://www.opensource.org/licenses/mit-license.php
*/


// Check engine version
if(is_dir(dirname($_SERVER['SCRIPT_FILENAME']) . '/core'))
  define('MODX_MODERN_ENGINE', 1);
else
  define('MODX_MODERN_ENGINE', 0);

define('MODX_READ_BUFFER_SIZE', 2048);


function http_404() {
  header('HTTP/1.0 404 Not Found');
  header('Content-Type: text/html; charset=utf-8');
  echo '<html>
  <head>
    <title>404 Страница не найдена</title>
  </head>
  <body>
    <h1>404 Страница не найдена</h1>
    <p>Карта сайта не сгенерирована</p>
  </body>
</html>';
}


function http_200() {
  header('HTTP/1.0 200 OK');
  header('Content-Type: text/xml; charset=utf-8');
}


function http_500($error) {
  header('HTTP/1.0 500 Internal server error');
  header('Content-Type: text/html; charset=utf-8');
  echo '<html>
  <head>
    <title>500 Внутренняя ошибка сервера</title>
  </head>
  <body>
    <h1>500 Внутренняя ошибка сервера</h1>
    <p>' . htmlspecialchars($error) . '</p>
  </body>
</html>';
}


$sitemapDir = dirname($_SERVER['SCRIPT_FILENAME']) . (MODX_MODERN_ENGINE ? '/core' : '') . '/temp';
if(isset($_GET['index'])) // Return the specified file
  $xmlFile = $sitemapDir . '/sitemap-' . intval($_GET['index']) . '.xml';
else {
  $files = Array();
  for($i = 1; $i < 100; $i++)
    if(file_exists($sitemapDir . '/sitemap-' . $i . '.xml'))
      $files[$i] = $sitemapDir . '/sitemap-' . $i . '.xml';

  if(count($files)) {
  
    if(1 == count($files)) // If have just one file, return it
      $xmlFile = $files[1];
    else { // Have mutiple files, return index

      http_200();
      echo '<?xml version="1.0" encoding="UTF-8"?>
<sitemapindex xmlns="http://www.sitemaps.org/schemas/sitemap/0.9">
';
      foreach($files as $index=>$file) {
        $url = 'http://' . $_SERVER['HTTP_HOST'] . (MODX_MODERN_ENGINE ? '/core' : '') . '/temp/sitemap-' . $index . '.xml';
        echo '   <sitemap>
      <loc>' . $url . '</loc>
   </sitemap>
';
      }
      
      echo '</sitemapindex>
';
    }
  
  } else http_404(); // No files

}


if(isset($xmlFile) && is_file($xmlFile) && ($fileSize = filesize($xmlFile))) {

  // Read file
  if($handle = @fopen($xmlFile, 'r')) {

    // Response headers
    http_200();
    header('Content-Length: ' . $fileSize);
    
    while(!feof($handle))
      echo fread($handle, MODX_READ_BUFFER_SIZE);

  } else
    http_500('Ошибка при открытии XML файла');

} elseif(isset($xmlFile)) http_404(); // File defined but not exists


?>
