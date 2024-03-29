{* ������ ����� �������� ����� *}

{include file="header.tpl" header=$smarty.const.STRING_FEEDBACK}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{$smarty.const.STRING_FEEDBACK_DESCRIPTION}</td>
  </tr>
</table>
{if $sent eq NULL}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">
	{if $error ne NULL}<div class="error cattop" align="center">{if $error eq 2}{$smarty.const.ERR_WRONG_CCODE}{elseif $error eq 3}{$smarty.const.ERR_WRONG_POST}{else}{$smarty.const.FEEDBACK_ERROR_FILL_IN_FORM}{/if}</div>{/if}
      <form name="formfeedback" id="formfeedback" method="post" action="index.php">
        <table cellspacing="0" cellpadding="0">
          <tr>
            <td align="left">{$smarty.const.FEEDBACK_CUSTOMER_NAME}<input type="hidden" name="send" value="yes"><input type="hidden" name="feedback" value="yes"></td>
          </tr>
          <tr>
            <td style="height: 2px;"></td>
          </tr>
          <tr>
            <td align="left"><input name="customer_name" type="text" maxlength="80" style="width: 220px;" value="{$customer_name}"></td>
          </tr>
          <tr>
            <td style="height: 6px;"></td>
          </tr>
          <tr>
            <td align="left">{$smarty.const.CUSTOMER_EMAIL}</td>
          </tr>
          <tr>
            <td style="height: 2px;"></td>
          </tr>
          <tr>
            <td align="left"><input name="customer_email" type="text" maxlength="80" style="width: 220px;" value="{$customer_email}"></td>
          </tr>
          <tr>
            <td style="height: 6px;"></td>
          </tr>
          <tr>
            <td align="left">{$smarty.const.FEEDBACK_CUSTOMER_MESSAGE_SUBJ}</td>
          </tr>
          <tr>
            <td style="height: 2px;"></td>
          </tr>
          <tr>
            <td align="left"><input name="message_subject" type="text" style="width: 300px;" maxlength="200" value="{$message_subject}"></td>
          </tr>
          <tr>
            <td style="height: 6px;"></td>
          </tr>
          <tr>
            <td align="left">{$smarty.const.FEEDBACK_CUSTOMER_MESSAGE_TEXT}</td>
          </tr>
          <tr>
            <td style="height: 2px;"></td>
          </tr>
          <tr>
            <td align="left"><textarea name="message_text" style="width: 360px; height: 120px;">{$message_text}</textarea></td>
          </tr>
          {if $smarty.const.CONF_ENABLE_CONFIRMATION_CODE eq 1}
          <tr>
            <td style="height: 6px;"></td>
          </tr>
          <tr>
            <td align="left"><img src="index.php?do=captcha&amp;{php}echo session_name();{/php}={php}echo session_id();{/php}" alt="code"></td>
          </tr>
          <tr>
            <td style="height: 2px;"></td>
          </tr>
          <tr>
            <td align="left"><input name="fConfirmationCode" value="{$smarty.const.STR_ENTER_CCODE}" type="text" style="width: 220px; color: #aaaaaa;" onfocus="if(this.value=='{$smarty.const.STR_ENTER_CCODE}')
                        {literal}
                        {this.style.color='#000000';this.value='';}
                        {/literal}" onblur="if(this.value=='')
                        {literal}{{/literal}this.style.color='#aaaaaa';this.value='{$smarty.const.STR_ENTER_CCODE}'{literal}}{/literal}"></td>
          </tr>
          {/if}
        </table>
      </form></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot" align="left"><a href="#" onclick="document.getElementById('formfeedback').submit(); return false">{$smarty.const.OK_BUTTON3}</a>&nbsp;|&nbsp;<a href="#" onclick="document.getElementById('formfeedback').reset(); return false">{$smarty.const.RESET_BUTTON}</a></td>
  </tr>
</table>
{else}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="oki pad" align="center">{$smarty.const.FEEDBACK_SENT_SUCCESSFULLY}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{/if}