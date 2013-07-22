<?php
  #####################################
  # ShopCMS: ������ ��������-��������
  # Copyright (c) by ADGroup
  # http://shopcms.ru
  #####################################


  // *****************************************************************************
  // Purpose        gets pictures by product
  // Inputs   $productID - product ID
  // Remarks
  // Returns        array of item
  //                                each item consits of
  //                                "photoID"                        - photo ID
  //                                "productID"                        - product ID
  //                                "filename"                        - conventional photo filename
  //                                "thumbnail"                        - thumbnail photo filename
  //                                "enlarged"                        - enlarged photo filename
  //                                "default_picture"        - 1 if default picture, otherwise 0
  function GetPictures($productID)
  {
      $q = db_query("select photoID, productID, filename, thumbnail, enlarged from ".PRODUCT_PICTURES.
          " where productID=".(int)$productID);
      $q2 = db_query("select default_picture from ".PRODUCTS_TABLE." where productID=".(int)$productID);
      $product = db_fetch_row($q2);
      $default_picture = $product[0];
      $res = array();
      while ($row = db_fetch_row($q))
      {
          if ((string )$row["photoID"] == (string )$default_picture) $row["default_picture"] = 1;
          else  $row["default_picture"] = 0;
          $res[] = $row;
      }
      return $res;
  }


  // *****************************************************************************
  // Purpose        deletes three pictures (filename, thumbnail, enlarged) for product
  // Inputs   $photoID - picture ID ( PRODUCT_PICTURES table )
  // Remarks        $photoID identifier is corresponded three pictures ( see PRODUCT_PICTURES
  //                                table in database_structure.xml )
  // Returns        nothing
  function DeleteThreePictures($photoID)
  {
      $q = db_query("select filename, thumbnail, enlarged, productID from ".PRODUCT_PICTURES." where photoID=".(int)$photoID);
      if ($picture = db_fetch_row($q))
      {
          if ($picture["filename"] != "" && $picture["filename"] != null)
              if (file_exists("data/small/".$picture["filename"])) unlink("data/small/".$picture["filename"]);

          if ($picture["thumbnail"] != "" && $picture["thumbnail"] != null)
              if (file_exists("data/medium/".$picture["thumbnail"])) unlink("data/medium/".$picture["thumbnail"]);

          if ($picture["enlarged"] != "" && $picture["enlarged"] != null)
              if (file_exists("data/big/".$picture["enlarged"])) unlink("data/big/".$picture["enlarged"]);

          $q1 = db_query("select default_picture from ".PRODUCTS_TABLE." where productID=".(int)$picture["productID"]);
          if ($product = db_fetch_row($q1))
          {
              if ($product["default_picture"] == $photoID) db_query("update ".PRODUCTS_TABLE." set default_picture=NULL ".
                      " where productID=".(int)$_GET["productID"]);
          }
          db_query("delete from ".PRODUCT_PICTURES." where photoID=".(int)$photoID);
      }
  }

  function DeleteThreePictures2($productID)
  {
      $q = db_query("select filename, thumbnail, enlarged from ".PRODUCT_PICTURES." where productID=".(int)$productID);
      while ($picture = db_fetch_row($q))
      {
          if ($picture["filename"] != "" && $picture["filename"] != null)
              if (file_exists("data/small/".$picture["filename"])) unlink("data/small/".$picture["filename"]);

          if ($picture["thumbnail"] != "" && $picture["thumbnail"] != null)
              if (file_exists("data/medium/".$picture["thumbnail"])) unlink("data/medium/".$picture["thumbnail"]);

          if ($picture["enlarged"] != "" && $picture["enlarged"] != null)
              if (file_exists("data/big/".$picture["enlarged"])) unlink("data/big/".$picture["enlarged"]);

          db_query("delete from ".PRODUCT_PICTURES." where productID=".(int)$productID);
      }
  }

  // *****************************************************************************
  // Purpose        deletes thumbnail picture for product
  // Inputs   $photoID - picture ID ( see PRODUCT_PICTURES table )
  // Remarks        $photoID identifier is corresponded three pictures ( see PRODUCT_PICTURES
  //                                table in database_structure.xml ), but this function delelete only thumbnail
  //                                        picture from server and set thumbnail column value to ''
  // Returns        nothing
  function DeleteThumbnailPicture($photoID)
  {
      $q = db_query("select thumbnail from ".PRODUCT_PICTURES." where photoID=".(int)$photoID);
      if ($thumbnail = db_fetch_row($q))
      {
          if ($thumbnail["thumbnail"] != "" && $thumbnail["thumbnail"] != null)
          {
              if (file_exists("data/medium/".$thumbnail["thumbnail"])) unlink("data/medium/".$thumbnail["thumbnail"]);
          }
          db_query("update ".PRODUCT_PICTURES." set thumbnail=''"." where photoID=".(int)$photoID);
      }
  }


  // *****************************************************************************
  // Purpose        deletes enlarged picture for product
  // Inputs   $photoID - picture ID ( see PRODUCT_PICTURES table )
  // Remarks        $photoID identifier is corresponded three pictures ( see PRODUCT_PICTURES
  //                                table in database_structure.xml ), but this function delelete only enlarged
  //                                        picture from server and set thumbnail column value to ''
  // Returns        nothing
  function DeleteEnlargedPicture($photoID)
  {
      $q = db_query("select enlarged from ".PRODUCT_PICTURES." where photoID=".(int)$photoID);
      if ($enlarged = db_fetch_row($q))
      {
          if ($enlarged["enlarged"] != "" && $enlarged["enlarged"] != null)
          {
              if (file_exists("data/big/".$enlarged["enlarged"])) unlink("data/big/".$enlarged["enlarged"]);
          }
          db_query("update ".PRODUCT_PICTURES." set enlarged=''"." where photoID=".(int)$photoID["enlarged"]);
      }
  }


  // *****************************************************************************
  // Purpose        updates filenames
  // Inputs   $fileNames array of        items
  //                                each item consits of
  //                                        "filename"                - normal picture
  //                                        "thumbnail"                - thumbnail picture
  //                                        "enlarged"                - enlarged picture
  //                                key is picture ID ( see PRODUCT_PICTURES  )
  // Remarks
  //                                if $default_picture == -1 then default picture is not set
  // Returns        nothing
  function UpdatePictures($productID, $fileNames, $default_picture)
  {
  // BEGIN Image Uploader
  // Fix image rename
      foreach ($fileNames as $key => $value)
      {
          // Get old filenames
          $key_ = intval($key);
          $sql = "SELECT filename, thumbnail, enlarged
                  FROM ".PRODUCT_PICTURES."
                  WHERE photoID = '$key_'
                  LIMIT 1";
          $q = db_query($sql);
          if($oldNames = db_fetch_assoc($q)) {

            // Fix extensions, transliterate filenames
            foreach($value as $vType=>$vName) {
              $value[$vType] = fu_translit_filename($vName);
              $vName = $value[$vType];
              $ext = pathinfo($vName, PATHINFO_EXTENSION);
              $filename = pathinfo($vName, PATHINFO_FILENAME);
              // Get extension from old name
              if(!$ext && ($extOld = pathinfo($oldNames[$vType], PATHINFO_EXTENSION))) {
                $value[$vType] = $vName.'.'.$extOld;
              }
            }

            $imgPath = Array('filename' => 'data/small/', 'thumbnail' => 'data/medium/', 'enlarged' => 'data/big/');
            foreach($value as $vType=>$vName)
              // If file is renamed
              if(($oldNames[$vType] != $value[$vType]) && file_exists($imgPath[$vType].$oldNames[$vType])) {
                // If target file exists also, we need to generate a unique name
                $ext = pathinfo($value[$vType], PATHINFO_EXTENSION);
                $filename = pathinfo($value[$vType], PATHINFO_FILENAME);
                $i = 1;
                while(file_exists($imgPath[$vType].$value[$vType])) {
                  $value[$vType] = $filename . '_' . $i . '.' . $ext;
                  $i++;
                }
                @rename($imgPath[$vType].$oldNames[$vType], $imgPath[$vType].$value[$vType]);
              }

          }

          db_query("update ".PRODUCT_PICTURES." set filename='".xEscSQL($value["filename"])."', thumbnail='".xEscSQL($value["thumbnail"])."' ,  enlarged='".xEscSQL($value["enlarged"])."' "."where photoID=".(int)$key);

      }
      if ($default_picture != -1) db_query("update ".PRODUCTS_TABLE." set default_picture = ".xEscSQL($default_picture)." where productID=".(int)$productID);
  // END Image Uploader
  }


  function UpdatePicturesUpload($productID, $fileNames, $default_picture)
  {
      foreach ($fileNames as $key => $value)
      {

          $new_filename = Rendernames("ufilenameu_".$key,"data/small/");
          $new_thumbnail = Rendernames("uthumbnailu_".$key,"data/medium/");
          $new_enlarged = Rendernames("uenlargedu_".$key,"data/big/");

          if ($new_filename != "" && $new_filename != null)
          {
              if (CONF_PHOTO_RESIZE) Renderimage($new_filename, CONF_PHOTO_WIDTH1,"data/small/");
              if (CONF_PUT_WATERMARK) Renderwatermark($new_filename,"data/small/");
              $q = db_query("select filename from ".PRODUCT_PICTURES." where photoID=".(int)$key);
              if ($filenamed = db_fetch_row($q))
                  if ($filenamed[0] != "" && $filenamed[0] != null)
                  {
                      if (file_exists("data/small/".$filenamed[0])) unlink("data/small/".$filenamed[0]);
                  }
              db_query("update ".PRODUCT_PICTURES." set filename='".xEscSQL($new_filename)."' where photoID=".(int)$key);
          }
          if ($new_thumbnail != "" && $new_thumbnail != null)
          {
              if (CONF_PHOTO_RESIZE) Renderimage($new_thumbnail, CONF_PHOTO_WIDTH2,"data/medium/");
              if (CONF_PUT_WATERMARK) Renderwatermark($new_thumbnail,"data/medium/");
              $q = db_query("select thumbnail from ".PRODUCT_PICTURES." where photoID=".(int)$key);
              if ($thumbnaild = db_fetch_row($q))
                  if ($thumbnaild[0] != "" && $thumbnaild[0] != null)
                  {
                      if (file_exists("data/medium/".$thumbnaild[0])) unlink("data/medium/".$thumbnaild[0]);
                  }
              db_query("update ".PRODUCT_PICTURES." set thumbnail='".xEscSQL($new_thumbnail)."' where photoID=".(int)$key);
          }
          if ($new_enlarged != "" && $new_enlarged != null)
          {
              if (CONF_PHOTO_RESIZE) Renderimage($new_enlarged, CONF_PHOTO_WIDTH3,"data/big/");
              if (CONF_PUT_WATERMARK) Renderwatermark($new_enlarged,"data/big/");
              $q = db_query("select enlarged from ".PRODUCT_PICTURES." where photoID=".(int)$key);
              if ($enlargedd = db_fetch_row($q))
                  if ($enlargedd[0] != "" && $enlargedd[0] != null)
                  {
                      if (file_exists("data/big/".$enlargedd[0])) unlink("data/big/".$enlargedd[0]);
                  }
              db_query("update ".PRODUCT_PICTURES." set enlarged='".xEscSQL($new_enlarged)."' where photoID=".(int)$key);
          }
      }

      if ($default_picture != -1) db_query("update ".PRODUCTS_TABLE." set default_picture = ".xEscSQL($default_picture)." where productID=".(int)$productID);
  }


  // *****************************************************************************
  // Purpose        adds new picture
  // Inputs        $filename, $thumbnail, $enlarged - keys of item in $_FILES
  //                                corresponded to these file names
  //                        $productID - product ID
  //                        $default_picture - default picture ID
  // Remarks
  //                        if $new_filename == "" then function does not something
  //                        if $default_picture == -1 then default picture is set to new inserted
  //                                        item to PRODUCT_PICTURES
  // Returns        nothing


  function AddNewPictures($productID, $filename, $thumbnail, $enlarged, $default_picture)
  {
      if (isset($_FILES[$filename]) && $_FILES[$filename]["name"] && $_FILES[$filename]["size"] > 0)
      {

          // BEGIN Image Uploader
          // by http://shopcms-moduli.com
          //$_FILES[$filename]["name"] = fn_translit($_FILES[$filename]["name"]);
          //$_FILES[$thumbnail]["name"] = fn_translit($_FILES[$thumbnail]["name"]);
          //$_FILES[$enlarged]["name"] = fn_translit($_FILES[$enlarged]["name"]);

          $new_filename = Rendernames($filename,"data/small/");

          if(UPLOAD_ERR_NO_FILE == $_FILES[$thumbnail]['error']) {
            $_FILES[$thumbnail] = $_FILES[$filename];
            $thumbnail = $filename;
            copy('data/small/'.$new_filename, $_FILES[$thumbnail]['tmp_name']);
          }
          $new_thumbnail = Rendernames($thumbnail,"data/medium/");

          if(UPLOAD_ERR_NO_FILE == $_FILES[$enlarged]['error']) {
            $_FILES[$enlarged] = $_FILES[$filename];
            $enlarged = $filename;
            copy('data/small/'.$new_filename, $_FILES[$thumbnail]['tmp_name']);
          }
          $new_enlarged = Rendernames($enlarged,"data/big/");

          if ($new_filename != "")
          {
              db_query("insert into ".PRODUCT_PICTURES."(productID, filename, thumbnail, enlarged)".
                  "  values( ".(int)$productID.", '".xEscSQL($new_filename)."', '".xEscSQL($new_thumbnail).
                  "', '".xEscSQL($new_enlarged)."' ) ");
              $pictId = db_insert_id();

              // If first picture uploaded - make it default
              $sql = '
                SELECT COUNT(*) FROM '.PRODUCT_PICTURES.'
                WHERE productID=\''.intval($productID).'\'';
              $q = db_query($sql);
              $pictCount = ($r = db_fetch_row($q)) ? $r[0] : 0;
              if(1 == $pictCount) { // if 1st picture
                $sql = '
                  UPDATE '.PRODUCTS_TABLE.'
                  SET default_picture=\''.intval($pictId).'\'
                  WHERE productID=\''.intval($productID).'\'
                  LIMIT 1';
                db_query($sql);
              }
          // END Image Uploader

              if (CONF_PHOTO_RESIZE)
              {

                  if ($new_filename != "") Renderimage($new_filename, CONF_PHOTO_WIDTH1,"data/small/");
                  if ($new_thumbnail != "") Renderimage($new_thumbnail, CONF_PHOTO_WIDTH2,"data/medium/");
                  if ($new_enlarged != "") Renderimage($new_enlarged, CONF_PHOTO_WIDTH3,"data/big/");
              }

              if (CONF_PUT_WATERMARK)
              {

                  if ($new_filename != "") Renderwatermark($new_filename,"data/small/");
                  if ($new_thumbnail != "") Renderwatermark($new_thumbnail,"data/medium/");
                  if ($new_enlarged != "") Renderwatermark($new_enlarged,"data/big/");
              }

              if ($default_picture == -1)
              {
                  $default_pictureID = db_insert_id();
                  db_query("update ".PRODUCTS_TABLE." set default_picture = ".$default_pictureID." where productID=".(int)$productID);
              }
          }
      }
  }

  function Renderimages()
  {

      set_time_limit(0);

      $q = db_query("select filename, thumbnail, enlarged FROM ".PRODUCT_PICTURES);

      while ($row = db_fetch_row($q))
      {
          if (strlen($row["filename"]) > 0 && file_exists("data/small/".$row["filename"])) Renderimage($row["filename"],CONF_PHOTO_WIDTH1,"data/small/");
          if (strlen($row["thumbnail"]) > 0 && file_exists("data/medium/".$row["thumbnail"])) Renderimage($row["thumbnail"],CONF_PHOTO_WIDTH2,"data/medium/");
          if (strlen($row["enlarged"]) > 0 && file_exists("data/big/".$row["enlarged"])) Renderimage($row["enlarged"],CONF_PHOTO_WIDTH3,"data/big/");
      }
  }

  function Renderwatermarks()
  {

      set_time_limit(0);

      $q = db_query("select filename, thumbnail, enlarged FROM ".PRODUCT_PICTURES);

      while ($row = db_fetch_row($q))
      {
          if (strlen($row["filename"]) > 0 && file_exists("data/small/".$row["filename"])) Renderwatermark($row["filename"],"data/small/");
          if (strlen($row["thumbnail"]) > 0 && file_exists("data/medium/".$row["thumbnail"])) Renderwatermark($row["thumbnail"],"data/medium/");
          if (strlen($row["enlarged"]) > 0 && file_exists("data/big/".$row["enlarged"])) Renderwatermark($row["enlarged"],"data/big/");
      }
  }

  // *****************************************************************************
  // Purpose        gets thumbnail file name
  // Inputs        $productID - product ID
  // Remarks
  // Returns        file name, it is not full path
  function GetThumbnail($productID)
  {
      $q = db_query("select default_picture from ".PRODUCTS_TABLE." where productID=".(int)$productID);
      if ($product = db_fetch_row($q))
      {
          $q2 = db_query("select filename from ".PRODUCT_PICTURES." where photoID=".(int)$product["default_picture"]." and productID=".(int)$productID);
          if ($picture = db_fetch_row($q2))
          {
              if (file_exists("data/small/".$picture["filename"]) && strlen($picture["filename"]) > 0)
                      return $picture["filename"];
          }
      }
      return "";
  }


  function GetPictureCount($productID)
  {
      $count_pict = db_query("select COUNT(*) from ".PRODUCT_PICTURES." where productID=".(int)$productID." AND filename!=''");
      $count_pict_row = db_fetch_row($count_pict);
      return $count_pict_row[0];
  }

  function GetThumbnailCount($productID)
  {
      $count_pict = db_query("select COUNT(*) from ".PRODUCT_PICTURES." where productID=".(int)$productID." AND thumbnail!=''");
      $count_pict_row = db_fetch_row($count_pict);
      return $count_pict_row[0];
  }

  function GetEnlargedPictureCount($productID)
  {
      $count_pict = db_query("select COUNT(*) from ".PRODUCT_PICTURES." where productID=".(int)$productID." AND enlarged!=''");
      $count_pict_row = db_fetch_row($count_pict);
      return $count_pict_row[0];
  }

  function Renderimage($tempname, $mode, $folder)
  {
      include_once ('core/asido/class.asido.php');
      asido::driver('gd');

      if ($mode > 0)
      {
          $i = asido::image($folder.$tempname, $folder.$tempname);
          asido::resize($i, $mode, $mode);
          $i->save(ASIDO_OVERWRITE_ENABLED);
      }
  }
  
  function Renderwatermark($tempname, $folder)
  {

      include_once ('core/asido/class.asido.php');
      asido::driver('gd');

      if (CONF_PUT_WATERMARK && file_exists("data/".CONF_WATERMARK_IMAGE))
      {
          $i = asido::image($folder.$tempname, $folder.$tempname);
          asido::watermark($i, "data/".CONF_WATERMARK_IMAGE, ASIDO_WATERMARK_CENTER, ASIDO_WATERMARK_SCALABLE_ENABLED);
          $i->save(ASIDO_OVERWRITE_ENABLED);
      }
  }

  // BEGIN Image Uploader
  
  function fu_translit_filename($content) {
    $utf2enS = Array('�'=>'A', '�'=>'B', '�'=>'V', '�'=>'G', '�'=>'G', '�'=>'D', '�'=>'E', '�'=>'JO', '�'=>'E', '�'=>'Zh', '�'=>'Z', '�'=>'I', '�'=>'I', '�'=>'I', '�'=>'I', '�'=>'K', '�'=>'L', '�'=>'M', '�'=>'N', '�'=>'O', '�'=>'P', '�'=>'R', '�'=>'S', '�'=>'T', '�'=>'U', '�'=>'U', '�'=>'F', '�'=>'H', '�'=>'C', '�'=>'Ch', '�'=>'Sh', '�'=>'Sz', '�'=>'', '�'=>'Y', '�'=>'', '�'=>'E', '�'=>'Yu', '�'=>'Ya');
    $utf2enB = array('�'=>'a', '�'=>'b', '�'=>'v', '�'=>'g', '�'=>'g', '�'=>'d', '�'=>'e', '�'=>'jo', '�'=>'e', '�'=>'zh', '�'=>'z', '�'=>'i', '�'=>'i', '�'=>'i', '�'=>'i', '�'=>'k', '�'=>'l', '�'=>'m', '�'=>'n', '�'=>'o', '�'=>'p', '�'=>'r', '�'=>'s', '�'=>'t', '�'=>'u', '�'=>'u', '�'=>'f', '�'=>'h', '�'=>'c', '�'=>'ch', '�'=>'sh', '�'=>'sz', '�'=>'', '�'=>'y', '�'=>'', '�'=>'e', '�'=>'yu', '�'=>'ya', '&quot;'=>'', '&amp;'=>'', '�'=>'u', '�'=>'num');

    $content = trim(strip_tags($content));
    $content = strtr($content, $utf2enS);
    $content = strtr($content, $utf2enB);
    $content = preg_replace("/\s+/ms", "-", $content);
    $content = preg_replace("/[ ]+/", "-", $content);

    $cut = "/[^a-z0-9_\.\-]+/mi";
    $content = preg_replace($cut, "", $content);

    return $content;
  }
  
  function Rendernames($tempname, $folder)
  {
      $new_tempname = "";
      if (isset($_FILES[$tempname]) && $_FILES[$tempname]["size"] > 0)
      {
          $picture_name = strtolower(str_replace(" ", "_", $_FILES[$tempname]["name"]));
          $pos = strrpos($picture_name, ".");
          $name = fu_translit_filename(substr($picture_name, 0, $pos));
          $ext = substr($picture_name, $pos + 1);

          if (file_exists($folder.$picture_name))
          {
              $taskDone = false;
              for ($i = 1; (($i < 500) && ($taskDone == false)); $i++)
              {
                  if (!file_exists($folder.$name."_".$i.".".$ext))
                  {
                      if (is_uploaded_file($_FILES[$tempname]['tmp_name']))
                      {
                          if (move_uploaded_file($_FILES[$tempname]['tmp_name'], $folder.$name."_".
                              $i.".".$ext))
                          {
                              SetRightsToUploadedFile($folder.$name."_".$i.".".$ext);
                              $new_tempname = $name."_".$i.".".$ext;
                          }
                      } else {
                          if (rename($_FILES[$tempname]['tmp_name'], $folder.$name."_".$i.".".$ext))
                          {
                              SetRightsToUploadedFile($folder.$name."_".$i.".".$ext);
                              $new_tempname = $name."_".$i.".".$ext;
                          }
                      }
                      $taskDone = true;
                  }
              }

          }
          else
          {
              $picture_name_new = fu_translit_filename(iconv('UTF-8', 'Windows-1251', $picture_name));
              if (is_uploaded_file($_FILES[$tempname]['tmp_name']))
              {
                  if (move_uploaded_file($_FILES[$tempname]['tmp_name'], $folder.$picture_name_new))
                  {
                      SetRightsToUploadedFile($folder.$picture_name_new);
                      $new_tempname = $picture_name_new;
                  }
              } else {
                  if (rename($_FILES[$tempname]['tmp_name'], $folder.$picture_name_new))
                  {
                      SetRightsToUploadedFile($folder.$picture_name_new);
                      $new_tempname = $picture_name_new;
                  }
              }
          }
      }
      return $new_tempname;
  }
  // END Image Uploader
?>