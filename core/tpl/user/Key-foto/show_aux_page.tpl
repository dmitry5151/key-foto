{* шаблон дополнительной страницы *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?dpt=custord&amp;sub=aux_pages&amp;edit=`$show_aux_page`' title='`$smarty.const.EDIT_BUTTON`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$aux_page_name`}{else}{assign var="postheader" value=$aux_page_name}{/if}

<article class="dwa-post dwa-article">
    <h1 style="margin: 15px 0" class="dwa-postheader">{$postheader}</h1>
    <div class="dwa-postcontent clearfix">
        <div class="dwa-content-layout">
            <div class="dwa-content-layout-row">
            <div class="dwa-layout-cell" style="width: 100%" >
                {$page_body}
            </div>
            </div>
        </div>
    </div>
</article>