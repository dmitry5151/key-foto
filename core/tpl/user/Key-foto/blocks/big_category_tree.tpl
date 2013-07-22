{strip}
{* шаблон блока развернутого дерева категорий *}
<div class="dwa-vmenublock clearfix">
    <div class="dwa-vmenublockheader">
        <span class="t">{$postheader}</span>
    </div>
    <div class="dwa-vmenublockcontent">

{*----------------------------------------------------------------- ¬ариант дл€ многоуровневой вложенности -------------------------------------------*}

{*
$parents_list - список родителей текущей категории (см. category_tree.php)
$big_categories_tree[i].name - »м€ категории
$big_categories_tree[i].level - ”ровень вложенности
$big_categories_tree[i].categoryID - ID категории
$big_categories_tree[i].parent - ID родительской категории
$big_categories_tree[i].subcount -  ол-во вложенных категорий

{section name=i loop=$parents_list} 
    {$parents_list[i]}-->
{/section}
*}
{if $big_categories_tree && $big_categories_tree_count>0}
<ul class="dwa-vmenu">
	{* ÷икл перебора всех значений дерева категорий *}
    
	{section name=h loop=$big_categories_tree}
    {if $big_categories_tree[h].categoryID != 1} 
    
    {* Ќазначаем класс ссылке *}   
	{if $categoryID == $big_categories_tree[h].categoryID && $big_categories_tree[h].subcount > 0}
    	{assign var="class" value="active sublevel"}
    {elseif $big_categories_tree[h].subcount > 0}
    	{assign var="class" value="sublevel"}
    {elseif $categoryID == $big_categories_tree[h].categoryID}
    	{assign var="class" value="active"}
    {else}
    	{assign var="class" value=""}
    {/if}
    
        <li><a href="{$big_categories_tree[h]|@fu_make_url}" class="{$class}">{$big_categories_tree[h].name}{if $smarty.const.CONF_SHOW_COUNTPROD eq 1}&nbsp;({$big_categories_tree[h].products_count}){/if}</a>

    	{if $big_categories_tree[h].subcount > 0}
        
        {* Ќазначаем активный класс *}
        {assign var="classs" value=""}
            {section name=j loop=$parents_list}
                {if $big_categories_tree[h].categoryID == $parents_list[j]}
                    {assign var="classs" value="active"}   
                {/if}
            {/section}
        <ul class="{$classs}">{else}</li>{/if}
        
        {* Ќеобходимо закрывать по несколько уровней в цикле при переходе на два и более уровн€ вверх *}
        {assign var="level1" value=$big_categories_tree[h].level}
        {assign var="level2" value=$big_categories_tree[h.index_next].level}
        {assign var="level" value=`$level1-$level2`}
        
        {if $level > 0}        	
        	{section name=lev loop=$level}
            {counter name="tar" assign="cnt"}
            </ul></li>
            {/section}
        {/if}
        
	{* /÷икл перебора всех значений дерева категорий *}
    {/if}
  	{/section}
</ul>
{else}
<div align="center">{$smarty.const.STRING_NO_CATEGORIES}</div>
{/if}
	</div>
</div>
{/strip}