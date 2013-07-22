{* шаблон страницы списка новостей *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?dpt=modules&amp;sub=news' title='`$smarty.const.EDIT_BUTTON`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$smarty.const.STRING_NEWS_TITLE`}{else}{assign var="postheader" value=$smarty.const.STRING_NEWS_TITLE}{/if}
{include file="header.tpl" header=$postheader}

{if $pre_news_array}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">
	  {section name=i loop=$pre_news_array}{if $smarty.section.i.index ne 0}<br>{/if}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td align="left" valign="top" style="padding-top: 1px;"><b>{$pre_news_array[i].add_date}</b>&nbsp;&nbsp;&nbsp;&nbsp;</td>
          <td align="left" valign="top" width="100%"><a href="{$pre_news_array[i]|@fu_make_url_news}" class="cl12"><b>{$pre_news_array[i].title}</b></a><div class="fil1"></div>{$pre_news_array[i].textToPrePublication}</td>
        </tr>
      </table>
      {/section}
	</td>
  </tr>
</table>
{else}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="center">{$smarty.const.STRING_NO_NEWS}</td>
  </tr>
</table>
{/if}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
