{* шаблон формы подтверждения/активации регистрации *}

{include file="header.tpl" header='&nbsp;'}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="center">
	{if !$smarty.get.order2}
      
      {if $ActOk}{$smarty.const.REGCONFIRM_SUCCESS}
      {else}
      {if $ActErr}
      <div style="color: red;">{$smarty.const.REGCONFIRM_WRONG_ACTCODE}</div>
      <br>
      {/if}
      {if $NoAct}
      <div style="color: red;">{$smarty.const.REGCONFIRM_NOTACTIVATED}</div>
      <br>
      {/if}
      <form method="get" id="nubm4form">
        <input type="hidden" name="act_customer" value="1">
        {$smarty.const.REGCONFIRM_TYPE_CODE}
        <input type="text" name="act_code" value="{$ActCode}">
        <br><br><a href="#" onclick="document.getElementById('nubm4form').submit(); return false">{$smarty.const.ACTIVATE_BUTTON}</a>
      </form>
      {/if}
      
      {else}
      {if $smarty.const.CONF_ENABLE_REGCONFIRMATION}
      <form method="get" action="" style="text-align:center;" id="nubm4form">
        <input type="hidden" name="order2" value="{$smarty.get.order2}">
        <input type="hidden" name="act_customer" value="1">
        {$smarty.const.REGCONFIRM_TYPE_CODE}
        {if $ActErr}
        <div style="color: red;">{$smarty.const.REGCONFIRM_WRONG_ACTCODE}</div>
        <br>
        {/if}
        {if $NoAct}
        <div style="color: red;">{$smarty.const.REGCONFIRM_NOTACTIVATED}</div>
        <br>
        {/if}
		<br>
        <input type="text" name="act_code" value="{$ActCode}">
        <br><br><a href="#" onclick="document.getElementById('nubm4form').submit(); return false">{$smarty.const.ACTIVATE_BUTTON}</a>
      </form>
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
