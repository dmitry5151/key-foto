{* ������ ����� ���������� ������� � ������������ ���������� *}

{if $popular_products}
{literal}
<style type="text/css">
<!--
#v_container_{/literal}{$blocknum}{literal}{position:relative; overflow:hidden; height:200px; padding:0px; margin: 0px; width:100%;}
#v_scroll_box_{/literal}{$blocknum}{literal}{position:absolute; top: 0px; left: 0px; padding:0px; margin: 0px; width:100%;}
-->
</style>
{/literal}

<div id="v_container_{$blocknum}"><div id="v_scroll_box_{$blocknum}">

{section name=i loop=$popular_products}
<a href="{$popular_products[i]|@fu_make_url}"><img src="data/{$popular_products[i].filename}" alt="{$popular_products[i].name}"></a><div class="fil"></div><b class="price">{if $popular_products[i].cena <= 0}{$smarty.const.STRING_NOPRODUCT_IN}{else}{$popular_products[i].Price}{/if}</b><div class="fil"></div><a href="{$popular_products[i]|@fu_make_url}">{$popular_products[i].name}</a><div class="fil3"></div>
{/section}
{section name=i loop=$popular_products}
<a href="{$popular_products[i]|@fu_make_url}"><img src="data/{$popular_products[i].filename}" alt="{$popular_products[i].name}"></a><div class="fil"></div><b class="price">{if $popular_products[i].cena <= 0}{$smarty.const.STRING_NOPRODUCT_IN}{else}{$popular_products[i].Price}{/if}</b><div class="fil"></div><a href="{$popular_products[i]|@fu_make_url}">{$popular_products[i].name}</a><div class="fil3"></div>
{/section}

</div></div>

<script type="text/javascript">
<!--
var vScore_{$blocknum} = 60;
var vText_{$blocknum} = document.getElementById("v_scroll_box_{$blocknum}");
var vContainer_{$blocknum} = document.getElementById("v_container_{$blocknum}");
var vScrolling_{$blocknum} = true;
var vCounter_{$blocknum} = 0;
var vPos_{$blocknum} = -1;
var vHeight_{$blocknum} = 0;
vContainer_{$blocknum}.onmouseover = VOnScrollerMouseOver_{$blocknum};
vContainer_{$blocknum}.onmouseout = VOnScrollerMouseOut_{$blocknum};

function VOnScrollerMouseOver_{$blocknum}()
{literal}{ {/literal}
        vScrolling_{$blocknum} = false;
{literal}}{/literal}

function VOnScrollerMouseOut_{$blocknum}()
{literal}{ {/literal}
        vScrolling_{$blocknum} = true;
{literal}}{/literal}

function VOnTimer_{$blocknum}()
{literal}{ {/literal}
        if(!vScrolling_{$blocknum}) return;

        vText_{$blocknum}.style.marginTop = vPos_{$blocknum}.toString() + "px";
        vPos_{$blocknum}--;  vPos_{$blocknum}--;
        vCounter_{$blocknum}++;  vCounter_{$blocknum}++;

        vHeightM_{$blocknum} =  Math.round(vHeight_{$blocknum}/2*100)/100;

        if(vCounter_{$blocknum} >= vHeightM_{$blocknum}){literal}{ {/literal}
        vCounter_{$blocknum} = 0;
        vPos_{$blocknum} = -3; // �������� �� ������������ ���������
        {literal}}{/literal}
{literal}}{/literal}

function VWrite_{$blocknum}() {literal}{ {/literal}
vHeight_{$blocknum} = vText_{$blocknum}.offsetHeight;
window.setInterval(VOnTimer_{$blocknum}, vScore_{$blocknum});
{literal}}{/literal}
setGlobalOnLoad(VWrite_{$blocknum});
// -->
</script>

{else}<div align="center">{$smarty.const.STRING_EMPTY_CATEGORY}</div>{/if}

