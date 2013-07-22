{* шаблон блока статей *}

{if $articles_random}
<div align="left" class="articles">
  {section name=u loop=$articles_random}
  {if $smarty.section.u.index ne 0}<br><br>{/if}<div style="font-size: 10px;">{$articles_random[u].update_date}</div>
  <div style="font-weight: bold; padding-bottom: 3px; padding-top: 3px;"><a style="text-decoration: none;" href="{$smarty.const.ARTICLES_ROOT}/{$articles_random[u].uri}.html">{$articles_random[u].title}</a></div>
  <div>{$articles_random[u].textToPrePublication}</div>
  {/section}<br>
  <a href="{$smarty.const.ARTICLES_ROOT}/">{$smarty.const.STRING_ARTICLES_INDEX}</a>
</div>
{/if}

