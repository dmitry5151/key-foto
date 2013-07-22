{* шаблон вывода товаров в категориях *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?categoryID=`$selected_category.categoryID`&amp;eaction=cat' title='`$smarty.const.ADMIN_ADMIN_MENUNEW1`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$categoryName`}{else}{assign var="postheader" value=$categoryName}{/if}

{* название и ссылки *}

{include file="header.tpl" header=$postheader}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{if $smarty.const.CONF_SHOW_COUNTPROD eq 1}<span style="float: right;">{$smarty.const.STRING_COUNTPROD}: {$products_to_showc}</span>{/if}<a href="{$smarty.const.CONF_FULL_SHOP_URL}">{$smarty.const.LINK_TO_HOMEPAGE}</a>{section name=i loop=$product_category_path}{if $product_category_path[i].categoryID != 1} / <a href="{$product_category_path[i]|@fu_make_url}">{$product_category_path[i].name}</a>{/if}{/section}</td>
  </tr>
</table>

{* вывод описания категории (если есть) *}

{if $selected_category.description}
{include file="header.tpl" header=$smarty.const.STRING_CATEGORY_DESK}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">{if $selected_category.picture}<img src="data/category/{$selected_category.picture}" alt="{$selected_category.name}" align="left" style="margin: 0px 6px 6px 0px;">{/if}{$selected_category.description}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
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
    <td class="cattop" align="center">{$string_product_sort}</td>
  </tr>
</table>
{/if}

{* форма навигации по страницам *}

{if $catalog_navigator}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center">{$catalog_navigator}</td>
  </tr>
</table>
{/if}

<table cellspacing="0" cellpadding="0" width="100%">
  {section name=u loop=$products_to_show}
  {if $smarty.section.u.index is div by $smarty.const.CONF_COLUMNS_PER_PAGE}<tr>{assign var="helpcounter" value=0}{/if}{assign var="helpcounter" value=$helpcounter+1}
    <td width="{math equation="100 / x" x=$smarty.const.CONF_COLUMNS_PER_PAGE format="%d"}%" align="left" valign="top">
    {include file="product_brief.tpl" product_info=$products_to_show[u]}
    </td>
    {if ($smarty.section.u.index+1) is div by $smarty.const.CONF_COLUMNS_PER_PAGE || $products_to_show_counter eq $smarty.section.u.index+1}
	</tr>
    <tr>
	{section name=e loop=$smarty.const.CONF_COLUMNS_PER_PAGE max=$helpcounter}
    {assign var="idnrecat" value=$smarty.section.u.index-$helpcounter+$smarty.section.e.index+1}
    <td align="left">
	  <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbot"><a href="{$products_to_show[$idnrecat]|@fu_make_url}">{$smarty.const.STRING_MOREPR}</a></td>
        </tr>
      </table>
	</td>
    {if $smarty.section.e.index+1 ne $smarty.const.CONF_COLUMNS_PER_PAGE}<td><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim" alt=""></td>{/if}
    {/section}
    </tr>
  {else}<td class="delim"><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim" alt=""></td>{/if}
  {/section}
</table>

{* форма навигации по страницам *}

{if $catalog_navigator}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center">{$catalog_navigator}</td>
  </tr>
</table>
{/if}

{* форма сортировки товаров *}

{if $string_product_sort}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center">{$string_product_sort}</td>
  </tr>
</table>
{/if}

{else}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop error" align="center">{if !$search_with_change_category_ability || $advanced_search_in_category}{if $advanced_search_in_category}{$smarty.const.STRING_EMPTY_SEARCH_RESULT}{else}{$smarty.const.STRING_EMPTY_CATEGORY}{/if}{/if}</td>
  </tr>
</table>
{/if}

{* вывод ссылок на страницы прикрепленные к категории *}

{if $categorylinkscat}
{include file="header.tpl" header=$smarty.const.STRING_CAT_USE_AUX}
<table cellspacing="0" cellpadding="0" width="100%">
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