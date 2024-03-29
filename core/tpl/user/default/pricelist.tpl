{* ������ �����-����� *}

{include file="header.tpl" header="`$smarty.const.STRING_PRICELIST` `$smarty.const.CONF_SHOP_NAME`"}

{* ����� ���������� ������� *}

{if $string_product_sort}
<table cellspacing="0" cellpadding="0" width="100%" class="print">
  <tr>
    <td class="cbt" align="left">{$string_product_sort}</td>
  </tr>
</table>
{/if}

{if $pricelist_elements}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hmin">
    <table cellspacing="1" cellpadding="0" width="100%" class="gre">
      <tr>
        <td class="lt pad" align="left" valign="middle" width="99%" nowrap="nowrap">{$smarty.const.STRING_PRICE_PRODUCT_NAME}</td>
        <td class="lt pad" align="left" valign="middle" width="90%" nowrap="nowrap">{$smarty.const.CURRENT_PRICE}</td>
        {if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
        <td class="lt pad" align="left" valign="middle" nowrap="nowrap">{$smarty.const.STRING_PRODUCT_CODE}</td>
        {/if}
	  </tr>
      {section name=i loop=$pricelist_elements}
      {assign var="paddingzn" value=8}
      {section name=j loop=$pricelist_elements max=($pricelist_elements[i][2]-2)}{assign var="paddingzn" value="`$paddingzn+8`"}{/section}
      <tr class="ptbl">
        <td {if $pricelist_elements[i][4] ne 1} colspan="{if $smarty.const.CONF_DISPLAY_PRCODE eq 1}3{else}2{/if}" {/if} {if $pricelist_elements[i][4] ne 1} class="lt" {/if} width="99%" style="padding-left: {$paddingzn}px"><a href="{$pricelist_elements[i]|@fu_make_url}" class="noline">{$pricelist_elements[i][1]}</a></td>     
        {if ($pricelist_elements[i][4] eq 1) && ($currencies_count ne 0)}<td nowrap="nowrap">{$pricelist_elements[i][5]}</td>{/if}
        {if ($pricelist_elements[i][4] eq 1) && ($smarty.const.CONF_DISPLAY_PRCODE eq 1)}
        <td nowrap="nowrap">{if $pricelist_elements[i][7]} {$pricelist_elements[i][7]}{/if}</td>
        {/if}
	  </tr>
      {/section}
    </table>
    </td>
  </tr>
</table>
{else}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="center">{$smarty.const.STRING_EMPTY_LIST}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{/if}
{if $pricelist_elements}
<table cellspacing="0" cellpadding="0" width="100%" class="print">
  <tr>
    <td class="hdbot"><a href="index.php?download_price=yes">{$smarty.const.STRING_DOWNLOAD_PRICE}</a></td>
  </tr>
</table>
{/if}