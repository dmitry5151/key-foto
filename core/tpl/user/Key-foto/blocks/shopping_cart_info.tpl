{* шаблон блока информации о состоянии корзины покупателя *}
<div class="dwa-block clearfix">
    <div class="dwa-blockheader">
        <span class="t">{$postheader}</span>
    </div>
    <div class="dwa-blockcontent">
        <div align="center" id="cart">
            {if $smarty.const.CONF_SHOW_ADD2CART == '1'}
            {if $shopping_cart_value} <b>{$smarty.const.STRING_CART_PR}:</b>&nbsp;&nbsp;{$shopping_cart_items} {$smarty.const.CART_CONTENT_NOT_EMPTY}
            <div style="padding-top: 4px;"><b>{$smarty.const.STRING_CUR_PR}:</b>&nbsp;&nbsp;{$shopping_cart_value_shown|replace:'"':'&quot;'}</div>
            <div style="padding-top: 10px;" align="center">
                <a class="dwa-button" {if $smarty.const.CONF_OPEN_SHOPPING_CART_IN_NEW_WINDOW eq 1}
                    href="#" onclick="open_window('index.php?do=cart',500,300); return false"
                    {else}
                    href="{if $smarty.const.CONF_MOD_REWRITE eq 1}cart.html{else}index.php?shopping_cart=yes{/if}"
                    {/if}>{$smarty.const.CART_PROCEED_TO_CHECKOUT}</a>
            </div>
            {else}{$smarty.const.STRING_CART_PR} {$smarty.const.CART_CONTENT_EMPTY}{/if}
            {/if}
        </div>
    </div>
</div>