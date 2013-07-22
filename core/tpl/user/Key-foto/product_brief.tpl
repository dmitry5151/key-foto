{* шаблон короткого описния товара *}

<div class="foto">
    <div class="foto-container">
    {if $product_info.picture}<!-- Картинка -->                
        <a href="{$product_info|@fu_make_url}"><img src="data/small/{$product_info.picture}" alt="{$product_info.name}" tip="{include file="tooltip.tpl"}"></a>
        {else}
            {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}
            <a href="{$product_info|@fu_make_url}"><img src="data/empty.gif" alt="no photo"></a>
            {/if}
        {/if}
    </div>
</div>
<div class="desc">
    <table width="100%"><tr>
    {*if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
        <td width="35%"><!-- Код, если есть -->
        {if $product_info.product_code}<span style="font-size: 11px; font-style: italic; height: 25px; vertical-align: middle; display: table-cell;">{$product_info.product_code}</span>{/if}        
        </td>
    {/if*}
    <td width="35%" style="font-size: 11px; vertical-align: middle; display: table-cell; height: 24px" id="optionPrice_{$product_info.productID}">{if $currencies_count ne 0}{if $product_info.Price <= 0}{$smarty.const.STRING_NOPRODUCT_IN}{else}{$product_info.PriceWithUnit}{/if}{/if}</td>
    {* Выбор лицензии *}
    <td width="30%">
        <form action="index.php?productID={$product_info.productID}" method=post name="MainForm1_{$product_info.productID}">
        {counter name='select_counter' start=0 skip=1 print=false assign='select_counter_var'}
        {section name=i loop=$product_info.product_extra}
            {section name=k loop=$product_info.product_extra[i].option_show_times}
                {counter name=select_counter}
                {if $product_info.product_extra[i].values_to_select_count == 1} {$product_info.product_extra[i].values_to_select[0].option_value}; &nbsp;
              <input type="hidden" name="option_select_{$select_counter_var}_{$product_info.productID}" value='{$product_info.product_extra[i].values_to_select[0].price_surplus}:{$product_info.product_extra[i].values_to_select[0].variantID}'>
                {else}
                    {if $smarty.section.k.index == 0}
                        <span style="vertical-align: middle; display: table-cell; height: 24px">
                    <select style="width:75px" name='option_select_{$select_counter_var}_{$product_info.productID}' onchange='GetCurrentCurrency_{$product_info.productID}();' class="WCHhider brief-select">

      {section name=j loop=$product_info.product_extra[i].values_to_select}

                      <option value='{$product_info.product_extra[i].values_to_select[j].price_surplus}:{$product_info.product_extra[i].values_to_select[j].variantID}' {if $product_info.product_extra[i].values_to_select[j].variantID eq $product_info.product_extra[i].variantID}selected{/if}>{$product_info.product_extra[i].values_to_select[j].option_value}</option>

      {/section}

                    </select>
                    {else}
                    <select style="width:75px" name='option_select_{$select_counter_var}_{$product_info.productID}' onchange='GetCurrentCurrency_{$product_info.productID}();' class="WCHhider brief-select">
                      <option value='0:-1'>{$smarty.const.NOT_DEFINED}</option>

      {section name=j loop=$product_info.product_extra[i].values_to_select}

                      <option value='{$product_info.product_extra[i].values_to_select[j].price_surplus}:{$product_info.product_extra[i].values_to_select[j].variantID}'>{$product_info.product_extra[i].values_to_select[j].option_value}</option>

      {/section}

                    </select>
                    {/if} 
                    </span>
                {/if}
            {/section}
        {/section}
        </form>
    </td>
    <td style="text-align: right">
        {* Кнопка добавления в корзину *}        
        {if $smarty.const.CONF_SHOW_ADD2CART eq 1 && ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
        <form action="index.php?categoryID={$product_info.categoryID}&amp;prdID={$product_info.productID}" method=post name="HiddenFieldsForm_{$product_info.productID}" id="HiddenFieldsForm_{$product_info.productID}">
        <a href="#" onclick="doLoad('do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_info.product_extra}{if $product_info.product_extra[i].option_type eq 1}{section name=s loop=$product_info.product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm_{$product_info.productID}.option_select_hidden_{counter name=select_counter_hidden_extra}_{$product_info.productID}.value+'{/section}{/if}{/section}&amp;xcart=yes&amp;multyaddcount='+document.HiddenFieldsForm_{$product_info.productID}.multyaddcount.value+''); return false"><img src="data/{$smarty.const.TPL}/crt.gif" alt=""></a>
        <input type={if $smarty.const.CONF_MULTYCART==0}hidden{else}text{/if} value="1" name="multyaddcount" {if $smarty.const.CONF_MULTYCART==1}size="2" style="margin-right: 4px; width: 16px;"{/if}>
        {counter name='select_counter_hidden' start=0 skip=1 print=false}
        {section name=i loop=$product_info.product_extra}
        {if $product_info.product_extra[i].option_type eq 1}
        {section name=s loop=$product_info.product_extra[i].option_show_times}
        <input type=hidden name='option_select_hidden_{counter name=select_counter_hidden}_{$product_info.productID}' value='1'>
        {/section}
        {/if}
        {/section}
        </form>
        {/if}
    </td>
    </tr></table>
    {if $select_counter_var != 0}
        <form action="index.php?productID={$product_info.productID}" method=post name="MainForm2_{$product_info.productID}">
          <input type=hidden value="{php}echo(getPriceUnit());{/php}" name="priceUnit_{$product_info.productID}">
        </form>
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
</div>