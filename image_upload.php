<?php
/*
  Модуль "Загрузка изображений для ShopCMS"
  2012 (c) http://shopcms-moduli.com
  Техническая поддержка - soulmare@gmail.com
  Лицензия - MIT http://www.opensource.org/licenses/mit-license.php
  version=20121212
  hash=119251688
*/

  error_reporting(E_ALL);
  ini_set('display_errors', 1);

  define('IMAGE_UPLOADER_DEBUG', 0); // Debug output will be written to core/cache/uploader.log
  
  if(IMAGE_UPLOADER_DEBUG)
    ob_start();

  include("core/config/connect.inc.php");
  include("core/config/init.php");
  include("core/config/tables.php");
  include("core/includes/database/mysql.php");
  include("core/functions/functions.php");
  include("core/functions/picture_functions.php");
  include("core/functions/setting_functions.php");
  include("core/functions/session_functions.php");
  include("core/functions/statistic_functions.php");

  // Connect to database
  define('ERROR_DB_INIT', 'Database connection problem!');
  db_connect(DB_HOST, DB_USER, DB_PASS) or die(ERROR_DB_INIT);
  db_select_db(DB_NAME) or die(db_error());

  settingDefineConstants();

	// Work-around for setting up a session because Flash Player doesn't send the cookies
	if(isset($_POST["PHPSESSID"])) {

    // Initialize ShopCMS session
    session_set_save_handler("sess_open", "sess_close", "sess_read", "sess_write", "sess_destroy", "sess_gc");
		session_id($_POST["PHPSESSID"]);

	  session_start();
	  
	  // Check for authorization
	  if($relaccess = checklogin()) {

      if(isset($_SESSION["log"]) && in_array(100, $relaccess) && (CONF_BACKEND_SAFEMODE != 1)) {

        // Check request
        if(isset($_POST['productID'])) {
          // Stub fields, needed by AddNewPictures() for "B" and "C" images auto-generation
          $_FILES[':STUB:'] = Array('error' => UPLOAD_ERR_NO_FILE);
          $_FILES[':STUB2:'] = Array('error' => UPLOAD_ERR_NO_FILE);

          AddNewPictures($_POST['productID'], 'image_file', ':STUB:', ':STUB2:');
          //print_r($_FILES);
          //print_r($_POST);
        } else echo 'Request check failed';
        
      } else echo 'Access denied. User credentials check failed';

	  } else echo 'Access denied. Login check failed';

	} else echo 'Access denied. Session check failed';

  if(IMAGE_UPLOADER_DEBUG) {
    @file_put_contents('core/cache/uploader.log', "\n\n".date("D M j G:i:s")."\n".ob_get_contents(), FILE_APPEND);
    ob_end_clean();
  }
	exit(0);
?>
