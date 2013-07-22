{* шаблон короткого описания товара *}

<td>
{if $isadmin eq "yes"}<a href='{$smarty.const.ADMIN_FILE}?productID={$product_info.productID}&amp;eaction=prod' title='{$smarty.const.STRING_EDITPR}' style="text-decoration:none;">+</a>{/if}
  <a href="{$product_info|@fu_make_url}">{$product_info.name}</a>
</td>
{if $smarty.const.CONF_CHECKSTOCK == '1'}
<td>
  <b>{if $product_info.in_stock > 0}<span class="oki">{if $smarty.const.CONF_EXACT_PRODUCT_BALANCE == '1'}{$product_info.in_stock}{else}{$smarty.const.ANSWER_YES}{/if}</span>{else}<span class="error">{if $product_info.in_stock < 0}{$smarty.const.STOCK_TRAIN_GO}{else}{$smarty.const.ANSWER_NO}{/if}</span>{/if}</b>
</td>
{/if}
{if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
<td>
  {if $product_info.product_code}<b>{$product_info.product_code}</b>{/if}
</td>
{/if}
<td class="price">
  {if $currencies_count ne 0}{if $product_info.Price <= 0}{$smarty.const.STRING_NOPRODUCT_IN}{else}{$product_info.PriceWithUnit}{/if}{/if}
</td>
<td>
  <form action="index.php?categoryID={$product_info.categoryID}&amp;prdID={$product_info.productID}" method=post name="HiddenFieldsForm_{$product_info.productID}" id="HiddenFieldsForm_{$product_info.productID}">
    <input type={if $smarty.const.CONF_MULTYCART==0}hidden{else}text{/if} value="1" name="multyaddcount" {if $smarty.const.CONF_MULTYCART==1}size="2" style="margin-right: 4px; width: 16px;"{/if}>
    {if $smarty.const.CONF_OPEN_SHOPPING_CART_IN_NEW_WINDOW eq 1}
    {if $smarty.const.CONF_SHOW_ADD2CART eq 1 && ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
        <a href="#" onclick="open_window('index.php?do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_info.product_extra}{if $product_info.product_extra[i].option_type eq 1}{section name=s loop=$product_info.product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm_{$product_info.productID}.option_select_hidden_{counter name=select_counter_hidden_extra}_{$product_info.productID}.value+'{/section}{/if}{/section}&amp;multyaddcount='+document.HiddenFieldsForm_{$product_info.productID}.multyaddcount.value+'',550,300); return false"><img src="data/{$smarty.const.TPL}/crt.gif" alt=""></a>
        <a href="#" onclick="open_window('index.php?do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_info.product_extra}{if $product_info.product_extra[i].option_type eq 1}{section name=s loop=$product_info.product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm_{$product_info.productID}.option_select_hidden_{counter name=select_counter_hidden_extra}_{$product_info.productID}.value+'{/section}{/if}{/section}&amp;multyaddcount='+document.HiddenFieldsForm_{$product_info.productID}.multyaddcount.value+'',550,300); return false">{$smarty.const.ADD_TO_CART_STRING}</a>
    {/if}
    {else}
    {if $smarty.const.CONF_CART_METHOD eq 2}
    {if $smarty.const.CONF_SHOW_ADD2CART eq 1 && ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
        <a href="#" onclick="doLoad('do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_info.product_extra}{if $product_info.product_extra[i].option_type eq 1}{section name=s loop=$product_info.product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm_{$product_info.productID}.option_select_hidden_{counter name=select_counter_hidden_extra}_{$product_info.productID}.value+'{/section}{/if}{/section}&amp;xcart=yes&amp;multyaddcount='+document.HiddenFieldsForm_{$product_info.productID}.multyaddcount.value+''); return false"><img src="data/{$smarty.const.TPL}/crt.gif" alt=""></a>
        <a href="#" onclick="doLoad('do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_info.product_extra}{if $product_info.product_extra[i].option_type eq 1}{section name=s loop=$product_info.product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm_{$product_info.productID}.option_select_hidden_{counter name=select_counter_hidden_extra}_{$product_info.productID}.value+'{/section}{/if}{/section}&amp;xcart=yes&amp;multyaddcount='+document.HiddenFieldsForm_{$product_info.productID}.multyaddcount.value+''); return false">{$smarty.const.ADD_TO_CART_STRING}</a>
    {/if}
    {else}
    {if $smarty.const.CONF_SHOW_ADD2CART eq 1 && ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
        <input type="hidden" name="cart_{$product_info.productID}_x" value="{$product_info.productID}">
        <a href="#" onclick="document.getElementById('HiddenFieldsForm_{$product_info.productID}').submit(); return false"><img src="data/{$smarty.const.TPL}/crt.gif" alt=""></a>
        <a href="#" onclick="document.getElementById('HiddenFieldsForm_{$product_info.productID}').submit(); return false">{$smarty.const.ADD_TO_CART_STRING}</a>
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
    {if $product_info.allow_products_comparison}
        <a href="#" onclick="doLoadcpr('do=compare&amp;cpradd={$product_info.productID}'); return false"><img src="data/{$smarty.const.TPL}/explorer.gif" alt=""></a>
        <a href="#" onclick="doLoadcpr('do=compare&amp;cpradd={$product_info.productID}'); return false">{$smarty.const.ADD_TO_CFOLDER}</a>
    {/if}
  </form>
</td>

