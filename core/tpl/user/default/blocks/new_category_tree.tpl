{* ������ ����� ����������� ������ ��������� *}

{if $big_categories_tree && $big_categories_tree_count>0}
{assign var="oldnumber" value=0}
<div align="left">
  {section name=h loop=$big_categories_tree}
  {if $big_categories_tree[h].categoryID != 1}
  
  {if $big_categories_tree[h].level > $oldnumber}<div id="s_{$oldcat}" {if $categoryID != $oldcat}style="display: none"{/if}>{/if}
  {if $big_categories_tree[h].level < $oldnumber}{section name=w loop=$oldnumber-$big_categories_tree[h].level}</div>{/section}{/if}
  
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr class="dtree">
	  {section name=j loop=$big_categories_tree max=$big_categories_tree[h].level}
      <td class="dtfon">{if $smarty.section.j.index==$big_categories_tree[h].level-1}<img src="data/{$smarty.const.TPL}/join.gif" alt="" align="left">{else}<img src="data/{$smarty.const.TPL}/line.gif" alt="" align="left">{/if}</td>
      {/section}
      <td><img src="data/{$smarty.const.TPL}/{if $big_categories_tree[h].subcount > 0}{if $categoryID != $big_categories_tree[h].categoryID}tree3.gif{else}tree2.gif{/if}{else}tree1.gif{/if}" alt="" align="left" {if $big_categories_tree[h].subcount > 0}onclick="flip('{$big_categories_tree[h].categoryID}')" id="p_s_{$big_categories_tree[h].categoryID}"{/if}></td>
      <td class="dtree">{if $smarty.const.CONF_SHOW_COUNTPROD eq 1}<span style="float:right">&nbsp;&nbsp;{$big_categories_tree[h].products_count}</span>{/if}<a href="{$big_categories_tree[h]|@fu_make_url}" {if $categoryID == $big_categories_tree[h].categoryID}class="bf"{/if}>{$big_categories_tree[h].name}</a></td>
    </tr>
  </table>
  {if $categoryID == $big_categories_tree[h].categoryID}
    <script type="text/javascript">
    {literal}
      var elem = document.getElementById('s_{/literal}{$big_categories_tree[h].parent}{literal}');
      if(elem){
        fliq(elem);
          while(elem.nodeName.toLowerCase() != "body"){
            elem = elem.parentNode;
            if(elem.nodeName.toLowerCase() == 'div')fliq(elem);
          }
      }
    {/literal}
    </script>
  {/if}
  
  {assign var="oldnumber" value=$big_categories_tree[h].level}
  {assign var="oldcat" value=$big_categories_tree[h].categoryID}
  
  {/if}
  {/section}
  
  {if $oldnumber > 0}{section name=w loop=$oldnumber}</div>{/section}{/if}
</div>
{else}
<div class="vcent">{$smarty.const.STRING_NO_CATEGORIES}</div>
{/if}