{* ������ ����� ������� �����������/����������� *}

{include file="header.tpl" header=$smarty.const.STRING_REGISTER_AUTH}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{$smarty.const.STRING_AM_NEW_CUSTOMER}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">{if $smarty.const.CONF_ORDERING_REQUEST_BILLING_ADDRESS == '1'}<a href="index.php?register=yes&amp;order=yes">{$smarty.const.STRING_REGISTER}</a>{/if}{if $smarty.const.CONF_ORDERING_REQUEST_BILLING_ADDRESS == '0'}<a href="index.php?register=yes&amp;order_without_billing_address=yes">{$smarty.const.STRING_REGISTER}</a>{/if}{if $smarty.const.CONF_USER_SYSTEM < 2} | <a href="index.php?quick_register=yes">{$smarty.const.STRING_QUICK_ORDERING}</a>{/if}</td>
  </tr>
</table>			
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{$smarty.const.STRING_I_AM_REGISTERED_CUSTOMER}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left"><form action="index.php?register_authorization=yes" method="POST" id="regauthform">
        <table cellspacing="0" cellpadding="0">
          <tr>
            <td>{$smarty.const.CUSTOMER_LOGIN}</td>
            <td width="10">&nbsp;</td>
            <td>{$smarty.const.CUSTOMER_PASSWORD}</td>
          </tr>
          <tr>
            <td><input type="text" name="user_login" style="width: 120px; margin-top: 2px;"></td>
            <td></td>
            <td align=left>
			  <table cellspacing="0" cellpadding="0" style="margin-top: 2px;">
                <tr>
                  <td valign="middle"><input style="width: 120px;" name="user_pw" type="password"></td>
                  <td valign="middle" style="padding-left: 8px;"><input type="hidden" name="login" value=1>
                    <table cellspacing="0" cellpadding="0" class="fsttab">
                      <tr>
                        <td>
						  <table cellspacing="0" cellpadding="0" class="sectb">
                            <tr>
                              <td><a href="#" onclick="document.getElementById('regauthform').submit(); return false">{$smarty.const.BUTTON_ENTER_AUTH}</a></td>
                            </tr>
                          </table>
						</td>
                      </tr>
                    </table>
			      </td>
                </tr>
              </table>
			</td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{$smarty.const.PASS_USER_REMAIND}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left"><form action="index.php?register_authorization=yes" method="POST" id="mypass">
        {if $password_sent_notifycation eq 'yes'}
        <table cellspacing="0" cellpadding="0" width="100%">
          <tr>
            <td class="cattop oki" align="center">{$smarty.const.STRING_PASSWORD_SENT}</td>
          </tr>
        </table>
        {elseif  $password_sent_notifycation eq 'no'}
        <table cellspacing="0" cellpadding="0" width="100%">
          <tr>
            <td class="cattop error" align="center">{$smarty.const.STRING_CANT_FIND_USER_IN_DB} ({$remind_user_login})</td>
          </tr>
        </table>
        {/if}
        <table cellspacing="0" cellpadding="0">
          <tr>
            <td valign="middle" align="right">{$smarty.const.STRING_FORGOT_PASSWORD_FIX}:&nbsp;</td>
            <td valign="middle"><input type="text" name="login_to_remind_password" value="{$user_login}">
              <input type="hidden" name="remind_password"></td>
            <td valign="middle" style="padding-left: 8px;"><table cellspacing="0" cellpadding="0" class="fsttab">
                <tr>
                  <td><table cellspacing="0" cellpadding="0" class="sectb">
                      <tr>
                        <td><a href="#" onclick="document.getElementById('mypass').submit(); return false">{$smarty.const.OK_BUTTON3}</a></td>
                      </tr>
                    </table></td>
                </tr>
              </table>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
