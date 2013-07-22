{* шаблон блока новостей *}
<div class="dwa-block clearfix">
    <div class="dwa-blockcontent">
        {if $news_array}
            <div align="left">
                {section name=u loop=$news_array}
                {if $smarty.section.u.index ne 0}<br><br>{/if}<b>{$news_array[u].add_date}</b><br>
                <a href="{$news_array[u]|@fu_make_url_news}">{$news_array[u].title}</a>
            {/section}<br><br>
        </div>
    {/if}
    <div align="left">
        <form action="index.php" name="subscription_form" method="post" id="subscription_form">
            <strong>{$smarty.const.CUSTOMER_SUBSCRIBE_FOR_NEWS}</strong>
            <div style="padding: 4px 0 6px 0;">
                <input type="text" name="email" value="" style="width: 205px;">
            </div>
            <table cellspacing="0" cellpadding="0">
                <tr>
                    <td valign="middle" style="height: 18px; padding-bottom: 2px;"><input type="radio" name="modesubs" value=1 checked></td>
                    <td valign="middle">&nbsp;{$smarty.const.STRING_GOSUBSC}</td>
                </tr>
                <tr>
                    <td valign="middle" style="height: 18px; padding-bottom: 2px;"><input type="radio" name="modesubs" value=0></td>
                    <td valign="middle">&nbsp;{$smarty.const.STRING_DESUBS}</td>
                </tr>
            </table>
            <div class="fil"></div>
            <div align="center">
                <a class="dwa-button" href="#" onclick="validate(this); return false">{$smarty.const.OK_BUTTON3}</a>
            </div>
            <input type="hidden" name="subscribe" value="yes">
        </form>
    </div>
    </div>
</div>