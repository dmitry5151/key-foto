{* ������ �������� ������ �������� *}

<div class="header"><span>{$smarty.const.STRING_ARTICLES_TITLE}</span></div>

{if $pre_articles_array}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">
	  {section name=i loop=$pre_articles_array}{if $smarty.section.i.index ne 0}<br>{/if}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td align="left" valign="top" width="100%"><a href="{$smarty.const.ARTICLES_ROOT}/{$pre_articles_array[i].uri}.html" class="cl12"><b>{$pre_articles_array[i].title}</b></a><div class="fil1"></div><small>{$pre_articles_array[i].update_date}</small><br>{$pre_articles_array[i].textToPrePublication}</td>
        </tr>
      </table>
      {/section}
	</td>
  </tr>
</table>
{else}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="center">{$smarty.const.STRING_NO_ARTICLES}</td>
  </tr>
</table>
{/if}

{if $arPagesTotal > 1}
  ��������:
  {assign var="arPage" value=0}
  {section name=i start=0 loop=$arPagesTotal}
    {assign var="arPageOffset" value=$arPage*$smarty.const.CONF_NEWS_COUNT_IN_NEWS_PAGE}
    {assign var="arPage" value=$arPage+1}
  {if $arPageOffset != $arOffset}<a href="{$smarty.const.ARTICLES_ROOT}/{if $arPageOffset}{$arPageOffset}/{/if}">{$arPage}</a>{else}<strong>{$arPage}</strong>{/if}
  {/section}
{/if}

