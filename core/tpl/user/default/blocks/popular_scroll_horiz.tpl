{* ������ ����� ���������� ������� � �������������� ���������� *}

{if $popular_products}
{literal}
<style type="text/css">
<!--
#h_box_{/literal}{$blocknum}{literal}{position:relative; width:100%; padding:0px; margin: 0px; overflow:hidden;}
#h_scroll_box_{/literal}{$blocknum}{literal}{position:absolute; top: 0px; left: 0px; padding:0px; margin: 0px;}
tr.htable_{/literal}{$blocknum}{literal} td{text-align: center; vertical-align: top; padding: 0px 8px; border-right: 1px solid #E1E2E5;}
.fixhblock_{/literal}{$blocknum}{literal}{width: 150px; height: 1px;}
-->
</style>
{/literal}

<div id="h_box_{$blocknum}"><div id="h_scroll_box_{$blocknum}"><table cellspacing="0" cellpadding="0"><tr class="htable_{$blocknum}">
{section name=i loop=$popular_products}
<td><img src="data/{$smarty.const.TPL}/pixel.gif" class="fixhblock_{$blocknum}" alt=""><br><a href="{$popular_products[i]|@fu_make_url}"><img src="data/{$popular_products[i].filename}" alt="{$popular_products[i].name}"></a><div class="fil"></div><b class="price">{if $popular_products[i].cena <= 0}{$smarty.const.STRING_NOPRODUCT_IN}{else}{$popular_products[i].Price}{/if}</b><div class="fil"></div><a href="{$popular_products[i]|@fu_make_url}">{$popular_products[i].name}</a></td>
{/section}
{section name=i loop=$popular_products}
<td><img src="data/{$smarty.const.TPL}/pixel.gif" class="fixhblock_{$blocknum}" alt=""><br><a href="{$popular_products[i]|@fu_make_url}"><img src="data/{$popular_products[i].filename}" alt="{$popular_products[i].name}"></a><div class="fil"></div><b class="price">{if $popular_products[i].cena <= 0}{$smarty.const.STRING_NOPRODUCT_IN}{else}{$popular_products[i].Price}{/if}</b><div class="fil"></div><a href="{$popular_products[i]|@fu_make_url}">{$popular_products[i].name}</a></td>
{/section}
</tr></table></div></div>
<script type="text/javascript">
<!--
var hBlocks_{$blocknum} = 2; // ���������� ������ � �����������.
var hScore_{$blocknum} = 60;
var hText_{$blocknum} = document.getElementById("h_scroll_box_{$blocknum}");
var hContainer_{$blocknum} = document.getElementById("h_box_{$blocknum}");
var hScrolling_{$blocknum} = true;
var hCounter_{$blocknum} = 0;
var hPos_{$blocknum} = -1;
hContainer_{$blocknum}.onmouseover = HOnScrollerMouseOver_{$blocknum};
hContainer_{$blocknum}.onmouseout = HOnScrollerMouseOut_{$blocknum};

function HOnScrollerMouseOver_{$blocknum}()
{literal}{ {/literal}
        hScrolling_{$blocknum} = false;
{literal}}{/literal}

function HOnScrollerMouseOut_{$blocknum}()
{literal}{{/literal}
        hScrolling_{$blocknum} = true;
{literal}}{/literal}

function HOnTimer_{$blocknum}()
{literal}{{/literal}
        if(!hScrolling_{$blocknum}) return;

        hText_{$blocknum}.style.marginLeft = hPos_{$blocknum}.toString() + "px";
        hPos_{$blocknum}--;
        hCounter_{$blocknum}++;
        hPos_{$blocknum}--;
        hCounter_{$blocknum}++;
        hWidthM_{$blocknum} =  Math.round(hWidth_{$blocknum}/hBlocks_{$blocknum}*100)/100;

        if(hCounter_{$blocknum} >= hWidthM_{$blocknum}){literal}{{/literal}
        hCounter_{$blocknum} = 0;
        hPos_{$blocknum} = -3; // �������� �� ������������ ���������
        {literal}}{/literal}
{literal}}{/literal}

function HWrite_{$blocknum}()
{literal}{{/literal}
hContainer_{$blocknum}.style.height = hText_{$blocknum}.offsetHeight + "px";
hWidth_{$blocknum} = hText_{$blocknum}.offsetWidth;
window.setInterval(HOnTimer_{$blocknum}, hScore_{$blocknum});
{literal}}{/literal}
setGlobalOnLoad(HWrite_{$blocknum});
// -->
</script>

{else}<div align="center">{$smarty.const.STRING_EMPTY_CATEGORY}</div>{/if}
