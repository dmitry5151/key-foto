{* шаблон вывода товаров в категориях *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?categoryID=`$selected_category.categoryID`&amp;eaction=cat' title='`$smarty.const.ADMIN_ADMIN_MENUNEW1`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$categoryName`}{else}{assign var="postheader" value=$categoryName}{/if}

{* название и ссылки *}
<article class="dwa-post dwa-article">
    <h1 style="margin: 15px 0" class="dwa-postheader">{if $page_title ne "Главная категория"}{$postheader}{else}Поиск по полному списку{/if}</h1>
    <div class="dwa-postcontent dwa-postcontent clearfix">
        <div class="dwa-content-layout">
            <div class="dwa-content-layout-row">
            <div class="dwa-layout-cell layout-item" style="width: 100%" >
<table cellspacing="0" cellpadding="0" width="100%" class="navigator">
  <tr>
    <td align="left">{if $smarty.const.CONF_SHOW_COUNTPROD eq 1}<span style="float: right;">{$smarty.const.STRING_COUNTPROD}: {$products_to_showc}</span>{/if}<a href="{$smarty.const.CONF_FULL_SHOP_URL}">{$smarty.const.LINK_TO_HOMEPAGE}</a>{section name=i loop=$product_category_path}{if $product_category_path[i].categoryID != 1} / <a href="{$product_category_path[i]|@fu_make_url}">{$product_category_path[i].name}</a>{/if}{/section}</td>
  </tr>
</table>
<div class="fil2"></div>
{* вывод описания категории (если есть) *}

{if $selected_category.description && $selected_category.description != "<br>"}
{$selected_category.description}
{/if}

{* вывод описания подкатегорий (если есть) *}

{if $catrescur}
{section name=r loop=$catrescur}
{if $catrescur[r][3] != ""}
{assign var="urlRewr" value=$catrescur[r]|@fu_make_url}
{assign var="tlink" value="<a class='phead' href='`$urlRewr`'>`$catrescur[r].name`</a>"}
{include file="header.tpl" header=$tlink}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">{if $catrescur[r].picture}<a href="{$catrescur[r]|@fu_make_url}"><img src="data/category/{$catrescur[r].picture}" alt="{$catrescur[r].name}" title="{$catrescur[r].name}" align="left" style="margin: 0px 6px 6px 0px;"></a>{/if}{$catrescur[r].description}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot"><a href="{$catrescur[r]|@fu_make_url}">{$smarty.const.STRING_GO_PODCAT}</a></td>
  </tr>
</table>
{/if}
{/section}
{/if}

{if $products_to_show}

{* форма сортировки товаров *}

 {if $string_product_sort}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
      <td class="cattop" align="center" style="text-align: center">{$string_product_sort}</td>
  </tr>
</table>
{/if}

{* форма навигации по страницам *}

{if $catalog_navigator}
{*<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center">{$catalog_navigator}</td>
  </tr>
</table>*}
<div class="dwa-pager">{$catalog_navigator}</div>
{/if}

{* Таблица товаров *}
<div class="fil2"></div>
<table cellspacing="0" cellpadding="0" width="100%" class="zebra">
  <thead style="background: url('data/ERS-moto/images/tableheader.png') repeat scroll 0 0 transparent;">
    <tr>
    {if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
      <th>{$smarty.const.STRING_PRODUCT_CODE}</th>
    {/if}
      <th>Фото</th>
      <th width="300">{$smarty.const.TABLE_PRODUCT_NAME}</th>
      <th>Производ.</th>
      <th>Характеристики</th>
      <th>{$smarty.const.CURRENT_PRICE}</th>
      <th>Заказ</th>
  </thead>
  <tbody>
    {section name=u loop=$products_to_show}
    <tr>
      {include file="product_brief-table.tpl" product_info=$products_to_show[u]}
	</tr>
	  {/section}
  </tbody>
</table>
{* END *}

{* форма навигации по страницам *}

{if $catalog_navigator}
{*<!--table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center">{$catalog_navigator}</td>
  </tr>
</table-->*}
<div class="dwa-pager">{$catalog_navigator}</div>
{/if}

{* форма сортировки товаров *}

{if $string_product_sort}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center" style="text-align: center">{$string_product_sort}</td>
  </tr>
</table>
{/if}

{else}
<table cellspacing="0" cellpadding="0" width="100%" class="zebra">
  <tr>
      <td align="center" style="text-align: center">{if !$search_with_change_category_ability || $advanced_search_in_category}{if $advanced_search_in_category}{$smarty.const.STRING_EMPTY_SEARCH_RESULT}{else}{$smarty.const.STRING_EMPTY_CATEGORY}{/if}{/if}</td>
  </tr>
</table>
{/if}

{* вывод ссылок на страницы прикрепленные к категории *}

{if $categorylinkscat}
{include file="header.tpl" header=$smarty.const.STRING_CAT_USE_AUX}
<table cellspacing="0" cellpadding="0" width="100%" class="zebra">
  <tr>
    <td class="hdbtop" align="left">{assign var="sett" value=0}
      {section name=icat loop=$categorylinkscat}
      <div {if $sett eq 1}style="margin-top: 4px;"{else}{assign var="sett" value=1}{/if}><a href="{$categorylinkscat[icat][0]|@fu_make_url_pages}">{$categorylinkscat[icat][1]}</a></div>
      {/section}
	</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{/if}
			</div>
            </div>
        </div>
    </div>
</article>