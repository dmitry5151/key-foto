{* ������ ������ ����������� �������� ������ ������� *}

{include file="header.tpl" header=$smarty.const.ADMIN_SEARCH_BUTTON}
{if $products_to_show_count > 0}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center">{$smarty.const.STRING_FOUND} <b>{$products_found}</b> {$smarty.const.STRING_PRODUCTS}</td>
  </tr>
</table>

{* ����� ���������� ������� *}

{if $string_product_sort}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center">{$string_product_sort}</td>
  </tr>
</table>
{/if}

{* ����� ��������� �� ��������� *}

{if $search_navigator}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center">{$search_navigator}</td>
  </tr>
</table>
{/if}

<table cellspacing="0" cellpadding="0" width="100%">
  {section name=q loop=$products_to_show max=$products_to_show_count}
  {if $smarty.section.q.index is div by $smarty.const.CONF_COLUMNS_PER_PAGE}<tr>{assign var="helpcounter" value=0}{/if}{assign var="helpcounter" value=$helpcounter+1}
    <td width="{math equation="100 / x" x=$smarty.const.CONF_COLUMNS_PER_PAGE format="%d"}%" align="left" valign="top">
    {include file="product_brief.tpl" product_info=$products_to_show[q]}
    </td>
    {if ($smarty.section.q.index+1) is div by $smarty.const.CONF_COLUMNS_PER_PAGE || $products_to_show_counter eq $smarty.section.q.index+1}
	</tr>
	<tr>
	{section name=e loop=$smarty.const.CONF_COLUMNS_PER_PAGE max=$helpcounter}
    {assign var="idnrecat" value=$smarty.section.q.index-$helpcounter+$smarty.section.e.index+1}
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
  {else}<td class="delim"><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim"></td>{/if}
  {/section}
</table>

{* ����� ��������� �� ��������� *}

{if $search_navigator}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center">{$search_navigator}</td>
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

<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center">{$smarty.const.STRING_FOUND} <b>{$products_found}</b> {$smarty.const.STRING_PRODUCTS}</td>
  </tr>
</table>
{else}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop error" align="center">{$smarty.const.STRING_NO_MATCHES_FOUND}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{/if}