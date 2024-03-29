{* ������ ������� ���������� *}

{if $product_removed eq 1}
{include file="header.tpl" header=$smarty.const.CART_TITLE}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop error" align="center">{$smarty.const.STRING_PRODUCT_REMOVED}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{else}
{if $this_is_a_popup_cart_window}
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset={$smarty.const.DEFAULT_CHARSET}">
<link rel="stylesheet" href="data/{$smarty.const.TPL}/style.css" type="text/css" media="all">
<title>{$smarty.const.CART_TITLE}</title>
</head>
<body>
{/if}
{include file="header.tpl" header=$smarty.const.CART_TITLE}

{if $cart_content}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hmin" align="left">
	  {if $make_more_exact_cart_content}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="error pad" align="center">{$smarty.const.STRING_MAKE_MORE_EXACT_CART_CONTENT}</td>
        </tr>
      </table>
      {/if}
      {if $cart_amount<$smarty.const.CONF_MINIMAL_ORDER_AMOUNT}      
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="error pad" align="center" id="id_too_small_order_amount" {if !$minOrder}style="display: none;"{/if}>{$smarty.const.CART_TOO_SMALL_ORDER_AMOUNT} {$cart_min}</td>
        </tr>
      </table>
      {/if}
      {counter name=product_count start=1 skip=1 print=false}
      <form action="{$cart_reguest}&amp;shopping_cart=yes" method=post name="formppl" id="formppl">
        <table cellspacing="1" cellpadding="0" width="100%" class="gre">
          <tr>
            <td class="lt pad" width="90%" nowrap="nowrap" align="left" valign="middle">{$smarty.const.TABLE_PRODUCT_NAME}</td>
            {if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
            <td class="lt pad" nowrap="nowrap" align="center" valign="middle">{$smarty.const.STRING_PRODUCT_CODE}</td>
            {/if}
            <td class="lt pad" align="center" valign="middle" nowrap="nowrap">{$smarty.const.TABLE_PRODUCT_QUANTITY}</td>
            <td class="lt pad" align="center" valign="middle" nowrap="nowrap">{$smarty.const.TABLE_PRODUCT_COST}, {$currency_name}</td>
            <td class="lt pad" align="center" valign="middle">&nbsp;</td>
          </tr>
          {section loop=$cart_content name=i}
          {counter name=product_count print=false}
          <tr>
            <td class="padt" align="left" valign="middle">{if $this_is_a_popup_cart_window}{$cart_content[i].name}{else}<a href='{$cart_content[i]|@fu_make_url}'>{$cart_content[i].name}</a>{/if}</td>
            {if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
            <td class="padt" align="center" valign="middle">{$cart_content[i].product_code}</td>
            {/if}
            <td class="padt" align="center" valign="middle">
			  {if $session_items}
              <input type="text" name="count_{$session_items[i]}" size=5 value="{$cart_content[i].quantity}">
              {else}
              <input type="text" name="count_{$cart_content[i].id}" size=5 value="{$cart_content[i].quantity}">
              {/if}
              {if $cart_content[i].min_order_amount}
              <table cellspacing="0" cellpadding="0" width="100%">
                <tr>
                  <td class="pad error" align="center">{$smarty.const.STRING_MIN_ORDER_AMOUNT} {$cart_content[i].min_order_amount} {$smarty.const.STRING_ITEM}</td>
                </tr>
              </table>
              {/if}
			</td>
            <td class="padt" align="center" valign="middle" nowrap="nowrap">{$cart_content[i].cost}</td>
            {if $session_items}
            <td class="padt" align="center" valign="middle"><a href="{$cart_reguest}&amp;shopping_cart=yes&amp;remove={$session_items[i]}">X</a></td>
            {else}
            <td class="padt" align="center" valign="middle"><a href="{$cart_reguest}&amp;shopping_cart=yes&amp;remove={$cart_content[i].id}">X</a></td>
            {/if} </tr>
          {/section}
          {if $discount_prompt != 0}
          {counter name=product_count print=false}
          {if $discount_prompt == 1 && $discount_percent != 0}
          <tr>
            <td class="lt padt" align="right" valign="middle" colspan="{if $smarty.const.CONF_DISPLAY_PRCODE eq 1}3{else}2{/if}"><b>{$smarty.const.ADMIN_DISCOUNT} {$discount_percent}%</b></td>
            <td class="lt padt" align="center" valign="middle" nowrap="nowrap"><b>{$discount_value}</b></td>
            <td class="lt padt" align="center" valign="middle">&nbsp;</td>
          </tr>
          {/if}
          {if $discount_prompt == 2}
          {counter name=product_count print=false}
          <tr>
            <td class="lt padt" align="right" valign="middle" colspan="{if $smarty.const.CONF_DISPLAY_PRCODE eq 1}5{else}4{/if}">{$smarty.const.STRING_UNREGISTERED_CUSTOMER_DISCOUNT_PROMPT}</td>
          </tr>
          {/if}
          {if $discount_prompt == 3 && $discount_percent != 0}
          {counter name=product_count print=false}
          <tr>
            <td class="lt padt" align="right" valign="middle" colspan="{if $smarty.const.CONF_DISPLAY_PRCODE eq 1}3{else}2{/if}"><b>{$smarty.const.ADMIN_DISCOUNT} {$discount_percent}%</b><br>{$smarty.const.STRING_UNREGISTERED_CUSTOMER_COMBINED_DISCOUNT_PROMPT}</td>
            <td class="lt padt" align="center" valign="middle" nowrap="nowrap"><b>{$discount_value}</b></td>
            <td class="lt padt" align="center" valign="middle">&nbsp;</td>
          </tr>
          {/if}
          {/if}
          <tr>
            <td class="pad bf cl12" align="right" valign="middle" colspan="{if $smarty.const.CONF_DISPLAY_PRCODE eq 1}3{else}2{/if}">{$smarty.const.TABLE_TOTAL}</td>
            <td class="lt pad cl12" align="center" valign="middle" nowrap="nowrap"><b>{$cart_total}</b></td>
            <td class="pad" align="center" valign="middle">&nbsp;<input type=hidden name=update value="1"><input type=hidden name=shopping_cart value="1"></td>
          </tr>
        </table>
      </form></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot"><a href="#" onClick="{if $cart_amount<$smarty.const.CONF_MINIMAL_ORDER_AMOUNT}document.getElementById('id_too_small_order_amount').style.display='block';return false;{/if}window{if $this_is_a_popup_cart_window}.opener{/if}.location='index.php?{if $log ne NULL}order2_shipping=yes&amp;shippingAddressID={$shippingAddressID}{else}register_authorization=yes{/if}';{if $this_is_a_popup_cart_window}window.close();{/if} return false">{$smarty.const.CART_PROCEED_TO_CHECKOUT}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onClick="document.getElementById('formppl').submit(); return false">{$smarty.const.UPDATE_BUTTON}</a>{if $this_is_a_popup_cart_window}&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onClick="window.close(); return false">{$smarty.const.CLOSE_BUTTON}</a>{/if}&nbsp;&nbsp;|&nbsp;&nbsp;<a href="{$cart_reguest}&amp;shopping_cart=yes&amp;clear_cart=yes">{$smarty.const.CART_CLEAR}</a></td>
  </tr>
</table>
{else}
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
{/if}

{if $this_is_a_popup_cart_window}
{* ������������� ������ ���� ������� *}
<script type="text/javascript">
{literal}
function adjust_cart_window(counter)
{
  var scr_h = screen.availHeight - 50;
  var wnd_h = 150 + counter*30;
  window.resizeTo( 550, Math.min(scr_h, wnd_h) );
}
{/literal}
adjust_cart_window({counter name=product_count});
</script>
</body>
</html>
{/if}
{/if}