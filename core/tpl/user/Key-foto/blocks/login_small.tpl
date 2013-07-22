{if $isadmin eq "yes"}
    <table cellspacing="0" cellpadding="0" align="center">
        <tr><td>
            <a href="index.php?user_details=yes">{$smarty.const.MY_ACCOUNT_LINK}</a>&nbsp;|&nbsp;<a href="index.php?logout=yes">{$smarty.const.LOGOUT_LINK}</a><br><a href="{$smarty.const.ADMIN_FILE}">{$smarty.const.ADMINISTRATE_LINK}</a>
        </td></tr>
    </table>
{elseif $log ne ""}
<a href="index.php?user_details=yes">{$smarty.const.MY_ACCOUNT_LINK}</a>&nbsp;|&nbsp;<a href="index.php?logout=yes">{$smarty.const.LOGOUT_LINK}</a>
{else}
<form action="index.php" method=post id="userform">
    <table cellspacing="0" cellpadding="0" align="center">
        <tr>
            <td align="center" style="text-align: center; white-space: nowrap"><input type="text" name="user_login" class="inbr" style="width: 80px; margin-left: 5px">&nbsp;<input style="width: 80px;" name="user_pw" type="password" class="inbr">&nbsp;<a class="dwa-button" href="#" onclick="document.getElementById('userform').submit(); return false">{$smarty.const.BUTTON_ENTER_AUTH}</a></td>
        </tr>        
        <tr>
            <td align="center" style="text-align: center; height: 30px; vertical-align: middle">
                <a href="index.php?register=yes">{$smarty.const.REGISTER_LINK}</a>&nbsp;|&nbsp;<a href="index.php?logging=yes">{$smarty.const.FORGOT_PASSWORD_LINK}</a>
            </td>
        </tr>
    </table>
    <input type="hidden" name="enter" value="1">
</form>
{/if}