{* ������ head ������ �������� *}
<head>  

    {* meta ���� � ��������� *}

    <base href="http://{$smarty.const.CONF_SHOP_URL|@fu_punycode_encode}/" />
    <meta http-equiv="Content-Type" content="text/html; charset={$smarty.const.DEFAULT_CHARSET}" />
    <title>{$page_title}</title>
    {if $page_meta_tags eq ""}
    <meta name="description" content="{$smarty.const.CONF_HOMEPAGE_META_DESCRIPTION}" />
    <meta name="keywords" content="{$smarty.const.CONF_HOMEPAGE_META_KEYWORDS}" />
    {else}
    {$page_meta_tags}
    {/if}

    {* ����������� ������ � ������ *}

    <link rel="stylesheet" href="data/{$smarty.const.TPL}/style.css" type="text/css" media="screen" />
    <link rel="stylesheet" href="data/{$smarty.const.TPL}/styleprint.css" type="text/css" media="print" />
    <link rel="icon" href="data/{$smarty.const.TPL}/favicon.ico" type="image/x-icon" />
    <link rel="shortcut icon" href="data/{$smarty.const.TPL}/favicon.ico" type="image/x-icon" />

    {* ����� ������ ������ *}
    <link rel="stylesheet" type="text/css" href="data/{$smarty.const.TPL}/autocomplete.css" />

    {* ����������� �������� *}

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
                document.getElementById('cart').innerHTML = '<b>' + doCart_act1 + ':<\/b>&nbsp;&nbsp;' + req["shopping_cart_items"] +
                    '&nbsp;' + doCart_act2 + '<div style="padding-top: 4px;"><b>' + doCart_act3 + ':<\/b>&nbsp;&nbsp;' + req["shopping_cart_value_shown"] +
                    '<\/div><div style="padding-top: 10px;" align="center"><table cellspacing="0" cellpadding="0" class="fsttab"><tr><td><table cellspacing="0" cellpadding="0" class="sectb"><tr><td><a {if $smarty.const.CONF_OPEN_SHOPPING_CART_IN_NEW_WINDOW eq 1}href="#" onclick="open_window(\'index.php?do=cart\',500,300);"{else}href="{if $smarty.const.CONF_MOD_REWRITE eq 1}cart.html{else}index.php?shopping_cart=yes{/if}"{/if}>' + doCart_act4 + '<\/a><\/td><\/tr><\/table><\/td><\/tr><\/table><\/div>';
                document.getElementById('axcrt').innerHTML = doCart_act5;
                {literal}}}{/literal}

        function doCpr(req) {literal}{{/literal}
            if(document.getElementById('cprbox') && req["cpr_value"] > 0){literal}{{/literal}
                document.getElementById('cprbox').innerHTML = doCpr_act1 + '&nbsp;' + req["cpr_value"] +
                    '&nbsp;' + doCpr_act2 + '<div style="padding-top: 10px;" align="center"><table cellspacing="0" cellpadding="0"><tr><td><table cellspacing="0" cellpadding="0" class="fsttab"><tr><td><table cellspacing="0" cellpadding="0" class="sectb"><tr><td><a href="{if $smarty.const.CONF_MOD_REWRITE eq 1}compare.html{else}index.php?comparison_products=yes{/if}">' + doCpr_act3 + '<\/a><\/td><\/tr><\/table><\/td><\/tr><\/table><\/td><td>&nbsp;&nbsp;<\/td><td><table cellspacing="0" cellpadding="0" class="fsttab"><tr><td><table cellspacing="0" cellpadding="0" class="sectb"><tr><td><a href="#" onclick="doLoadcprCL(\'do=compare&amp;clear=yes\'); return false">' + doCpr_act4 + '<\/a><\/td><\/tr><\/table><\/td><\/tr><\/table><\/td><\/tr><\/table><\/div>';
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

    {* ����� ����� *}
    <script type="text/javascript" src="/data/admin/jquery.min.js"></script>
    <script type="text/javascript" src="data/{$smarty.const.TPL}/autocomplete.js"></script>
    {literal}
    <script type="text/javascript">
        $(document).ready(function() {

            function liFormat (row) {
                var result = row[0];
                return result;
            }

            function selectItem(li) {
                if( li == null ) var sValue = '������ �� �������!';
                if( !!li.extra ) var sValue = li.extra[2];
                else var sValue = li.selectValue;
                document.forms["formpoisk"].submit();
                //alert("������� ������ � ID: " + sValue);
            }
            $("#searchauto").autocomplete("autocomplete.php", { delay:5,minChars:1,matchSubset:1,autoFill:false,matchContains:1,cacheLength:10,selectFirst:false,maxItemsToShow:10,onItemSelect:selectItem })

        });


    </script>
    {/literal}
    {* ����������� rss *}

    <link rel="alternate" href="index.php?do=rss" title="rss" type="application/rss+xml">

    {* ����� ��� IE *}

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