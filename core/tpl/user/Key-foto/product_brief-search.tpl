{* шаблон короткого описания товара *}

{section name=i loop=$product_info.product_extra}
	{if $product_info.product_extra[i].option_type eq 0 }
        {if $product_info.product_extra[i].name == "Производитель"}{assign var="proizv" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "Двигатель"}{assign var="tipdvig" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "Количество фаз"}{assign var="faz" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "Способ пуска"}{assign var="pusk" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "Модель двигателя"}{assign var="mod_dvig" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "Выходное напряжение, В"}{assign var="v_vih" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "Максимальная производительность (л/мин)"}{assign var="lmin" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "Диаметр патрубков, вх/вых (мм)"}{assign var="patr" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "Тип перекачиваемой воды"}{assign var="tipvod" value=$product_info.product_extra[i].option_value}{/if}
    {else}    	
        {if $product_info.product_extra[i].name == "Производитель"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="proizv" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="proizv" value="ошибка"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "Двигатель"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="tipdvig" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="tipdvig" value="ошибка"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "Количество фаз"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="faz" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="faz" value="ошибка"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "Способ пуска"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="pusk" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="pusk" value="ошибка"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "Модель двигателя"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="mod_dvig" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="mod_dvig" value="ошибка"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "Выходное напряжение, В"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="v_vih" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="v_vih" value="ошибка"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "Максимальная производительность (л/мин)"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="lmin" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="lmin" value="ошибка"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "Диаметр патрубков, вх/вых (мм)"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="patr" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="patr" value="ошибка"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "Тип перекачиваемой воды"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="tipvod" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="tipvod" value="ошибка"}
            {/if}
        {/if}
    {/if}
{/section}

{if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
<td class="center"><!-- Код, если есть -->
  {if $product_info.product_code}<b>{$product_info.product_code}</b>{/if}
</td>
{/if}
{if $product_info.picture}<!-- Картинка -->
<td><a href="{$product_info|@fu_make_url}"><img src="data/small/{$product_info.picture}" alt="{$product_info.name}" width="50"></a></td>
{else}
    {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}
    <td class="imboxl"><a href="{$product_info|@fu_make_url}"><img src="data/empty.gif" alt="no photo" width="50"></a></td>
    {/if}
{/if}
<td><!-- Название -->
{if $isadmin eq "yes"}<a href='{$smarty.const.ADMIN_FILE}?productID={$product_info.productID}&amp;eaction=prod' title='{$smarty.const.STRING_EDITPR}' style="text-decoration:none;">+</a>{/if}
  <strong><a href="{$product_info|@fu_make_url}">{$product_info.name}</a></strong>
</td>
<td class="center"><!-- Мощность -->
<strong>{$product_info.Productivity} л/мин</strong>
{*<ul>
{foreach from=$product_info.product_weight key=k item=v}
    <li>{$k}: {$v}</li>
{/foreach}
</ul>*}
</td>
<td class="center"><!-- Характеристики -->
{if $patr != ""}&Oslash; патрубка&nbsp;<b>{$patr}</b><br />{/if}
{if $tipvod != ""}{$tipvod}<br />{/if}
{if $tipdvig != ""}{$tipdvig}{/if}
</td>
<td class="center price" nowrap="nowrap"><!-- Цена -->
  {if $currencies_count ne 0}{if $product_info.Price <= 0}{$smarty.const.STRING_NOPRODUCT_IN}{else}{$product_info.PriceWithUnit}{/if}{/if}
</td>
<td nowrap="nowrap" class="center"><!-- Заказ + сравнение -->
  <form action="index.php?categoryID={$product_info.categoryID}&amp;prdID={$product_info.productID}" method=post name="HiddenFieldsForm_{$product_info.productID}" id="HiddenFieldsForm_{$product_info.productID}">
    <input type={if $smarty.const.CONF_MULTYCART==0}hidden{else}text{/if} value="1" name="multyaddcount" {if $smarty.const.CONF_MULTYCART==1}size="2" style="margin-right: 4px; width: 16px;"{/if}>
    {if $smarty.const.CONF_OPEN_SHOPPING_CART_IN_NEW_WINDOW eq 1}
    {if $smarty.const.CONF_SHOW_ADD2CART eq 1 && ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
        <a class="dwa-button" href="#" onclick="open_window('index.php?do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_info.product_extra}{if $product_info.product_extra[i].option_type eq 1}{section name=s loop=$product_info.product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm_{$product_info.productID}.option_select_hidden_{counter name=select_counter_hidden_extra}_{$product_info.productID}.value+'{/section}{/if}{/section}&amp;multyaddcount='+document.HiddenFieldsForm_{$product_info.productID}.multyaddcount.value+'',550,300); return false">{$smarty.const.ADD_TO_CART_STRING}</a>
    {/if}
    {else}
    {if $smarty.const.CONF_CART_METHOD eq 2}
    {if $smarty.const.CONF_SHOW_ADD2CART eq 1 && ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
        <a class="dwa-button" href="#" onclick="doLoad('do=cart&amp;addproduct={$product_info.productID}{counter name='select_counter_hidden' start=0 skip=1 print=false}{counter name='select_counter_hidden_extra' start=0 skip=1 print=false}{section name=i loop=$product_info.product_extra}{if $product_info.product_extra[i].option_type eq 1}{section name=s loop=$product_info.product_extra[i].option_show_times}&amp;option_select_hidden_{counter name=select_counter_hidden}='+document.HiddenFieldsForm_{$product_info.productID}.option_select_hidden_{counter name=select_counter_hidden_extra}_{$product_info.productID}.value+'{/section}{/if}{/section}&amp;xcart=yes&amp;multyaddcount='+document.HiddenFieldsForm_{$product_info.productID}.multyaddcount.value+''); return false">{$smarty.const.ADD_TO_CART_STRING}</a>
    {/if}
    {else}
    {if $smarty.const.CONF_SHOW_ADD2CART eq 1 && ( $smarty.const.CONF_CHECKSTOCK==0 || $product_info.in_stock > 0 ) }
        <input type="hidden" name="cart_{$product_info.productID}_x" value="{$product_info.productID}">        
        <a class="dwa-button" href="#" onclick="document.getElementById('HiddenFieldsForm_{$product_info.productID}').submit(); return false">{$smarty.const.ADD_TO_CART_STRING}</a>
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
    <a href="#" onclick="doLoadcpr('do=compare&amp;cpradd={$product_info.productID}'); return false">{$smarty.const.ADD_TO_CFOLDER}</a>
    {/if}     
</td>

