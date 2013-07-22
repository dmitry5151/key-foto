{* шаблон head секции страницы *}
<head>  
    <!-- Created by Dmitry Dolinin | www.ixum.ru --> 
    {* meta тэги и заголовок *}
    <base href="http://{$smarty.const.CONF_SHOP_URL|@fu_punycode_encode}/" />
    <meta http-equiv="Content-Type" content="text/html; charset={$smarty.const.DEFAULT_CHARSET}" />
    <title>{$page_title}</title>
    {if $page_meta_tags eq ""}
    <!--meta name="viewport" content="initial-scale = 1.0, maximum-scale = 1.0, user-scalable = yes, width = device-width"-->
    <meta name="description" content="{$smarty.const.CONF_HOMEPAGE_META_DESCRIPTION}" />
    <meta name="keywords" content="{$smarty.const.CONF_HOMEPAGE_META_KEYWORDS}" />
    {else}
    {$page_meta_tags}
    {/if}
    
    {* подключение стилей и иконки *}
    <!--[if lt IE 9]><script src="https://html5shiv.googlecode.com/svn/trunk/html5.js"></script><![endif]-->
    <link rel="stylesheet" href="data/{$smarty.const.TPL}/style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="data/{$smarty.const.TPL}/style_def.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="data/{$smarty.const.TPL}/styleprint.css" type="text/css" media="print" />
    <link href="data/{$smarty.const.TPL}/ui-theme/jquery-ui-1.10.2.custom.css" rel="stylesheet">
    <!--[if lte IE 7]><link rel="stylesheet" href="data/{$smarty.const.TPL}/style.ie7.css" media="screen" /><![endif]-->
    <link href='http://fonts.googleapis.com/css?family=Open+Sans+Condensed:300,300italic,700&subset=latin,cyrillic' rel='stylesheet' type='text/css'>

    <link rel="shortcut icon" href="data/{$smarty.const.TPL}/favicon.ico" type="image/x-icon">    
    <link rel="icon" href="data/{$smarty.const.TPL}/favicon.ico" type="image/x-icon" />
    <script src="data/{$smarty.const.TPL}/js/jquery-1.10.2.min.js"></script>
    <script src="data/{$smarty.const.TPL}/js/jquery-migrate-1.2.1.min.js"></script>
    <script src="data/{$smarty.const.TPL}/script.js"></script>
    <script src="data/{$smarty.const.TPL}/js/jquery-ui-1.10.2.custom.js"></script>
    
    {literal}
    <style>.dwa-content .dwa-postcontent-0 .layout-item-0 { padding-right: 10px;padding-left: 10px;  }
    .ie7 .dwa-post .dwa-layout-cell {border:none !important; padding:0 !important; }
    .ie6 .dwa-post .dwa-layout-cell {border:none !important; padding:0 !important; }
    </style>
    {/literal}


    {* Стиль живого поиска *}
    <link rel="stylesheet" type="text/css" href="data/{$smarty.const.TPL}/autocomplete.css" />
    <script type="text/javascript">
    {literal}
        $(function(){
            var f = $('#formpoisk');
            var d = $('#divpoisk');
            var t = $('#searchauto');
            t.focus(function(){
                d.animate({'margin' : '0 0 0 -325px', 'width':'325px'},50);
                f.animate({'width' : '325px'},50);
                //alert('Focus');
            });
            t.blur(function(){
                d.animate({'margin' : '0 0 0 -227px', 'width':'227px'},50);
                f.animate({'width' : '227px'},50);
                //alert('Focus');
            });
        });
    {/literal}
    </script>
    <script type="text/javascript">
        <!--
        var confirmUnsubscribe_act1 =  '{$smarty.const.QUESTION_UNSUBSCRIBE}';
        var validate_act1 =  '{$smarty.const.ERROR_INPUT_EMAIL}';
        var validate_disc_act1 =  '{$smarty.const.ERROR_INPUT_NICKNAME}';
        var validate_disc_act2 =  '{$smarty.const.ERROR_INPUT_MESSAGE_SUBJECT}';
        var validate_search_act1 =  '{$smarty.const.ERROR_INPUT_PRICE}';
        var doCL_act1 =  '{$smarty.const.STRING_COMPARISON_IN}';
        var doCL_act2 =  '{$smarty.const.CART_CONTENT_EMPTY}';
        var doCL_act3 =  '{$smarty.const.STRING_COMPARISON_TITLE_OK}';
        var renbox_act1 =  '{$smarty.const.STRING_COMPARISON_PROCESS}';
        var renboxCL_act1 =  '{$smarty.const.STRING_COMPARISON_TITLE_CL}';
        var doreset_act1 =  '{$smarty.const.STRING_CART_PROCESS}';
        var printcart_act1 =  '{$smarty.const.STRING_CART_PROCESS}';
        var doCart_act1 =  '{$smarty.const.STRING_CART_PR}';
        var doCart_act2 =  '{$smarty.const.CART_CONTENT_NOT_EMPTY}';
        var doCart_act3 =  '{$smarty.const.STRING_CUR_PR}';
        var doCart_act4 =  '{$smarty.const.CART_PROCEED_TO_CHECKOUT}';
        var doCart_act5 =  '{$smarty.const.STRING_CART_OKAX}';
        var doCpr_act1 =  '{$smarty.const.STRING_COMPARISON_IN}';
        var doCpr_act2 =  '{$smarty.const.CART_CONTENT_NOT_EMPTY}';
        var doCpr_act3 =  '{$smarty.const.STRING_COMPARISON_INFOLDER}';
        var doCpr_act4 =  '{$smarty.const.STRING_COMPARISON_CLEAR}';
        var doCpr_act5 =  '{$smarty.const.STRING_CART_OKAX}';

        function doCart(req) {literal}{{/literal}
            if(document.getElementById('cart') && req["shopping_cart_value"] > 0){literal}{{/literal}                
                document.getElementById('cart').innerHTML = '<a href="\/cart.html">' + req["shopping_cart_items"] +
        '&nbsp;{$smarty.const.CART_CONTENT_NOT_EMPTY}&nbsp;<strong>' + req["shopping_cart_value_shown"] +
        '<\/strong><\/a>&nbsp;&nbsp;<a title="Очистить корзину" style="color:red; text-shadow: none" href="index.php?popup=no&amp;shopping_cart=yes&amp;clear_cart=yes">x</a>';
                document.getElementById('axcrt').innerHTML = doCart_act5;
                {literal}}}{/literal}

        function doCpr(req) {literal}{{/literal}
            if(document.getElementById('cprbox') && req["cpr_value"] > 0){literal}{{/literal}
                document.getElementById('cprbox').innerHTML = doCpr_act1 + '&nbsp;' + req["cpr_value"] +
                    '&nbsp;' + doCpr_act2 + '<div style="padding-top: 10px;" align="center"><a class="dwa-button" href="{if $smarty.const.CONF_MOD_REWRITE eq 1}compare.html{else}index.php?comparison_products=yes{/if}">' + doCpr_act3 + '<\/a>&nbsp;&nbsp;<a class="dwa-button" href="#" onclick="doLoadcprCL(\'do=compare&amp;clear=yes\'); return false">' + doCpr_act4 + '<\/a><\/div>';
                document.getElementById('axcrt').innerHTML = doCpr_act5;
                {literal}}}{/literal}
	
        function doStat(req) {literal}{{/literal}
            if(req){literal}{{/literal}
                document.getElementById('tgenexe').innerHTML     = req['tgenexe'];
                document.getElementById('tgencompile').innerHTML = req['tgencompile'];
                document.getElementById('tgendb').innerHTML      = req['tgendb'];
                document.getElementById('tgenall').innerHTML     = req['tgenall'];
                document.getElementById('tgensql').innerHTML     = req['tgensql'];
                {literal}}}{/literal}
        //-->
    </script>
    <script type="text/javascript" src="data/{$smarty.const.TPL}/user.js"></script>

    {* Живой поиск *}
    <!--script type="text/javascript" src="data/admin/jquery.min.js"></script-->
    <script type="text/javascript" src="data/{$smarty.const.TPL}/autocomplete.js"></script>
    {literal}
    <script type="text/javascript">
        $(document).ready(function() {

            function liFormat (row) {
                var result = row[0];
                return result;
            }

            function selectItem(li) {
                if( li == null ) var sValue = 'Ничего не выбрано!';
                if( !!li.extra ) var sValue = li.extra[2];
                else var sValue = li.selectValue;
                document.forms["formpoisk"].submit();
                //alert("Выбрана запись с ID: " + sValue);
            }
            $("#searchauto").autocomplete("autocomplete.php", { delay:5,minChars:1,matchSubset:1,autoFill:false,matchContains:1,cacheLength:10,selectFirst:false,maxItemsToShow:10,onItemSelect:selectItem })

        });


    </script>
    {/literal}
        
    {* подключение rss *}

    <link rel="alternate" href="index.php?do=rss" title="rss" type="application/rss+xml">    
    
    {* стили для IE *}

    {literal}
    <!--[if lte IE 6]>
    <style type="text/css">
      #axcrt {
        top: expression(document.documentElement.scrollTop + Math.ceil((document.documentElement.clientHeight-100)/2)+ "px") !important;
        left: expression(Math.ceil((document.documentElement.clientWidth-300)/2)+ "px") !important;
      }
      body {behavior:url("data/admin/csshover.htc");}
      .semafor{background: none; filter:progid:DXImageTransform.Microsoft.AlphaImageLoader(src='data/{/literal}{$smarty.const.TPL}{literal}/best.png', sizingMethod='image');}
    </style>
    <![endif]-->
    {/literal}
</head>