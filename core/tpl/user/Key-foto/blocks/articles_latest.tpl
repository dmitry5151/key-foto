{* шаблон блока статей *}

{if $articles_array}
<div align="left" class="articles">
  {section name=u loop=$articles_array}
  {if $smarty.section.u.index ne 0}<br><br>{/if}<div style="font-size: 10px;">{$articles_array[u].update_date}</div>
  <div style="font-weight: bold; padding-bottom: 3px; padding-top: 3px;"><a style="text-decoration: none;" href="{$smarty.const.ARTICLES_ROOT}/{$articles_array[u].uri}.html">{$articles_array[u].title}</a></div>
  <div>{$articles_array[u].textToPrePublication}</div>
  {/section}<br>
  <a href="{$smarty.const.ARTICLES_ROOT}/">{$smarty.const.STRING_ARTICLES_INDEX}</a>
</div>
{/if}

