{* шаблон блока статей *}

{if $articles_linked}
<div align="left" class="articles">
  {section name=u loop=$articles_linked}
  {if $smarty.section.u.index ne 0}<br><br>{/if}<div style="font-size: 10px;">{$articles_linked[u].update_date}</div>
  <div style="font-weight: bold; padding-bottom: 3px; padding-top: 3px;"><a style="text-decoration: none;" href="{$smarty.const.ARTICLES_ROOT}/{$articles_linked[u].uri}.html">{$articles_linked[u].title}</a></div>
  <div>{$articles_linked[u].textToPrePublication}</div>
  {/section}
</div>
{/if}

