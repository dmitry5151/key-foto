{* ������ ��������� �������� ������ *}

{section name=i loop=$product_info.product_extra}
	{if $product_info.product_extra[i].option_type eq 0 }
        {if $product_info.product_extra[i].name == "�������������"}{assign var="proizv" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "���������"}{assign var="tipdvig" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "���������� ���"}{assign var="faz" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "������ �����"}{assign var="pusk" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "������ ���������"}{assign var="mod_dvig" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "�������� ����������, �"}{assign var="v_vih" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "������������ ������������������ (�/���)"}{assign var="lmin" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "������� ���������, ��/��� (��)"}{assign var="patr" value=$product_info.product_extra[i].option_value}{/if}
        {if $product_info.product_extra[i].name == "��� �������������� ����"}{assign var="tipvod" value=$product_info.product_extra[i].option_value}{/if}
    {else}    	
        {if $product_info.product_extra[i].name == "�������������"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="proizv" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="proizv" value="������"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "���������"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="tipdvig" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="tipdvig" value="������"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "���������� ���"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="faz" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="faz" value="������"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "������ �����"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="pusk" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="pusk" value="������"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "������ ���������"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="mod_dvig" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="mod_dvig" value="������"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "�������� ����������, �"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="v_vih" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="v_vih" value="������"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "������������ ������������������ (�/���)"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="lmin" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="lmin" value="������"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "������� ���������, ��/��� (��)"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="patr" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="patr" value="������"}
            {/if}
        {/if}
        {* ---------------------------------------------------------------------------------------------------------- *}
        {if $product_info.product_extra[i].name == "��� �������������� ����"}
            {if $product_info.product_extra[i].values_to_select_count == 1}
                {assign var="tipvod" value=$product_info.product_extra[i].values_to_select[0].option_value}
            {else}
                {assign var="tipvod" value="������"}
            {/if}
        {/if}
    {/if}
{/section}

{if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
<td class="center"><!-- ���, ���� ���� -->
  {if $product_info.product_code}<b>{$product_info.product_code}</b>{/if}
</td>
{/if}
{if $product_info.picture}<!-- �������� -->
<td><a href="{$product_info|@fu_make_url}"><img src="data/small/{$product_info.picture}" alt="{$product_info.name}" width="50"></a></td>
{else}
    {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}
    <td class="imboxl"><a href="{$product_info|@fu_make_url}"><img src="data/empty.gif" alt="no photo" width="50"></a></td>
    {/if}
{/if}
<td><!-- �������� -->
{if $isadmin eq "yes"}<a href='{$smarty.const.ADMIN_FILE}?productID={$product_info.productID}&amp;eaction=prod' title='{$smarty.const.STRING_EDITPR}' style="text-decoration:none;">+</a>{/if}
  <strong><a href="{$product_info|@fu_make_url}">{$product_info.name}</a></strong>
</td>
<td class="center"><!-- �������� -->
<strong>{$product_info.Productivity} �/���</strong>
{*<ul>
{foreach from=$product_info.product_weight key=k item=v}
    <li>{$k}: {$v}</li>
{/foreach}
</ul>*}
</td>
<td class="center"><!-- �������������� -->
{if $patr != ""}&Oslash; ��������&nbsp;<b>{$patr}</b><br />{/if}
{if $tipvod != ""}{$tipvod}<br />{/if}
{if $tipdvig != ""}{$tipdvig}{/if}
</td>
<td class="center price" nowrap="nowrap"><!-- ���� -->
  {if $currencies_count ne 0}{if $product_info.Price <= 0}{$smarty.const.STRING_NOPRODUCT_IN}{else}{$product_info.PriceWithUnit}{/if}{/if}
</td>
<td nowrap="nowrap" class="center"><!-- ����� + ��������� -->
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

