{* шаблон короткого описни€ товара *}

{if $product_info.picture}<!--  артинка -->                
    <a href="{$product_info|@fu_make_url}"><img src="data/medium/{$product_info.picture}" alt="{$product_info.name}" tip="{include file="tooltip.tpl"}" style="width: 100%" /></a>
{else}
    {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}
    <a href="{$product_info|@fu_make_url}"><img src="data/empty.gif" alt="no photo" style="width: 100%" /></a>
    {/if}
{/if}