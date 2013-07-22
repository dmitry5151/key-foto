{* шаблон корзины покупателя *}
<article class="dwa-post dwa-article">
    <h2 class="dwa-postheader">{$smarty.const.CART_TITLE}</h2>
    <div class="dwa-postcontent dwa-postcontent clearfix">
        <div class="dwa-content-layout">
            <div class="dwa-content-layout-row">
            <div class="dwa-layout-cell layout-item" style="width: 100%" >	
{if $product_removed eq 1}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop error" align="center">{$smarty.const.STRING_PRODUCT_REMOVED}</td>
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


{if $cart_content}
<script type="text/javascript" src="data/{$smarty.const.TPL}/highslide.packed.js"></script>
<script type="text/javascript">
<!--
    hs.graphicsDir = 'data/{$smarty.const.TPL}/';
    hs.outlineType = 'rounded';
    hs.showCredits = false;
    hs.loadingOpacity = 1;

    hs.lang.restoreTitle = '{$smarty.const.STRING_HS_RESTORETITLE}';
    hs.lang.loadingText = '{$smarty.const.STRING_HS_LOADINGTEXT}';
    hs.lang.loadingTitle = '{$smarty.const.STRING_HS_LOADINGTITLE}';
    hs.lang.focusTitle = '{$smarty.const.STRING_HS_FOCUSTITLE}';
    hs.lang.fullExpandTitle = '{$smarty.const.STRING_HS_FULLEXPANDTITLE}';
//-->
</script>    
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hmin" align="left" style="padding:0;">
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
        <table cellspacing="1" cellpadding="0" width="100%" class="zebra">
          <tr>
              <td style="text-align: center">Фото</td>
              <td class="lt pad" width="90%" nowrap="nowrap" align="left" valign="middle"><b>{$smarty.const.TABLE_PRODUCT_NAME}</b></td>
            {if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
            <td class="lt pad" nowrap="nowrap" align="center" valign="middle">{$smarty.const.STRING_PRODUCT_CODE}</td>
            {/if}
            <!--td class="lt pad" align="center" valign="middle" nowrap="nowrap">{$smarty.const.TABLE_PRODUCT_QUANTITY}</td-->
            <td class="lt pad" align="center" valign="middle" nowrap="nowrap">{$smarty.const.TABLE_PRODUCT_COST}, {$currency_name}</td>
            <td class="lt pad" align="center" valign="middle">Удалить</td>
          </tr>
          {section loop=$cart_content name=i}
          {counter name=product_count print=false}
          <tr>
              <td style="text-align: center">
                  <!-- Вывод картинки -->                    
                    {if $cart_content[i].picture}
                        {if $cart_content[i].big_picture}
                            <a href="data/big/{$cart_content[i].big_picture}" class="highslide" onclick="return hs.expand(this)"><img src="data/small/{$cart_content[i].picture}" alt="{$cart_content[i].name}" id="{$cart_content[i].big_picture}" style="margin:0px" /></a>
                        {else}
                            <img src="data/small/{$cart_content[i].picture}" alt="{$cart_content[i].name}" style="margin:0px" />
                        {/if}
                    {elseif $cart_content[i].thumbnail}    
                        {if $cart_content[i].big_picture}<a href="data/big/{$cart_content[i].big_picture}" class="highslide" onclick="return hs.expand(this)"><img src="data/medium/{$cart_content[i].thumbnail}" alt="{$cart_content[i].name}" id="{$cart_content[i].big_picture}" style="margin:0px; width: 200px" /></a>
                        {else}<img src="data/medium/{$cart_content[i].thumbnail}" alt="{$cart_content[i].name}" style="margin:0px; width: 200px" />
                        {/if}
                    {else}
                        {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}<img src="data/empty.gif" alt="no photo" style="margin:0" />{/if}
                    {/if}
              </td>
            <td style="text-align: left; vertical-align: middle" valign="middle">{if $this_is_a_popup_cart_window}{$cart_content[i].name}{else}<a href='{$cart_content[i]|@fu_make_url}'>{$cart_content[i].name}</a>{/if}</td>
            {if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
            <td style="text-align: center; vertical-align: middle">{$cart_content[i].product_code}</td>
            {/if}
            {*
            <td class="padt" align="center" valign="middle">
			  {if $session_items}
              <input type="text" name="count_{$session_items[i]}" size=5 value="{$cart_content[i].quantity}" disabled="disabled" />
              {else}
              <input type="text" name="count_{$cart_content[i].id}" size=5 value="{$cart_content[i].quantity}" disabled="disabled" />
              {/if}
              {if $cart_content[i].min_order_amount}
              <table cellspacing="0" cellpadding="0" width="100%">
                <tr>
                  <td class="pad error" align="center">{$smarty.const.STRING_MIN_ORDER_AMOUNT} {$cart_content[i].min_order_amount} {$smarty.const.STRING_ITEM}</td>
                </tr>
              </table>
              {/if}
			</td>*}
            <td style="text-align: center; vertical-align: middle" nowrap="nowrap">{$cart_content[i].cost}</td>
            {if $session_items}
            <td style="text-align: center; vertical-align: middle"><a class="dwa-button" href="{$cart_reguest}&amp;shopping_cart=yes&amp;remove={$session_items[i]}">X</a></td>
            {else}
            <td style="text-align: center; vertical-align: middle"><a class="dwa-button" href="{$cart_reguest}&amp;shopping_cart=yes&amp;remove={$cart_content[i].id}">X</a></td>
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
<div class="fil2"></div>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot" width="100%"><a href="#" onClick="document.getElementById('formppl').submit(); return false">{$smarty.const.UPDATE_BUTTON}</a>{if $this_is_a_popup_cart_window}&nbsp;&nbsp;|&nbsp;&nbsp;<a href="#" onClick="window.close(); return false">{$smarty.const.CLOSE_BUTTON}</a>{/if}&nbsp;&nbsp;|&nbsp;&nbsp;<a href="{$cart_reguest}&amp;shopping_cart=yes&amp;clear_cart=yes">{$smarty.const.CART_CLEAR}</a></td>
    <td class="hdbot"><a class="dwa-button" href="#" onClick="{if $cart_amount<$smarty.const.CONF_MINIMAL_ORDER_AMOUNT}document.getElementById('id_too_small_order_amount').style.display='block';return false;{/if}window{if $this_is_a_popup_cart_window}.opener{/if}.location='index.php?{if $log ne NULL}order2_shipping=yes&amp;shippingAddressID={$shippingAddressID}{else}register_authorization=yes{/if}';{if $this_is_a_popup_cart_window}window.close();{/if} return false">{$smarty.const.CART_PROCEED_TO_CHECKOUT}</a></td>
  </tr>
</table>
{else}
<table cellspacing="0" cellpadding="0" width="100%" class="zebra">
  <tr>
    <td style="text-align:center">{$smarty.const.CART_EMPTY}</td>
  </tr>
</table>

{/if}

{if $this_is_a_popup_cart_window}
{* корректировка высоты окна корзины *}
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
				</div>
            </div>
        </div>
    </div>
</article>