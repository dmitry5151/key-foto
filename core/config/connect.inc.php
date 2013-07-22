<?php
//database connection settings

define('DBMS', 'mysql');                      // database system  
define('DB_HOST', 'localhost');       // database host    
define('DB_USER', 'root');   // username         
define('DB_PASS', '');   // password         
define('DB_NAME', 'keys_foto');       // database name    
define('DB_PRFX', 'kreu_');     // database prefix  
/*
define('DBMS', 'mysql');                      // database system  
define('DB_HOST', 'keys.mysql');       // database host    
define('DB_USER', 'keys_mysql');   // username         
define('DB_PASS', 'vjjpiyix');   // password         
define('DB_NAME', 'keys_foto');       // database name    
define('DB_PRFX', 'kreu_');     // database prefix 
*/ 
// include table name file
include('core/config/tables.inc.php');
define('ALTERNATEPHP', '1');
?>