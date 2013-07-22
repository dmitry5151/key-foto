<?php
/*****CONFIG*******/
/*
$dbname = "keys_foto";
$dbuser = "keys_mysql";
$dbpass = "vjjpiyix";
$dbhost = "keys.mysql";
$dbprfx = "kreu_";
*/
// Локальные настройки
$dbname = "keys_foto";
$dbuser = "root";
$dbpass = "";
$dbhost = "localhost";
$dbprfx = "kreu_";


function db_connect($host,$user,$pass) //create connection
{
        $r = mysql_connect($host,$user,$pass);
        $version = mysql_get_server_info($r);
        if(preg_match('/^5\./',$version) || preg_match('/^4\.[1-9]/',$version)){
        if(preg_match('/^5\./',$version)) mysql_query('set session sql_mode=0');
         mysql_query('set names cp1251');
         mysql_query('set character set cp1251');
         mysql_query('set character_set_client=cp1251');
         mysql_query('set character_set_results=cp1251');
         mysql_query('set character_set_connection=cp1251');
         mysql_query('set character_set_database=cp1251');
         mysql_query('set character_set_server=cp1251');
        }
        return $r;
}

function db_select_db($name) //select database
{

        return mysql_select_db($name);
}

function db_disconnect() //close connection
{
        return mysql_close();
}


db_connect($dbhost,$dbuser,$dbpass) or die(ERROR_DB_INIT);
db_select_db($dbname) or die(db_error());

/*****PRODUCTS***********/
$qqq = mysql_query("SELECT productID,name,foto_keywords FROM ".$dbprfx."products WHERE enabled=1");
for ($i=0; $i<mysql_num_rows($qqq); $i++)
{
  $f=mysql_fetch_array($qqq);
  // Если кодировка при выводе результатов живого поиска не отображается корректно, закомментировать следующую строку и раскомментировать ниже
  // Изменение кодировки из 1251 в UTF
  //$ut = iconv('windows-1251','UTF-8', $f[name]);
  // Кодировка остается неизменной
  #$ut = $f[name]." (".$f[foto_keywords].")";
  $ut = $f[foto_keywords];
#  print"$f[name]\n";
  print"$ut\n";


}

db_disconnect(DB_NAME);
?>