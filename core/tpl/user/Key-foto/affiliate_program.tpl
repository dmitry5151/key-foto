{* ������ ������� ����������� ��������� *}

{include file="header.tpl" header=$smarty.const.STRING_AFFILIATE_PROGRAM}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left"><a href='index.php?contact_info=yes'>{$smarty.const.STRING_CONTACT_INFORMATION_DOWN_CASE}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?address_book=yes'>{$smarty.const.STRING_ADDRESS_BOOK}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?order_history=yes'>{$smarty.const.STRING_ORDER_HISTORY}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?visit_history=yes'>{$smarty.const.STRING_VISIT_HISTORY}</a>{if $smarty.const.CONF_AFFILIATE_PROGRAM_ENABLED}&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?affiliate=yes&amp;sub=balance'>{$smarty.const.STRING_AFFILIATE_PROGRAM}</a>{/if}</td>
  </tr>
</table>
<br>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot"><a href="index.php?affiliate=yes&amp;sub=balance">{$smarty.const.AFFP_USER_BALANCE}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="index.php?affiliate=yes&amp;sub=payments_history">{$smarty.const.AFFP_PAYMENTS_HISTORY}</a>{if $smarty.const.CONF_AFFILIATE_EMAIL_NEW_COMMISSION or $smarty.const.CONF_AFFILIATE_EMAIL_NEW_PAYMENT}&nbsp;&nbsp;|&nbsp;&nbsp;<a href="index.php?affiliate=yes&amp;sub=settings">{$smarty.const.STRING_MODULE_SETTING}</a>{/if}&nbsp;&nbsp;|&nbsp;&nbsp;<a href="index.php?affiliate=yes&amp;sub=attract_guide">{$smarty.const.AFFP_ATTRACT_GUIDE}</a></td>
  </tr>
</table>

{* ������ *}

{if $SubPage=='balance'}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left"><b style="font-size:110%">{$smarty.const.AFFP_USER_BALANCE}</b>{if $smarty.const.CONF_USER_SYSTEM eq 2}<br>
      <br>{$smarty.const.STRING_AFFILIATE_CUSTOMERS}: <b>{$affiliate_customers}</b>{/if}</td>
  </tr>
</table>
{if $CommissionsNumber}
<table cellspacing="1" cellpadding="0" width="100%" class="gre">
  <tr>
    <td class="lt pad" align="left">{$smarty.const.AFFP_STRING_TOTAL_EARNINGS}</td>
    <td class="lt pad" align="left">{$smarty.const.AFFP_STRING_TOTAL_PAYMENTS}</td>
    <td class="lt pad" align="left">{$smarty.const.AFFP_USER_BALANCE}</td>
  </tr>
  {foreach from=$CurrencyISO3 item=_CurrencyISO}
  {if $CommissionsAmount[$_CurrencyISO.currency_iso_3] or $PaymentsAmount[$_CurrencyISO.currency_iso_3]}
  <tr>
    <td class="padt" align="left">{$_CurrencyISO.currency_iso_3} {$CommissionsAmount[$_CurrencyISO.currency_iso_3]|string_format:"%.2f"} </td>
    <td class="padt" align="left">{$PaymentsAmount[$_CurrencyISO.currency_iso_3]|string_format:"%.2f"} </td>
    <td class="padt" align="left">{"`$CommissionsAmount[$_CurrencyISO.currency_iso_3]-$PaymentsAmount[$_CurrencyISO.currency_iso_3]`"|string_format:"%.2f"} </td>
  </tr>
  {/if}
  {/foreach}
</table>
<br>
{else}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">{$smarty.const.AFFP_MSG_NO_BALANCE}</td>
  </tr>
</table>
{/if}

{/if}

{* ������� ������ *}

{if $SubPage=='payments_history'}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left"><b style="font-size:110%">{$smarty.const.AFFP_PAYMENTS_HISTORY}</b></td>
  </tr>
</table>
{if $PaymentsNumber}
<table cellspacing="1" cellpadding="0" width="100%" class="gre">
  <tr>
    <td class="lt pad" align="left">{$smarty.const.AFFP_PAYMENT_NUMBER}</td>
    <td class="lt pad" align="left">{$smarty.const.ADMIN_CURRENT_DATE}</td>
    <td class="lt pad" align="left">{$smarty.const.STRING_ADMIN_COMMENT}</td>
    <td class="lt pad" align="left">{$smarty.const.STRING_SUM}</td>
  </tr>
  {foreach from=$Payments item=_Payment}
  <tr>
    <td class="padt" align="left">P-{$_Payment.pID} </td>
    <td class="padt" align="left">{$_Payment.xDate} </td>
    <td class="padt" align="left">{$_Payment.Description} </td>
    <td class="padt" align="left">{$_Payment.Amount} {$_Payment.CurrencyISO3} </td>
  </tr>
  {/foreach}
</table>
<br>
{else}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">{$smarty.const.AFFP_MSG_NO_PAYMENTS}</td>
  </tr>
</table>
{/if}

{/if}

{* ��������� *}

{if $SubPage=='settings'}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left"><b style="font-size:110%">{$smarty.const.STRING_MODULE_SETTING}</b> <br>
      <br>
      {if $SettingsSaved}
      <div style="color: green">{$smarty.const.MSG_INFORMATION_SAVED}</div>
      <br>
      {/if}
      {if $smarty.const.CONF_AFFILIATE_EMAIL_NEW_COMMISSION or $smarty.const.CONF_AFFILIATE_EMAIL_NEW_PAYMENT}
      <form name="form_settings" action="{$REQUEST_URI}" method="POST" id="form_settings">
        <input name="fACTION" value="SAVE_SETTINGS" type="hidden" >
        <input name="fREDIRECT" value="{$REQUEST_URI}" type="hidden" >
        {if $smarty.const.CONF_AFFILIATE_EMAIL_NEW_COMMISSION}
        <input name="EmailOrders"
                                {if $Settings.EmailOrders}
                                        checked="checked"
                                {/if}
                                class="checknomarging" value="1" type="checkbox" id="id_emailorders">
        &nbsp;
        <label for="id_emailorders">{$smarty.const.AFFP_EMAILORDERS}</label>
        <br>
        <br>
        {/if}{* if $smarty.const.CONF_AFFILIATE_EMAIL_NEW_COMMISSION *}
        
        {if $smarty.const.CONF_AFFILIATE_EMAIL_NEW_PAYMENT}
        <input name="EmailPayments"
                                {if $Settings.EmailPayments}
                                        checked="checked"
                                {/if}
                                class="checknomarging" value="1" type="checkbox" id="id_emailpayments">
        &nbsp;
        <label for="id_emailpayments">{$smarty.const.AFFP_EMAILPAYMENTS}</label>
        {/if}{* if $smarty.const.CONF_AFFILIATE_EMAIL_NEW_PAYMENT *} <br>
        <br>
        <a href="#" onclick="document.getElementById('form_settings').submit(); return false">{$smarty.const.SAVE_BUTTON}</a>
      </form>
      {/if} </td>
  </tr>
</table>
{/if}

{* ���������� *}

{if $SubPage=='attract_guide'}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left"><b style="font-size:110%">{$smarty.const.AFFP_ATTRACT_GUIDE}</b><br>
      <br>
      {$_AFFP_STRING_ATTRACT_GUIDE} </td>
  </tr>
</table>
{/if}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>

