{* ������ ����� ����������� (� ������������ ���������� � ��������) *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?dpt=custord&amp;sub=reg_fields' title='`$smarty.const.EDIT_BUTTON`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$smarty.const.STRING_REGISTER`}{else}{assign var="postheader" value=$smarty.const.STRING_REGISTER}{/if}
{include file="header.tpl" header=$postheader}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{$smarty.const.STRING_REQUIRED}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">
      {if $order ne NULL}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="error cattop" align="center">{$smarty.const.STRING_ORDER_CONTINUE_TIP}</td>
        </tr>
      </table>
      {/if}
      {if $order}
      <form action="index.php?register=yes&order=yes" method="post" name='RegisterForm'>
      {else}
      <form action="index.php?register=yes" method="post"  name='RegisterForm' id='RegisterForm'>
        {/if}
        {if $reg_error ne NULL}
        <table cellspacing="0" cellpadding="0" width="100%">
          <tr>
            <td class="error pad" align="center">{$reg_error}</td>
          </tr>
        </table>
        {/if}
        <table cellspacing="0" cellpadding="0" align="center">
          <tr>
            <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_LOGIN}:&nbsp;</td>
            <td valign="middle" align="left"><input type="text" name="login" style="width: 220px;" value="{$login}"></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          <tr>
            <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_PASSWORD}:&nbsp;</td>
            <td valign="middle" align="left"><input type="password" style="width: 220px;" name="cust_password1" value="{$cust_password1}"></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          <tr>
            <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_CONFIRM_PASSWORD}:&nbsp;</td>
            <td valign="middle" align="left"><input type="password" style="width: 220px;" name="cust_password2" value="{$cust_password2}"></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          <tr>
            <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_FIRST_NAME}:&nbsp;</td>
            <td valign="middle" align="left"><input type="text" style="width: 220px;" name="first_name" value="{$first_name}"></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          <tr>
            <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_LAST_NAME}:&nbsp;</td>
            <td valign="middle" align="left"><input type="text" name="last_name" style="width: 220px;" value="{$last_name}"></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          <tr>
            <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_EMAIL}:&nbsp;</td>
            <td valign="middle" align="left"><input type="text" name="email" style="width: 220px;" value="{$email}"></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          <tr>
            <td align="right" valign="middle" style="padding-right: 4px;"><input type=checkbox name=subscribed4news {if $subscribed4news == 1}checked{/if}></td>
            <td valign="middle" align="left">{$smarty.const.CUSTOMER_SUBSCRIBE_FOR_NEWS}</td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {if !$SessionRefererLogin && $smarty.const.CONF_AFFILIATE_PROGRAM_ENABLED eq 1}
          <tr><td align="right" valign="middle">{$smarty.const.CUSTOMER_AFFILIATION}:&nbsp;</td><td valign="middle" align="left"><input type="text" style="width: 220px;" name="affiliationLogin" value="{$affiliationLogin}"></td></tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {/if}
		  {if $SessionRefererLogin || $smarty.const.CONF_AFFILIATE_PROGRAM_ENABLED eq 0}<input name="affiliationLogin" type="hidden" value="{$SessionRefererLogin}">{/if}
          {section name=i loop=$additional_fields}
          <tr>
            <td align="right" valign="middle">{if $additional_fields[i].reg_field_required}<span class="error">*</span> {/if}{$additional_fields[i].reg_field_name}:&nbsp;</td>
            <td valign="middle" align="left"><input type='text' name='additional_field_{$additional_fields[i].reg_field_ID}' style="width: 220px;" value='{$additional_field_values[i].reg_field_value}'></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {/section}
          {if $order ne NULL}
          <tr>
            <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.STRING_RECEIVER_FIRST_NAME}:&nbsp;</td>
            <td valign="middle" align="left"><input type=text name='receiver_first_name'
                                                        value='{$receiver_first_name}'
                                                        onblur='billingAddressCheckHandler()'
                                                        onchange='billingAddressCheckHandler()' ></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          <tr>
            <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.STRING_RECEIVER_LAST_NAME}:&nbsp;</td>
            <td valign="middle" align="left"><input type=text name='receiver_last_name'
                                                        value='{$receiver_last_name}'
                                                        onblur='billingAddressCheckHandler()'
                                                        onchange='billingAddressCheckHandler()' ></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {/if}
          {if $countries}
          <tr>
            <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_COUNTRY}:&nbsp;</td>
            <td valign="middle" align="left">
			<select name="countryID" onchange='billingAddressCheckHandler(); changeCountryHandler();'>                
                {section name=i loop=$countries}                 
                <option value="{$countries[i].countryID}"
                    {if $countryID ne NULL}
                        {if $countries[i].countryID == $countryID} selected {/if}
                    {else}
                        {if $countries[i].countryID == $smarty.const.CONF_DEFAULT_COUNTRY} selected {/if}
                    {/if}
                >{$countries[i].country_name}</option>                
                {/section}
            </select>
			</td>
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
            <td valign="middle" align="left">
			  {if !$zones}
              <input type="text" name="state" style="width: 220px;" value="{$state}" onchange='billingAddressCheckHandler()' >
              {else}
              <select name="zoneID" onchange='billingAddressCheckHandler()' >
			  {section name=i loop=$zones}
              <option value="{$zones[i].zoneID}"{if $zones[i].zoneID == $zoneID}selected{/if}>{$zones[i].zone_name}</option>
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
            <td>{if !$zones}
              <input type=hidden name='state' value=''>
              {else}
              <input type=hidden name='zoneID' value='0'>
              {/if}</td>
          </tr>
          {/if}
          {if $smarty.const.CONF_ADDRESSFORM_CITY ne 2}
          <tr>
            <td align="right" valign="middle">{if $smarty.const.CONF_ADDRESSFORM_CITY eq 0}<span class="error">*</span> {/if}{$smarty.const.CUSTOMER_CITY}:&nbsp;</td>
            <td valign="middle" align="left"><input type="text" name="city" style="width: 220px;"
                                                value="{$city}"
                                                onblur='billingAddressCheckHandler()'
                                                onchange='billingAddressCheckHandler()' ></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {else}
          <tr>
            <td><input type=hidden name='city' value=''></td>
          </tr>
          {/if}
          {if $smarty.const.CONF_ADDRESSFORM_ADDRESS ne 2}
          <tr>
            <td align="right" valign="middle">{if $smarty.const.CONF_ADDRESSFORM_ADDRESS eq 0}<span class="error">*</span> {/if}{$smarty.const.CUSTOMER_ADDRESS}:&nbsp;</td>
            <td valign="middle" align="left"><textarea name="address" style="height: 80px; width: 280px;" onchange='billingAddressCheckHandler()'>{$address}
</textarea></td>
          </tr>
          <tr>
            <td colspan="2" style="height: 6px;"></td>
          </tr>
          {else}
          <input type=hidden name='address' value=''>
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
            <td colspan="2" style="height: 6px;">
			  {literal}
              <script type="text/javascript">
                function billingAddressCheckHandler()
                {
                    return;
                }
              </script>
              {/literal}
              {literal}
              <script type="text/javascript">
                function changeCountryHandler()
                {
                    document.RegisterForm.submit();
                }
              </script>
              {/literal}
			</td>
          </tr>
          <tr>
            <td></td>
            <td align="left" valign="middle"><a href="#" onclick="document.getElementById('RegisterForm').submit(); return false">{$smarty.const.OK_BUTTON3}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onclick="document.getElementById('RegisterForm').reset(); return false">{$smarty.const.RESET_BUTTON}</a>
              <input type="hidden" value="1" name="save">
              {if $order ne NULL}
              <input type=hidden name=order value=1>
              {/if}
              {if $order_without_billing_address ne NULL}
              <input type=hidden name=order_without_billing_address value=1>
              {/if}</td>
          </tr>
        </table>
      </form>
      {if $reg_updating}
	  <br><div align="center"><a href="javascript:confirmUnsubscribe();">{$smarty.const.TERMINATE_ACCOUNT_LINK}</a></div>
      {/if}
	</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>