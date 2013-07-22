{* ������ ������� ��������� ������� *}

{include file="header.tpl" header=$smarty.const.STRING_PRODUCT_COMPARISON}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hmin">
	  <table cellspacing="1" cellpadding="0" width="100%" class="gre">
        <tr>
		  {* �������� ������� *}
          <td class="lt pad" align="left" valign="middle" width="5%" nowrap="nowrap">{$smarty.const.TABLE_PRODUCT_NAME}</td>
          {section name=i loop=$products}
          <td class="pad" valign="middle" align="left" width="{math equation="round(95 / $products_count)"}%"><a href='index.php?productID={$products[i].productID}'><b>{$products[i].name}</b></a></td>
          {/section}
		</tr>
        <tr>
		  {* ���������� ������� *}
          <td class="lt pad" valign="middle" align="left">{$smarty.const.ADMIN_PRODUCT_PICTURE}</td>
          {section name=i loop=$products}
          <td class="pad" valign="middle" align="left">{if $products[i].picture}<img src="data/small/{$products[i].picture}" alt="{$products[i].name}">{else}{if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}<img src="data/empty.gif" alt="">{else}-{/if}{/if}</td>
          {/section}
		</tr>
        <tr>
		  {* ���� ������� *}
          <td class="lt pad" valign="middle" align="left">{$smarty.const.STRING_PRODUCT_PRICE}</td>
          {section name=i loop=$products}
          <td class="pad price" valign="middle" align="left">{$products[i].PriceWithUnit}</td>
          {/section}
		</tr>
        <tr>
		  {* �������� ������� *}
          <td class="lt pad" valign="middle" align="left">{$smarty.const.STRING_PRODUCT_BRIEF_DESC}</td>
          {section name=i loop=$products}
          <td class="pad" valign="middle" align="left">{if $products[i].brief_description}{$products[i].brief_description}{else}-{/if}</td>
          {/section}
		</tr>
        {section name=i loop=$definedOptions}
        <tr>
		  {* �������������� ������� *}
          <td class="lt pad" valign="middle" align="left">{$definedOptions[i].name}</td>
          {section name=j loop=$products}
          <td class="pad" valign="middle" align="left">{$products[j][i]}</td>
          {/section}
		</tr>
        {/section}
      </table>
	</td>
  </tr>
</table>