<?php
#####################################
# ShopCMS: Скрипт интернет-магазина
# Copyright (c) by ADGroup
# http://shopcms.ru
#####################################


        $extraParametrsTemplate = null;
        $searchParamName = null;
        $rangePrice = null;
		$rangePow   = null; 
        if ( !isset($_GET["categoryID"]) && isset($_GET["search_with_change_category_ability"]) )
        {

                $smarty->assign( "categories_to_select", $cats );
        }

        if ( isset($_GET["categoryID"]) )
        {
                $_GET["categoryID"] = (int)$_GET["categoryID"];

                if  (  !catGetCategoryById($_GET["categoryID"])  ){
                        header("HTTP/1.0 404 Not Found");
                        header("HTTP/1.1 404 Not Found");
                        header("Status: 404 Not Found");
                        die(ERROR_404_HTML);
                }
                else
                {
                        if ( isset($_GET["search_with_change_category_ability"]) )
                        {
                               $smarty->assign( "categories_to_select", $cats);
                        }

                        $getData = null;
                        if ( isset($_GET["advanced_search_in_category"]) )
                        {
                                $extraParametrsTemplate = array();
                                $extraParametrsTemplate["categoryID"] = $_GET["categoryID"];

                                if ( isset($_GET["search_name"]) )
                                        if ( trim($_GET["search_name"]) != "" )
                                                $searchParamName = array($_GET["search_name"]);

                                $rangePrice = array( "from" => $_GET["search_price_from"],
                                                          "to"   => $_GET["search_price_to"]);
								// + диапазонный поиск по мощности
                                $rangePow   = array( "from" => $_GET["search_pow_from"],
                                                          "to"   => $_GET["search_pow_to"] );
								// - диапазонный поиск по мощности

                                $getData = ScanGetVariableWithId( array("param") );
                                foreach( $getData as $optionID => $value )
                                {
                                        $res = schOptionIsSetToSearch( $_GET["categoryID"], $optionID );

                                        if ( $res["set_arbitrarily"]==0 && (int)$value["param"] == 0 )
                                                continue;

                                        $item = array();
                                        $item["optionID"] = $optionID;
                                        $item["value"]    = $value["param"];
                                        $item["set_arbitrarily"] = $res["set_arbitrarily"];
                                        $extraParametrsTemplate[] = $item;
                                }
                        }


                        $params = array();

                        $categoryID = $_GET["categoryID"];
                        $options = optGetOptionscat($categoryID);
                        $OptionsForSearch = schOptionsAreSetToSearch($categoryID, $options);

                        foreach( $options as $option ){

                                if ( isset($OptionsForSearch[$option["optionID"]])){

                                        $set_arbitrarily = $OptionsForSearch[$option["optionID"]]['set_arbitrarily'];
                                        $item = array();
                                        $item["optionID"]        = $option["optionID"];
                                        $item["value"] = $getData[ (string)$option["optionID"] ]["param"];

                                        $item["controlIsTextField"] = $set_arbitrarily;
                                        $item["name"]                                = $option["name"];
                                        if ( $set_arbitrarily == 0 )
                                        {
                                                $item["variants"]                        = array();
                                                $variants = schGetVariantsForSearch( $categoryID, $option["optionID"]);
                                                foreach( $variants as $variant ){

                                                        $item["variants"][] = array(
                                                                'variantID' => $variant["variantID"],
                                                                'value' => $variant["option_value"]
                                                                );
                                                }
                                        }
                                        $params[] = $item;
                                }
                        }


                        if ( isset($_GET["search_name"]) ) $smarty->assign( "search_name", $_GET["search_name"]);
                        if ( isset($_GET["search_price_from"]) ) $smarty->assign( "search_price_from", $_GET["search_price_from"]);
                        if ( isset($_GET["search_price_to"]) ) $smarty->assign( "search_price_to", $_GET["search_price_to"]);
						
						// + диапазонный поиск по мощности
                        if ( isset($_GET["search_pow_from"]) ) $smarty->assign( "search_pow_from", $_GET["search_pow_from"]);
                        if ( isset($_GET["search_pow_to"]) ) $smarty->assign( "search_pow_to", $_GET["search_pow_to"]);
						// - диапазонный поиск по мощности

                        $smarty->assign( "categoryID", $categoryID );

                        if ( isset($_GET["advanced_search_in_category"]) )
                                $smarty->assign( "search_in_subcategory", isset($_GET["search_in_subcategory"]) );
                        else
                                $smarty->assign( "search_in_subcategory", true );
                        $smarty->assign( "show_subcategory_checkbox", 1 );
                        $smarty->assign( "priceUnit", getPriceUnit() );
                        $smarty->assign( "params", $params );
						
						// Рассчет количества столбцов для фильтра
						$params_count = count($params);
						if ($params_count <= 6) $rows = 3; else $rows = 4;
						$cols = ceil($params_count/$rows);
						$smarty->assign( "cols", $cols );
						$smarty->assign( "rows", $rows );
                }
        }else  // Ищем параметры для страниц, не имеющих отношения к категориям товаров (для вывода характеристик фильтра)
			{			
						$cID = (int)1;
						$getData = null;
                        
						$extraParametrsTemplate = array();
						$extraParametrsTemplate["categoryID"] = $cID;

						if ( isset($_GET["search_name"]) )
								if ( trim($_GET["search_name"]) != "" )
										$searchParamName = array($_GET["search_name"]);

						$rangePrice = array( "from" => $_GET["search_price_from"],
												  "to"   => $_GET["search_price_to"]);
						// + диапазонный поиск по мощности
						$rangePow   = array( "from" => $_GET["search_pow_from"],
												  "to"   => $_GET["search_pow_to"] );
						// - диапазонный поиск по мощности
						
						$getData = ScanGetVariableWithId( array("param") );
						foreach( $getData as $optionID => $value )
						{
								$res = schOptionIsSetToSearch( $cID, $optionID );

								if ( $res["set_arbitrarily"]==0 && (int)$value["param"] == 0 )
										continue;

								$item = array();
								$item["optionID"] = $optionID;
								$item["value"]    = $value["param"];
								$item["set_arbitrarily"] = $res["set_arbitrarily"];
								$extraParametrsTemplate[] = $item;
						}
				
						$params = array();

                        
                        $options = optGetOptionscat($cID);
                        $OptionsForSearch = schOptionsAreSetToSearch($cID, $options);
						
						foreach( $options as $option ){

                                if ( isset($OptionsForSearch[$option["optionID"]])){

                                        $set_arbitrarily = $OptionsForSearch[$option["optionID"]]['set_arbitrarily'];
                                        $item = array();
                                        $item["optionID"]        = $option["optionID"];
                                        $item["value"] = $getData[ (string)$option["optionID"] ]["param"];

                                        $item["controlIsTextField"] = $set_arbitrarily;
                                        $item["name"]                                = $option["name"];
                                        if ( $set_arbitrarily == 0 )
                                        {
                                                $item["variants"]                        = array();
                                                $variants = schGetVariantsForSearch( $cID, $option["optionID"]);
                                                foreach( $variants as $variant ){

                                                        $item["variants"][] = array(
                                                                'variantID' => $variant["variantID"],
                                                                'value' => $variant["option_value"]
                                                                );
                                                }
                                        }
                                        $params[] = $item;
                                }
                        }						
						
						$smarty->assign( "categoryID", $cID );

                        if ( isset($_GET["advanced_search_in_category"]) )
                                $smarty->assign( "search_in_subcategory", isset($_GET["search_in_subcategory"]) );
                        else
                                $smarty->assign( "search_in_subcategory", true );
                        $smarty->assign( "show_subcategory_checkbox", 1 );
						
						if ( isset($_GET["search_name"]) ) $smarty->assign( "search_name", $_GET["search_name"]);
                        if ( isset($_GET["search_price_from"]) ) $smarty->assign( "search_price_from", $_GET["search_price_from"]);
                        if ( isset($_GET["search_price_to"]) ) $smarty->assign( "search_price_to", $_GET["search_price_to"]);
												
						// + диапазонный поиск по мощности
			if ( isset($_GET["search_pow_from"]) ) $smarty->assign( "search_pow_from", $_GET["search_pow_from"]);
                        if ( isset($_GET["search_pow_to"]) ) $smarty->assign( "search_pow_to", $_GET["search_pow_to"]);
						// - диапазонный поиск по мощности
						
						$smarty->assign( "priceUnit", getPriceUnit() );
                        $smarty->assign( "params", $params );
						// Рассчет количества столбцов для фильтра
						$params_count = count($params);
						if ($params_count <= 6) $rows = 3; else $rows = 4;
						$cols = ceil($params_count/$rows);
						$smarty->assign( "cols", $cols );
						$smarty->assign( "rows", $rows );
						//$smarty->assign( "params_count", count($params) );
			}
?>