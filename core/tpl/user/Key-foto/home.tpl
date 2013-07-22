{* шаблон вывода спецпредложений *}

{if $special_offers}
    {literal}
        <script type="text/javascript">
            function changesize_home() {
                var td = $('td[name=pic]');
                //var tab = $('table[name=contitem]');
                var b = 0;
                td.height('');
                td.each(function() {
                    if ($(this).height() > b)
                        b = $(this).height();
                });
                td.height(b);
            }
            $(function() {
                $(window).load(function(event) {
                    changesize_home();
                });
                $(window).bind('resize', function(event) {
                    changesize_home()
                });

            });
        </script>
    {/literal}
    <article class="dwa-post dwa-article">
        <h1 style="margin: 15px 0" class="dwa-postheader">{$postheader}</h1>
        <div class="dwa-postcontent clearfix">
            <div class="dwa-content-layout">
                <div class="dwa-content-layout-row">
                    <div class="dwa-layout-cell" style="width: 100%" >
                        <table cellspacing="0" cellpadding="0" width="100%">
                            {section name=i loop=$special_offers}
                                {if $smarty.section.i.index is div by $smarty.const.CONF_TAB_COUNT_IN_HOME}
                                    <tr>
                                    {/if}
                                    <td width="{math equation="100 / x" x=$smarty.const.CONF_TAB_COUNT_IN_HOME format="%d"}%" align="left" valign="top">

                                        {* формирование названия товара *}

                                        {if $smarty.const.CONF_MOD_REWRITE eq 1}
                                            {assign var="link" value="<a href='product_`$special_offers[i].productID`.html'>`$special_offers[i].name`</a>"}
                                        {else}
                                            {assign var="link" value="<a href='index.php?productID=`$special_offers[i].productID`'>`$special_offers[i].name`</a>"}
                                        {/if}
                                        {assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?productID=`$special_offers[i].productID`&amp;eaction=prod' title='`$smarty.const.STRING_EDITPR`' style='float: right;'>+</a>"}
                                {if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$link`}{else}{assign var="postheader" value=$link}{/if}

                                <table cellspacing="0" cellpadding="0" width="100%" border="0">
                                    <tr>
                                        <td align="center" name="pic">
                                            <a href="{if $smarty.const.CONF_MOD_REWRITE eq 1}product_{$special_offers[i].productID}.html{else}index.php?productID={$special_offers[i].productID}{/if}"><img src="data/{$special_offers[i].default_picture}" alt="{$special_offers[i].name}" width="150" /></a>
                                        </td>
                                    <tr>
                                        <td align="center"><h4 class="title">{$postheader}</h4></td>
                                    </tr>
                                    <tr>
                                        <td align="center" class="price">{if $special_offers[i].cena <= 0}{$smarty.const.STRING_NOPRODUCT_IN}{else}{$special_offers[i].Price}{/if}</td>
                                    </tr>
                                </table>
                                {*-----------------------------------------------------------------------------------------------------------------------------------------------*}

                            </td>

                            {if ($smarty.section.i.index+1) is div by $smarty.const.CONF_TAB_COUNT_IN_HOME}
                            </tr>
                        {else}
                            <td><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim" alt=""></td>
                            {/if}

                    {/section}
                </table>
            </div>
        </div>
    </div>
</div>
</article>
{/if}