{* шаблон блока информации о состоянии папки сравнения товаров *}
<div class="dwa-block clearfix">
    <div class="dwa-blockheader">
        <span class="t">{$postheader}</span>
    </div>
    <div class="dwa-blockcontent">
        <div align="center" id="cprbox"> 
            {if $compare_value > 0}
            {$smarty.const.STRING_COMPARISON_IN} {$compare_value} {$smarty.const.CART_CONTENT_NOT_EMPTY}
            <div style="padding-top: 10px;" align="center">
                <a class="dwa-button" href="{if $smarty.const.CONF_MOD_REWRITE eq 1}compare.html{else}index.php?comparison_products=yes{/if}">{$smarty.const.STRING_COMPARISON_INFOLDER}</a>&nbsp;&nbsp;<a class="dwa-button" href="#" onclick="doLoadcprCL('do=compare&amp;clear=yes'); return false">{$smarty.const.STRING_COMPARISON_CLEAR}</a>
            </div>
            {else}{$smarty.const.STRING_COMPARISON_IN} {$smarty.const.CART_CONTENT_EMPTY}{/if} 
        </div>
    </div>
</div>