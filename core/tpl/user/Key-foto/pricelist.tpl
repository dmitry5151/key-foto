{* шаблон прайс-листа *}

<article class="dwa-post dwa-article">
    <h1 class="dwa-postheader">{$smarty.const.STRING_PRICELIST}&nbsp;{$smarty.const.CONF_SHOP_NAME}</h1>
    <div class="dwa-postcontent clearfix">
        <div class="dwa-content-layout">
            <div class="dwa-content-layout-row">
                <div class="dwa-layout-cell" style="width: 100%" >
                    {* форма сортировки товаров *}

                    {if $string_product_sort}
                    <table cellspacing="0" cellpadding="0" width="100%" class="print">
                        <tr>
                            <td class="cbt" align="center" style="text-align: center">{$string_product_sort}</td>
                        </tr>
                    </table>
                    {/if}
                    {if $pricelist_elements}
                    <table cellspacing="0" cellpadding="0" width="100%" class="print">
                        <tr>
                            <td style="padding: 0;"><a class="dwa-button" href="index.php?download_price=yes">{$smarty.const.STRING_DOWNLOAD_PRICE}</a></td>
                        </tr>
                    </table>
                    <div class="fil2"></div>
                    {/if}
                    {if $pricelist_elements}
                    <table cellspacing="1" cellpadding="0" width="100%" class="zebra">
                        <thead>
                            <tr>
                                <th align="left" valign="middle" width="99%" nowrap="nowrap">{$smarty.const.STRING_PRICE_PRODUCT_NAME}</th>
                                <!--th align="left" valign="middle" nowrap="nowrap">Произв.</th-->
                                <th align="left" valign="middle" width="90%" nowrap="nowrap">{$smarty.const.CURRENT_PRICE}</th>
                                {if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
                                <th align="left" valign="middle" nowrap="nowrap">{$smarty.const.STRING_PRODUCT_CODE}</th>
                                {/if}
                            </tr>
                        </thead>
                        <tbody>
                            {section name=i loop=$pricelist_elements}
                            {assign var="paddingzn" value=8}
                            {section name=j loop=$pricelist_elements max=($pricelist_elements[i][2]-2)}{assign var="paddingzn" value="`$paddingzn+8`"}{/section}
                            <tr class="ptbl">
                                <td {if $pricelist_elements[i][4] ne 1} colspan="{if $smarty.const.CONF_DISPLAY_PRCODE eq 1}3{else}2{/if}" {/if} {if $pricelist_elements[i][4] ne 1} style="font-weight:bold" {/if} width="99%" style="padding-left: {$paddingzn}px"><a href="{$pricelist_elements[i]|@fu_make_url}" class="noline">{$pricelist_elements[i][1]}</a></td>
                                {*if $pricelist_elements[i][4] eq 1}<td nowrap="nowrap"><strong>{$pricelist_elements[i][9]}</strong>&nbsp;л/мин</td>{/if*}    
                                {if ($pricelist_elements[i][4] eq 1) && ($currencies_count ne 0)}<td nowrap="nowrap">{$pricelist_elements[i][5]}</td>{/if}
                                {if ($pricelist_elements[i][4] eq 1) && ($smarty.const.CONF_DISPLAY_PRCODE eq 1)}
                                <td nowrap="nowrap">{if $pricelist_elements[i][7]} {$pricelist_elements[i][7]}{/if}</td>
                                {/if}
                            </tr>
                            {/section}
                        </tbody>
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
                </div>
            </div>
        </div>
    </div>
</article>