{* ������ ����� ������� ����������� ��� �������� ������ (��� ����������� ���������� � ��������) *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?dpt=custord&amp;sub=reg_fields' title='`$smarty.const.EDIT_BUTTON`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$smarty.const.STRING_REGISTRATION_FORM`}{else}{assign var="postheader" value=$smarty.const.STRING_REGISTRATION_FORM}{/if}
<article class="dwa-post dwa-article">
    <h1 class="dwa-postheader">{$postheader}</h1>
    <div class="dwa-postcontent dwa-postcontent-0 clearfix">
        <div class="dwa-content-layout">
            <div class="dwa-content-layout-row">
            <div class="dwa-layout-cell layout-item-0" style="width: 100%" >                
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{$smarty.const.STRING_REQUIRED}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="center">
	  {if $reg_error ne NULL}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="error cattop" align="center">{$reg_error}</td>
        </tr>
      </table>
      {/if}
      <form method=post name='RegisterForm' id="RegisterForm" action="">
        <table cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_FIRST_NAME}:&nbsp;</td>
            <td valign="middle" align="left"><input type="text" name="first_name" value="{$first_name}" style="width: 220px;"></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          <tr>
            <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_LAST_NAME}:&nbsp;</td>
            <td valign="middle" align="left"><input type="text" name="last_name" value="{$last_name}" style="width: 220px;"></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {if $smarty.const.CONF_ACTIVE_ORDER eq 1 or $smarty.const.CONF_EMAIL_ORDER_SEND eq 1}
          <tr>
            <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_EMAIL}:&nbsp;</td>
            <td valign="middle" align="left"><input type="text" name="email" value="{$email}" style="width: 220px;"></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {else}
          <tr>
            <td><input type="hidden" name="email" value="-"></td>
          </tr>
          {/if}
          {if !$SessionRefererLogin && $smarty.const.CONF_AFFILIATE_PROGRAM_ENABLED eq 1}
          <tr><td align="right" valign="middle">{$smarty.const.CUSTOMER_AFFILIATION}:&nbsp;</td><td valign="middle" align="left"><input type="text" style="width: 220px;" name="affiliationLogin" value="{$affiliationLogin}"></td></tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {/if}
		  {if $SessionRefererLogin || $smarty.const.CONF_AFFILIATE_PROGRAM_ENABLED eq 0}<input name="affiliationLogin" type="hidden" value="{$SessionRefererLogin}">{/if}
          <!-- ADDITIONAL FIELDS -->
          {section name=i loop=$additional_fields}
          <tr>
            <td align="right" valign="middle">{if $additional_fields[i].reg_field_required}<span class="error">*</span> {/if}{$additional_fields[i].reg_field_name}:&nbsp;</td>
            <td valign="middle" align="left"><input type='text' name='additional_field_{$additional_fields[i].reg_field_ID}' value='{$additional_field_values[i].reg_field_value}' style="width: 220px;"></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {/section}
          {if $countries}
          <tr>
            <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_COUNTRY}:&nbsp;</td>
            <td valign="middle" align="left"><select name="countryID" onchange='billingAddressCheckHandler(); changeCountryHandler();'>
                
{section name=i loop=$countries}

                <option value={$countries[i].countryID}
{if $countryID ne NULL}
{if $countries[i].countryID == $countryID}selected{/if}
{else}
{if $countries[i].countryID == $smarty.const.CONF_DEFAULT_COUNTRY}selected {/if}
{/if}
>
                {$countries[i].country_name}
                </option>
                
{/section}
              </select></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {else}
          <tr>
            <td><input type=hidden name='countryID' value='NULL'></td>
          </tr>
          {/if}
          {if $smarty.const.CONF_ADDRESSFORM_STATE ne 2}
          <tr>
            <td align="right" valign="middle">{if $smarty.const.CONF_ADDRESSFORM_STATE eq 0}<span class="error">*</span> {/if}{$smarty.const.CUSTOMER_STATE}:&nbsp;</td>
            <td valign="middle" align="left">{if !$zones}
              <input type="text" style="width: 220px;" name="state" value="{$state}" onchange='billingAddressCheckHandler()'>
              {else}
              <select name="zoneID" onchange='billingAddressCheckHandler()'>
			  {section name=i loop=$zones}
			  <option value={$zones[i].zoneID} {if $zones[i].zoneID == $zoneID}selected{/if}>{$zones[i].zone_name}</option>
			  {/section}
              </select>
              {/if}
			</td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {else}
          <tr>
            <td> {if !$zones}
              <input type=hidden name='state' value=''>
              {else}
              <input type=hidden name='zoneID' value='0'>
              {/if} </td>
          </tr>
          {/if}
          {if $smarty.const.CONF_ADDRESSFORM_CITY ne 2}
          <tr>
            <td align="right" valign="middle">{if $smarty.const.CONF_ADDRESSFORM_CITY eq 0}<span class="error">*</span> {/if}{$smarty.const.CUSTOMER_CITY}:&nbsp;</td>
            <td valign="middle" align="left"><input type="text" style="width: 220px;" name="city" value="{$city}" onblur='billingAddressCheckHandler()' onchange='billingAddressCheckHandler()'></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {else}
          <tr>
            <td><input type=hidden name='city' value=''></td>
          </tr>
          {/if}
          <tr>
            <td><input type=hidden name='receiver_first_name' value='shop'>
              <input type=hidden name='receiver_last_name' value='shop'></td>
          </tr>
          {if $smarty.const.CONF_ADDRESSFORM_ADDRESS ne 2}
          <tr>
            <td align="right" valign="middle">{if $smarty.const.CONF_ADDRESSFORM_ADDRESS eq 0}<span class="error">*</span> {/if}{$smarty.const.CUSTOMER_ADDRESS}:&nbsp;</td>
            <td valign="middle" align="left"><textarea name="address" onchange='billingAddressCheckHandler()' style="height: 80px; width: 280px;">{$address}</textarea></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {else}
          <tr>
            <td><input type=hidden name='address' value=''></td>
          </tr>
          {/if}
          {if $smarty.const.CONF_ENABLE_CONFIRMATION_CODE eq 1}
          <tr>
            <td></td>
            <td align="left" valign="middle"><img src="index.php?do=captcha&amp;{php}echo session_name();{/php}={php}echo session_id();{/php}" alt="code"></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          <tr>
            <td></td>
            <td align="left" valign="middle"><input name="fConfirmationCode" value="{$smarty.const.STR_ENTER_CCODE}" type="text" style="width: 220px; color: #aaaaaa;" onfocus="if(this.value=='{$smarty.const.STR_ENTER_CCODE}')
                        {literal}
                        {this.style.color='#000000';this.value='';}
                        {/literal}" onblur="if(this.value=='')
                        {literal}{{/literal}this.style.color='#aaaaaa';this.value='{$smarty.const.STR_ENTER_CCODE}'{literal}}{/literal}"></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {/if}
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          <tr>
            <td></td>
            <td align="left" valign="middle"><a class="dwa-button" href="#" onclick="document.getElementById('RegisterForm').submit(); return false">{$smarty.const.OK_BUTTON3}</a>&nbsp;&nbsp;<a class="dwa-button" href="#" onclick="document.getElementById('RegisterForm').reset(); return false">{$smarty.const.RESET_BUTTON}</a></td>
          </tr>
        </table>
        {literal}
        <script type="text/javascript">
                function changeCountryHandler()
                {
                  document.getElementById('RegisterForm').submit();
                }

                function billingAddressCheckHandler()
                {
                  return;
                }
        </script>
        {/literal}
        <input type="hidden" value="" name="save">
        <input type="hidden" name="quick_register" value=1>
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