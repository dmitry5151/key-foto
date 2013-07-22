{* ������ ����� ��������� ���������� ������ *}

<article class="dwa-post dwa-article">
    <h2 class="dwa-postheader">{$smarty.const.STRING_USER_DATA_ALL}</h2>
    <div class="dwa-postcontent dwa-postcontent clearfix">
        <div class="dwa-content-layout">
            <div class="dwa-content-layout-row">
            <div class="dwa-layout-cell layout-item" style="width: 100%" >
<table cellspacing="0" cellpadding="0" width="100%" class="navigator">
  <tr>
    <td align="center"><a href='index.php?contact_info=yes'>{$smarty.const.STRING_CONTACT_INFORMATION_DOWN_CASE}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?address_book=yes'>{$smarty.const.STRING_ADDRESS_BOOK}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?order_history=yes'>{$smarty.const.STRING_ORDER_HISTORY}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?visit_history=yes'>{$smarty.const.STRING_VISIT_HISTORY}</a>{if $smarty.const.CONF_AFFILIATE_PROGRAM_ENABLED}&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?affiliate=yes&amp;sub=balance'>{$smarty.const.STRING_AFFILIATE_PROGRAM}</a>{/if}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="center"><form action='index.php?contact_info=yes' method=post id="formcont">
        {if $error ne ""}
        <div class="error cattop" align="center">{$error}</div>
        {/if}
        <table cellspacing="0" cellpadding="0" width="100%">
          <tr>
            <td align="center">{$smarty.const.STRING_REQUIRED}<br>
              <br>
              <table cellspacing="0" cellpadding="0" align="center">
                <tr>
                  <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_LOGIN}:&nbsp;</td>
                  <td><input type="text" style="width: 250px;" name="login" value="{$login|default:""}"></td>
                </tr>
                <tr>
                  <td colspan="2" style="height: 4px;"></td>
                </tr>
                <tr>
                  <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_PASSWORD}:&nbsp;</td>
                  <td><input type="password" style="width: 250px;" name="cust_password1" value="{$cust_password1|default:""}"></td>
                </tr>
                <tr>
                  <td colspan="2" style="height: 4px;"></td>
                </tr>
                <tr>
                  <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_CONFIRM_PASSWORD}:&nbsp;</td>
                  <td><input type="password" style="width: 250px;" name="cust_password2" value="{$cust_password2|default:""}"></td>
                </tr>
                <tr>
                  <td colspan="2" style="height: 4px;"></td>
                </tr>
                <tr>
                  <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_FIRST_NAME}:&nbsp;</td>
                  <td><input type="text" style="width: 250px;" name="first_name" value="{$first_name|default:""}"></td>
                </tr>
                <tr>
                  <td colspan="2" style="height: 4px;"></td>
                </tr>
                <tr>
                  <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_LAST_NAME}:&nbsp;</td>
                  <td><input type="text" style="width: 250px;" name="last_name" value="{$last_name|default:""}"></td>
                </tr>
                <tr>
                  <td colspan="2" style="height: 4px;"></td>
                </tr>
                <tr>
                  <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_EMAIL}:&nbsp;</td>
                  <td><input type="text" style="width: 250px;" name="email" value="{$email|default:""}"></td>
                </tr>
                <tr>
                  <td colspan="2" style="height: 4px;"></td>
                </tr>
				{* ����� �������������� ����� *}
                {section name=i loop=$additional_fields}
                <tr>
                  <td align="right" valign="middle">{if $additional_fields[i].reg_field_required}<span class="error">*</span> {/if}{$additional_fields[i].reg_field_name}:&nbsp;</td>
                  <td><input type='text' style="width: 250px;" name='additional_field_{$additional_fields[i].reg_field_ID}' value='{section name=j loop=$additional_field_values}{if $additional_field_values[j].reg_field_ID == $additional_fields[i].reg_field_ID}{$additional_field_values[j].reg_field_value}{/if}{/section}'></td>
                <tr>
                  <td colspan="2" style="height: 4px;"></td>
                </tr>
                {/section}
                <tr>
                  <td align="right" valign="middle"><input type=checkbox name='subscribed4news'{if $subscribed4news} checked {/if}>&nbsp;</td>
                  <td align="left" valign="middle">{$smarty.const.CUSTOMER_SUBSCRIBE_FOR_NEWS}</td>
                </tr>
                <tr>
                  <td></td>
                  <td align="left"><br><a class="dwa-button" href="#" onclick="document.getElementById('formcont').submit(); return false">{$smarty.const.SAVE_BUTTON}</a><input type=hidden value="" name="save"></td>
                </tr>
              </table></td>
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
				</div>
            </div>
        </div>
    </div>
</article>