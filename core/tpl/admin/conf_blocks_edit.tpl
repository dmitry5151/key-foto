{if $edit}
<form action="{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit&amp;edit={$blocks_edit.bid}" method="post" name="formaxp3" id="formaxp3">
<table class="adn">
<tr class="linsz">
<td align="left" style="padding-top: 0;"><span class="titlecol2">{$smarty.const.BLOCKS_NAME}</span></td>
</tr>
<tr>
<td align="left"><input name="block_name" type="text" value='{$blocks_edit.title}' style="width: 500px;" class="textp"></td>
</tr></table>
<table class="adn"><tr><td class="se5"></td></tr></table>
{if $blocks_edit.html eq 0}
<table class="adn">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.BLOCK_TEXT_CONT}</span></td>
</tr>
<tr>
<td>
<textarea name="block_content" id="blockarea" class="admin">{$blocks_edit.content}</textarea>
</td></tr></table>
<table class="adn"><tr><td class="se6"></td></tr></table>
{if $smarty.const.CONF_EDITOR}
{literal}
<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
<script type="text/javascript" src="fckeditor/ckfinder/ckfinder.js"></script>
<script type="text/javascript">
window.onload = function()
{
var oFCKeditor = new FCKeditor( 'blockarea',720,346) ;
{/literal}{php}
$dir1 = dirname($_SERVER['PHP_SELF']);
$sourcessrand = array("//" => "/", "\\" => "/");
$dir1 = strtr($dir1, $sourcessrand);
if ($dir1 != "/") $dir2 = "/"; else $dir2 = "";
echo "\n";
echo "oFCKeditor.BasePath = \"".$dir1.$dir2."fckeditor/\";\n";
{/php}{literal}
oFCKeditor.ReplaceTextarea() ;
}
</script>
{/literal}
{/if}
{else}
{$smarty.const.BLOCKS_HTML}{$smarty.const.CONF_DEFAULT_TEMPLATE}{$smarty.const.BLOCKS_HTML2}{$blocks_edit.url}"<input type="hidden" name="block_content" value="">
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td height="18"></td></tr></table>
{/if}

{if $blocks_edit.about}<b>{$smarty.const.BLOCK_EDIT_ABOUT}</b>: {$blocks_edit.about}
<table width="100%" border="0" cellpadding="0" cellspacing="0"><tr><td height="18"></td></tr></table>
{/if}
{$smarty.const.BLOCK_EDIT_1}: <select name='block_select_where' >
<option value="0" {if $blocks_edit.which eq 0}selected{/if}> {$smarty.const.BLOCK_EDIT_4} </option>
<option value="1" {if $blocks_edit.which eq 1}selected{/if}> {$smarty.const.BLOCK_EDIT_5} </option>
<option value="2" {if $blocks_edit.which eq 2}selected{/if}> {$smarty.const.BLOCK_EDIT_5_NEW} </option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;{$smarty.const.BLOCK_EDIT_2}: <select name='block_select_line' >
<option value="1" {if $blocks_edit.bposition eq 1}selected{/if}> {$smarty.const.BLOCK_EDIT_6} </option>
<option value="2" {if $blocks_edit.bposition eq 2}selected{/if}> {$smarty.const.BLOCK_EDIT_7} </option>
<option value="3" {if $blocks_edit.bposition eq 3}selected{/if}> {$smarty.const.BLOCK_EDIT_8} </option>
<option value="4" {if $blocks_edit.bposition eq 4}selected{/if}> {$smarty.const.BLOCK_EDIT_9} </option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;{$smarty.const.BLOCK_EDIT_3}: <select name='block_select_active' >
<option value="1" {if $blocks_edit.active eq 1}selected{/if}> {$smarty.const.BLOCK_EDIT_10} </option>
<option value="0" {if $blocks_edit.active eq 0}selected{/if}> {$smarty.const.BLOCK_EDIT_11} </option>
</select>&nbsp;&nbsp;<select name='block_select_admin' >
<option value="0" {if $blocks_edit.admin eq 0}selected{/if}> {$smarty.const.BLOCK_EDIT_ADMIN2} </option>
<option value="1" {if $blocks_edit.admin eq 1}selected{/if}> {$smarty.const.BLOCK_EDIT_ADMIN3} </option>
</select><table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adw">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.BLOCK_EDIT_NEW_CHOISE}</span></td>
<td align="left" style="padding-left: 16px;"><span class="titlecol2">{$smarty.const.BLOCK_EDIT_ADD_CHOISE}</span></td>
</tr>
<tr>
<td align="left">
<select name="spage_select[]" size="10" multiple="multiple" style="width: 350px">
{assign var="isw" value=1}
<option value="nonepage" {if in_array("home.tpl", $blocks_edit.pages) || in_array("activation_orders.tpl", $blocks_edit.pages) || in_array("deactivation_orders.tpl", $blocks_edit.pages)
 || in_array("address_book.tpl", $blocks_edit.pages)
 || in_array("address_editor.tpl", $blocks_edit.pages)
 || in_array("category.tpl", $blocks_edit.pages)
 || in_array("category_search_result.tpl", $blocks_edit.pages)
 || in_array("comparison_products.tpl", $blocks_edit.pages)
 || in_array("contact_info.tpl", $blocks_edit.pages)
 || in_array("customer_survey_result.tpl", $blocks_edit.pages)
 || in_array("feedback.tpl", $blocks_edit.pages)
 || in_array("links_exchange.tpl", $blocks_edit.pages)
 || in_array("order2_shipping.tpl", $blocks_edit.pages)
 || in_array("order2_shipping_quick.tpl", $blocks_edit.pages)
 || in_array("order3_billing.tpl", $blocks_edit.pages)
 || in_array("order3_billing_quick.tpl", $blocks_edit.pages)
 || in_array("order4_confirmation.tpl", $blocks_edit.pages)
 || in_array("order4_confirmation_quick.tpl", $blocks_edit.pages)
 || in_array("order_history.tpl", $blocks_edit.pages)
 || in_array("password.tpl", $blocks_edit.pages)
 || in_array("pricelist.tpl", $blocks_edit.pages)
 || in_array("product_detailed.tpl", $blocks_edit.pages)
 || in_array("product_discussion.tpl", $blocks_edit.pages)
 || in_array("reg_successful.tpl", $blocks_edit.pages)
 || in_array("register.tpl", $blocks_edit.pages)
 || in_array("register_authorization.tpl", $blocks_edit.pages)
 || in_array("register_quick.tpl", $blocks_edit.pages)
 || in_array("search_simple.tpl", $blocks_edit.pages)
 || in_array("shopping_cart.tpl", $blocks_edit.pages)
 || in_array("show_aux_page.tpl", $blocks_edit.pages)
 || in_array("show_full_news.tpl", $blocks_edit.pages)
 || in_array("show_news.tpl", $blocks_edit.pages)
 || in_array("subscribe.tpl", $blocks_edit.pages)
 || in_array("user_account.tpl", $blocks_edit.pages)
 || in_array("visit_history.tpl", $blocks_edit.pages)
 }{assign var="isw" value=2}{/if}{if $isw eq 1}selected{/if}>{$smarty.const.ADMIN_NOT_VALUED}</option>
                <option value="home.tpl" {if in_array("home.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_1}</option>
                <option value="activation_orders.tpl" {if in_array("activation_orders.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_2}</option>
                <option value="deactivation_orders.tpl" {if in_array("deactivation_orders.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_3}</option>
                <option value="address_book.tpl" {if in_array("address_book.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_4}</option>
                <option value="address_editor.tpl" {if in_array("address_editor.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_5}</option>
                <option value="category.tpl" {if in_array("category.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_6}</option>
                <option value="category_search_result.tpl" {if in_array("category_search_result.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_7}</option>
                <option value="comparison_products.tpl" {if in_array("comparison_products.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_8}</option>
                <option value="contact_info.tpl" {if in_array("contact_info.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_9}</option>
                <option value="customer_survey_result.tpl" {if in_array("customer_survey_result.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_10}</option>
                <option value="feedback.tpl" {if in_array("feedback.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_11}</option>
                <option value="links_exchange.tpl" {if in_array("links_exchange.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_12}</option>
                <option value="order2_shipping.tpl" {if in_array("order2_shipping.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_13}</option>
                <option value="order2_shipping_quick.tpl" {if in_array("order2_shipping_quick.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_14}</option>
                <option value="order3_billing.tpl" {if in_array("order3_billing.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_15}</option>
                <option value="order3_billing_quick.tpl" {if in_array("order3_billing_quick.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_16}</option>
                <option value="order4_confirmation.tpl" {if in_array("order4_confirmation.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_17}</option>
                <option value="order4_confirmation_quick.tpl" {if in_array("order4_confirmation_quick.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_18}</option>
                <option value="order_history.tpl" {if in_array("order_history.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_19}</option>
                <option value="password.tpl" {if in_array("password.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_20}</option>
                <option value="pricelist.tpl" {if in_array("pricelist.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_21}</option>
                <option value="product_detailed.tpl" {if in_array("product_detailed.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_22}</option>
                <option value="product_discussion.tpl" {if in_array("product_discussion.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_23}</option>
                <option value="reg_successful.tpl" {if in_array("reg_successful.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_24}</option>
                <option value="register.tpl" {if in_array("register.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_25}</option>
                <option value="register_authorization.tpl" {if in_array("register_authorization.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_26}</option>
                <option value="register_quick.tpl" {if in_array("register_quick.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_27}</option>
                <option value="search_simple.tpl" {if in_array("search_simple.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_28}</option>
                <option value="shopping_cart.tpl" {if in_array("shopping_cart.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_29}</option>
                <option value="show_aux_page.tpl" {if in_array("show_aux_page.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_30}</option>
                <option value="show_full_news.tpl" {if in_array("show_full_news.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_31}</option>
                <option value="show_news.tpl" {if in_array("show_news.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_32}</option>
                <option value="subscribe.tpl" {if in_array("subscribe.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_33}</option>
                <option value="user_account.tpl" {if in_array("user_account.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_34}</option>
                <option value="visit_history.tpl" {if in_array("visit_history.tpl", $blocks_edit.pages)}selected{/if}>{$smarty.const.BLOCK_EDIT_PAGE_35}</option>
</select>
</td>
<td align="left" style="padding-left: 16px;">
<select name="dpage_select[]" size="10" multiple="multiple" style="width: 350px;">
{assign var="istval" value=1}
<option value="nonepage" {section name=ist loop=$aux_pages}{if in_array($aux_pages[ist].aux_page_ID, $blocks_edit.dpages)}{assign var="istval" value=2}{/if}{/section}{if $istval eq 1}selected{/if}>{$smarty.const.ADMIN_NOT_VALUED}</option>
{section name=i loop=$aux_pages}
<option value="{$aux_pages[i].aux_page_ID}" {if in_array($aux_pages[i].aux_page_ID, $blocks_edit.dpages)}selected{/if}>{$aux_pages[i].aux_page_name}</option>
{/section}
</select>
</td>
</tr></table>
<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adw">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.BLOCK_EDIT_DCAT}</span></td>
<td align="left" style="padding-left: 16px;"><span class="titlecol2">{$smarty.const.BLOCK_EDIT_DPROD}</span></td>
</tr>
<tr>
<td align="left">
<select name="categories_select[]" size="10" multiple="multiple" style="width: 350px">
{assign var="issval" value=1}
<option value="nonepage" {section name=iss loop=$cats}{if in_array($cats[iss].categoryID, $blocks_edit.categories)}{assign var="issval" value=2}{/if}{/section}{if $issval eq 1}selected{/if}>{$smarty.const.ADMIN_NOT_VALUED}</option>
{section name=im loop=$cats}
<option value="{$cats[im].categoryID}" {if in_array($cats[im].categoryID, $blocks_edit.categories)}selected{/if}>{section name=j loop=$cats[im].level max=$cats[im].level}&nbsp;&nbsp;&nbsp;{/section}{$cats[im].name}</option>
{/section}
</select>
</td>
<td align="left" style="padding-left: 16px;" valign="top">
<textarea name="products_select" style="width: 348px; height: 92px;">
{section name=z loop=$blocks_edit.products}
{$blocks_edit.products[z]}
{/section}
</textarea>
<div align="left"><br>{$smarty.const.BLOCK_EDIT_PSDESCRIPT}</div>
</td>
</tr>
</table>
          <table class="adn"><tr><td height="18"></td></tr></table>
<a href="#" onclick="document.getElementById('formaxp3').submit(); return false" class="inl">{$smarty.const.SAVE_BUTTON}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit" class="inl">{$smarty.const.ADMIN_TX2}</a>
<input type=hidden value='{$smarty.const.SAVE_BUTTON}' name='save'>
</form>
{elseif $add_new_file}
<form action="{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit&amp;add_new=yes&amp;file=yes" method="post" name="formaxp3" id="formaxp3">
  <table class="adn">
<tr class="linsz">
<td align="left" style="padding-top: 0;"><span class="titlecol2">{$smarty.const.BLOCKS_NAME}</span></td>
</tr>
<tr>
<td align="left"><input name="block_name" type="text" value='' style="width: 500px;" class="textp"></td>
</tr></table>
<table class="adn"><tr><td class="se5"></td></tr></table>
<b>{$smarty.const.BLOCK_TEXT_FILE}:</b> <select name='block_select_file' >
{section name=i loop=$blocklist}
<option value="{$blocklist[i]}"> {$blocklist[i]} </option>
{/section}
</select>
<table class="adn"><tr><td class="se6"></td></tr></table>
<input type="hidden" value="" name="block_content">
{$smarty.const.BLOCK_EDIT_1}: <select name='block_select_where' >
<option value="0" selected> {$smarty.const.BLOCK_EDIT_4} </option>
<option value="1"> {$smarty.const.BLOCK_EDIT_5} </option>
<option value="2"> {$smarty.const.BLOCK_EDIT_5_NEW} </option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;{$smarty.const.BLOCK_EDIT_2}: <select name='block_select_line' >
<option value="1" selected> {$smarty.const.BLOCK_EDIT_6} </option>
<option value="2"> {$smarty.const.BLOCK_EDIT_7} </option>
<option value="3"> {$smarty.const.BLOCK_EDIT_8} </option>
<option value="4"> {$smarty.const.BLOCK_EDIT_9} </option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;{$smarty.const.BLOCK_EDIT_3}: <select name='block_select_active' >
<option value="1" selected> {$smarty.const.BLOCK_EDIT_10} </option>
<option value="0"> {$smarty.const.BLOCK_EDIT_11} </option>
</select>&nbsp;&nbsp;<select name='block_select_admin' >
<option value="0" selected> {$smarty.const.BLOCK_EDIT_ADMIN2} </option>
<option value="1"> {$smarty.const.BLOCK_EDIT_ADMIN3} </option>
</select><table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adw">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.BLOCK_EDIT_NEW_CHOISE}</span></td>
<td align="left" style="padding-left: 16px;"><span class="titlecol2">{$smarty.const.BLOCK_EDIT_ADD_CHOISE}</span></td>
</tr>
<tr>
<td align="left">
<select name="spage_select[]" size="10" multiple="multiple" style="width: 350px">
<option value="nonepage" selected>{$smarty.const.ADMIN_NOT_VALUED}</option>
                <option value="home.tpl">{$smarty.const.BLOCK_EDIT_PAGE_1}</option>
                <option value="activation_orders.tpl">{$smarty.const.BLOCK_EDIT_PAGE_2}</option>
                <option value="deactivation_orders.tpl">{$smarty.const.BLOCK_EDIT_PAGE_3}</option>
                <option value="address_book.tpl">{$smarty.const.BLOCK_EDIT_PAGE_4}</option>
                <option value="address_editor.tpl">{$smarty.const.BLOCK_EDIT_PAGE_5}</option>
                <option value="category.tpl">{$smarty.const.BLOCK_EDIT_PAGE_6}</option>
                <option value="category_search_result.tpl">{$smarty.const.BLOCK_EDIT_PAGE_7}</option>
                <option value="comparison_products.tpl">{$smarty.const.BLOCK_EDIT_PAGE_8}</option>
                <option value="contact_info.tpl">{$smarty.const.BLOCK_EDIT_PAGE_9}</option>
                <option value="customer_survey_result.tpl">{$smarty.const.BLOCK_EDIT_PAGE_10}</option>
                <option value="feedback.tpl">{$smarty.const.BLOCK_EDIT_PAGE_11}</option>
                <option value="links_exchange.tpl">{$smarty.const.BLOCK_EDIT_PAGE_12}</option>
                <option value="order2_shipping.tpl">{$smarty.const.BLOCK_EDIT_PAGE_13}</option>
                <option value="order2_shipping_quick.tpl">{$smarty.const.BLOCK_EDIT_PAGE_14}</option>
                <option value="order3_billing.tpl">{$smarty.const.BLOCK_EDIT_PAGE_15}</option>
                <option value="order3_billing_quick.tpl">{$smarty.const.BLOCK_EDIT_PAGE_16}</option>
                <option value="order4_confirmation.tpl">{$smarty.const.BLOCK_EDIT_PAGE_17}</option>
                <option value="order4_confirmation_quick.tpl">{$smarty.const.BLOCK_EDIT_PAGE_18}</option>
                <option value="order_history.tpl">{$smarty.const.BLOCK_EDIT_PAGE_19}</option>
                <option value="password.tpl">{$smarty.const.BLOCK_EDIT_PAGE_20}</option>
                <option value="pricelist.tpl">{$smarty.const.BLOCK_EDIT_PAGE_21}</option>
                <option value="product_detailed.tpl">{$smarty.const.BLOCK_EDIT_PAGE_22}</option>
                <option value="product_discussion.tpl">{$smarty.const.BLOCK_EDIT_PAGE_23}</option>
                <option value="reg_successful.tpl">{$smarty.const.BLOCK_EDIT_PAGE_24}</option>
                <option value="register.tpl">{$smarty.const.BLOCK_EDIT_PAGE_25}</option>
                <option value="register_authorization.tpl">{$smarty.const.BLOCK_EDIT_PAGE_26}</option>
                <option value="register_quick.tpl">{$smarty.const.BLOCK_EDIT_PAGE_27}</option>
                <option value="search_simple.tpl">{$smarty.const.BLOCK_EDIT_PAGE_28}</option>
                <option value="shopping_cart.tpl">{$smarty.const.BLOCK_EDIT_PAGE_29}</option>
                <option value="show_aux_page.tpl">{$smarty.const.BLOCK_EDIT_PAGE_30}</option>
                <option value="show_full_news.tpl">{$smarty.const.BLOCK_EDIT_PAGE_31}</option>
                <option value="show_news.tpl">{$smarty.const.BLOCK_EDIT_PAGE_32}</option>
                <option value="subscribe.tpl">{$smarty.const.BLOCK_EDIT_PAGE_33}</option>
                <option value="user_account.tpl">{$smarty.const.BLOCK_EDIT_PAGE_34}</option>
                <option value="visit_history.tpl">{$smarty.const.BLOCK_EDIT_PAGE_35}</option>
</select>
</td>
<td align="left" style="padding-left: 16px;">
<select name="dpage_select[]" size="10" multiple="multiple" style="width: 350px;">
<option value="nonepage" selected>{$smarty.const.ADMIN_NOT_VALUED}</option>
{section name=i loop=$aux_pages}
<option value="{$aux_pages[i].aux_page_ID}">{$aux_pages[i].aux_page_name}</option>
{/section}
</select>
</td>
</tr></table>
<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adw">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.BLOCK_EDIT_DCAT}</span></td>
<td align="left" style="padding-left: 16px;"><span class="titlecol2">{$smarty.const.BLOCK_EDIT_DPROD}</span></td>
</tr>
<tr>
<td align="left">
<select name="categories_select[]" size="10" multiple="multiple" style="width: 350px">
<option value="nonepage" selected>{$smarty.const.ADMIN_NOT_VALUED}</option>
{section name=im loop=$cats}
<option value="{$cats[im].categoryID}">{section name=j loop=$cats[im].level max=$cats[im].level}&nbsp;&nbsp;&nbsp;{/section}{$cats[im].name}</option>
{/section}
</select>
</td>
<td align="left" style="padding-left: 16px;" valign="top">
<textarea name="products_select" style="width: 348px; height: 92px;"></textarea>
<div align="left"><br>{$smarty.const.BLOCK_EDIT_PSDESCRIPT}</div>
</td>
</tr>
</table>
     <table class="adn"><tr><td height="18"></td></tr></table>
<a href="#" onclick="document.getElementById('formaxp3').submit(); return false" class="inl">{$smarty.const.SAVE_BUTTON}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit" class="inl">{$smarty.const.ADMIN_TX2}</a>
<input type=hidden value='{$smarty.const.SAVE_BUTTON}' name='save'>
</form>
{elseif $add_new}
<form action="{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit&amp;add_new=yes" method="post" name="formaxp3" id="formaxp3">

<table class="adn">
<tr class="linsz">
<td align="left" style="padding-top: 0;"><span class="titlecol2">{$smarty.const.BLOCKS_NAME}</span></td>
</tr>
<tr>
<td align="left"><input name="block_name" type="text" value='' style="width: 500px;" class="textp"></td>
</tr></table>
<table class="adn"><tr><td class="se5"></td></tr></table>
<table class="adn">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.BLOCK_TEXT_CONT}</span></td>
</tr>
<tr>
<td>
<textarea name="block_content" id="blockarea" class="admin"></textarea>
</td></tr></table>
<table class="adn"><tr><td class="se6"></td></tr></table>
{if $smarty.const.CONF_EDITOR}
{literal}
<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
<script type="text/javascript" src="fckeditor/ckfinder/ckfinder.js"></script>
<script type="text/javascript">
window.onload = function()
{
var oFCKeditor = new FCKeditor( 'blockarea',720,346) ;
{/literal}{php}
$dir1 = dirname($_SERVER['PHP_SELF']);
$sourcessrand = array("//" => "/", "\\" => "/");
$dir1 = strtr($dir1, $sourcessrand);
if ($dir1 != "/") $dir2 = "/"; else $dir2 = "";
echo "\n";
echo "oFCKeditor.BasePath = \"".$dir1.$dir2."fckeditor/\";\n";
{/php}{literal}
oFCKeditor.ReplaceTextarea() ;
}
</script>
{/literal}
{/if}
{$smarty.const.BLOCK_EDIT_1}: <select name='block_select_where' >
<option value="0" selected> {$smarty.const.BLOCK_EDIT_4} </option>
<option value="1"> {$smarty.const.BLOCK_EDIT_5} </option>
<option value="2"> {$smarty.const.BLOCK_EDIT_5_NEW} </option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;{$smarty.const.BLOCK_EDIT_2}: <select name='block_select_line' >
<option value="1" selected> {$smarty.const.BLOCK_EDIT_6} </option>
<option value="2"> {$smarty.const.BLOCK_EDIT_7} </option>
<option value="3"> {$smarty.const.BLOCK_EDIT_8} </option>
<option value="4"> {$smarty.const.BLOCK_EDIT_9} </option>
</select>&nbsp;&nbsp;&nbsp;&nbsp;{$smarty.const.BLOCK_EDIT_3}: <select name='block_select_active' >
<option value="1" selected> {$smarty.const.BLOCK_EDIT_10} </option>
<option value="0"> {$smarty.const.BLOCK_EDIT_11} </option>
</select>&nbsp;&nbsp;<select name='block_select_admin' >
<option value="0" selected> {$smarty.const.BLOCK_EDIT_ADMIN2} </option>
<option value="1"> {$smarty.const.BLOCK_EDIT_ADMIN3} </option>
</select><table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adw">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.BLOCK_EDIT_NEW_CHOISE}</span></td>
<td align="left" style="padding-left: 16px;"><span class="titlecol2">{$smarty.const.BLOCK_EDIT_ADD_CHOISE}</span></td>
</tr>
<tr>
<td align="left">
<select name="spage_select[]" size="10" multiple="multiple" style="width: 350px">
<option value="nonepage" selected>{$smarty.const.ADMIN_NOT_VALUED}</option>
                <option value="home.tpl">{$smarty.const.BLOCK_EDIT_PAGE_1}</option>
                <option value="activation_orders.tpl">{$smarty.const.BLOCK_EDIT_PAGE_2}</option>
                <option value="deactivation_orders.tpl">{$smarty.const.BLOCK_EDIT_PAGE_3}</option>
                <option value="address_book.tpl">{$smarty.const.BLOCK_EDIT_PAGE_4}</option>
                <option value="address_editor.tpl">{$smarty.const.BLOCK_EDIT_PAGE_5}</option>
                <option value="category.tpl">{$smarty.const.BLOCK_EDIT_PAGE_6}</option>
                <option value="category_search_result.tpl">{$smarty.const.BLOCK_EDIT_PAGE_7}</option>
                <option value="comparison_products.tpl">{$smarty.const.BLOCK_EDIT_PAGE_8}</option>
                <option value="contact_info.tpl">{$smarty.const.BLOCK_EDIT_PAGE_9}</option>
                <option value="customer_survey_result.tpl">{$smarty.const.BLOCK_EDIT_PAGE_10}</option>
                <option value="feedback.tpl">{$smarty.const.BLOCK_EDIT_PAGE_11}</option>
                <option value="links_exchange.tpl">{$smarty.const.BLOCK_EDIT_PAGE_12}</option>
                <option value="order2_shipping.tpl">{$smarty.const.BLOCK_EDIT_PAGE_13}</option>
                <option value="order2_shipping_quick.tpl">{$smarty.const.BLOCK_EDIT_PAGE_14}</option>
                <option value="order3_billing.tpl">{$smarty.const.BLOCK_EDIT_PAGE_15}</option>
                <option value="order3_billing_quick.tpl">{$smarty.const.BLOCK_EDIT_PAGE_16}</option>
                <option value="order4_confirmation.tpl">{$smarty.const.BLOCK_EDIT_PAGE_17}</option>
                <option value="order4_confirmation_quick.tpl">{$smarty.const.BLOCK_EDIT_PAGE_18}</option>
                <option value="order_history.tpl">{$smarty.const.BLOCK_EDIT_PAGE_19}</option>
                <option value="password.tpl">{$smarty.const.BLOCK_EDIT_PAGE_20}</option>
                <option value="pricelist.tpl">{$smarty.const.BLOCK_EDIT_PAGE_21}</option>
                <option value="product_detailed.tpl">{$smarty.const.BLOCK_EDIT_PAGE_22}</option>
                <option value="product_discussion.tpl">{$smarty.const.BLOCK_EDIT_PAGE_23}</option>
                <option value="reg_successful.tpl">{$smarty.const.BLOCK_EDIT_PAGE_24}</option>
                <option value="register.tpl">{$smarty.const.BLOCK_EDIT_PAGE_25}</option>
                <option value="register_authorization.tpl">{$smarty.const.BLOCK_EDIT_PAGE_26}</option>
                <option value="register_quick.tpl">{$smarty.const.BLOCK_EDIT_PAGE_27}</option>
                <option value="search_simple.tpl">{$smarty.const.BLOCK_EDIT_PAGE_28}</option>
                <option value="shopping_cart.tpl">{$smarty.const.BLOCK_EDIT_PAGE_29}</option>
                <option value="show_aux_page.tpl">{$smarty.const.BLOCK_EDIT_PAGE_30}</option>
                <option value="show_full_news.tpl">{$smarty.const.BLOCK_EDIT_PAGE_31}</option>
                <option value="show_news.tpl">{$smarty.const.BLOCK_EDIT_PAGE_32}</option>
                <option value="subscribe.tpl">{$smarty.const.BLOCK_EDIT_PAGE_33}</option>
                <option value="user_account.tpl">{$smarty.const.BLOCK_EDIT_PAGE_34}</option>
                <option value="visit_history.tpl">{$smarty.const.BLOCK_EDIT_PAGE_35}</option>
</select>
</td>
<td align="left" style="padding-left: 16px;">
<select name="dpage_select[]" size="10" multiple="multiple" style="width: 350px;">
<option value="nonepage" selected>{$smarty.const.ADMIN_NOT_VALUED}</option>
{section name=i loop=$aux_pages}
<option value="{$aux_pages[i].aux_page_ID}">{$aux_pages[i].aux_page_name}</option>
{/section}
</select>
</td>
</tr></table>
<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adw">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.BLOCK_EDIT_DCAT}</span></td>
<td align="left" style="padding-left: 16px;"><span class="titlecol2">{$smarty.const.BLOCK_EDIT_DPROD}</span></td>
</tr>
<tr>
<td align="left">
<select name="categories_select[]" size="10" multiple="multiple" style="width: 350px">
<option value="nonepage" selected>{$smarty.const.ADMIN_NOT_VALUED}</option>
{section name=im loop=$cats}
<option value="{$cats[im].categoryID}">{section name=j loop=$cats[im].level max=$cats[im].level}&nbsp;&nbsp;&nbsp;{/section}{$cats[im].name}</option>
{/section}
</select>
</td>
<td align="left" style="padding-left: 16px;" valign="top">
<textarea name="products_select" style="width: 348px; height: 92px;"></textarea>
<div align="left"><br>{$smarty.const.BLOCK_EDIT_PSDESCRIPT}</div>
</td>
</tr>
</table>

<table class="adn"><tr><td height="18"></td></tr></table>
<a href="#" onclick="document.getElementById('formaxp3').submit(); return false" class="inl">{$smarty.const.SAVE_BUTTON}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit" class="inl">{$smarty.const.ADMIN_TX2}</a>
<input type=hidden value='{$smarty.const.SAVE_BUTTON}' name='save'>
</form>
{else}

{if $blocks_count >= 1}
<form action='{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit' method=post name="formaxp2" id="formaxp2">
<table class="adn">
<tr class="lineb">
<td align="left" width="100%">{$smarty.const.BLOCKS_NAME}</td>
<td align="right">{$smarty.const.BLOCKS_ACTIVE}</td>
<td align="right">{$smarty.const.BLOCKS_POSITION}</td>
<td align="right">{$smarty.const.BLOCKS_SORT}</td>
<td align="right">{$smarty.const.AUX_PAGE_EDIT}</td>
</tr>{assign var="admhl" value=0}
{section name=i loop=$blocks_edit}
{if $admhl eq 1}
<tr><td colspan="6" class="separ"><img src="data/admin/pixel.gif" alt="" class="sep"></td></tr>
{else}{assign var="admhl" value=1}{/if}
<tr class="liney hover">
<td align="left">{$blocks_edit[i][1]}</td>
<td align="right">{if $blocks_edit[i][3] eq 1}<span style="color: #339933">{$smarty.const.BLOCKS_ON}</span>{else}<span style="color: #BB0000">{$smarty.const.BLOCKS_OFF}</span>{/if}&nbsp;</td>
<td align="right" class="toph3">{if $blocks_edit[i][2] eq 1}{$smarty.const.BLOCKS_LEFT}{elseif $blocks_edit[i][2] eq 2}{$smarty.const.BLOCKS_TOP}{elseif $blocks_edit[i][2] eq 3}{$smarty.const.BLOCKS_BOTTOM}{elseif $blocks_edit[i][2] eq 4}{$smarty.const.BLOCKS_RIGHT}{/if}</td>
<td align="right"><input type="text" value="{$blocks_edit[i][5]}" class="prc" name="sort_{$blocks_edit[i][0]}" size="4"></td>
<td align="right">{if $blocks_edit[i][3] eq 1}<a href='{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit&amp;block_switch_off={$blocks_edit[i][0]}'>{$smarty.const.BLOCK_OUT}</a>{else}<a href='{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit&amp;block_switch_on={$blocks_edit[i][0]}'>{$smarty.const.BLOCK_IN}</a>{/if}&nbsp;|&nbsp;<a href='{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit&amp;edit={$blocks_edit[i][0]}'>{$smarty.const.ADMIN_EDIT_SMALL}</a>&nbsp;|&nbsp;<a href="#" onclick="confirmDelete({$blocks_edit[i][0]},'{$smarty.const.QUESTION_DELETE_CONFIRMATION}','{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit&amp;delete=');">X</a></td>
</tr>
{/section}
</table>
<table class="adn"><tr><td class="separ"><img src="data/admin/pixel.gif" alt="" class="sep"></td></tr><tr><td class="se5"></td></tr></table>
<a href="#" onclick="document.getElementById('formaxp2').submit(); return false" class="inl">{$smarty.const.SAVE_BUTTON}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit&amp;add_new=yes" class="inl">{$smarty.const.ADD_BLOCK}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit&amp;add_new=yes&amp;file=yes" class="inl">{$smarty.const.ADD_BLOCK_FILE}</a>
<input type=hidden value='{$smarty.const.SAVE_BUTTON}' name='savel'>
</form>
{else}
<table class="adn">
<tr class="lineb">
<td align="left">&nbsp;</td></tr>
<tr><td align="center" height="24">{$smarty.const.ALERT_ADMIN_BLOCKS}</td></tr></table>
<table class="adn"><tr><td class="separ"><img src="data/admin/pixel.gif" alt="" class="sep"></td></tr><tr><td class="se5"></td></tr></table>
<a href="{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit&amp;add_new=yes" class="inl">{$smarty.const.ADD_BLOCK}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="{$smarty.const.ADMIN_FILE}?dpt=conf&amp;sub=blocks_edit&amp;add_new=yes&amp;file=yes" class="inl">{$smarty.const.ADD_BLOCK_FILE}</a>
{/if}

{/if}



<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adn"><tr><td class="help"><span class="titlecol2">{$smarty.const.USEFUL_FOR_YOU}</span><div class="helptext">{$smarty.const.ALERT_ADMIN_BL2}<br><br>{$smarty.const.ALERT_ADMIN2}</div></td>
        </tr>
      </table>