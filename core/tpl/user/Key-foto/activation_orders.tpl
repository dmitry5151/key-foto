{* ������ �������� ���������/������ ������ *}

{if $activate_mode eq 1}
{if $activate_result eq 1}
{include file="header.tpl" header=$smarty.const.CUSTOMER_ACTIVATE_TITLE}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop oki" align="center">{$smarty.const.CUSTOMER_ACTIVATE_OK}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{else}
{include file="header.tpl" header=$smarty.const.CUSTOMER_ORDER_ACTNOFIND}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop error" align="center">{$smarty.const.CUSTOMER_ACTIVATE_NO}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{/if}
{elseif $activate_mode eq 2}
{if $activate_result eq 1}
{include file="header.tpl" header=$smarty.const.CUSTOMER_DEACTIVATE_TITLE}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop oki" align="center">{$smarty.const.CUSTOMER_DEACTIVATE_OK}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{else}
{include file="header.tpl" header=$smarty.const.CUSTOMER_ORDER_ACTNOFIND}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop error" align="center">{$smarty.const.CUSTOMER_ACTIVATE_NO}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{/if}
{/if}