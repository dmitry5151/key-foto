{* ������ ����� ������ ��������� *}

{if $big_categories_tree && $big_categories_tree_count>0}
<table cellspacing="0" cellpadding="0" width="100%">
{counter name='s1' start=-1 skip=1 print=false assign='select_counter_var'}

{section name=h1 loop=$big_categories_tree}
{if $big_categories_tree[h1].categoryID != 1 && $big_categories_tree[h1].parent == 1}

{assign var="tmp" value=0}
{counter name='s1'}
{if ($select_counter_var) is div by 2}<tr>{/if}

<td width="50%" valign="top" align="left">
  <table cellspacing="0" cellpadding="0">
    <tr>
      {if $big_categories_tree[h1].picture != ""}
      <td valign="top" align="left"><a href="{$big_categories_tree[h1]|@fu_make_url}"><img src="data/category/{$big_categories_tree[h1].picture}" style="margin-right: 5px;" alt=""></a></td>
      {/if}
      <td valign="top" align="left"><a href="{$big_categories_tree[h1]|@fu_make_url}" class="arc cl18">{$big_categories_tree[h1].name}</a>{if $smarty.const.CONF_SHOW_COUNTPROD eq 1}&nbsp;<span class="cl18">({$big_categories_tree[h1].products_count})</span>{/if}
      <div align="left" style="padding-top: 4px; padding-bottom: 14px;">
      {section name=h2 loop=$big_categories_tree}
	    {if $big_categories_tree[h2].parent == $big_categories_tree[h1].categoryID && $big_categories_tree[h1].parent == 1}
          {if $tmp == 1} | {else}{assign var="tmp" value=1}{/if}
          <a href="{$big_categories_tree[h2]|@fu_make_url}">{$big_categories_tree[h2].name}</a>{if $smarty.const.CONF_SHOW_COUNTPROD eq 1}&nbsp;({$big_categories_tree[h2].products_count}){/if}
        {/if}
      {/section}
	  </div>
      </td>
    </tr>
  </table>
</td>

{if ($select_counter_var+1) is div by 2}</tr>{else}
<td><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim" alt=""></td><td><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim" alt=""></td>
{/if}

{/if}
{/section}
</table>
{else}<div align="center">{$smarty.const.STRING_NO_CATEGORIES}</div>{/if}