{* ������ ����� ������ ��������� *}

{if $categories_tree && $categories_tree_count>1}
<div align="left">
  {section name=h loop=$categories_tree}
  {if $categories_tree[h].categoryID != 1}
  
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="dtree">
	  {assign var=maxmmm value=$smarty.section.h.index+1}
      {section name=j loop=$categories_tree max=$categories_tree[h].level-1}
      <td><img src="data/{$smarty.const.TPL}/pixel.gif" alt="" align="left" width="8" height="10"></td>
      {/section}
      <td class="dtree">{if $smarty.const.CONF_SHOW_COUNTPROD eq 1}<span style="float:right">&nbsp;&nbsp;{$categories_tree[h].products_count}</span>{/if}<a href="{$categories_tree[h]|@fu_make_url}" {if $categoryID == $categories_tree[h].categoryID}class="bf"{/if}>{$categories_tree[h].name}</a></td>
    </tr>
  </table>
  {if $smarty.section.h.index ne $categories_tree_count-1}
  <div style="background: url('data/{$smarty.const.TPL}/pix_horiz_b.gif') repeat-x top left;"><img src="data/{$smarty.const.TPL}/pixel.gif" alt="" width="100%" height="1"></div>
  {/if}
  
  {/if}
  {/section}
</div>
{else}
<div align="center">{$smarty.const.STRING_NO_CATEGORIES}</div>
{/if}


{* ���� ��������������� �������������� ���� ��������� � ���������� *}
{*
{if $categories_tree && $categories_tree_count>1}
<div align="left">
  {section name=h loop=$categories_tree}
  {if $categories_tree[h].categoryID != 1}
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="dtree"> 
      {section name=j loop=$categories_tree max=$categories_tree[h].level-1}
      <td class="dtfon">{if $smarty.section.j.index==$categories_tree[h].level-2}<img src="data/{$smarty.const.TPL}/join.gif" alt="" align="left">{else}<img src="data/{$smarty.const.TPL}/line.gif" alt="" align="left">{/if}</td>
      {/section}
      <td><img src="data/{$smarty.const.TPL}/tree1.gif" alt="" align="left"></td>
      <td class="dtree">{if $smarty.const.CONF_SHOW_COUNTPROD eq 1}<span style="float:right">&nbsp;&nbsp;{$categories_tree[h].products_count}</span>{/if}<a href="{$categories_tree[h]|@fu_make_url}" {if $categoryID == $categories_tree[h].categoryID}class="bf"{/if}>{$categories_tree[h].name}</a></td>
    </tr>
  </table>
  {/if}
  {/section}
</div>
{else}
<div align="center">{$smarty.const.STRING_NO_CATEGORIES}</div>
{/if}
*}