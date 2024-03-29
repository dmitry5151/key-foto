{* ������ ������� ���������� � ������ (��������� ��� ��� ����������) (��� ����������� ���������� � ��������) *}

{include file="header.tpl" header=$smarty.const.STRING_ORDERING}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{$smarty.const.STRING_ORDER_CONFIRMATION}</td>
  </tr>
</table>
{if $order_success}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop oki" align="center">{if $smarty.const.CONF_ACTIVE_ORDER eq 1}
      {$smarty.const.STRING_ORDER_PLACED_ACTIVATE}{if $smarty.const.CONF_DISP_ORDERNUM eq 1}
	  <br>{$smarty.const.STRING_ORDER_NUME}: {$orderidd}{/if}
      {else}
      {$smarty.const.STRING_ORDER_PLACED}{if $smarty.const.CONF_DISP_ORDERNUM eq 1}
	  <br>{$smarty.const.STRING_ORDER_NUME}: {$orderidd}{/if}
      {/if}</td>
  </tr>
</table>
{if $after_processing_html}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="center">{$after_processing_html}</td>
  </tr>
</table>
{/if}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{else}
{if $orderSum eq NULL}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop error" align="center">{$smarty.const.ERROR_CANT_FIND_REQUIRED_PAGE}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{else}
{if $orderSum.orderContentCartProductsCount eq 0}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop error" align="center">{$smarty.const.CART_EMPTY}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{else}
{if $payment_error}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop error" align="center">{$smarty.const.ADMIN_PAYMENT_ERROR}{if $payment_error ne 1}: {$payment_error}{/if}</td>
  </tr>
</table>
{/if}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hmin"><table cellspacing="1" cellpadding="0" width="100%" class="gre">
        <tr>
          <td class="lt pad" align="left" valign="middle" nowrap="nowrap" width="90%">{$smarty.const.TABLE_PRODUCT_NAME}</td>
          <td class="lt pad" align="center" valign="middle" nowrap="nowrap">{$smarty.const.TABLE_PRODUCT_QUANTITY}</td>
          <td class="lt pad" align="center" valign="middle" nowrap="nowrap">{$smarty.const.TABLE_PRODUCT_COST_WITHOUT_TAX}</td>
        </tr>
        {section name=i loop=$orderSum.sumOrderContent}
        <tr>
          <td class="padt" align="left" valign="middle">{$orderSum.sumOrderContent[i].name}</td>
          <td class="padt" align="center" valign="middle">{$orderSum.sumOrderContent[i].quantity}</td>
          <td class="padt" align="center" valign="middle" style="white-space: nowrap">{$orderSum.sumOrderContent[i].cost}</td>
        </tr>
        {/section}
        <tr>
          <td class="padt bf" align="right" valign="middle" colspan="2">{$smarty.const.STRING_PRED_TOTAL}</td>
          <td class="padt" align="center" valign="middle" style="white-space: nowrap">{$orderSum.pred_total}</td>
        </tr>
        {if $orderSum.discount_percent>0}
        <tr>
          <td class="padt bf" align="right" valign="middle" colspan="2">{$smarty.const.ADMIN_DISCOUNT} {$orderSum.discount_percent}%</td>
          <td class="padt" align="center" valign="middle" style="white-space: nowrap">{$orderSum.discount_show}</td>
        </tr>
        {/if}
        <tr>
          <td class="padt bf" align="right" valign="middle" colspan="2">{$smarty.const.STRING_SHIPPING_TYPE_PAY}</td>
          <td class="padt" align="center" valign="middle" style="white-space: nowrap">{$orderSum.shipping_cost}</td>
        </tr>
        <tr>
          <td class="pad bf cl12" align="right" valign="middle" colspan="2">{$smarty.const.TABLE_TOTAL}</td>
          <td class="pad lt cl12" align="center" valign="middle" style="white-space: nowrap;">{$orderSum.total}</td>
        </tr>
      </table></td>
  </tr>
</table>
<br>
<table cellspacing="0" cellpadding="0" width="100%">
  {if $orderSum.shipping_name ne "-"}
  <tr>
    <td class="padt" align="left" valign="middle">{$smarty.const.STRING_SHIPPING_TYPE_MAKE}: <b>{$orderSum.shipping_name}{if $orderSum.shippingServiceInfo} ({$orderSum.shippingServiceInfo}){/if}</b></td>
  </tr>
  {/if}
  {if $orderSum.payment_name ne "-"}
  <tr>
    <td class="padt" align="left" valign="middle">{$smarty.const.STRING_PAYMENT_TYPE_MAKE}: <b>{$orderSum.payment_name}</b></td>
  </tr>
  {/if}
  <tr>
    <td class="padt" align="left" valign="middle">{$smarty.const.STRING_TARGET_SHIPPING_ADDRESS}: <b>{$orderSum.shipping_address|replace:"<":"&lt;"|replace:"&lt;br>":", "}</b></td>
  </tr>
</table>
<br>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left"><form name='MainForm' method="POST" action="" id="MainForm">
        {$orderSum.payment_form_html}
        {$smarty.const.STRING_ORDER_COMMENT}:
        <div class="fil1"></div>
        <textarea name="order_comment" cols="54" rows="7"></textarea>
        <input type="hidden" name="submitgo" value=1>
        <input type="hidden" name='totalUC' value='{$totalUC}'>
      </form></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot"><a href="#" onclick="document.getElementById('MainForm').submit(); return false;">{$smarty.const.STRING_FORMALIZE_ORDER}</a></td>
  </tr>
</table>
{/if}
{/if}
{/if}