{* ������ �������� ������� ������� � ������ �������� *}

{include file="header.tpl" header=$smarty.const.STRING_SHOPPING_HISTORY}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{if $order_detailed && $urlToReturn}<a href='{$urlToReturn}' style="float: right;">{$smarty.const.ADMIN_ORDER_LIST_GO_BACK}</a>{/if}<a href='index.php?contact_info=yes'>{$smarty.const.STRING_CONTACT_INFORMATION_DOWN_CASE}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?address_book=yes'>{$smarty.const.STRING_ADDRESS_BOOK}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?order_history=yes'>{$smarty.const.STRING_ORDER_HISTORY}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?visit_history=yes'>{$smarty.const.STRING_VISIT_HISTORY}</a>{if $smarty.const.CONF_AFFILIATE_PROGRAM_ENABLED}&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?affiliate=yes&amp;sub=balance'>{$smarty.const.STRING_AFFILIATE_PROGRAM}</a>{/if}</td>
  </tr>
</table>
{if !$order_detailed}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left"><form name='MainForm' id="MainForm" action="index.php?order_history=yes" method="GET">
        <input type=hidden name='order_history' value='yes'>
        <table cellspacing="0" cellpadding="0" width="100%">
          <tr>
            <td><table cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="middle" style="padding-bottom: 2px;"><input type=radio name=order_search_type value='SearchByOrderID'
                                                                        {if $order_search_type == 'SearchByOrderID' || $order_search_type == null}
                                                                                checked
                                                                        {/if}
                                                                                onclick='order_search_typeClickHandler()'
                                                                ></td>
                  <td valign="middle" class="padt">{$smarty.const.ADMIN_ORDER_SEARCH_BY_NUMBER}:</td>
                  <td><input type=text style="width: 150px;" name='orderID_textbox' value='{$orderID}'></td>
                </tr>
                <tr>
                  <td height="6" colspan="3"></td>
                </tr>
                <tr>
                  <td valign="middle" style="padding-bottom: 2px;"><input type=radio class="radio" name=order_search_type value='SearchByStatusID'
                                                                        {if $order_search_type == 'SearchByStatusID'}
                                                                                checked
                                                                        {/if}
                                                                        onclick='order_search_typeClickHandler()'
                                                                ></td>
                  <td valign="middle" class="padt" colspan="2">{$smarty.const.ADMIN_SHOW_ORDER_IN_STATUS}:</td>
                <tr>
                  <td></td>
                  <td colspan="2">
				  <script type="text/javascript">
                  <!--
                  function checkBoxes(_idForm, _syncID)
				  {literal}{{/literal}
				  if(document.getElementById(_syncID).checked == false)
				  {literal}{{/literal}
                      {section name=i loop=$order_statuses}
                      document.getElementById('checkbox_order_status_{$order_statuses[i].statusID}').checked = false;
                      {/section}
                  {literal}
                  }else{
                  {/literal}
                      {section name=i loop=$order_statuses}
                      document.getElementById('checkbox_order_status_{$order_statuses[i].statusID}').checked = true;
                      {/section}
                  {literal}
                  {literal}}{/literal}
                  return true;
                  {literal}}{/literal}
                  //-->
                  </script>
                    {if $order_statuses}
                    <table cellspacing="0" cellpadding="0">
                      <tr>
                        <td valign="middle"><input id="id_checkall" name="id_checkall" onclick="checkBoxes('MainForm', 'id_checkall');" type="checkbox"></td>
                        <td valign="middle">&nbsp;{$smarty.const.ADMIN_SHOW_ALLL}</td>
                      </tr>
                      {section name=i loop=$order_statuses}
                      <tr>
                        <td valign="middle"><input type=checkbox  id=checkbox_order_status_{$order_statuses[i].statusID} 
						                    name=checkbox_order_status_{$order_statuses[i].statusID}
                                            {if $order_statuses[i].selected == 1} checked {/if}value='1'></td>
                        <td valign="middle">&nbsp;{$order_statuses[i].status_name}</td>
                      </tr>
                      {/section}
					</table>
					{/if}                    
                    <br><a href="#" onclick="document.getElementById('MainForm').submit(); return false">{$smarty.const.OK_BUTTON3}</a>
                    <input type=hidden value=1 name="search">
				  </td>
                </tr>
              </table>
			</td>
          </tr>
        </table>
      </form>
      <script type="text/javascript">
      function order_search_typeClickHandler()
      {literal}{{/literal}
        if ( document.MainForm.order_search_type[0].checked )
        {literal}{{/literal}
            {section name=i loop=$order_statuses}
            document.MainForm.checkbox_order_status_{$order_statuses[i].statusID}.disabled = true;
            {/section}
            document.MainForm.id_checkall.disabled = true;
            document.MainForm.orderID_textbox.disabled = false;
            {literal}}{/literal}
            else if ( document.MainForm.order_search_type[1].checked )
            {literal}{{/literal}
            {section name=i loop=$order_statuses}
            document.MainForm.checkbox_order_status_{$order_statuses[i].statusID}.disabled = false;
            {/section}
            document.MainForm.orderID_textbox.disabled = true;
            document.MainForm.id_checkall.disabled = false;
        {literal}}{/literal}
      {literal}}{/literal}
      order_search_typeClickHandler();
      </script>
	</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hmin">
	  {if $user_orders}
      {if $orders_navigator}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="catbot" align="center">{$orders_navigator}</td>
        </tr>
      </table>
      {/if}
      <table cellspacing="1" cellpadding="0" class="gre" width="100%">
        <tr>
          <td class="lt pad" align="left" valign="middle" nowrap="nowrap"><a href='{$urlToSort}&amp;sort=orderID&amp;direction=ASC'>{$smarty.const.STRING_MODULE_NUMERATIK} #</a></td>
          <td class="lt pad" align="left" valign="middle"><a href='{$urlToSort}&amp;sort=order_time&amp;direction=ASC'>{$smarty.const.TABLE_ORDER_TIME}</a></td>
          <td class="lt pad" align="left" valign="middle">{$smarty.const.ADMIN_ORDER_STATUS_NAME}</td>
          <td class="lt pad" align="left" valign="middle">{$smarty.const.TABLE_ORDERED_PRODUCTS}</td>
          <td class="lt pad" align="left" valign="middle" nowrap="nowrap"><a href='{$urlToSort}&amp;sort=order_amount&amp;direction=ASC'>{$smarty.const.TABLE_ORDER_TOTAL}, {$currency_name}</a></td>
        </tr>
        {section name=i loop=$user_orders}
        <tr>
          <td class="pad" align="left" valign="middle"><a href='index.php?order_detailed={$user_orders[i].orderID}&amp;urlToReturn={$urlToReturn}'>{$smarty.const.STRING_ORDER_NAME1} #{$user_orders[i].orderID}</a></td>
          <td class="pad" align="left" valign="middle">{$user_orders[i].order_time}</td>
          <td class="pad" align="left" valign="middle">{$user_orders[i].OrderStatus}</td>
          <td class="pad" align="left" valign="middle"><table>
              {section name=j loop=$user_orders[i].content}
              <tr>
                <td>{$user_orders[i].content[j].name}
                  {if $user_orders[i].content[j].eproduct_filename}
				  {if $completed_order_status}
				  {if $completed_order_status == $user_orders[i].statusID}
				  <br><a href='index.php?do=get_file&amp;getFileParam={$user_orders[i].content[j].getFileParam}'>{$smarty.const.ADMIN_DOWN_LOAD} ({$user_orders[i].content[j].file_size}
                  MB)</a>{if $user_orders[i].content[j].day_count_remainder > 0} - {$smarty.const.ADMIN_EPRODUCT_AVAILABLE_DAYS} {$user_orders[i].content[j].day_count_remainder} {$smarty.const.ADMIN_DAYS}{if $user_orders[i].content[j].load_counter_remainder != 0}, {$smarty.const.ADMIN_REMANDER_EPRODUCT_DOWNLOAD_TIMES} {$user_orders[i].content[j].load_counter_remainder} {$smarty.const.ADMIN_DOWNLOAD_TIMES}{/if}{/if}{/if}{/if}{/if}</td>
              </tr>
              {/section}
            </table></td>
          <td class="pad" align="left" valign="middle">{$user_orders[i].order_amount} {if $user_orders[i].calculate_tax ne 0 && $user_orders[i].tax ne 0}<br>({$smarty.const.STRING_TAX} {$user_orders[i].tax}){/if}</td>
        </tr>
        {/section}
      </table>
      {else}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="cattop error" align="center">{$smarty.const.STRING_NO_ORDERS}</td>
        </tr>
      </table>
      {/if}
	</td>
  </tr>
</table>
{else}
<div class="fil1 white"></div>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left"><b>{$smarty.const.STRING_ORDERING_INFO} #{$order.orderID}</b></td>
  </tr>
</table>
<form action="" name='MainForm' method="POST">
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td class="hdbtop" align="left"><table cellspacing="0" cellpadding="0" width="100%">
          <tr>
            <td>{$smarty.const.TABLE_ORDER_TIME}: <b>{$order.order_time}</b></td>
          </tr>
          <tr>
            <td style="height: 3px;"></td>
          </tr>
          <tr>
            <td>{$smarty.const.CUSTOMER_FIRST_NAME}: <b>{$order.customer_firstname}</b></td>
          </tr>
          <tr>
            <td style="height: 3px;"></td>
          </tr>
          <tr>
            <td>{$smarty.const.CUSTOMER_LAST_NAME}: <b>{$order.customer_lastname}</b></td>
          </tr>
          {section name=i loop=$order.reg_fields_values}
          <tr>
            <td> {$order.reg_fields_values[i].reg_field_name}: <b>{$order.reg_fields_values[i].reg_field_value}</b></td>
          </tr>
          <tr>
            <td style="height: 3px;"></td>
          </tr>
          {/section}
          <tr>
            <td style="height: 3px;"></td>
          </tr>
          <td>{$smarty.const.CUSTOMER_ADRESL}: <b>{if $order.shipping_address ne ""}{$order.shipping_address}{/if}{if $order.shipping_city ne ""}, {$order.shipping_city}{/if}{if $order.shipping_state ne ""}, {$order.shipping_state}{/if}{if $order.shipping_country ne ""}, {$order.shipping_country}{/if}</b></td>
          </tr>  
          <tr>
            <td style="height: 3px;"></td>
          </tr>
          {if $order.shipping_type}
          <tr>
            <td>{$smarty.const.STRING_SHIPPING_TYPE_MAKE}: <b>{$order.shipping_type} {if $order.shippingServiceInfo} ({$order.shippingServiceInfo}){/if}</b></td>
          </tr>
          <tr>
            <td style="height: 3px;"></td>
          </tr>
          {/if}
          {if $order.payment_type}
          <tr>
            <td>{$smarty.const.STRING_PAYMENT_TYPE_MAKE}: <b>{$order.payment_type}</b></td>
          </tr>
          <tr>
            <td style="height: 3px;"></td>
          </tr>
          {/if}
        </table></td>
    </tr>
  </table>
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td class="cbt" align="left"><b>{$smarty.const.ADMIN_ORDERED_PRODUCTS}</b></td>
    </tr>
  </table>
  <table cellspacing="0" cellpadding="0" width="100%">
    <tr>
      <td class="hmin" align="left"><table cellspacing="1" cellpadding="0" width="100%" class="gre">
          <tr>
            <td class="lt pad" align="left" valign="middle" width="80%">{$smarty.const.ADMIN_PRODUCT_NAME}</td>
            <td class="lt pad" align="left" valign="middle">{$smarty.const.TABLE_PRODUCT_QUANTITY}</td>
            <td class="lt pad" align="left" valign="middle">{$smarty.const.TABLE_PRODUCT_COST_WITHOUT_TAX}</td>
          </tr>
          {section name=i loop=$orderContent}
          <tr>
            <td class="padt" align="left" valign="middle">{$orderContent[i].name} {if $orderContent[i].eproduct_filename}
              {if $completed_order_status} {if $completed_order_status ==
              $order.statusID} <a href='index.php?do=get_file&amp;getFileParam={$orderContent[i].getFileParam}'>{$smarty.const.ADMIN_DOWN_LOAD} ({$orderContent[i].file_size}
              MB)</a>{if $orderContent[i].day_count_remainder > 0} - {$smarty.const.ADMIN_EPRODUCT_AVAILABLE_DAYS} {$orderContent[i].day_count_remainder} {$smarty.const.ADMIN_DAYS}{if $orderContent[i].load_counter_remainder != 0}, {$smarty.const.ADMIN_REMANDER_EPRODUCT_DOWNLOAD_TIMES} {$orderContent[i].load_counter_remainder} {$smarty.const.ADMIN_DOWNLOAD_TIMES}{/if}{/if}{/if}{/if}{/if}</td>
            <td class="padt" align="left" valign="middle">{$orderContent[i].Quantity}</td>
            <td class="padt" align="left" valign="middle" nowrap="nowrap">{$orderContent[i].PriceToShow}</td>
          </tr>
          {/section}
          <tr>
            <td class="padt" align="right" valign="middle" colspan="2">{$smarty.const.STRING_PRED_TOTAL}:</td>
            <td class="padt" align="left" valign="middle" nowrap="nowrap">{$order.clear_total_priceToShow}</td>
          </tr>
          {if $order.order_discount > 0}
          <tr class="liney">
            <td class="padt" align="right" valign="middle" colspan="2">{$smarty.const.ADMIN_DISCOUNT} {$order.order_discount}%:</td>
            <td class="padt" align="left" valign="middle" nowrap="nowrap">{$order.order_discount_ToShow}</td>
          </tr>
          {/if}
          <tr>
            <td class="padt" align="right" valign="middle" colspan="2">{$smarty.const.ADMIN_SHIPPING_COST}:</td>
            <td class="padt" align="left" valign="middle" nowrap="nowrap">{$order.shipping_costToShow}</td>
          </tr>
          <tr>
            <td class="padt cl12" align="right" valign="middle" colspan="2">{$smarty.const.TABLE_TOTAL}:</td>
            <td class="padt lt cl12" align="left" valign="middle" nowrap="nowrap">{$order.order_amountToShow}</td>
          </tr>
        </table>
        {if $order_status_report}
        <div class="fil1 white"></div>
        <div class="fil1 white"></div>
        <table cellspacing="0" cellpadding="0" width="100%">
          <tr>
            <td class="cbt" align="left"><b>{$smarty.const.ADMIN_ORDER_EXECUTING}</b></td>
          </tr>
        </table>
        <div class="fil1 white"></div>
        <table cellspacing="1" cellpadding="0" width="100%" class="gre">
          <tr>
            <td class="lt pad" align="left" valign="middle" width="80%">{$smarty.const.ADMIN_TIME}</td>
            <td class="lt pad" align="left" valign="middle">{$smarty.const.ADMIN_ORDER_STATUS_NAME}</td>
          </tr>
          {section name=i loop=$order_status_report}
          <tr>
            <td class="padt" align="left" valign="middle">{$order_status_report[i].status_change_time}</td>
            <td class="padt" align="left" valign="middle">{if $order_status_report[i].status_name != 'STRING_CANCELED_ORDER_STATUS'}{$order_status_report[i].status_name} {else}{$smarty.const.STRING_CANCELED_ORDER_STATUS}{/if}</td>
          </tr>
          {/section}
        </table>
        {/if}
        <input type=hidden name='orders_detailed' value='yes'></td>
    </tr>
  </table>
</form>
{/if}