<?php
#####################################
# ShopCMS: —крипт интернет-магазина
# Copyright (c) by ADGroup
# http://shopcms.ru
#####################################

        // category navigation form

        if ( isset($categoryID) ) {
                $out = catGetCategoryCompactCList( $categoryID );
				$dd_catid = $categoryID;
		}
        else {
                $out = catGetCategoryCompactCList( 1 );
				$dd_catid = 1;
		}
				
        $smarty->assign( "categories_tree_count", count($out) );
        $smarty->assign( "categories_tree", $out ); 

        $smarty->assign( "big_categories_tree_count", count($cats) );
        $smarty->assign( "big_categories_tree", $cats );
		
		// »щем родителей вложенных категорий
		$dd_txt = "";
		$dd_parents = array();
		
		$dd_cid = $dd_catid;
		$dd_parents[] = $dd_catid;
		$dd_txt .= $dd_catid."-->";
		while ($dd_cid != 1) {
			foreach ($cats as $v) {
				if ($v["categoryID"] == $dd_cid) {
					//if ($v["parent"] != 1) {
						$dd_txt .= $v["parent"]."-->";
						$dd_parents[] = $v["parent"];
					//}
					$dd_cid = $v["parent"];
				}				
			}				
		}
		$dd_txt .= "<hr />";
		$smarty->assign( "txt", $dd_txt );	
		$smarty->assign( "parents_list", $dd_parents );

?>