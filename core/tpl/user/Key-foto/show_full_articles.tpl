{* шаблон страницы просмотра статьи *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?dpt=modules&amp;sub=articles&amp;edit=`$articles_full_array.AID`' title='`$smarty.const.EDIT_BUTTON`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$smarty.const.STRING_ARTICLES_TITLE`}{else}{assign var="postheader" value=$smarty.const.STRING_ARTICLES_TITLE}{/if}
<div class="header"><span>{$smarty.const.STRING_ARTICLES_TITLE}</span></div>

<table cellspacing="0" cellpadding="0" width="100%"><tr><td class="cl12"><h1>{$articles_full_array.title}</h1></td></tr></table>

<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left"><b>{$articles_full_array.update_date}</b></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">
      <div class="fil"></div>{$articles_full_array.textToPublication}</td>
    </td>
  </tr>
</table>

