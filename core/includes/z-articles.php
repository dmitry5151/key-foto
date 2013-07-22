<?php
/*
  Статьи для ShopCMS

  Автор: qjmann ( soulmare@gmail.com http://shopcms-moduli.com )
  Основано на коде ShopCMS модуля новостей, Copyright (c) by ADGroup
*/

        // Check for blocks enabled
        global $leftb, $rightb, $topb, $bottomb;
        $articlesLatestEnabled = false;
        $articlesLinkedEnabled = false;
        $articlesRandomEnabled = false;
        foreach($leftb as $b) {
          if('articles_latest.tpl' == $b['url']) $articlesLatestEnabled = true;
          if('articles_linked.tpl' == $b['url']) $articlesLinkedEnabled = true;
          if('articles_random.tpl' == $b['url']) $articlesRandomEnabled = true;
        }
        foreach($rightb as $b) {
          if('articles_latest.tpl' == $b['url']) $articlesLatestEnabled = true;
          if('articles_linked.tpl' == $b['url']) $articlesLinkedEnabled = true;
          if('articles_random.tpl' == $b['url']) $articlesRandomEnabled = true;
        }
        foreach($topb as $b) {
          if('articles_latest.tpl' == $b['url']) $articlesLatestEnabled = true;
          if('articles_linked.tpl' == $b['url']) $articlesLinkedEnabled = true;
          if('articles_random.tpl' == $b['url']) $articlesRandomEnabled = true;
        }
        foreach($bottomb as $b) {
          if('articles_latest.tpl' == $b['url']) $articlesLatestEnabled = true;
          if('articles_linked.tpl' == $b['url']) $articlesLinkedEnabled = true;
          if('articles_random.tpl' == $b['url']) $articlesRandomEnabled = true;
        }

        if((isset($_GET['categoryID']) || isset($_GET['productID'])) && $articlesLinkedEnabled) {
          $categoryID = isset($_GET['categoryID']) ? $_GET['categoryID'] : $categoryID;
          $articles_linked = articlesGetArticlesLinked($categoryID);
          $smarty->assign( "articles_linked", $articles_linked );
        }

        if($articlesRandomEnabled) {
          $articles_random = articlesGetArticlesRandom();
          $smarty->assign( "articles_random", $articles_random );
        }

        if($articlesLatestEnabled) {
          $articles_array = articlesGetArticlesToCustomer();
          $smarty->assign( "articles_array", $articles_array );
        }

        if ( isset($_GET["articles"]) ) { // Get articles listing
          global $articlesCountTotal;
          $pre_articles_array = articlesGetPreArticlesToCustomer(isset($_GET['offset']) ? intval($_GET['offset']) : 0);
          $smarty->assign("pre_articles_array", $pre_articles_array);
          $smarty->assign("main_content_template", "show_articles.tpl");
          $smarty->assign("arItemsTotal", $articlesCountTotal);
          $smarty->assign("arPagesTotal", ceil($articlesCountTotal / CONF_NEWS_COUNT_IN_NEWS_PAGE));
          $smarty->assign("arOffset", isset($_GET['offset']) ? intval($_GET['offset']) : 0);
        }
    
        if ( isset($_GET["fullarticles"]) ){
        
      global $fullArticles;
	    $fullarticles_array = isset($fullArticles) ? $fullArticles : articlesGetFullArticlesToCustomer($_GET["fullarticles"]);

	    if ( $fullarticles_array )
                {
                        $smarty->assign( "articles_full_array", $fullarticles_array );
                        $smarty->assign( "main_content_template", "show_full_articles.tpl" );
                        $metaTags = Array();
                        if($fullarticles_array['meta_description'])
                          $metaTags[] = "<meta name=\"description\" content=\"{$fullarticles_array['meta_description']}\">";
                        if($fullarticles_array['meta_keywords'])
                          $metaTags[] = "<meta name=\"keywords\" content=\"{$fullarticles_array['meta_keywords']}\">";
                        if(count($metaTags))
                          $smarty->assign( "page_meta_tags", implode("\n    ", $metaTags));
                }
                else
                {
                        header("HTTP/1.0 404 Not Found");
                        header("HTTP/1.1 404 Not Found");
                        header("Status: 404 Not Found");
                        die(ERROR_404_HTML);
                }

        }

?>
