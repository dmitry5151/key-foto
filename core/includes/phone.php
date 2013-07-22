<?php
#####################################
# ShopCMS: —крипт интернет-магазина
# Copyright (c) by ADGroup
# http://shopcms.ru
#####################################

        if (isset($_GET["phone"]) || isset($_POST["phone"]))
        {
                if (isset($_POST["phone"]))
                {
                        $customer_name = "–обот Ёнерго–егион—наб";
                        $customer_email = "info@ers-energo.ru"; //robot@ers-energo.ru dmitry5151@list.ru
                        $message_subject = "«аказ обратного звонка";
                        //$message_text = $_POST["message_text"];
						$phone_num = $_POST["phone_num"];
                }
                else
                {
                        $customer_name = "–обот Ёнерго–егион—наб";
                        $customer_email = "info@ers-energo.ru";
                        $message_subject = "«аказ обратного звонка";
                        //$message_text = "";
						$phone_num = $_GET["phone_num"];
                }

                //validate input data
                if (trim($phone_num)!="")
                {
                        if (xMailTxtHTML(CONF_GENERAL_EMAIL, $message_subject, $phone_num, $customer_email, $customer_name)){
                          Redirect("index.php?phone=1&sent=1");
                          }else{
                          $smarty->assign("error",3);
						  }
						  /*
						if(CONF_ENABLE_CONFIRMATION_CODE){
                                   $error_f = 1;
                          if(!$_POST['fConfirmationCode'] || !isset($_SESSION['captcha_keystring']) || $_SESSION['captcha_keystring'] !==  $_POST['fConfirmationCode']) {
                                   $error_f = 2;
                                   $smarty->assign("error",$error_f);
                          }
                          unset($_SESSION['captcha_keystring']);
                          if($error_f == 1){
                          if (xMailTxtHTML(CONF_GENERAL_EMAIL, $message_subject, $message_text, $customer_email, $customer_name)){
                          Redirect("index.php?feedback=1&sent=1");
                          }else{
                          $smarty->assign("error",3);
                          }
                          }
                        }else{
                          if (xMailTxtHTML(CONF_GENERAL_EMAIL, $message_subject, $message_text, $customer_email, $customer_name)){
                          Redirect("index.php?feedback=1&sent=1");
                          }else{
                          $smarty->assign("error",3);
                          }
                        }*/
                }
                else if (isset($_POST["phone"])) $smarty->assign("error",1);

                //extract input to Smarty
                $smarty->hassign("customer_name",$customer_name);
                $smarty->hassign("customer_email",$customer_email);
                $smarty->hassign("message_subject",$message_subject);
                $smarty->hassign("phone_num",$phone_num);

                if (isset($_GET["sent"])) $smarty->assign("sent",1);

                $smarty->assign("main_content_template", "sent_phone.tpl");
        }
		//else $smarty->assign("error_mail", "ќшибка отправки почты");
?>