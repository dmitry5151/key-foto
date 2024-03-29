{* ������ ����� �������������� ������ � ������ �������� *}

{include file="header.tpl" header=$smarty.const.STRING_ADDRESS_BOOK}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left"><a href='index.php?address_book=yes' style="float: right;">{$smarty.const.STRING_GO_TO_ADDRESS_LIST}</a><a href='index.php?contact_info=yes'>{$smarty.const.STRING_CONTACT_INFORMATION_DOWN_CASE}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?address_book=yes'>{$smarty.const.STRING_ADDRESS_BOOK}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?order_history=yes'>{$smarty.const.STRING_ORDER_HISTORY}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?visit_history=yes'>{$smarty.const.STRING_VISIT_HISTORY}</a>{if $smarty.const.CONF_AFFILIATE_PROGRAM_ENABLED}&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?affiliate=yes&amp;sub=balance'>{$smarty.const.STRING_AFFILIATE_PROGRAM}</a>{/if}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="center">
	  {if $add_new_address}
      <form name='AddressForm' id='AddressForm' action='index.php?add_new_address=yes' method="post">
      {elseif $address_editor}
      <form name='AddressForm' id='AddressForm' action='index.php?address_editor={$address_editor}' method="post">
      {/if}
        {if $error ne ""}
        <div class="error cattop" align="center">{$error}</div>
        {/if}
		{if $zones}
		{if $select_zone_statement ne NULL}
        <div class="error cattop" align="center">{$select_zone_statement}</div>
        {/if}
		{/if}
        <table cellspacing="0" cellpadding="0" width="100%">
          <tr>
            <td align="center">{$smarty.const.STRING_REQUIRED}<br>
              <br>
              <table cellspacing="0" cellpadding="0" align="center">
                <tr>
                  <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_FIRST_NAME}:&nbsp;</td>
                  <td align="left" valign="middle"><input type="text" style="width: 220px;" name="first_name" value='{$first_name}'></td>
                </tr>
                <tr>
                  <td colspan="2" style="height: 4px;"></td>
                </tr>
                <tr>
                  <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_LAST_NAME}:&nbsp;</td>
                  <td align="left" valign="middle"><input type="text" style="width: 220px;" name="last_name" value='{$last_name}'></td>
                </tr>
                <tr>
                  <td colspan="2" style="height: 4px;"></td>
                </tr>
                {if $smarty.const.CONF_ADDRESSFORM_ADDRESS ne 2}
                <tr>
                  <td align="right" valign="middle">{if $smarty.const.CONF_ADDRESSFORM_ADDRESS eq 0}<span class="error">*</span> {/if}{$smarty.const.CUSTOMER_ADDRESS}:&nbsp;</td>
                  <td align="left" valign="middle"><textarea name="address" style="height: 80px; width: 250px;">{$address}</textarea></td>
                <tr>
                  <td colspan="2" style="height: 4px;"></td>
                </tr>
                {else}
                <tr>
                  <td><input type="hidden" name='address' value=''></td>
                </tr>
                {/if}
                {if $smarty.const.CONF_ADDRESSFORM_CITY ne 2}
                <tr>
                  <td align="right" valign="middle">{if $smarty.const.CONF_ADDRESSFORM_CITY eq 0}<span class="error">*</span> {/if}{$smarty.const.CUSTOMER_CITY}:&nbsp;</td>
                  <td align="left" valign="middle"><input type="text" style="width: 220px;" name="city" value='{$city}'></td>
                </tr>
                <tr>
                  <td colspan="2" style="height: 4px;"></td>
                </tr>
                {else}
                <tr>
                  <td><input type="hidden" name='city' value=''></td>
                </tr>
                {/if}
                {if $smarty.const.CONF_ADDRESSFORM_STATE ne 2}
                <tr>
                  <td align="right" valign="middle">{if $smarty.const.CONF_ADDRESSFORM_STATE eq 0}<span class="error">*</span> {/if}{$smarty.const.CUSTOMER_STATE}:&nbsp;</td>
                  <td align="left" valign="middle">{if $zones}
                    <select name="zoneID">                      
                     {section name=i loop=$zones}                      
                      <option {if $zones[i].zoneID == $zoneID}selected{/if} value='{$zones[i].zoneID}'>{$zones[i].zone_name}</option>                      
                     {/section}                     
                    </select>
                    {else}
                    <input type=text style="width: 220px;" value='{$state}' name='state'>
                    {/if}
                <tr>
                  <td colspan="2" style="height: 4px;"></td>
                </tr>
                {else}
                <tr>
                  <td>{if $zones}<input type="hidden" name='zoneID' value='0'>{else}<input type="hidden" name='state' value=''>{/if}</td>
                </tr>
                {/if}
                
                {if $countries}
                <tr>
                  <td align="right" valign="middle"><span class="error">*</span> {$smarty.const.CUSTOMER_COUNTRY}:&nbsp;</td>
                  <td align="left" valign="middle"><select name="countryID" onchange="changeCountryHandler();">
                      
                     {section name=i loop=$countries}
                     
                      <option value='{$countries[i].countryID}'
                                                        {if $countryID ne NULL}
                                                                {if $countryID == $countries[i].countryID}
                                                                        selected
                                                                {/if}
                                                        {else}
                                                                {if $smarty.const.CONF_DEFAULT_COUNTRY == $countries[i].countryID}
                                                                        selected
                                                                {/if}
                                                        {/if}
                     >{$countries[i].country_name}</option>
                      
                     {/section}
                     
                    </select></td>
                </tr>
                <tr>
                  <td colspan="2" style="height: 4px;"></td>
                </tr>
                {else}
                <tr>
                  <td><input type=hidden name="countryID" value='NULL'></td>
                </tr>
                {/if}
                <tr>
                  <td>
				  {literal}
                    <script type="text/javascript">
                      function changeCountryHandler()
                      {
                        document.getElementById('AddressForm').submit();
                      }
                    </script>
                  {/literal}
				  </td>
                  <td align="left" valign="top"><br><a href="#" onclick="document.getElementById('save').name='save';document.getElementById('AddressForm').submit(); return false">{$smarty.const.SAVE_BUTTON}</a><input type="hidden" id="save" name='none' value='save'></td>
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
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>