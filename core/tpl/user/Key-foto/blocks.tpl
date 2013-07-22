{strip}
{* шаблон вывода блоков *}

{section name=b loop=$binfo}

{* формирование заголовка блока *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?dpt=conf&amp;sub=blocks_edit&amp;edit=`$binfo[b].bid`' title='`$smarty.const.EDIT_BUTTON`' style='float: right;'>+</a>"}
{if $isadmin eq "yes" && $binfo[b].title ne ""}{assign var="postheader" value=`$preheader``$binfo[b].title`}{else}{assign var="postheader" value=$binfo[b].title}{/if}

{if $binfo[b].html eq 1}{include file="blocks/`$binfo[b].url`" blocknum=$smarty.section.b.index header=$postheader}
{else}
{if $bclass != "hdbtop"}
<div class="dwa-block clearfix">
    <div class="dwa-blockheader">
        <span class="t">{$postheader}</span>
    </div>
    <div class="dwa-blockcontent">
    {$binfo[b].content}
    </div>
</div>
{else}
<article class="dwa-post dwa-article">
	{if $postheader == "Мотопомпы на все случаи жизни!" or $postheader == "Контакты"}
    <span class="dwa-postheader">{$postheader}</span>
    {else}
    <h1 class="dwa-postheader">{$postheader}</h1>
    {/if}
    <div class="dwa-postcontent clearfix">
        <!--div class="dwa-content-layout">
            <div class="dwa-content-layout-row">
            <div class="dwa-layout-cell layout-item" style="width: 100%" -->
            {$binfo[b].content}
            <!--/div>
            </div>
        </div-->
    </div>
</article>
{/if}
{/if}

{/section}
{/strip}