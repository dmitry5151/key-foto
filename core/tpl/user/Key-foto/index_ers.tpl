<!DOCTYPE html>
<html dir="ltr" lang="en-US">
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

<table cellspacing="0" cellpadding="0" width="100%"><tr><td valign="top" align="left">

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
<header class="dwa-header clearfix">


    <div class="dwa-shapes">
        <div style="width: 100%; position: absolute; height:272px">
    	<div style="width:750px; height:272px; position: relative; float:left; z-index:5"></div>
        <div style="height:272px; position: relative; z-index:20; margin-left:760px">
            <img src="data/{$smarty.const.TPL}/images/object1448695670.png" class="dwa-gen1" />
            <img src="data/{$smarty.const.TPL}/images/object1083491709.png" class="dwa-gen2" />
            <img src="data/{$smarty.const.TPL}/images/object1338207163.png" class="dwa-gen3" />
        </div>
    </div>
    <div class="cleared"></div>
<div class="dwa-object1094520239" data-left="260px">
    <span>Бесплатно по России</span>
    <span style="font-weight:bold; font-size: 25px">8-800-555-24-21</span>
    <span>Москва</span>
    <span style="font-weight:bold; font-size: 25px">8-495-258-68-23</span>
    <span style="text-align:right">многоканальный</span>
</div>
<div class="dwa-object120887411" data-left="100%"></div>
<div class="dwa-object2054217316" data-left="40px"><a href="index.html" style="display:block; width:185px; height:175px"></a></div>
<div class="dwa-object1297403000" data-left="260px"><!-- баннер -->
    {*include file="banner.tpl"*}
</div>
<div class="dwa-object164594156" data-left="15px"><!-- ООО ЭнергоРегионСнаб --></div>
<div class="dwa-object384376408" data-left="470px">
    {* Корзина товаров в шапке *}
	{if $smarty.const.CONF_SHOW_ADD2CART == '1'}
        <div id="smc" class="cart" style="font-weight: normal !important;">{if $shopping_cart_value}<a href="/cart.html">{$shopping_cart_items}&nbsp;{$smarty.const.CART_CONTENT_NOT_EMPTY}&nbsp;<strong>{$shopping_cart_value_shown|replace:'"':'&quot;'}</strong></a>&nbsp;&nbsp;<a title="Очистить корзину" style="color:red; text-shadow: none" href="index.php?popup=no&amp;shopping_cart=yes&amp;clear_cart=yes">x</a>
        {else}
        {$smarty.const.STRING_CART_PR} {$smarty.const.CART_CONTENT_EMPTY}
        {/if}</div>
    {/if}
	<a href="/cart.html" alt="Корзина" title="Оформить заказ"><div class="cart-button"></div></a>
</div>
<div class="dwa-object1746488529" data-left="470px">
    {* Форма заказа обратного звонка *}
    <form class="dwa-search" name="Callback" action="index.php" method="get" id="phoneform" style="position:relative; width:259px; height:61px">
        <input type="text" name="phone_num" style="background: transparent; color: #1652A2 !important; position:relative; top:18px; left:83px; width: 158px; height:24px; border-color:#7ba0b8; font-size:11px; padding: 4px 2px" id="callback">
        <input type="hidden" name="send" value="yes">
        <input type="hidden" name="phone" value="yes">
        {*<input type="submit" value="Send" class="dwa-search-button" />*}
        <input type="submit" class="send-phone" title="Заказать" />
    </form>
</div>

            </div>
<h1 class="dwa-headline" data-left="75.6%">
    <a href="#">ООО ЭнергоРегионСнаб</a>
</h1>
<h2 class="dwa-slogan" data-left="60.72%">Мотопомпы</h2>



<div class="dwa-textblock dwa-object1250359214" data-left="99.33%">
    <form class="dwa-search" action="index.php" method="get" name="formpoisk" id="formpoisk">
        {section name=sert loop=$searchstrings}<input type="hidden" name='search_string_{$smarty.section.sert.index}' value='{$searchstrings[sert]}'>{/section}
        <input type="text" name="searchstring" id="searchauto" {if !$searchstring} value="поиск"{else} value="{$searchstring}"{/if}">
        <input type="submit" value="Search" name="search" class="dwa-search-button">
    </form>
</div>
<nav class="dwa-nav clearfix">
    <ul class="dwa-hmenu">
        <li><a {if $smarty.server.REQUEST_URI == "/pages/kak_vybrat_motopompu.html"}class="active"{/if} href="{11|@fu_make_url_pages}">Как выбрать мотопомпу</a></li>
        <li><a {if $smarty.server.REQUEST_URI == "/price.html"}class="active"{/if} href="price.html">Прайслист</a></li>
        <li><a {if $smarty.server.REQUEST_URI == "/oplata_i_dostavka.html"}class="active"{/if} href="{1|@fu_make_url_pages}">Оплата и доставка</a></li>
        <li><a {if $smarty.server.REQUEST_URI == "/feedback.html"}class="active"{/if} href="feedback.html">Контакты</a></li>
    </ul> 
    </nav>

                    
</header>
<div class="dwa-sheet clearfix">
            <div class="dwa-layout-wrapper clearfix">
                <div class="dwa-content-layout">
                    <div class="dwa-content-layout-row">
{* левая колонка (если есть блоки) *}                        
{if $countlb > 0}
    <div class="dwa-layout-cell dwa-sidebar1 clearfix">
        {include file="blocks.tpl" binfo=$left_blocks bclass="hdb" nopad=1 balign="center"}
    </div>
{/if}

<div class="dwa-layout-cell dwa-content clearfix"><!-- Начало блока контента -->

{* верхние блоки *}        
{include file="blocks.tpl" binfo=$top_blocks bclass="hdbtop" balign="left"}

{* вывод центральной страницы *}
{include file="$main_content_template"}

{* нижние блоки *}
{include file="blocks.tpl" binfo=$bottom_blocks bclass="hdbtop" balign="left"} {*hdbot*}

</div>

{* правая колонка (если есть блоки) *}                        
{if $countrb > 0}
	 <div class="dwa-layout-cell dwa-sidebar2 clearfix">
		{include file="blocks.tpl" binfo=$right_blocks bclass="hdb" nopad=1 balign="center"}
	</div>
{/if}
                    </div>
                </div>
            </div><footer class="dwa-footer clearfix">
<div class="dwa-content-layout">
    <div class="dwa-content-layout-row">
    <div class="dwa-layout-cell layout-item-0" style="width: 67%">
        <table class="dwa-article" style="border-top-width: 0px; border-right-width: 0px; border-bottom-width: 0px; border-left-width: 0px; border-style: initial; border-color: initial; width: 100%;"><tbody><tr><td style="text-align: left; width: 25%;">Бесплатно по России<br>
         <span style="font-weight: bold; font-size: 16px;">8-800-555-24-21</span></td><td style="text-align: left; width: 25%;">г. Москва<br>
         <span style="font-size: 16px; font-weight: bold;">8-495-258-68-23</span></td><td style="text-align: left; width: 25%;">г. Владимир<br>
        <p style="text-align: left;"><span style="font-size: 16px; font-weight: bold;">8-492-260-04-14</span></p>
        </td><td style="text-align: left; width: 25%;">г. Курск<br>
         <span style="font-size: 16px; font-weight: bold;">8-4712-31-01-47</span></td></tr></tbody></table>
    </div><div class="dwa-layout-cell" style="width: 33%">
        <p style="text-align: right;"><img width="88" height="31" alt="" class="dwa-lightbox" src="images/hit-2.gif"></p>
    </div>
    </div>
</div>
<div class="dwa-content-layout">
    <div class="dwa-content-layout-row">
    <div class="dwa-layout-cell layout-item-1" style="width: 50%">
        <p style="text-align: left;">&copy; 2005 - {php}echo date(Y);{/php}&nbsp;<a href="http://ers-motopumps.ru">ЭнергоРегионСнаб</a>. Все права защищены.&nbsp;<a href="mailto:info@ers-motopumps.ru">info@ers-motopumps.ru</a><a href="mailto:info@ers-motopumps.ru"></a></p>
    </div><div class="dwa-layout-cell layout-item-1" style="width: 50%">
        <p style="text-align: right;"><a href="http://www.ers-energo.ru/page_1.html">О&nbsp;компании</a>&nbsp;|&nbsp;<a href="http://www.ers-energo.ru/page_10.html">Условия доставки</a>&nbsp;|&nbsp;<a href="http://www.ers-energo.ru/page_9.html">Способы оплаты</a>&nbsp;|&nbsp;<a href="http://www.ers-motopumps.ru/feedback.html">Контакты</a></p>
    </div>
    </div>
</div>

</footer>

    </div>
</div>

{* прорисовка скрытого ajax бокса *}
<script type="text/javascript">printcart();</script>

{/if}
</body></html>