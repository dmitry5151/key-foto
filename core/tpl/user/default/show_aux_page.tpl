{* шаблон дополнительной страницы *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?dpt=custord&amp;sub=aux_pages&amp;edit=`$show_aux_page`' title='`$smarty.const.EDIT_BUTTON`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$aux_page_name`}{else}{assign var="postheader" value=$aux_page_name}{/if}

{include file="header.tpl" header=$postheader}

<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">{$page_body}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
