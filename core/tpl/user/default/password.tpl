{* шаблон страницы восстановления пароля *}

{include file="header.tpl" header="&nbsp;"}
{if $login_was_found ne NULL}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop oki" align="center">{$smarty.const.STRING_PASSWORD_SENT}</td>
  </tr>
</table>
{elseif $login_wasnt_found ne NULL}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop error" align="center">{$smarty.const.STRING_CANT_FIND_USER_IN_DB} ( {$forgotpw} )!</td>
  </tr>
</table>
{elseif $wrongLoginOrPw}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop error" align="center">{$smarty.const.ERROR_WRONG_PASSWORD}</td>
  </tr>
</table>
{else}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="center">
	  <form action="index.php" method="post" id="mypass">
        <table cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td valign="middle" align="right">{$smarty.const.STRING_FORGOT_PASSWORD_FIX}:&nbsp;</td>
            <td valign="middle" align="left"><input type="text" size="25" name="forgotpw"></td>
            <td valign="middle" align="left" style="padding-left: 4px;"><table cellspacing="0" cellpadding="0" class="fsttab">
                <tr>
                  <td>
				    <table cellspacing="0" cellpadding="0" class="sectb">
                      <tr>
                        <td><a href="#" onclick="document.getElementById('mypass').submit(); return false">{$smarty.const.OK_BUTTON3}</a></td>
                      </tr>
                    </table>
			      </td>
                </tr>
              </table>
          </tr>
        </table>
      </form>
	</td>
  </tr>
</table>
{/if}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
