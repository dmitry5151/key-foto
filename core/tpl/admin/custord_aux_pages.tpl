{if $edit || $add_new}{if $edit}
<form action='{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=aux_pages&amp;edit={$aux_page.aux_page_ID}' method=post name="formaxp" id="formaxp">
{else}
<form action='{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=aux_pages&amp;add_new=yes' method=post name="formaxp" id="formaxp">
{/if}
<table class="adn">
<tr class="linsz">
<td align="left" style="padding-top: 0;"><span class="titlecol2">{$smarty.const.AUX_PAGE_NAME}</span></td>
</tr>
<tr>
<td align="left"><input name="aux_page_name" type="text" value='{$aux_page.aux_page_name}' style="width: 500px;" class="textp"></td>
</tr><tr><td class="se5"></td></tr>
<tr class="linsz">
<td align="left" style="padding-top: 0;"><span class="titlecol2">{$smarty.const.ADMIN_PRODUCT_TITLE_PAGE}</span></td>
</tr>
<tr>
<td align="left"><input name="aux_page_title" type="text" value='{$aux_page.aux_page_title}' style="width: 500px;" class="textp"></td>
</tr>

<!-- BEGIN Human friendly URL's -->
<tr><td class="se5"></td></tr>
<tr class="linsz">
<td align="left" style="padding-top: 0;"><span class="titlecol2">{$smarty.const.HFU_SLUG}</span></td>
</tr>
<tr>
<td align="left">
  <input name="slug" type="text" value='{$aux_page.uri}' style="width: 200px;" class="textp">
  [<a href="JavaScript:hfu_translit_inputs('aux_page_name','slug','{$smarty.const.FU_WHITESPACE}')" style="text-decoration:underline;">транслит</a>]
</td>
</tr>
<!-- END Human friendly URL's -->

{if $smarty.const.CONF_EDITOR eq 0}
<tr class="linsz">
<td align="left"><input type="checkbox" class="round" name="aux_page_text_type" value="1"
                                {if $aux_page.aux_page_text_type == 1}
                                        checked
                                {/if}
>&nbsp;&nbsp;{$smarty.const.ADMIN_AXP1}</td>
</tr></table>{else}</table><input type="hidden" name="aux_page_text_type" value="1">{/if}
<table class="adn"><tr><td class="se5"></td></tr></table>
<table class="adn">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.AUX_PAGE_TEXT}</span></td>
</tr>
<tr>
<td><textarea name="aux_page_text" id="areapg" class="admin">{$aux_page.aux_page_text}</textarea></td>
</tr></table>
<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adw">
<tr><td width="50%">
<table class="adn">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.ADMIN_META_DESCRIPTION}</span></td>
</tr>
<tr><td align="left"><textarea name='meta_description' id='meta_description' class="adminall" style="margin-right: 38px;">{$aux_page.meta_description}</textarea>
</td></tr>
</table>
</td>
<td width="50%">
<table class="adn">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.ADMIN_META_KEYWORDS}</span></td>
</tr>
<tr><td align="left"><textarea name='meta_keywords' id='meta_keywords' class="adminall">{$aux_page.meta_keywords}</textarea>
</td></tr>
</table>
</td></tr></table>
<table class="adn"><tr><td class="se5"></td></tr></table>
<a href="#" onclick="document.getElementById('formaxp').submit(); return false" class="inl">{$smarty.const.SAVE_BUTTON}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=aux_pages" class="inl">{$smarty.const.ADMIN_TX2}</a>
<input type=hidden value='1' name='save'>
</form>
{if $smarty.const.CONF_EDITOR}
{literal}
<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
<script type="text/javascript" src="fckeditor/ckfinder/ckfinder.js"></script>
<script type="text/javascript">
window.onload = function()
{
var oFCKeditor = new FCKeditor( 'areapg',720,346) ;
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
<table class="adn">
<tr class="lineb">
<td align="left" class="toph3">{$smarty.const.AUX_PAGE_NAME}</td>
<td align="left">{$smarty.const.AUX_PAGE_TEXT_TYPE}</td>
<td align="left" width="100%" class="toph3">{$smarty.const.AUX_PAGE_REF}</td>
<td align="left">{$smarty.const.AUX_PAGE_EDIT}</td>
</tr>
{assign var="admhl" value=0}
{section name=i loop=$aux_pages}
{if $admhl eq 1}
<tr><td colspan="4" class="separ"><img src="data/admin/pixel.gif" alt="" class="sep"></td></tr>
{else}{assign var="admhl" value=1}{/if}
<tr class="lineybig hover">
<td align="left">{$aux_pages[i].aux_page_name}</td>
<td align="left">{if $aux_pages[i].aux_page_text_type == 0} TEXT {else} HTML {/if}</td>
<td align="left">&lt;a href="{if $smarty.const.CONF_MOD_REWRITE eq 1}page_{$aux_pages[i].aux_page_ID}.html"&gt;{$aux_pages[i].aux_page_name}{else}index.php?show_aux_page={$aux_pages[i].aux_page_ID}"&gt;{$aux_pages[i].aux_page_name}{/if}&lt;/a&gt;</td>
<td align="center"><a href="{if $smarty.const.CONF_MOD_REWRITE eq 1}page_{$aux_pages[i].aux_page_ID}.html{else}index.php?show_aux_page={$aux_pages[i].aux_page_ID}{/if}" target="_blank">{$smarty.const.ADMIN_SHOW_AUX_PAGE}</a>&nbsp;|&nbsp;<a href="{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=aux_pages&amp;edit={$aux_pages[i].aux_page_ID}">{$smarty.const.ADMIN_EDIT_SMALL}</a>&nbsp;|&nbsp;<a href="#" onclick="open_window('{$smarty.const.ADMIN_FILE}?do=wishcat&owner={$aux_pages[i].aux_page_ID}',500,500)">{$smarty.const.ADMIN_AUX_CAT}</a>&nbsp;|&nbsp;<a href="#" onclick="open_window('{$smarty.const.ADMIN_FILE}?do=wishprod&owner={$aux_pages[i].aux_page_ID}',500,500)">{$smarty.const.ADMIN_AUX_PROD}</a>&nbsp;|&nbsp;<a href="#" onclick="confirmDelete({$aux_pages[i].aux_page_ID},'{$smarty.const.QUESTION_DELETE_CONFIRMATION}','{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=aux_pages&amp;delete=');">X</a></td>
</tr>
{sectionelse}
<tr><td colspan="4" align="center" height="20">{$smarty.const.ADMIN_NO_VALUES}</td></tr>
{/section}
</table>
<table class="adn"><tr><td class="separ"><img src="data/admin/pixel.gif" alt="" class="sep"></td></tr><tr><td class="se5"></td></tr></table>
<a href="{$smarty.const.ADMIN_FILE}?dpt=custord&amp;sub=aux_pages&amp;add_new=yes" class="inl">{$smarty.const.ADD_PAGE}</a>
{/if}
<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adn"><tr><td class="help"><span class="titlecol2">{$smarty.const.USEFUL_FOR_YOU}</span><div class="helptext">{$smarty.const.ALERT_ADMIN21}</div></td>
        </tr>
      </table>
