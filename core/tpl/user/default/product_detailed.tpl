{* ������ ���������� �������� ������ *}

{if $product_info ne NULL}
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
{* ��� ������� ���������� ���� �������� ��� ������������� �������� ���� ���������������� ���� ���� ����
<script type="text/javascript">
    hs.dimmingOpacity = 0.75;
</script>
<style type="text/css">
{literal}
.highslide-dimming {
        background: #333333;
        position: absolute;
}
{/literal}
</style>
*}
{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?productID=`$product_info.productID`&amp;eaction=prod' title='`$smarty.const.STRING_EDITPR`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$product_info.name`}{else}{assign var="postheader" value=$product_info.name}{/if}
{include file="header.tpl" header=$postheader}
<table cellspacing="0" cellpadding="0" width="100%" class="print">
  <tr>
    <td class="cbt" align="left">{if $smarty.const.CONF_USE_DISCUSS eq 1}<span style="float: right;"><a href="index.php?productID={$product_info.productID}&amp;discuss=yes">{$smarty.const.DISCUSS_ITEM_LINK}</a> ({$product_reviews_count} {$smarty.const.POSTS_FOR_ITEM_STRING})</span>{/if}<a href="{$smarty.const.CONF_FULL_SHOP_URL}">{$smarty.const.LINK_TO_HOMEPAGE}</a>{section name=i loop=$product_category_path}{if $product_category_path[i].categoryID != 1} / <a href="{$product_category_path[i]|@fu_make_url}">{$product_category_path[i].name}</a>{/if}{/section}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" valign="top" align="left"><table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td valign="middle" align="left"><table cellspacing="0" cellpadding="0" style="margin-right: 8px;">
              <tr>
                <td class="price" id="optionPrice">{if $currencies_count ne 0}{if $product_info.Price <= 0}{$smarty.const.STRING_NOPRODUCT_IN}{else}{$product_info.PriceWithUnit}{/if}{/if}</td>
              </tr>
              {if $currencies_count ne 0}{if $product_info.list_price > 0 && $product_info.list_price > $product_info.Price && $product_info.Price > 0}
              <tr>
                <td class="price market-price">{$product_info.list_priceWithUnit}</td>
              </tr>
              {/if}{/if}
            </table></td>
          <td align="right" width="100%" valign="middle"><table cellspacing="0" cellpadding="0" align="right">
              <tr>
                <td style="border-left: 1px solid #CCCCCC; padding-left: 8px;" align="left" valign="middle"><form action="index.php?productID={$product_info.productID}" method=post name="HiddenFieldsForm" id="DetailCartForm">
                    {if $smarty.const.CONF_OPEN_SHOPPING_CART_IN_NEW_WINDOW eq 1}
                    {if $smarty.const.CONF_SHOW_ADD2CART eq 1 &&  ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
                    <table cellspacing="0" cellpadding="0" class="print">
                      <tr>
                        <td><a href="#" onclick="open_window('index.php?do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_extra}{if $product_extra[i].option_type eq 1}{section name=s loop=$product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm.option_select_hidden_{counter name=select_counter_hidden_extra}.value+'{/section}{/if}{/section}&amp;multyaddcount='+document.HiddenFieldsForm.multyaddcount.value+'',550,300);"><img src="data/{$smarty.const.TPL}/crt.gif" alt=""></a></td>
                        <td style="padding-left: 4px;"><input type={if $smarty.const.CONF_MULTYCART==0}hidden{else}text{/if} value="1" name="multyaddcount" {if $smarty.const.CONF_MULTYCART==1}size="2" style="margin-right: 4px; width: 16px;"{/if}>
                          <a href="#" onclick="open_window('index.php?do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_extra}{if $product_extra[i].option_type eq 1}{section name=s loop=$product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm.option_select_hidden_{counter name=select_counter_hidden_extra}.value+'{/section}{/if}{/section}&amp;multyaddcount='+document.HiddenFieldsForm.multyaddcount.value+'',550,300);">{$smarty.const.ADD_TO_CART_STRING}</a></td>
                      </tr>
                    </table>
                    {/if}
                    {else}
                    {if $smarty.const.CONF_CART_METHOD eq 2}
                    {if $smarty.const.CONF_SHOW_ADD2CART eq 1 && ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
                    <table cellspacing="0" cellpadding="0" class="print">
                      <tr>
                        <td><a href="#" onclick="doLoad('do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_extra}{if $product_extra[i].option_type eq 1}{section name=s loop=$product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm.option_select_hidden_{counter name=select_counter_hidden_extra}.value+'{/section}{/if}{/section}&amp;xcart=yes&amp;multyaddcount='+document.HiddenFieldsForm.multyaddcount.value+''); return false"><img src="data/{$smarty.const.TPL}/crt.gif" alt=""></a></td>
                        <td style="padding-left: 4px;"><input type={if $smarty.const.CONF_MULTYCART==0}hidden{else}text{/if} value="1" name="multyaddcount" {if $smarty.const.CONF_MULTYCART==1}size="2" style="margin-right: 4px; width: 16px;"{/if}>
                          <a href="#" onclick="doLoad('do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_extra}{if $product_extra[i].option_type eq 1}{section name=s loop=$product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm.option_select_hidden_{counter name=select_counter_hidden_extra}.value+'{/section}{/if}{/section}&amp;xcart=yes&amp;multyaddcount='+document.HiddenFieldsForm.multyaddcount.value+''); return false">{$smarty.const.ADD_TO_CART_STRING}</a></td>
                      </tr>
                    </table>
                    {/if}
                    {else}
                    {if $smarty.const.CONF_SHOW_ADD2CART eq 1 && ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
                    <table cellspacing="0" cellpadding="0" class="print">
                      <tr>
                        <td><input type="hidden" name="cart_x" value="{$product_info.productID}">
                          <a href="#" onclick="document.getElementById('DetailCartForm').submit(); return false"><img src="data/{$smarty.const.TPL}/crt.gif" alt=""></a></td>
                        <td style="padding-left: 4px;"><input type={if $smarty.const.CONF_MULTYCART==0}hidden{else}text{/if} value="1" name="multyaddcount" {if $smarty.const.CONF_MULTYCART==1}size="2" style="margin-right: 4px; width: 16px;"{/if}>
                          <a href="#" onclick="document.getElementById('DetailCartForm').submit(); return false">{$smarty.const.ADD_TO_CART_STRING}</a></td>
                      </tr>
                    </table>
                    {/if}
                    {/if}
                    {/if}
                    {counter name='select_counter_hidden' start=0 skip=1 print=false}
                    {section name=i loop=$product_extra}
                    {if $product_extra[i].option_type eq 1}
                    {section name=s loop=$product_extra[i].option_show_times}
                    <input type=hidden name='option_select_hidden_{counter name=select_counter_hidden}' value='1'>
                    {/section}
                    {/if}
                    {/section}
                  </form>
                  {if $product_info.allow_products_comparison}
                  <div class="fil1"></div>
                  <table cellspacing="0" cellpadding="0" class="print">
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
          <td class="imboxl"> {if $product_info.thumbnail}
            {if $product_info.big_picture} <a href="data/big/{$product_info.big_picture}" class="highslide" onclick="return hs.expand(this)"><img src="data/medium/{$product_info.thumbnail}" alt="{$product_info.name}" id="{$product_info.big_picture}"></a>{*
            <div class="fil"></div>
            <a href="data/big/{$product_info.big_picture}" onclick="return hs.expand(this,{literal}{{/literal}thumbnailId: '{$product_info.big_picture}'{literal}}{/literal})" class="cl9">{$smarty.const.ENLARGE_PICTURE}</a> *}
            {else} <img src="data/medium/{$product_info.thumbnail}" alt="{$product_info.name}"> {/if}
            {elseif $product_info.picture}
            {if $product_info.big_picture} <a href="data/big/{$product_info.big_picture}" class="highslide" onclick="return hs.expand(this)"><img src="data/small/{$product_info.picture}" alt="{$product_info.name}" id="{$product_info.big_picture}"></a>{*
            <div class="fil"></div>
            <a href="data/big/{$product_info.big_picture}" onclick="return hs.expand(this,{literal}{{/literal}thumbnailId: '{$product_info.big_picture}'{literal}}{/literal})" class="cl9">{$smarty.const.ENLARGE_PICTURE}</a> *}
            {else} <img src="data/small/{$product_info.picture}" alt="{$product_info.name}"> {/if}
            {else}
            {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1} <img src="data/empty.gif" alt="no photo"> {/if}
            {/if}
            {if $all_product_pictures}
            {section name=i loop=$all_product_pictures}
            <div class="fil"></div>
            {if $all_product_pictures[i].enlarged} <a href="data/big/{$all_product_pictures[i].enlarged}" class="highslide" onclick="return hs.expand(this)"><img src="data/small/{$all_product_pictures[i].filename}" alt="{$product_info.name}" id="{$all_product_pictures[i].enlarged}"></a>{*
            <div class="fil"></div>
            <a href="data/big/{$all_product_pictures[i].enlarged}" onclick="return hs.expand(this,{literal}{{/literal}thumbnailId: '{$all_product_pictures[i].enlarged}'{literal}}{/literal})" class="cl9">{$smarty.const.ENLARGE_PICTURE}</a> *}
            {else} <img src="data/small/{$all_product_pictures[i].filename}" alt="{$product_info.name}"> {/if}
            {/section}
            {/if} </td>
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
            {if $smarty.const.CONF_USE_RATING eq 1}
            {literal}
            <script type="text/javascript">
<!--
function votescript(val) {
document.getElementById('markvalue').value=val;
document.getElementById('VotingForm').submit();
}
//-->
</script>
            {/literal}
            <form name="VotingForm" action='index.php' method="GET" id="VotingForm" class="print">
              <table cellspacing="0" cellpadding="0">
                <tr>
                  <td valign="middle" align="left">{$smarty.const.STRING_PR_DOIT}:&nbsp;</td>
                  <td valign="middle" align="left"><ul class="unit-rating" style="width:100px;">
                      <li class="current-rating" style="width:100px;">&nbsp;</li>
                      <li><a href="#" onclick="votescript(1); return false;" title="{$smarty.const.STRING_PR_1}" class="r1-unit rater">{$smarty.const.STRING_PR_1}</a></li>
                      <li><a href="#" onclick="votescript(2); return false;" title="{$smarty.const.STRING_PR_2}" class="r2-unit rater">{$smarty.const.STRING_PR_2}</a></li>
                      <li><a href="#" onclick="votescript(3); return false;" title="{$smarty.const.STRING_PR_3}" class="r3-unit rater">{$smarty.const.STRING_PR_3}</a></li>
                      <li><a href="#" onclick="votescript(4); return false;" title="{$smarty.const.STRING_PR_4}" class="r4-unit rater">{$smarty.const.STRING_PR_4}</a></li>
                      <li><a href="#" onclick="votescript(5); return false;" title="{$smarty.const.STRING_PR_5}" class="r5-unit rater">{$smarty.const.STRING_PR_5}</a></li>
                    </ul></td>
                </tr>
              </table>
              <input type="hidden" name="productID" value="{$product_info.productID}">
              <input type="hidden" name="vote" value="yes">
              <input type="hidden" name="mark" value="" id="markvalue">
            </form>
            <div class="fil"></div>
            {/if}
            {if $product_info.eproduct_filename ne ""}{$smarty.const.PRODUCT_IS_DOWNLOADABLE} ({$product_info.eproduct_filesize})
            <div class="fil"></div>
            {/if}
            {assign var="otstup" value=0}
            {if $smarty.const.CONF_CHECKSTOCK == '1'}{$smarty.const.IN_STOCK}: <b>{if $product_info.in_stock > 0}<span class="oki">{if $smarty.const.CONF_EXACT_PRODUCT_BALANCE == '1'}{$product_info.in_stock}{else}{$smarty.const.ANSWER_YES}{/if}</span>{else}<span class="error">{if $product_info.in_stock < 0}{$smarty.const.STOCK_TRAIN_GO}{else}{$smarty.const.ANSWER_NO}{/if}</span>{/if}</b><br>
            {assign var="otstup" value=1}{/if}
            {if $currencies_count ne 0}
            {if $product_info.shipping_freightUC}{$smarty.const.ADMIN_SHIPPING_FREIGHT}: <b>{$product_info.shipping_freightUC}</b><br>
            {assign var="otstup" value=1}{/if}
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
            <form action="index.php?productID={$product_info.productID}" method=post name="MainForm">
              {counter name='select_counter' start=0 skip=1 print=false assign='select_counter_var'}
              {section name=i loop=$product_extra}
              {if $product_extra[i].option_type eq 0 }
              {$product_extra[i].name}: <b>{$product_extra[i].option_value}</b><br>
              {else}
              {counter name='option_show_times' start=0 skip=1 print=false}
              {section name=k loop=$product_extra[i].option_show_times}
              {$product_extra[i].name}{if $product_extra[i].option_show_times > 1 }
              ({counter name=option_show_times}):{else}:{/if}
              {counter name=select_counter}
              {if $product_extra[i].values_to_select_count == 1} <b>{$product_extra[i].values_to_select[0].option_value}</b><br>
              <input type="hidden" name="option_select_{$select_counter_var}" value='{$product_extra[i].values_to_select[0].price_surplus}:{$product_extra[i].values_to_select[0].variantID}'>
              {else}
              {if $smarty.section.k.index == 0}
              <select name='option_select_{$select_counter_var}' onchange='GetCurrentCurrency();' class="WCHhider">
                
                  {section name=j loop=$product_extra[i].values_to_select}
                  
                <option value='{$product_extra[i].values_to_select[j].price_surplus}:{$product_extra[i].values_to_select[j].variantID}' {if $product_extra[i].values_to_select[j].variantID eq $product_extra[i].variantID}selected{/if}>{$product_extra[i].values_to_select[j].option_value}</option>
                
                  {/section}
              </select>
              <br>
              {else}
              <select name='option_select_{$select_counter_var}' onchange='GetCurrentCurrency();' class="WCHhider">
                <option value='0:-1'>{$smarty.const.NOT_DEFINED}</option>
                
                  {section name=j loop=$product_extra[i].values_to_select}
                  
                <option value='{$product_extra[i].values_to_select[j].price_surplus}:{$product_extra[i].values_to_select[j].variantID}'>{$product_extra[i].values_to_select[j].option_value}</option>
                
                  {/section}
              </select>
              <br>
              {/if}
              {/if}
              {/section}
              {/if}
              {/section}
              {if $select_counter_var != 0}
              <input type=hidden value="{php}echo(getPriceUnit());{/php}" name="priceUnit">
              {/if}
            </form>
            {if $product_extra_count > 0}
            <div class="fil"></div>
            {/if}
            {if $select_counter_var != 0}
            {literal}
            <script type="text/javascript">
function GetCurrentCurrency()
{
{/literal}
_selectionCount={$select_counter_var};
 _sum = {$product_info.PriceWithOutUnit};
{counter name='select_counter2' start=1 skip=1 print=false assign='select_counter_var2'}
{section name=i loop=$product_extra}
{section name=k loop=$product_extra[i].option_show_times}
 _value =
document.MainForm.option_select_{$select_counter_var2}.value;
price_surplus = ( _value.split(":") )[0];
 _sum += new Number( price_surplus );
variantID = ( _value.split(":") )[1];
document.HiddenFieldsForm.option_select_hidden_{$select_counter_var2}.value = variantID;
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
echo("priceUnit='".getPriceUnit()."';\n");
{/php}
 _sumStr = _formatPrice( _sumStr, {$currency_roundval});
if ( locationPriceUnit )
document.getElementById('optionPrice').innerHTML = _sumStr + document.MainForm.priceUnit.value;
else
document.getElementById('optionPrice').innerHTML = document.MainForm.priceUnit.value + _sumStr;
{literal}
}
{/literal}
GetCurrentCurrency();
</script>
            {/if}
            {if $product_info.description}{$product_info.description}{elseif $product_info.brief_description}{$product_info.brief_description}{/if} </td>
          {if $smarty.const.CONF_DISPLAY_FOTO eq 0}
          <td class="imboxr"> {if $product_info.thumbnail}
            {if $product_info.big_picture} <a href="data/big/{$product_info.big_picture}" class="highslide" onclick="return hs.expand(this)"><img src="data/medium/{$product_info.thumbnail}" alt="{$product_info.name}" id="{$product_info.big_picture}"></a>{*
            <div class="fil"></div>
            <a href="data/big/{$product_info.big_picture}" onclick="return hs.expand(this,{literal}{{/literal}thumbnailId: '{$product_info.big_picture}'{literal}}{/literal})" class="cl9">{$smarty.const.ENLARGE_PICTURE}</a> *}
            {else} <img src="data/medium/{$product_info.thumbnail}" alt="{$product_info.name}"> {/if}
            {elseif $product_info.picture}
            {if $product_info.big_picture} <a href="data/big/{$product_info.big_picture}" class="highslide" onclick="return hs.expand(this)"><img src="data/small/{$product_info.picture}" alt="{$product_info.name}" id="{$product_info.big_picture}"></a>{*
            <div class="fil"></div>
            <a href="data/big/{$product_info.big_picture}" onclick="return hs.expand(this,{literal}{{/literal}thumbnailId: '{$product_info.big_picture}'{literal}}{/literal})" class="cl9">{$smarty.const.ENLARGE_PICTURE}</a> *}
            {else} <img src="data/small/{$product_info.picture}" alt="{$product_info.name}"> {/if}
            {else}
            {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1} <img src="data/empty.gif" alt="no photo"> {/if}
            {/if}
            {if $all_product_pictures}
            {section name=i loop=$all_product_pictures}
            <div class="fil"></div>
            {if $all_product_pictures[i].enlarged} <a href="data/big/{$all_product_pictures[i].enlarged}" class="highslide" onclick="return hs.expand(this)"><img src="data/small/{$all_product_pictures[i].filename}" alt="{$product_info.name}" id="{$all_product_pictures[i].enlarged}"></a>{*
            <div class="fil"></div>
            <a href="data/big/{$all_product_pictures[i].enlarged}" onclick="return hs.expand(this,{literal}{{/literal}thumbnailId: '{$all_product_pictures[i].enlarged}'{literal}}{/literal})" class="cl9">{$smarty.const.ENLARGE_PICTURE}</a> *}
            {else} <img src="data/small/{$all_product_pictures[i].filename}" alt="{$product_info.name}"> {/if}
            {/section}
            {/if} </td>
          {/if} </tr>
      </table></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%" class="print">
  <tr>
    <td align="left" valign="top">
	  {if $product_related_number > 0}
      {include file="header.tpl" header=$smarty.const.STRING_RELATED_ITEMS}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbtop" align="left">
            {section name=i loop=$product_related}
            {if $smarty.section.i.index ne 0}
            <div class="fil1"></div>
            {/if}
            <table cellspacing="0" cellpadding="0">
              <tr>
                <td align="left"><a href="{$product_related[i]|@fu_make_url}">{$product_related[i].name}</a></td>
                <td align="left" class="price">&nbsp;&nbsp;&nbsp;{$product_related[i].Price}</td>
              </tr>
            </table>
            {/section} </td>
        </tr>
      </table>
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbot">&nbsp;</td>
        </tr>
      </table>
      {/if}
      
      {if $smarty.const.CONF_PRODUCT_MAIL eq 1} <a name="inquiry"></a> {include file="header.tpl" header=$smarty.const.STRING_FEEDBACK_PRODUCT_HEADER}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="cbt" align="left">{$smarty.const.STRING_FEEDBACK_PRODUCT_DESCRIPTION}</td>
        </tr>
      </table>
      {if $sent eq NULL}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbtop" align="left" valign="top"> {if $error ne NULL}
            <table cellspacing="0" cellpadding="0" width="100%">
              <tr>
                <td class="error cattop" align="center">{if $error eq 7}{$smarty.const.ERR_WRONG_CCODE}{else}{$smarty.const.FEEDBACK_ERROR_FILL_IN_FORM}{/if}</td>
              </tr>
            </table>
            {/if}
            <form name="form1post" id="form1post" method="post" action="index.php#inquiry">
              <table cellspacing="0" cellpadding="0" align="left">
                <tr>
                  <td align="left">{$smarty.const.FEEDBACK_CUSTOMER_NAME}</td>
                </tr>
                <tr>
                  <td style="height: 2px;"></td>
                </tr>
                <tr>
                  <td align="left"><input name="customer_name" type="text" style="width: 220px;" value="{$customer_name|replace:"\"":"&quot;"}"></td>
                </tr>
                <tr>
                  <td style="height: 6px;"></td>
                </tr>
                <tr>
                  <td align="left">{$smarty.const.CUSTOMER_EMAIL}</td>
                </tr>
                <tr>
                  <td style="height: 2px;"></td>
                </tr>
                <tr>
                  <td align="left"><input name="customer_email" type="text" style="width: 220px;" value="{$customer_email|replace:"\"":"&quot;"}"></td>
                </tr>
                <tr>
                  <td style="height: 6px;"></td>
                </tr>
                <tr>
                  <td align="left">{$smarty.const.STRING_FEEDBACK_PRODUCT_INQUIRY_EXPLANATION}</td>
                </tr>
                <tr>
                  <td style="height: 2px;"></td>
                </tr>
                <tr>
                  <td align="left"><input name="message_subject" type="hidden" value="{$product_info.name|replace:"\"":"&quot;"}">
                    <textarea name="message_text" style="width: 360px; height: 100px;">{$message_text|replace:"<":"&lt;"}</textarea>
                    <input type="hidden" name="request_information" value="yes">
                    <input type="hidden" name="productID" value="{$product_info.productID}"></td>
                </tr>
                {if $smarty.const.CONF_ENABLE_CONFIRMATION_CODE eq 1}
                <tr>
                  <td style="height: 6px;"></td>
                </tr>
                <tr>
                  <td align="left"><img src="index.php?do=captcha&amp;{php}echo session_name();{/php}={php}echo session_id();{/php}" alt="code"></td>
                </tr>
                <tr>
                  <td style="height: 2px;"></td>
                </tr>
                <tr>
                  <td align="left"><input name="fConfirmationCode" value="{$smarty.const.STR_ENTER_CCODE}" type="text" style="width: 220px; color: #aaaaaa;" onfocus="if(this.value=='{$smarty.const.STR_ENTER_CCODE}')
                        {literal}
                        {this.style.color='#000000';this.value='';}
                        {/literal}" onblur="if(this.value=='')
                        {literal}{{/literal}this.style.color='#aaaaaa';this.value='{$smarty.const.STR_ENTER_CCODE}'{literal}}{/literal}"></td>
                </tr>
                {/if}
              </table>
            </form></td>
        </tr>
      </table>
      <div class="fil"></div>
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbot"><a href="#" onclick="document.getElementById('form1post').submit(); return false">{$smarty.const.OK_BUTTON3}</a></td>
        </tr>
      </table>
      {else}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="oki cattop" align="center">{$smarty.const.FEEDBACK_SENT_SUCCESSFULLY}</td>
        </tr>
      </table>
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbot">&nbsp;</td>
        </tr>
      </table>
      {/if}
      {/if}
      
      {if $productslinkscat}
      {include file="header.tpl" header=$smarty.const.STRING_CAT_USE_AUX}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbtop" align="left" valign="top">
            {section name=iprod loop=$productslinkscat}
            {if $smarty.section.iprod.index ne 0}
            <div class="fil1"></div>
            {/if}<a href="{if $smarty.const.CONF_MOD_REWRITE eq 1}page_{$productslinkscat[iprod][0]}.html{else}index.php?show_aux_page={$productslinkscat[iprod][0]}{/if}">{$productslinkscat[iprod][1]}</a> {/section} </td>
        </tr>
      </table>
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbot">&nbsp;</td>
        </tr>
      </table>
      {/if}
      {/if} </td>
  </tr>
</table>