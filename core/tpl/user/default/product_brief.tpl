{* ������ ��������� ������� ������ *}

{if $product_info ne NULL}
{assign var="urlRewr" value=$product_info|@fu_make_url}
{assign var="tlink" value="<a class='phead' href='`$urlRewr`'>`$product_info.name`</a>"}
{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?productID=`$product_info.productID`&amp;eaction=prod' title='`$smarty.const.STRING_EDITPR`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$tlink`}{else}{assign var="postheader" value=$tlink}{/if}
{include file="header.tpl" header=$postheader}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" valign="top" align="left"><table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td valign="middle" align="left"><table cellspacing="0" cellpadding="0" style="margin-right: 8px;">
              <tr>
                <td class="price" id="optionPrice_{$product_info.productID}">{if $currencies_count ne 0}{if $product_info.Price <= 0}{$smarty.const.STRING_NOPRODUCT_IN}{else}{$product_info.PriceWithUnit}{/if}{/if}</td>
              </tr>
              {if $currencies_count ne 0}{if $product_info.list_price > 0 && $product_info.list_price > $product_info.Price && $product_info.Price > 0}
              <tr>
                <td class="price market-price">{$product_info.list_priceWithUnit}</td>
              </tr>
              {/if}{/if}
            </table></td>
          <td align="right" width="100%" valign="middle"><table cellspacing="0" cellpadding="0" align="right">
              <tr>
                <td style="border-left: 1px solid #CCCCCC; padding-left: 8px;" align="left" valign="middle"><form action="index.php?categoryID={$product_info.categoryID}&amp;prdID={$product_info.productID}" method=post name="HiddenFieldsForm_{$product_info.productID}" id="HiddenFieldsForm_{$product_info.productID}">
                    {if $smarty.const.CONF_OPEN_SHOPPING_CART_IN_NEW_WINDOW eq 1}
                    {if $smarty.const.CONF_SHOW_ADD2CART eq 1 && ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
                    <table cellspacing="0" cellpadding="0">
                      <tr>
                        <td><a href="#" onclick="open_window('index.php?do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_info.product_extra}{if $product_info.product_extra[i].option_type eq 1}{section name=s loop=$product_info.product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm_{$product_info.productID}.option_select_hidden_{counter name=select_counter_hidden_extra}_{$product_info.productID}.value+'{/section}{/if}{/section}&amp;multyaddcount='+document.HiddenFieldsForm_{$product_info.productID}.multyaddcount.value+'',550,300); return false"><img src="data/{$smarty.const.TPL}/crt.gif" alt=""></a></td>
                        <td style="padding-left: 4px;"><input type={if $smarty.const.CONF_MULTYCART==0}hidden{else}text{/if} value="1" name="multyaddcount" {if $smarty.const.CONF_MULTYCART==1}size="2" style="margin-right: 4px; width: 16px;"{/if}>
                          <a href="#" onclick="open_window('index.php?do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_info.product_extra}{if $product_info.product_extra[i].option_type eq 1}{section name=s loop=$product_info.product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm_{$product_info.productID}.option_select_hidden_{counter name=select_counter_hidden_extra}_{$product_info.productID}.value+'{/section}{/if}{/section}&amp;multyaddcount='+document.HiddenFieldsForm_{$product_info.productID}.multyaddcount.value+'',550,300); return false">{$smarty.const.ADD_TO_CART_STRING}</a></td>
                      </tr>
                    </table>
                    {/if}
                    {else}
                    {if $smarty.const.CONF_CART_METHOD eq 2}
                    {if $smarty.const.CONF_SHOW_ADD2CART eq 1 && ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
                    <table cellspacing="0" cellpadding="0">
                      <tr>
                        <td><a href="#" onclick="doLoad('do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_info.product_extra}{if $product_info.product_extra[i].option_type eq 1}{section name=s loop=$product_info.product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm_{$product_info.productID}.option_select_hidden_{counter name=select_counter_hidden_extra}_{$product_info.productID}.value+'{/section}{/if}{/section}&amp;xcart=yes&amp;multyaddcount='+document.HiddenFieldsForm_{$product_info.productID}.multyaddcount.value+''); return false"><img src="data/{$smarty.const.TPL}/crt.gif" alt=""></a></td>
                        <td style="padding-left: 4px;"><input type={if $smarty.const.CONF_MULTYCART==0}hidden{else}text{/if} value="1" name="multyaddcount" {if $smarty.const.CONF_MULTYCART==1}size="2" style="margin-right: 4px; width: 16px;"{/if}>
                          <a href="#" onclick="doLoad('do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_info.product_extra}{if $product_info.product_extra[i].option_type eq 1}{section name=s loop=$product_info.product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm_{$product_info.productID}.option_select_hidden_{counter name=select_counter_hidden_extra}_{$product_info.productID}.value+'{/section}{/if}{/section}&amp;xcart=yes&amp;multyaddcount='+document.HiddenFieldsForm_{$product_info.productID}.multyaddcount.value+''); return false">{$smarty.const.ADD_TO_CART_STRING}</a></td>
                      </tr>
                    </table>
                    {/if}
                    {else}
                    {if $smarty.const.CONF_SHOW_ADD2CART eq 1 && ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
                    <table cellspacing="0" cellpadding="0">
                      <tr>
                        <td><input type="hidden" name="cart_{$product_info.productID}_x" value="{$product_info.productID}">
                          <a href="#" onclick="document.getElementById('HiddenFieldsForm_{$product_info.productID}').submit(); return false"><img src="data/{$smarty.const.TPL}/crt.gif" alt=""></a></td>
                        <td style="padding-left: 4px;"><input type={if $smarty.const.CONF_MULTYCART==0}hidden{else}text{/if} value="1" name="multyaddcount" {if $smarty.const.CONF_MULTYCART==1}size="2" style="margin-right: 4px; width: 16px;"{/if}>
                          <a href="#" onclick="document.getElementById('HiddenFieldsForm_{$product_info.productID}').submit(); return false">{$smarty.const.ADD_TO_CART_STRING}</a></td>
                      </tr>
                    </table>
                    {/if}
                    {/if}
                    {/if}
                    {counter name='select_counter_hidden' start=0 skip=1 print=false}
                    {section name=i loop=$product_info.product_extra}
                    {if $product_info.product_extra[i].option_type eq 1}
                    {section name=s loop=$product_info.product_extra[i].option_show_times}
                    <input type=hidden name='option_select_hidden_{counter name=select_counter_hidden}_{$product_info.productID}' value='1'>
                    {/section}
                    {/if}
                    {/section}
                  </form>
                  {if $product_info.allow_products_comparison}
                  <div class="fil1"></div>
                  <table cellspacing="0" cellpadding="0">
                    <tr>
                      <td><a href="#" onclick="doLoadcpr('do=compare&amp;cpradd={$product_info.productID}'); return false"><img src="data/{$smarty.const.TPL}/explorer.gif" alt=""></a></td>
                      <td style="padding-left: 4px;"><a href="#" onclick="doLoadcpr('do=compare&amp;cpradd={$product_info.productID}'); return false">{$smarty.const.ADD_TO_CFOLDER}</a></td>
                    </tr>
                  </table>
                  {/if} </td>
              </tr>
            </table></td>
        </tr>
      </table></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td width="100%" style="background-color: #CCCCCC; height: 1px;"></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" valign="top" align="left"><table cellspacing="0" cellpadding="0" width="100%">
        <tr> {if $smarty.const.CONF_DISPLAY_FOTO eq 1}
          {if $product_info.picture}
          <td class="imboxl"><a href="{$product_info|@fu_make_url}"><img src="data/small/{$product_info.picture}" alt="{$product_info.name}"></a></td>
          {else}
          {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}
          <td class="imboxl"><a href="{$product_info|@fu_make_url}"><img src="data/empty.gif" alt="no photo"></a></td>
          {/if}
          {/if}
          {/if}
          <td width="100%" valign="top" align="left"> {if $product_info.customer_votes > 0 && $smarty.const.CONF_USE_RATING eq 1}
            <table cellspacing="0" cellpadding="0" width="100%" class="print">
              <tr>
                <td valign="middle" align="left"><table cellspacing="0" cellpadding="0">
                    <tr> {section name=i loop=5}
                      <td valign="middle" align="left"> {if $smarty.section.i.index<$product_info.customers_rating}
                                                                <img src="data/{$smarty.const.TPL}/redstar_big.gif" alt=""> {else} <img src="data/{$smarty.const.TPL}/blackstar_big.gif" alt=""> {/if} </td>
                      {/section} </tr>
                  </table></td>
              </tr>
            </table>
            <div class="fil1"></div>
            {/if}
            {assign var="otstup" value=0}
            {if $smarty.const.CONF_CHECKSTOCK == '1'}{$smarty.const.IN_STOCK}: <b>{if $product_info.in_stock > 0}<span class="oki">{if $smarty.const.CONF_EXACT_PRODUCT_BALANCE == '1'}{$product_info.in_stock}{else}{$smarty.const.ANSWER_YES}{/if}</span>{else}<span class="error">{if $product_info.in_stock < 0}{$smarty.const.STOCK_TRAIN_GO}{else}{$smarty.const.ANSWER_NO}{/if}</span>{/if}</b><br>
            {assign var="otstup" value=1}{/if}
            {if $currencies_count ne 0}
            {if $product_info.shipping_freightUC}
            {$smarty.const.ADMIN_SHIPPING_FREIGHT2}: <b>{$product_info.shipping_freightUC}</b><br>
            {assign var="otstup" value=1}
            {/if}
            {/if}
            {if $product_info.min_order_amount > 1}
            {$smarty.const.STRING_MIN_ORDER_AMOUNT}: <b>{$product_info.min_order_amount}{$smarty.const.STRING_ITEM}</b><br>
            {assign var="otstup" value=1}
            {/if}
            {if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
            {if $product_info.product_code}
            {$smarty.const.STRING_PRODUCT_CODE}: <b>{$product_info.product_code}</b><br>
            {assign var="otstup" value=1}
            {/if}
            {/if}
            {if $otstup eq 1}
            <div class="fil"></div>
            {/if}
            <form action="index.php?productID={$product_info.productID}" method=post name="MainForm1_{$product_info.productID}">
              {counter name='select_counter' start=0 skip=1 print=false assign='select_counter_var'}
              {section name=i loop=$product_info.product_extra}
              {if $product_info.product_extra[i].option_type eq 0 }
              {$product_info.product_extra[i].name}: {$product_info.product_extra[i].option_value}<br>
              {else}
              {section name=k loop=$product_info.product_extra[i].option_show_times}
              {$product_info.product_extra[i].name}{if $product_info.product_extra[i].option_show_times > 1} ({$smarty.section.k.index+1}):{else}:{/if}
              {counter name=select_counter}
              {if $product_info.product_extra[i].values_to_select_count == 1} <b>{$product_info.product_extra[i].values_to_select[0].option_value}</b><br>
              <input type="hidden" name="option_select_{$select_counter_var}_{$product_info.productID}" value='{$product_info.product_extra[i].values_to_select[0].price_surplus}:{$product_info.product_extra[i].values_to_select[0].variantID}'>
              {else}
              {if $smarty.section.k.index == 0}
              <select name='option_select_{$select_counter_var}_{$product_info.productID}' onchange='GetCurrentCurrency_{$product_info.productID}();' class="WCHhider">
                
{section name=j loop=$product_info.product_extra[i].values_to_select}

                <option value='{$product_info.product_extra[i].values_to_select[j].price_surplus}:{$product_info.product_extra[i].values_to_select[j].variantID}' {if $product_info.product_extra[i].values_to_select[j].variantID eq $product_info.product_extra[i].variantID}selected{/if}>{$product_info.product_extra[i].values_to_select[j].option_value}</option>
                
{/section}

              </select>
              <br>
              {else}
              <select name='option_select_{$select_counter_var}_{$product_info.productID}' onchange='GetCurrentCurrency_{$product_info.productID}();' class="WCHhider">
                <option value='0:-1'>{$smarty.const.NOT_DEFINED}</option>
                
{section name=j loop=$product_info.product_extra[i].values_to_select}

                <option value='{$product_info.product_extra[i].values_to_select[j].price_surplus}:{$product_info.product_extra[i].values_to_select[j].variantID}'>{$product_info.product_extra[i].values_to_select[j].option_value}</option>
                
{/section}

              </select>
              <br>
              {/if}{/if}
              {/section}
              {/if}
              {/section}
            </form>
            {if $product_info.product_extra_count > 0}
            <div class="fil"></div>
            {/if}
            {if $select_counter_var != 0}
            <form action="index.php?productID={$product_info.productID}" method=post name="MainForm2_{$product_info.productID}">
              <input type=hidden value="{php}echo(getPriceUnit());{/php}" name="priceUnit_{$product_info.productID}">
            </form>
            {/if}
            {if $select_counter_var != 0}
            <script type="text/javascript">
function GetCurrentCurrency_{$product_info.productID}()
{literal}
{
{/literal}
 _selectionCount={$select_counter_var};
 _sum = {$product_info.PriceWithOutUnit};
{counter name='select_counter2' start=1 skip=1 print=false assign='select_counter_var2'}
{section name=i loop=$product_info.product_extra}
{section name=k loop=$product_info.product_extra[i].option_show_times}

 _value=document.MainForm1_{$product_info.productID}.option_select_{$select_counter_var2}_{$product_info.productID}.value;
 price_surplus = ( _value.split(":") )[0];
  _sum += new Number( price_surplus );
 variantID = ( _value.split(":") )[1];
 document.HiddenFieldsForm_{$product_info.productID}.option_select_hidden_{$select_counter_var2}_{$product_info.productID}.value = variantID;
{counter name=select_counter2}
{/section}
{/section}
 _sum = Math.round(_sum*100)/100;
 _sumStr = new String(_sum);
 _commaIndex = _sumStr.indexOf(".");
 if ( _commaIndex == -1 )
 _sumStr = _sum;
 else
 _sumStr = _sumStr.substr(0, _commaIndex + 3);
{php}
echo("locationPriceUnit=".getLocationPriceUnit().";\n");
{/php}
 _sumStr = _formatPrice(_sumStr, {$currency_roundval});
if ( locationPriceUnit )
document.getElementById('optionPrice_{$product_info.productID}').innerHTML = _sumStr + document.MainForm2_{$product_info.productID}.priceUnit_{$product_info.productID}.value;
else
document.getElementById('optionPrice_{$product_info.productID}').innerHTML = document.MainForm2_{$product_info.productID}.priceUnit_{$product_info.productID}.value + _sumStr;
{literal}
}
{/literal}
GetCurrentCurrency_{$product_info.productID}();
</script>
            {/if}
            {if $product_info.brief_description}{$product_info.brief_description}{/if} </td>
          {if $smarty.const.CONF_DISPLAY_FOTO eq 0}
          {if $product_info.picture}
          <td class="imboxr"><a href="{$product_info|@fu_make_url}"><img src="data/small/{$product_info.picture}" alt="{$product_info.name}"></a></td>
          {else}
          {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}
          <td class="imboxr"><a href="{$product_info|@fu_make_url}"><img src="data/empty.gif" alt="no photo"></a></td>
          {/if}
          {/if}
          
          {/if} </tr>
      </table></td>
  </tr>
</table>
{*
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot"><a href="{$product_info|@fu_make_url}">{$smarty.const.STRING_MOREPR}</a></td>
  </tr>
</table>
*}
{/if}