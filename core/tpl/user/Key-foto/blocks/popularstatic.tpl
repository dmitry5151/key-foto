{* ������ ������������ ����� ���������� ������� *}

{if $popular_products}
<table cellspacing="0" cellpadding="0" width="100%">
  {section name=i loop=$popular_products}
  {if $smarty.section.i.index is div by 4}<tr>{/if}
    <td width="{math equation="100 / x" x=4 format="%d"}%" align="center" valign="top" style="padding: 8px;">
    <a href="{$popular_products[i]|@fu_make_url}"><img src="data/{$popular_products[i].filename}" alt="{$popular_products[i].name}"></a>
    <div class="fil"></div>
    <b class="price">{if $popular_products[i].cena <= 0}{$smarty.const.STRING_NOPRODUCT_IN}{else}{$popular_products[i].Price}{/if}</b>
    <div class="fil"></div>
    <a href="{$popular_products[i]|@fu_make_url}">{$popular_products[i].name}</a>
    </td>
    {if ($smarty.section.i.index+1) is div by 4}</tr>{else}
    <td><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim" alt=""></td>
    {/if}
    {/section}
</table>
{else}
<div align="center">{$smarty.const.STRING_EMPTY_CATEGORY}</div>
{/if}