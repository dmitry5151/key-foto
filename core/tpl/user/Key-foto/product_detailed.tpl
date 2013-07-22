{* шаблон детального описания товара *}
{assign var=baseurl value="http://`$smarty.const.CONF_SHOP_URL`/"}
{literal}
<script type="text/javascript">
    $(function() {
        $.fn.__tabs = $.fn.tabs;
        $.fn.tabs = function (a, b, c, d, e, f) {
                var base = location.href.replace(/#.*$/, '');
                $('ul>li>a[href^="#"]', this).each(function () {
                        var href = $(this).attr('href');
                        $(this).attr('href', base + href);
                });
                $(this).__tabs(a, b, c, d, e, f);
        };    
        //$('base').attr('href', '');
        $( "#tabs" ).tabs();
        //$('base').attr('href', 'http://{/literal}{$smarty.const.CONF_SHOP_URL|@fu_punycode_encode}{literal}/');
    });
</script>
{/literal}
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
{* Для эффекта затемнения всей страницы при развертывании большого фото раскомментируйте этот блок кода
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
{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?productID=`$product_info.productID`&amp;eaction=prod' title='`$smarty.const.STRING_EDITPR`' style='float: left;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$product_info.name`}{else}{assign var="postheader" value=$product_info.name}{/if}
<article class="dwa-post dwa-article">
<table cellspacing="0" cellpadding="0" width="100%" class="navigator">
  <tr>
    <td align="left">{if $smarty.const.CONF_USE_DISCUSS eq 1}<span style="float: right;"><a href="index.php?productID={$product_info.productID}&amp;discuss=yes">{$smarty.const.DISCUSS_ITEM_LINK}</a> ({$product_reviews_count} {$smarty.const.POSTS_FOR_ITEM_STRING})</span>{/if}<a href="{$smarty.const.CONF_FULL_SHOP_URL}">{$smarty.const.LINK_TO_HOMEPAGE}</a>{section name=i loop=$product_category_path}{if $product_category_path[i].categoryID != 1} / <a href="{$product_category_path[i]|@fu_make_url}">{$product_category_path[i].name}</a>{/if}{/section}</td>
  </tr>
</table>
</article>
<article class="dwa-post dwa-article">
    <table cellspacing="0" cellpadding="2" width="100%">
        <tr>
            <td>
            <h1 class="dwa-postheader" style="font-size:16px"><img src='data/Key-foto/images/icon-photo.png' style="vertical-align: middle; border: none; margin-bottom: 10px" />
            {if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
            {if $product_info.product_code}
            {$product_info.product_code}
            {/if}
            {/if}
            &nbsp;-&nbsp;{$postheader}</h1>
            </td>
            <td width="300" align="right" style="text-align: right; vertical-align: middle; padding: 0">
                <div style="border-radius:10px; background: #ddd; width: 100%; height: 60px;">
                    <table cellspacing="0" cellpadding="0" width="100%" height="100%"><tr>
                        {* Цена *}
                        <td width="150" style="text-align: center; vertical-align: middle" id="optionPrice" class="price">
                            {if $currencies_count ne 0}{if $product_info.Price <= 0}<strong>{$smarty.const.STRING_NOPRODUCT_IN}</strong>{else}<strong>{$product_info.PriceWithUnit}</strong>{/if}{/if}
                            {if $currencies_count ne 0}{if $product_info.list_price > 0 && $product_info.list_price > $product_info.Price && $product_info.Price > 0}
                                <font style="font-size:10px; color:#FF6600; text-decoration:line-through;">&nbsp;{$product_info.list_priceWithUnit}</font>
                            {/if}{/if}   
                        </td>
                        <td width="150" style="text-align: right; vertical-align: middle">
                            <form action="index.php?productID={$product_info.productID}" method=post name="HiddenFieldsForm" id="DetailCartForm" class="box">
                                {if $smarty.const.CONF_SHOW_ADD2CART eq 1 && ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
                                <input type={if $smarty.const.CONF_MULTYCART==0}hidden{else}text{/if} value="1" name="multyaddcount" {if $smarty.const.CONF_MULTYCART==1}size="2" style="margin-right: 4px; width: 16px;"{/if}>
                                <a class="mega-button" href="#" onclick="doLoad('do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_extra}{if $product_extra[i].option_type eq 1}{section name=s loop=$product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm.option_select_hidden_{counter name=select_counter_hidden_extra}.value+'{/section}{/if}{/section}&amp;xcart=yes&amp;multyaddcount='+document.HiddenFieldsForm.multyaddcount.value+''); return false">{$smarty.const.ADD_TO_CART_STRING}<img src="data/Key-foto/images/megabutton_cart.png" style="border:none" /></a>
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
                        </td>
                        </tr></table>
                </div>
            </td>
        </tr>
    </table>
    
    <div class="dwa-postcontent dwa-postcontent clearfix"><!-- Основной центральный блок -->
        <div class="dwa-content-layout"><!-- Автономный текстовый блок -->
            <div class="dwa-content-layout-row">
            <div class="dwa-layout-cell layout-item" style="width: 100%" >

			</div>
            </div>
        </div>
        <div class="fil2"></div>
        
{*--------------------------------------------------------------------- Вывод основной информации о товаре ---------------------------------------------------*}        

        {* --------------------------------------------------------- Характеристики и картинка ------------------------------------------------------------------*}
<div class="dwa-content-layout">
    <div class="dwa-content-layout-row">
        {if $smarty.const.CONF_DISPLAY_FOTO eq 1}
        {* Картинка слева *}
        <div class="dwa-layout-cell layout-item" style="width: 400px; text-align: center" >
            {if $product_info.thumbnail}    
            {if $product_info.big_picture}<a href="data/big/{$product_info.big_picture}" class="highslide" onclick="return hs.expand(this)"><img src="data/medium/{$product_info.thumbnail}" alt="{$product_info.name}" id="{$product_info.big_picture}" style="margin:0px" /></a>
            {else} <img src="data/medium/{$product_info.thumbnail}" alt="{$product_info.name}" style="margin:0px" />
            {/if}
            {elseif $product_info.picture}
                {if $product_info.big_picture}<a href="data/big/{$product_info.big_picture}" class="highslide" onclick="return hs.expand(this)"><img src="data/small/{$product_info.picture}" alt="{$product_info.name}" id="{$product_info.big_picture}" style="margin:0px" /></a>
                {else} <img src="data/small/{$product_info.picture}" alt="{$product_info.name}" style="margin:0px" />
                {/if}
            {else}
                {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}<img src="data/empty.gif" alt="no photo" style="margin:0" />
                {/if}
            {/if}
        </div>
        {/if}
        <div class="dwa-layout-cell layout-item" style="width: 100%" >
            {* Характеристики товара *}
            <div id="tabs" style="background: none">
                <ul>
                        <li><a href="#tabs-1">Характеристики</a></li>
                        <li><a href="#tabs-2">Описание</a></li>
                </ul>
                <div id="tabs-1">
                    {* Новый вывод таблицы характеристик *}
                    <table cellspacing="0" cellpadding="5" width="100%" class="zebra">
                        <caption style="font-size:12px; text-align: left">Характеристики фотографии</caption>
                        <thead>
                            <tr>
                                <th>Лицензия</th>
                                <th>Стоимость</th>
                                <th>Выбор</th>
                            </tr>
                        </thead>
                        <tbody>
                            
                                <form action="index.php?productID={$product_info.productID}" method=post name="MainForm">
                              {counter name='select_counter' start=0 skip=1 print=false assign='select_counter_var'}

                              {section name=i loop=$product_extra}
                                  {if $product_extra[i].option_type ne 0 }                                   
                                  {counter name='option_show_times' start=0 skip=1 print=false}
                                  {section name=k loop=$product_extra[i].option_show_times}
                                        <!--td>{$product_extra[i].name}{if $product_extra[i].option_show_times > 1 } ({counter name=option_show_times}):{else}:{/if}</td-->
                                      {counter name=select_counter}
                                      {if $product_extra[i].values_to_select_count != 1}
                                          {if $smarty.section.k.index == 0}
                                                {*<div name='option_select_{$select_counter_var}' onchange='GetCurrentCurrency();' class="WCHhider">*}
                                                {section name=j loop=$product_extra[i].values_to_select}
                                                <tr>
                                                    <td>{$product_extra[i].values_to_select[j].option_value}</td>
                                                    {assign var=price value=$product_info.PriceWithOutUnit+$product_extra[i].values_to_select[j].price_surplus}
                                                    <td style="text-align: center" class="base-price">{$price}</td>
                                                    <td style="text-align: center"><input type="radio" name="license"  value='{$product_extra[i].values_to_select[j].price_surplus}:{$product_extra[i].values_to_select[j].variantID}' {if $product_extra[i].values_to_select[j].variantID eq $product_extra[i].variantID}checked{/if} /></td>
                                                </tr>
                                                {/section}
                                                
                                          {else}
                                                
                                                  <select name='option_select_{$select_counter_var}' onchange='GetCurrentCurrency();' class="WCHhider">
                                                    <option value='0:-1'>{$smarty.const.NOT_DEFINED}</option>

                                                      {section name=j loop=$product_extra[i].values_to_select}

                                                    <option value='{$product_extra[i].values_to_select[j].price_surplus}:{$product_extra[i].values_to_select[j].variantID}'>{$product_extra[i].values_to_select[j].option_value}</option>

                                                      {/section}
                                                  </select>
                                                
                                          {/if}
                                      {/if}
                                      
                                  {/section}
                                  {/if}
                              {/section}
                            </form>
                            {if $select_counter_var != 0}
                            {literal}
                <script type="text/javascript">
                    $(function(){
                        var license = 0;
                        $('input[name=license]').click(function(){
                            license = $('input[name=license]:checked').val();
                            //alert(license);
                            GetCurrentCurrency();
                        });                        
                    });
                    function GetCurrentCurrency()
                    {
                    {/literal}
                    _selectionCount={$select_counter_var};
                    _sum = {$product_info.PriceWithOutUnit};
                    {counter name='select_counter2' start=1 skip=1 print=false assign='select_counter_var2'}
                    {section name=i loop=$product_extra}
                    {section name=k loop=$product_extra[i].option_show_times}
                    //_value = document.MainForm.option_select_{$select_counter_var2}.value;
                    _value = $('input[name=license]:checked').val();                    
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
                    {literal}
                        //alert('Тест');
                    if ( locationPriceUnit ) {
                        document.getElementById('optionPrice').innerHTML = _sumStr + priceUnit;// + document.MainForm.priceUnit.value;
                    //$('#optionPrice').val() = _sumStr + priceUnit;
                    }                    
                    else {
                        document.getElementById('optionPrice').innerHTML = priceUnit + _sumStr;
                        //alert('Второе условие');
                    }
                    }
                    {/literal}
                    GetCurrentCurrency();
                </script>
                            {/if}    
                        </tbody>
                    </table>
                    </div>
                    <div id="tabs-2">
                        {$product_info.description}
                    </div>
            </div>
        </div>
        {if $smarty.const.CONF_DISPLAY_FOTO eq 0}
        {* Картинка справа *}
        <div class="dwa-layout-cell layout-item" style="width: 400px" >
            {if $product_info.thumbnail} 
            <td valign="top" width="300" align="right" style="border: rgba(150, 150, 200, 0.65)">   
                {if $product_info.big_picture}<a href="data/big/{$product_info.big_picture}" class="highslide" onclick="return hs.expand(this)"><img src="data/medium/{$product_info.thumbnail}" alt="{$product_info.name}" id="{$product_info.big_picture}" style="margin:5px" width="280" /></a>
                {else} <img src="data/medium/{$product_info.thumbnail}" alt="{$product_info.name}" style="margin:5px" width="280" />
                {/if}
            {elseif $product_info.picture}
            <td valign="top" width="300" align="right" style="border: 1px solid #CCC">
                {if $product_info.big_picture}<a href="data/big/{$product_info.big_picture}" class="highslide" onclick="return hs.expand(this)"><img src="data/small/{$product_info.picture}" alt="{$product_info.name}" id="{$product_info.big_picture}" style="margin:5px" width="280" /></a>
                {else} <img src="data/small/{$product_info.picture}" alt="{$product_info.name}" style="margin:5px" width="280" />
                {/if}
            {else}
            <td valign="middle" width="300" align="center" style="padding: 3px; border: 1px solid rgba(150, 150, 200, 0.65); background: #FFFFFF; text-align: center">
                {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}<img src="data/empty.gif" alt="no photo" style="margin:0" />
                {/if}
            {/if}
        </div>
        {/if}
    </div>
</div> 

{* --------------------------------------------------------------------- Спецпредложения, комментарии и др. ------------------------------------------------- *}
<div class="dwa-content-layout">
            <div class="dwa-content-layout-row">
            <div class="dwa-layout-cell layout-item-0" style="width: 100%" >
<div class="fil"></div>
<table cellspacing="0" cellpadding="0" width="100%" class="print">
  <tr>
    <td align="left" valign="top" style="padding:0">
    {* Рекомендуемые товары *}	  
      {if $product_related_number > 0}
      <!-- Новый вариант вывода рекомендуемых товаров -->
      <div class="dwa-blockheader">
      	<h3 class="t">{$smarty.const.STRING_RELATED_ITEMS}</h3>
      </div>
        <table cellspacing="10" cellpadding="10"><tr>
        {section name=i loop=$product_related max=5}
            <td align="center" width="75">
            <a href="{$product_related[i]|@fu_make_url}"><img src="/data/small/{$product_related[i].filename}" height="75" /></a><br />
            <a href="{$product_related[i]|@fu_make_url}">{$product_related[i].name}</a><br />
            <span class="price">{$product_related[i].Price}</span>
            </td>
        {/section}
        </tr></table>
        {/if}
      {* Вопросы по товару *}
      {if $smarty.const.CONF_PRODUCT_MAIL eq 1} {*include file="header.tpl" header=$smarty.const.STRING_FEEDBACK_PRODUCT_HEADER*}
      <h2>{$smarty.const.STRING_FEEDBACK_PRODUCT_HEADER}</h2>
      <h5>{$smarty.const.STRING_FEEDBACK_PRODUCT_DESCRIPTION}</h5>
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
            <form name="form1post" id="form1post" method="post" action="index.php#inquiry" class="box">
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
                  <td align="left"><input name="fConfirmationCode" value="{$smarty.const.STR_ENTER_CCODE}" type="text" style="width: 250px; color: #aaaaaa;" onfocus="if(this.value=='{$smarty.const.STR_ENTER_CCODE}')
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
          <td class="hdbot"><a class="dwa-button" href="#" onclick="document.getElementById('form1post').submit(); return false">{$smarty.const.OK_BUTTON3}</a></td>
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
      {* /// Вопросы по товару *}
      
      {* Рекомендуемые товары/статьи *}
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
			</div>
            </div>
        </div>
    </div>
</article>