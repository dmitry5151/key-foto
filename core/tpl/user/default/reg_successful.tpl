{* ������ ��������� �� �������� ����������� *}

{include file="header.tpl" header='&nbsp;'}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop oki" align="center">
	  {if $reg_terminated}
      {$smarty.const.STRING_SUCCESSFUL_ACCOUNT_TERMINATION}
      {else}
      {if $reg_updating}
      {$smarty.const.STRING_ACOOUNT_UPDATE_SUCCESSFUL}
      {else}
      {if $smarty.const.CONF_ENABLE_REGCONFIRMATION}{$smarty.const.REGACTIVATION}<br><br>{/if}
      {$smarty.const.STRING_REGISTRATION_SUCCESSFUL}
      {if $smarty.const.CONF_ENABLE_REGCONFIRMATION}
	  <br><br>
      <form method="get" action="" style="text-align:center;" id="regsuccform">
        <input type="hidden" name="act_customer" value="1">
        {$smarty.const.REGCONFIRM_TYPE_CODE}
        <input type="text" name="act_code" value="{$ActCode}">
        <br>
        <br><a href="#" onclick="document.getElementById('regsuccform').submit(); return false">{$smarty.const.ACTIVATE_BUTTON}</a>
      </form>
      {/if}
      {/if}
      {/if}
	</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
