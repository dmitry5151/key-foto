{if !$customer_details}
<form name="extform2" method=GET id="extform2" action="">
{if $customers_has_been_exported_succefully == 1}
<div align="left" style="color: #339900">{$smarty.const.ADMIN_CUSTOMERS_HAS_BEEN_EXPORTED_SUCCESSFULLY}!</div>
<div align="left" style="padding-top: 8px;"><a href='{$urlToDownloadResult}' class="inl">{$smarty.const.ADMIN_DOWN_LOAD}</a> ( {$file_size} b ) </div>
<table class="adn"><tr><td class="se6"></td></tr></table>{/if}
<table class="adn">
<tr class="lineb">
<td align=left width="100%"><a href='{$urlToSort}&amp;sort=Login&amp;direction=ASC' class="liv">{$smarty.const.ADMIN_CUSTOMER_LOGIN}</a></td>
<td align=right><a href='{$urlToSort}&amp;sort=first_name&amp;direction=ASC' class="liv">{$smarty.const.ADMIN_CUSTOMER_FIRST_NAME}</a></td>
<td align=right><a href='{$urlToSort}&amp;sort=last_name&amp;direction=ASC' class="liv">{$smarty.const.ADMIN_CUSTOMER_LAST_NAME}</a></td>
<td align=right class="toph3"><a href='{$urlToSort}&amp;sort=Email&amp;direction=ASC' class="liv">{$smarty.const.ADMIN_CUSTOMER_EMAIL}</a></td>
<td align=right><a href='{$urlToSort}&amp;sort=custgroupID&amp;direction=ASC' class="liv">{$smarty.const.ADMIN_CUSTOMER_GROUP_NAME}</a></td>
<td align=right class="toph3"><a href='{$urlToSort}&amp;sort=reg_datetime&amp;direction=ASC' class="liv">{$smarty.const.ADMIN_REGISTRATION_TIME}</a></td>
<td align=left class="toph3">{$smarty.const.STR_ACTSTATE}</td>
<td align=center>Del</td>
</tr>{assign var="admhl" value=0}
{section name=i loop=$customers}
                {if $admhl eq 1}
<tr><td colspan="8" class="separ"><img src="data/admin/pixel.gif" alt="" class="sep"></td></tr>
{else}{assign var="admhl" value=1}{/if}
<tr class="lineybig hover">
<td align="left"><a href='{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=custlist&amp;customer_details=contact_info&amp;customerID={$customers[i].customerID}&amp;encodedReturnUrl={$encodedReturnUrl}'>{$customers[i].Login}</a></td>
<td align="right" class="toph3">{$customers[i].first_name}</td>
<td align="right" class="toph3">{$customers[i].last_name}</td>
<td align="right" class="toph3">{if $smarty.const.CONF_BACKEND_SAFEMODE eq 0}{$customers[i].Email}{else}{$smarty.const.ADMIN_SAFEMODE_BLOCKED}{/if}</td>
<td align="right" class="toph3">{$customers[i].custgroup_name}</td>
<td align="right" class="toph3">{$customers[i].reg_datetime}</td>
<td align="left" class="toph3">{if $customers[i].ActivationCode}{$smarty.const.STR_NOTACTIVATED}<br><a href="{"activateID=`$customers[i].customerID`"|set_query}" onclick="return confirm('{$smarty.const.STR_QACTIVATE_ACCOUNT|replace:'[email]':$customers[i].Email}');">{$smarty.const.ACTIVATE_BUTTON}</a>{else}{$smarty.const.STR_ACTIVATED}{/if}
</td>
<td align="center">{if $customers[i].allowToDelete}<a href="#" onclick="confirmDelete({$customers[i].customerID}, '{$smarty.const.QUESTION_DELETE_CONFIRMATION}', '{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=custlist&amp;encodedReturnUrl={$encodedReturnUrl}&amp;deleteCustomerID=')">X</a>{/if}</td>
</tr>
{sectionelse}<tr><td colspan="8" nowrap align="center" height="22">{$smarty.const.ADMIN_NO_VALUES}</td></tr>
{/section}
{if $navigator}
<tr>
<td class="navigator" colspan="8">{$navigator}</td>
</tr></table>
{else}</table>
<table class="adn"><tr><td class="separ"><img src="data/admin/pixel.gif" alt="" class="sep"></td></tr></table>
{/if}
<input type=hidden name='count_to_export' value='{$count_to_export}'>
<input type=hidden name='export_to_excel' value='1'>
<input type=hidden name='dpt' value='custord'>
<input type=hidden name='sub' value='custlist'>
</form>
{if $customers}<table class="adn"><tr><td class="se5"></td></tr></table><a href="#"  onclick="document.getElementById('extform2').submit(); return false" class="inl">{$smarty.const.ADMIN_EXPORT_USER_TO_FILE}</a>{/if}
{else}
{if $customerID eq NULL}
{$smarty.const.ADMIN_NO_RECORD_FOUND}
{if $returnUrl}
<a href='{$returnUrl}'>
{else}
<a href='{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=custlist'>
{/if}
&lt;&lt;{$smarty.const.ADMIN_BACK_TO_SEARCH_FORM}
</a>
{else}
<table width="100%" border="0" class="usert" cellspacing="0">

                <tr valign="top" class="lineb">

                        {if $customer_details == 'contact_info'}
<td align="left" width="20%" style="background: #ffffff; padding: 10px; border: 1px solid #80A2D9; border-bottom: 0px;" valign="middle">{$smarty.const.STRING_CONTACT_INFORMATION_DOWN_CASE}</td>
                        {else}
<td align="left" width="20%" style="background: #E7ECFF; padding: 10px; border: 1px solid #80A2D9;" valign="middle"><a href="{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=custlist&amp;customer_details=contact_info&amp;customerID={$customerID}&amp;encodedReturnUrl={$encodedReturnUrl}" class="liv">{$smarty.const.STRING_CONTACT_INFORMATION_DOWN_CASE}</a></td>
                        {/if}

               {if $customer_details == 'address_book'}
           <td align="left" width="20%" style="background: #ffffff; padding: 10px; border: 1px solid #80A2D9; border-bottom: 0px; border-left: 0px;" valign="middle">{$smarty.const.STRING_ADDRESS_BOOK}</td>
                        {else}
<td align="left" width="20%" style="background: #E7ECFF; padding: 10px; border: 1px solid #80A2D9; border-left: 0px;" valign="middle"><a href="{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=custlist&amp;customer_details=address_book&amp;customerID={$customerID}&amp;encodedReturnUrl={$encodedReturnUrl}" class="liv">{$smarty.const.STRING_ADDRESS_BOOK}</a></td>
                        {/if}

                        {if $customer_details == 'order_history'}
  <td align="left" width="20%" style="background: #ffffff; padding: 10px; border: 1px solid #80A2D9; border-bottom: 0px; border-left: 0px;" valign="middle">{$smarty.const.STRING_ORDER_HISTORY}</td>
                        {else}
<td align="left" width="20%" style="background: #E7ECFF; padding: 10px; border: 1px solid #80A2D9; border-left: 0px;" valign="middle"><a href="{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=custlist&amp;customer_details=order_history&amp;customerID={$customerID}&amp;encodedReturnUrl={$encodedReturnUrl}" class="liv">{$smarty.const.STRING_ORDER_HISTORY}</a></td>
                        {/if}

                        {if $customer_details == 'visit_log'}
  <td align="left" width="20%" style="background: #ffffff; padding: 10px; border: 1px solid #80A2D9; border-bottom: 0px; border-left: 0px;" valign="middle">{$smarty.const.STRING_VISIT_HISTORY}</td>
                        {else}
<td align="left" width="20%" style="background: #E7ECFF; padding: 10px; border: 1px solid #80A2D9; border-left: 0px;" valign="middle"><a href="{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=custlist&amp;customer_details=visit_log&amp;customerID={$customerID}&amp;encodedReturnUrl={$encodedReturnUrl}" class="liv">{$smarty.const.STRING_VISIT_HISTORY}</a></td>
                        {/if}

                                                {if $customer_details == 'affiliate'}
           <td align="left" width="20%" style="background: #ffffff; padding: 10px; border: 1px solid #80A2D9; border-bottom: 0px; border-left: 0px;" valign="middle">{$smarty.const.STRING_AFFILIATE_PROGRAM}</td>
                        {else}
                    <td align="left" width="20%" style="background: #E7ECFF; padding: 10px; border: 1px solid #80A2D9; border-left: 0px;" valign="middle">
                                        <a href="{$smarty.const.ADMIN_FILE}?dpt=custord&sub=custlist&customer_details=affiliate&customerID={$customerID}&encodedReturnUrl={$encodedReturnUrl}" class="liv">{$smarty.const.STRING_AFFILIATE_PROGRAM}</a></td>
                        {/if}
                        </tr>
                              </table>
                         <table class="adn"> <tr>
                        <td style="background: #ffffff; padding: 12px; border: 1px solid #80A2D9; border-top: 0px;">
                                {if $customer_details == 'contact_info'}
                                <form method=POST name=MainForm action="">
<table class="adw">
<tr class="liney">
                                                        <td align=left>{$smarty.const.CUSTOMER_LOGIN}
                                                </td>
                                                <td>{$customerInfo.Login|replace:"<":"&lt;"}
                                                </td>
                                        </tr>
<tr class="liney">
                                                <td>{$smarty.const.CUSTOMER_FIRST_NAME}
                                                </td>
                                                <td>{$customerInfo.first_name|replace:"<":"&lt;"}
                                                </td>
                                        </tr>
<tr class="liney">
                                                <td>{$smarty.const.CUSTOMER_LAST_NAME}
                                                </td>
                                                <td>{$customerInfo.last_name|replace:"<":"&lt;"}
                                                </td>
                                        </tr>
<tr class="liney">
                                                <td>{$smarty.const.CUSTOMER_EMAIL}
                                                </td>
                                                <td>{if $smarty.const.CONF_BACKEND_SAFEMODE eq 0}{$customerInfo.Email|replace:"<":"&lt;"}{else}{$smarty.const.ADMIN_SAFEMODE_BLOCKED}{/if}
                                                </td>
                                        </tr>

                                        {section name=i loop=$reg_fields_values}
<tr class="liney">
                                                <td>{$reg_fields_values[i].reg_field_name}:
                                                </td>
                                                <td>{$reg_fields_values[i].reg_field_value|replace:"<":"&lt;"}
                                                </td>
                                        </tr>
                                        {/section}
<tr class="liney">
                                                <td>{$smarty.const.CUSTOMER_SUBSCRIBE_FOR_NEWS}
                                                </td>
                                                <td valign=middle>
                                                        <input type=checkbox
                                                        {if $customerInfo.subscribed4news}
                                                                checked
                                                        {/if}
                                                        name = 'subscribed4news'
                                                        value='1'
                                                        >
                                                        <input type=submit name='subscribed4news_submit' value='{$smarty.const.ADMIN_CHANGE}' style="font-size: 11px; font-family: Tahoma, Arial; border: 1px solid #80A2D9; background-color: #E1ECFD;">
                                                </td>
                                        </tr>
<tr class="liney">
                                                <td>
                                                        {$smarty.const.ADMIN_CUSTOMER_GROUP_NAME}
                                                </td>
                                                <td>{if $customerInfo.custgroup_name}{$customerInfo.custgroup_name}&nbsp;&nbsp;&nbsp;{/if}{$smarty.const.ADMIN_CHANGE}
                                                        <select name='custgroupID'>
                                                                <option value='null'>-</option>
                                                                {section name=i loop=$customer_groups}
                                                                        <option value='{$customer_groups[i].custgroupID}'
                                                                        {if $customer_groups[i].custgroupID == $customerInfo.custgroupID}
                                                                                selected
                                                                        {/if}
                                                                        >
                                                                                {$customer_groups[i].custgroup_name}
                                                                        </option>
                                                                {/section}
                                                        </select>
                                                        <input type=submit name='custgroupID_submit' value='{$smarty.const.ADMIN_CHANGE}' style="font-size: 11px; font-family: Tahoma, Arial; border: 1px solid #80A2D9; background-color: #E1ECFD;">
                                                </td>
                                        </tr>                                       <tr class="liney">
                                                <td> {$smarty.const.STR_ACTSTATE}</td>
                                                <td>
                                                {if $customerInfo.ActivationCode}
                                                        {$smarty.const.STR_NOTACTIVATED}
                                                        <a href="{"activateID=`$customerInfo.customerID`"|set_query}" onclick="return confirm('{$smarty.const.STR_QACTIVATE_ACCOUNT|replace:'[email]':$customerInfo.Email}');">{$smarty.const.ACTIVATE_BUTTON}</a>
                                                {else}
                                                        {$smarty.const.STR_ACTIVATED}
                                                {/if}
                                                </td>
                                        </tr>
                                                                                {if $customerInfo.ActivationCode}

                                      <tr class="liney">
                                                <td><strong>{$smarty.const.STR_ACTCODE}</strong></td>
                                                <td>{$customerInfo.ActivationCode}</td>
                                        </tr>
                                        {/if}
                                        {if $customerInfo.allowToDelete}
                                      <tr class="liney">
                                                <td></td>
                                                <td><input type="button" onclick="if(window.confirm('{$smarty.const.QUESTION_DELETE_CONFIRMATION}'))document.location.href='{"&safemode=&deleteCustomerID=`$customerInfo.customerID`"|set_query}';" value="{$smarty.const.TERMINATE_ACCOUNT_LINK}"  style="font-size: 11px; font-family: Tahoma, Arial; border: 1px solid #80A2D9; background-color: #E1ECFD;"></td>
                                        </tr>
                                        {/if}

                                </table>

                                </form>
                                {/if}


                                {if $customer_details == 'address_book'}
<table class="adn">
                                        {section name=i loop=$addresses}
<tr class="liney">
                                                        <td>
                                                                <b>{$smarty.const.CUSTOMER_ADDRESS} {$smarty.section.i.index+1}
                                                                        {if $addresses[i].addressID == $defaultAddressID}
                                                                                ({$smarty.const.STRING_DEFAULT})
                                                                        {/if}
                                                                </b>
                                                                <br>
                                                                {$addresses[i].addressStr|replace:"<":"&lt;"|replace:"&lt;br>":"<br>"}
                                                        </td>
                                                </tr>
                                        {/section}
                                        </table>

                                {/if}

                                {if $customer_details == 'order_history'}
                                        {if $orders}
                                                <form action='{$urlToSubmit}' method=POST>
                                                        {include file='admin/admin_order_history.tpl'}
                                                </form>
                                        {else}
                                                &lt; {$smarty.const.ADMIN_NO_RECORD_FOUND} &gt;
                                        {/if}
                                {/if}

                                {if $customer_details == 'visit_log'}

                                        {if $visits}
<table class="adn">
            <tr class="lineb">
                                                        <td align=left>IP</td>
                                                        <td align=left width="100%">{$smarty.const.ADMIN_CUSTOMER_ENTER_TIME}</td>
                                                </tr>

                                                {section name=i loop=$visits}
                                               <tr class="liney">
                                                        <td>
                                                                {$visits[i].customer_ip}
                                                        </td>
                                                        <td>
                                                                {$visits[i].customer_logtime}
                                                        </td>
                                                </tr>
                                                {/section}
                                                                                                {if $navigator}
                                                <tr>
                                                        <td class="navigator" colspan=7>{$navigator}</td>
                                                </tr>
                                                {/if}
                                        </table>

                                        {else}
                                                &lt; {$smarty.const.ADMIN_NO_RECORD_FOUND} &gt;
                                        {/if}

                                {/if} {if $customer_details == 'affiliate'}
                                        {include file="admin/custord_custlist_affiliate.tpl"}
                                {/if}
                      </td>
                </tr>




        </table>
<br>{if $returnUrl}
<a href='{$returnUrl}' class="inl">
{else}
<a href='{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=custlist' class="inl">
{/if}{$smarty.const.ADMIN_BACK_TO_SEARCH_FORM}</a>
{/if}
{/if}
<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adn"><tr><td class="help"><span class="titlecol2">{$smarty.const.USEFUL_FOR_YOU}</span><div class="helptext">{$smarty.const.ALERT_ADMIN2}</div></td>
        </tr>
      </table>