{* ������ �������� ��������� ������� *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?dpt=modules&amp;sub=news&amp;edit=`$news_full_array.NID`' title='`$smarty.const.EDIT_BUTTON`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$smarty.const.STRING_NEWS_TITLE`}{else}{assign var="postheader" value=$smarty.const.STRING_NEWS_TITLE}{/if}

{include file="header.tpl" header=$postheader}

<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{$smarty.const.ADMIN_DATE_ADDED}: {$news_full_array.add_date}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">
	  <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="cl12"><b>{$news_full_array.title}</b></td>
        </tr>
      </table>
      <div class="fil"></div>{$news_full_array.textToPublication}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
