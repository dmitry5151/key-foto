{if $news_editor eq 1}
<form action="{$urlToSubmit}" method=POST name='MainForm' id='MainForm'>
<table class="adn">
<tr class="lineb">
<td align="left">{if $edit_news}{$smarty.const.STRING_NEWS2}{else}{$smarty.const.ADMIN_NEW_NEWSARTICLE}{/if}</td></tr>
<tr class="lins"><td align="left">{$smarty.const.ADMIN_NEWS_TITLE}: <input type=text name='title' value='{if $edit_news}{$edit_news.title}{else}{$title}{/if}' style="width: 440px;" class="textp">&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;{$smarty.const.ADMIN_CURRENT_DATE}: <input type=text name='add_date' value="{if $edit_news}{$edit_news.add_date}{else}{$current_date}{/if}" style="width: 86px;" class="textp"></td></tr>
<!-- BEGIN Human friendly URL's -->
<tr class="lins">
  <td align="left">
    {$smarty.const.HFU_SLUG}:
    <input type=text name='slug' value='{if $edit_news}{$edit_news.uri}{else}{$uri}{/if}' style="width: 200px;" class="textp">
    [<a href="JavaScript:hfu_translit_inputs('title','slug','{$smarty.const.FU_WHITESPACE}')" style="text-decoration:underline;">транслит</a>]
</td></tr>
<!-- END Human friendly URL's -->
</table>
<table class="adn"><tr><td class="separ"><img src="data/admin/pixel.gif" alt="" class="sep"></td></tr><tr><td class="se5"></td></tr></table>
<table class="adn">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.ADMIN_TEXT_TO_PUBLICATION1}</span></td>
</tr>
<tr><td><textarea name='textToPrePublication' class="admin" id="area1">{if $edit_news}{$edit_news.textToPrePublication}{else}{$textToPrePublication}{/if}</textarea></td>
</tr>
</table>
<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adn">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.ADMIN_TEXT_TO_PUBLICATION2}</span></td>
</tr>
<tr><td><textarea name='textToPublication' class="admin" id="area2">{if $edit_news}{$edit_news.textToPublication}{else}{$textToPublication}{/if}</textarea></td>
</tr>
</table>
<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adn">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.ADMIN_TEXT_TO_MAIL}</span></td>
</tr></table>
<textarea name='textToMail' class="admin" id="area3">{if $edit_news}{$edit_news.textToMail}{else}{$textToMail}{/if}</textarea>
<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adw"><tr><td><input type=checkbox name="send" {if $send == 1} checked {/if} ></td><td> {$smarty.const.ADMIN_SEND_NEWS_TO_SUBSCRIBERS}</td>
</tr></table>
<table class="adn"><tr><td class="se5"></td></tr></table>
<a href="#" onclick="document.getElementById('MainForm').submit(); return false" class="inl">{$smarty.const.SAVE_BUTTON}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="{$smarty.const.ADMIN_FILE}?dpt=modules&amp;sub=news" class="inl">{$smarty.const.CANCEL_BUTTON}</a>
<input type=hidden name="{if $edit_news}update_news{else}news_save{/if}" value="1">
{if $edit_news}<input type=hidden name="edit_news_id" value="{$edit_news_id}">{/if}
<input type=hidden name=dpt value=modules>
<input type=hidden name=sub value=news>
</form>
{if $smarty.const.CONF_EDITOR}
{literal}
<script type="text/javascript" src="fckeditor/fckeditor.js"></script>
<script type="text/javascript" src="fckeditor/ckfinder/ckfinder.js"></script>
<script type="text/javascript">
window.onload = function()
{
var oFCKeditor = new FCKeditor( 'area1',720,346) ;
{/literal}{php}
$dir1 = dirname($_SERVER['PHP_SELF']);
$sourcessrand = array("//" => "/", "\\" => "/");
$dir1 = strtr($dir1, $sourcessrand);
if ($dir1 != "/") $dir2 = "/"; else $dir2 = "";
echo "\n";
echo "oFCKeditor.BasePath = \"".$dir1.$dir2."fckeditor/\";\n";
{/php}{literal}
oFCKeditor.ReplaceTextarea() ;
var oFCKeditor2 = new FCKeditor( 'area2',720,346) ;
{/literal}{php}
$dir1 = dirname($_SERVER['PHP_SELF']);
$sourcessrand = array("//" => "/", "\\" => "/");
$dir1 = strtr($dir1, $sourcessrand);
if ($dir1 != "/") $dir2 = "/"; else $dir2 = "";
echo "\n";
echo "oFCKeditor2.BasePath = \"".$dir1.$dir2."fckeditor/\";\n";
{/php}{literal}
oFCKeditor2.ReplaceTextarea() ;
var oFCKeditor3 = new FCKeditor( 'area3',720,300) ;
{/literal}{php}
$dir1 = dirname($_SERVER['PHP_SELF']);
$sourcessrand = array("//" => "/", "\\" => "/");
$dir1 = strtr($dir1, $sourcessrand);
if ($dir1 != "/") $dir2 = "/"; else $dir2 = "";
echo "\n";
echo "oFCKeditor3.BasePath = \"".$dir1.$dir2."fckeditor/\";\n";
echo "oFCKeditor3.ToolbarSet = 'Basic';\n";
{/php}{literal}
oFCKeditor3.ReplaceTextarea() ;
}
</script>
{/literal}
{/if}
{if $invalid_date}<script type="text/javascript" defer>alert('{$smarty.const.ERROR_DATE}')</script>{/if}
{else}
<table class="adn">
<tr class="lineb">
<td align="left" class="toph3">{$smarty.const.ADMIN_NEWS_DATEF}</td>
<td align="left" width="100%">{$smarty.const.ADMIN_NEWS_NAMEF}</td>
<td align="right">{$smarty.const.ADMIN_NEWS_FUCTION}</td>
</tr>{assign var="admhl" value=0}
{section name=i loop=$news_posts}
                {if $admhl eq 1}
<tr><td colspan="3" class="separ"><img src="data/admin/pixel.gif" alt="" class="sep"></td></tr>
{else}{assign var="admhl" value=1}{/if}
<tr class="lineybig hover">
<td align="left">{$news_posts[i].add_date}</td>
<td align="left">{$news_posts[i].title}</td>
<td align="right"><a href="index.php?fullnews={$news_posts[i].NID}">{$smarty.const.ADMIN_SHOW_AUX_PAGE}</a>&nbsp;|&nbsp;<a href="{$urlToSubmit}&amp;edit={$news_posts[i].NID}">{$smarty.const.ADMIN_EDIT_SMALL}</a>&nbsp;|&nbsp;<a href="#" onclick="confirmDelete('{$news_posts[i].NID}','{$smarty.const.QUESTION_DELETE_CONFIRMATION}','{$urlToDelete}&amp;delete=');">X</a></td></tr>
{sectionelse}
<tr>
<td align="center" colspan="3" height="20">{$smarty.const.STRING_EMPTY_LIST}</td>
</tr>
{/section}
{if $navigator}
<tr><td colspan="3" class="navigator">{$navigator}</td>
</tr></table>
<table class="adn"><tr><td class="se5"></td></tr></table>
{else}</table>
<table class="adn"><tr><td class="separ"><img src="data/admin/pixel.gif" alt="" class="sep"></td></tr><tr><td class="se5"></td></tr></table>
{/if}
<a href="{$urlToSubmit}&amp;add_news" class="inl">{$smarty.const.ADMIN_NEWS_ADD}</a>
{/if}
<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adn"><tr><td class="help"><span class="titlecol2">{$smarty.const.USEFUL_FOR_YOU}</span><div class="helptext">{$smarty.const.ALERT_ADMIN2}</div></td>
        </tr>
      </table>
