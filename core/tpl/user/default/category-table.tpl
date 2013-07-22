{* ������ ������ ������� � ���������� *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?categoryID=`$selected_category.categoryID`&amp;eaction=cat' title='`$smarty.const.ADMIN_ADMIN_MENUNEW1`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$categoryName`}{else}{assign var="postheader" value=$categoryName}{/if}

{* �������� � ������ *}

{include file="header.tpl" header=$postheader}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{if $smarty.const.CONF_SHOW_COUNTPROD eq 1}<span style="float: right;">{$smarty.const.STRING_COUNTPROD}: {$products_to_showc}</span>{/if}<a href="{$smarty.const.CONF_FULL_SHOP_URL}">{$smarty.const.LINK_TO_HOMEPAGE}</a>{section name=i loop=$product_category_path}{if $product_category_path[i].categoryID != 1} / <a href="{$product_category_path[i]|@fu_make_url}">{$product_category_path[i].name}</a>{/if}{/section}</td>
  </tr>
</table>

{* ����� �������� ��������� (���� ����) *}

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

{* ����� �������� ������������ (���� ����) *}

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

{* ����� ���������� ������� *}

 {if $string_product_sort}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center">{$string_product_sort}</td>
  </tr>
</table>
{/if}

{* ����� ��������� �� ��������� *}

{if $catalog_navigator}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center">{$catalog_navigator}</td>
  </tr>
</table>
{/if}

{* BEGIN Products table *}
<table cellspacing="0" cellpadding="0" width="100%">
  <thead align="left">
    <tr class="hd">
      <th style="padding:2px 4px;">{$smarty.const.TABLE_PRODUCT_NAME}</th>
    {if $smarty.const.CONF_CHECKSTOCK == '1'}
      <th>{$smarty.const.IN_STOCK}</th>
    {/if}
    {if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
      <th>{$smarty.const.STRING_PRODUCT_CODE}</th>
    {/if}
      <th>{$smarty.const.CURRENT_PRICE}</th>
      <th>{$smarty.const.ADD_TO_CART_STRING}</th>
    </tr>
  </thead>
  <tbody>
    {section name=u loop=$products_to_show}
    <tr {cycle values=",class='cbt'"}>
      {include file="product_brief-table.tpl" product_info=$products_to_show[u]}
	  </tr>
	  {/section}
  </tbody>
</table>
{* END Products table *}

{* ����� ��������� �� ��������� *}

{if $catalog_navigator}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center">{$catalog_navigator}</td>
  </tr>
</table>
{/if}

{* ����� ���������� ������� *}

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

{* ����� ������ �� �������� ������������� � ��������� *}

{if $categorylinkscat}
{include file="header.tpl" header=$smarty.const.STRING_CAT_USE_AUX}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">{assign var="sett" value=0}
      {section name=icat loop=$categorylinkscat}
      <div {if $sett eq 1}style="margin-top: 4px;"{else}{assign var="sett" value=1}{/if}><a href="{if $smarty.const.CONF_MOD_REWRITE eq 1}page_{$categorylinkscat[icat][0]}.html{else}index.php?show_aux_page={$categorylinkscat[icat][0]}{/if}">{$categorylinkscat[icat][1]}</a></div>
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
