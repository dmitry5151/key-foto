{* шаблон короткого описния товара *}
<div class="more-ss">
    {if $product_info.picture}<!-- Картинка -->                
        <a href="{$product_info|@fu_make_url}"><img src="data/small/{$product_info.picture}" alt="{$product_info.name}" style="width: 100%; position: absolute" /></a>
    {else}
        {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}
        <a href="{$product_info|@fu_make_url}"><img src="data/empty.gif" alt="no photo" style="width: 100%" /></a>
        {/if}
    {/if}
    <!--a href="data/big/{$product_info.picture}" class="fancybox"><div class="caption-ss">Свойства</div></a-->
</div>
