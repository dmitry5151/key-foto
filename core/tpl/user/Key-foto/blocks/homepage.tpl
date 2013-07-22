{* шаблон блока вывода категорий (для главной страницы) *}
<article class="dwa-post dwa-article">
    <div class="dwa-postcontent clearfix">
        <div class="dwa-content-layout">
                    {* Альтернативный вывод категорий дивами *}
                    
                    {assign var name="cnt" value=0}
                    {assign var name="id" value=0}
                      {section name=u loop=$big_categories_tree}                      
                          {if $big_categories_tree[u].parent == 1}
                          
                              {if $cnt is div by $smarty.const.CONF_COLUMNS_PER_PAGE}
                              	<div class="dwa-content-layout-row">
                                {assign var name="id" value=$id+1}
                              {/if}                                    
                                <div class="dwa-layout-cell" style="width: {math equation="100 / x" x=$smarty.const.CONF_COLUMNS_PER_PAGE format="%d"}%;">
                                    <table cellspacing="0" cellpadding="7" width="100%" border="0" name="{$id}">
                                    <tr>
                                    {* Вывод заголовка *}
                                    <td valign="top"><h3 align="center" style="margin-bottom:5px"><a href="{$big_categories_tree[u]|@fu_make_url}">{$big_categories_tree[u].name}{if $smarty.const.CONF_SHOW_COUNTPROD eq 1}&nbsp;<span style="font-weight:normal">({$big_categories_tree[u].products_count})</span>{/if}</a></h3></td> 
                                    </tr>                                   
                                    {* Вывод картинки *}
                                    <tr>
                                    <td valign="top"><div align="center" style="padding: 7px"><a href="{$big_categories_tree[u]|@fu_make_url}"><img src="data/category/{$big_categories_tree[u].picture}" alt="{$big_categories_tree[u].name}" class="homeimage" /></a></div></td>
                                    </tr>
                                    </table>
                                </div>                                   
                              {if ($cnt+1) is div by $smarty.const.CONF_COLUMNS_PER_PAGE}
                                </div>                              
                              {/if}
                              {assign var name="cnt" value=$cnt+1}
                          {/if}
                      {/section}
                      
                    
                </div>
    </div>
</article>
<div class="fil"></div>