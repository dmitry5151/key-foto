<!DOCTYPE html>
<html dir="ltr">

{* подключение файла заголовков *}
{include file="head.tpl"}
<body>
    {if $smarty.const.CONF_SHOP_BILD eq 1 and $isadmin ne "yes"}

        {* сообщение о профилактике *}

        <table cellspacing="0" cellpadding="0" width="100%" height="100%">
            <tr>
                <td class="profi arc" valign="middle" align="center"><img src="data/{$smarty.const.TPL}/bild.gif" alt="">
                    <br><br>{$smarty.const.STRING_BILD}<br>{$smarty.const.STRING_BILD_DES}</td>
            </tr>
        </table>

    {else}


    {* панель отладочной информации *}

    {if $smarty.const.CONF_DISPLAY_INFO eq 1 and $isadmin eq "yes"}
        <table cellspacing="0" cellpadding="0" width="100%" class="print">
            <tr class="mid">
                <td style="background: url('data/admin/fonbot.gif'); height: 23px;"><img src="data/admin/sep.gif" alt=""></td>
                <td width="100%" style="background: url('data/admin/fonbot.gif'); height: 23px;">
                    <table cellspacing="0" cellpadding="0" width="100%">
                        <tr class="mid">
                            <td style="padding-bottom: 2px;" nowrap="nowrap" class="stat">&nbsp;&nbsp;{$smarty.const.STRING_EXE_DATA}:&nbsp;<span id="tgenexe">0.000</span>&nbsp;{$smarty.const.TIME_SEK}</td>
                            <td nowrap="nowrap"><img src="data/admin/sep2.gif" alt=""></td>
                            <td style="padding-bottom: 2px;" nowrap="nowrap" class="stat">{$smarty.const.STRING_PREEXE_DATA}:&nbsp;<span id="tgencompile">0.000</span>&nbsp;{$smarty.const.TIME_SEK}</td>
                            <td nowrap="nowrap"><img src="data/admin/sep2.gif" alt=""></td>
                            <td style="padding-bottom: 2px;" nowrap="nowrap" class="stat">{$smarty.const.BD_DO_TIME}:&nbsp;<span id="tgendb">0.000</span>&nbsp;{$smarty.const.TIME_SEK}</td>
                            <td nowrap="nowrap"><img src="data/admin/sep2.gif" alt=""></td>
                            <td style="padding-bottom: 2px;" nowrap="nowrap" class="stat">{$smarty.const.STRING_ALL_EXETIME}:&nbsp;<span id="tgenall">0.000</span>&nbsp;{$smarty.const.TIME_SEK}</td>
                            <td nowrap="nowrap"><img src="data/admin/sep2.gif" alt=""></td>
                            <td width="95%" style="padding-bottom: 2px;" nowrap="nowrap" class="stat">{$smarty.const.STRING_DO_COUNT}:&nbsp;<span id="tgensql">0</span></td>
                        </tr>
                    </table>
                </td> 
            </tr>
        </table>
        <script type="text/javascript">doLStat('do=stat');</script>
    {/if}

    {* вывод сообщений об ошибках *}
{if $exploerrors ne ""}{$exploerrors}{/if}

{* Верстка шаблона *}
<div id="dwa-main">
    <div id="dwa-header-bg">
    </div>
    <div id="dwa-hmenu-bg" class="dwa-bar dwa-nav">
    </div>
    <div class="dwa-sheet clearfix">
        <header class="dwa-header">
        <div class="dwa-shapes">

            <div class="dwa-object1798686377" data-left="0.99%"></div>
            {* корзина *}
            <div class="dwa-object1092939082" data-left="99.45%">
                <div class="dwa-block clearfix" style="margin-top: 0">
                    <div class="dwa-blockcontent" style="padding: 0">
                        <table cellspacing="0" cellpadding="0" width="100%" align="left">
                            <tr>
                                <td width="35">
                                    <a href="/cart.html" alt="Корзина" title="Оформить заказ"><img src="data/Key-foto/images/cart.png" style="border: none; margin: 0 0 0 5px" /></a>
                                </td>
                                <td style="text-align: center">
                                <div id="cart">
                                {if $smarty.const.CONF_SHOW_ADD2CART == '1'}
                                    <div style="font-weight: normal !important;">{if $shopping_cart_value}<a href="/cart.html">{$shopping_cart_items}&nbsp;{$smarty.const.CART_CONTENT_NOT_EMPTY}&nbsp;<strong>{$shopping_cart_value_shown|replace:'"':'&quot;'}</strong></a>&nbsp;&nbsp;<a title="Очистить корзину" style="color:red; text-shadow: none" href="index.php?popup=no&amp;shopping_cart=yes&amp;clear_cart=yes">x</a>
                                    {else}
                                    Корзина пуста
                                    {/if}</div>
                                {/if}
                                </div>
                                </td>
                            </tr>
                        </table>
                    </div>
                </div>
                <div style="width: 100%">
                    {include file="blocks/login_small.tpl"}
                </div>
            </div>

        </div>
        <h1 class="dwa-headline" data-left="20.09%">
            <a href="index.html">Key-foto.com</a>
        </h1>
        <h2 class="dwa-slogan" data-left="23.3%">Авторский проект фоторепортера Дмитрия Хрупова</h2>        
        <div class="dwa-textblock dwa-object1237867625" id="divpoisk">
            <form class="dwa-search" action="index.php" method="get" name="formpoisk" id="formpoisk">
                <input type="text" id="searchauto" name="searchstring" value="{$searchstring}">
                <input type="submit" name="search" class="dwa-search-button" >
            </form>
        </div>
        <nav class="dwa-nav">{* Горизонтальное меню *}
            <div class="dwa-nav-inner">
                 {include file="hmenu.tpl"}
            </div>
        </nav>
        </header>
        <div class="dwa-layout-wrapper">
            <div class="dwa-content-layout">
                <div class="dwa-content-layout-row">

                    {* левая колонка (если есть блоки) *}                        
                    {if $countlb > 0}
                        <div class="dwa-layout-cell dwa-sidebar1">
                            {include file="blocks.tpl" binfo=$left_blocks bclass="hdb" nopad=1 balign="center"}
                        </div>
                    {/if}

                    <div class="dwa-layout-cell dwa-content">
                        {* верхние блоки *}        
                        {include file="blocks.tpl" binfo=$top_blocks bclass="hdbtop" balign="left"}

                        {* вывод центральной страницы *}
                        {include file="$main_content_template"}

                        {* нижние блоки *}
                        {include file="blocks.tpl" binfo=$bottom_blocks bclass="hdbtop" balign="left"} {*hdbot*}
                    </div>

                    {* правая колонка (если есть блоки) *}                        
                    {if $countrb > 0}
                        <div class="dwa-layout-cell dwa-sidebar2">
                            {include file="blocks.tpl" binfo=$right_blocks bclass="hdb" nopad=1 balign="center"}
                        </div>
                    {/if}
                </div>
            </div>
        </div>
    </div>
    <footer class="dwa-footer">
        <div class="dwa-footer-inner">
            <div class="dwa-content-layout">
                <div class="dwa-content-layout-row">
                    <div class="dwa-layout-cell" style="width: 25%">
                        <p><a href="http://www.ixum.ru" target="_blank"></a></p>
                    </div><div class="dwa-layout-cell" style="width: 25%">
                        <p><br></p>
                    </div><div class="dwa-layout-cell" style="width: 25%">
                        <p><br></p>
                    </div><div class="dwa-layout-cell" style="width: 25%">
                        <p><br></p>
                    </div>
                </div>
            </div>
            <div class="dwa-content-layout">
                <div class="dwa-content-layout-row">
                    <div class="dwa-layout-cell" style="width: 100%">
                        <p>Copyright &copy; 2011 - {php}echo date(Y);{/php}.&nbsp;<a href="http://keyspgroup.com">Keys Private Group</a>. All Rights Reserved.</p><p>Disigned by&nbsp;<a href="http://www.ixum.ru" target="_blank">www.ixum.ru</a></p>
                    </div>
                </div>
            </div>

        </div>
    </footer>

</div>

{* прорисовка скрытого ajax бокса *}
<script type="text/javascript">printcart();</script>

{/if}
</body></html>