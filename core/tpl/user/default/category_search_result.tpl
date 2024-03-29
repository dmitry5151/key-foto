{* ������ ������ ����������� ������ � ��������� *}

{include file="header.tpl" header=$smarty.const.STRING_ADVANCED_SEARCH_IN_CATEGORY}

{* ����� ������������ ������ *}

{if $allow_products_search}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hmin" align="left">{include file="advanced_search_in_category.tpl"}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{/if}

{* ����� ���������� ������� *}

{if $products_to_show}
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

{* ����� ������� *}

<table cellspacing="0" cellpadding="0" width="100%">
  {section name=i1 loop=$products_to_show}
  {if $smarty.section.i1.index is div by $smarty.const.CONF_COLUMNS_PER_PAGE}<tr>{assign var="helpcounter" value=0}{/if}{assign var="helpcounter" value=$helpcounter+1}
    <td width="{math equation="100 / x" x=$smarty.const.CONF_COLUMNS_PER_PAGE format="%d"}%" align="left" valign="top">
    {include file="product_brief.tpl" product_info=$products_to_show[i1]}
    </td>
    {if ($smarty.section.i1.index+1) is div by $smarty.const.CONF_COLUMNS_PER_PAGE || $products_to_show_counter eq $smarty.section.i1.index+1}
	</tr>
    <tr>
	{section name=e loop=$smarty.const.CONF_COLUMNS_PER_PAGE max=$helpcounter}
    {assign var="idnrecat" value=$smarty.section.i1.index-$helpcounter+$smarty.section.e.index+1}
    <td align="left">
	  <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbot"><a href="{if $smarty.const.CONF_MOD_REWRITE eq 1}product_{$products_to_show[$idnrecat].productID}.html{else}index.php?productID={$products_to_show[$idnrecat].productID}{/if}">{$smarty.const.STRING_MOREPR}</a></td>
        </tr>
      </table>
	</td>
    {if $smarty.section.e.index+1 ne $smarty.const.CONF_COLUMNS_PER_PAGE}
    <td><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim" alt=""></td>
    {/if}
    {/section}
    </tr>
    {else}
    <td class="delim"><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim" alt=""></td>
    {/if}
  {/section}
</table>

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
{if $search_with_change_category_ability}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop error" align="center">{$smarty.const.STRING_EMPTY_SEARCH_RESULT}</td>
  </tr>
</table>
{/if}
{/if}