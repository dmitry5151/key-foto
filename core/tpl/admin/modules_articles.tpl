{if $articles_editor eq 1}

<script type="text/javascript">{literal}
function art_translit(s){
  var a=new Array('�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�','�',' ','\'',',')
  var b=new Array('a','b','v','g','d','e','yo','zh','z','y','i','y','k','l','m','n','o','p','r','s','t','u','f','h','ts','ch','sh','sch','','','e','yu','ya','yi','i','ye','-','','')
  var x=s.toLowerCase()
  for(i=0;i<a.length;i++){
	  y=eval('/'+a[i]+'/g');
	  x=x.replace(y,b[i]);
  }
  x = x.replace(/[^a-zA-Z0-9\-]/, '-');
  x = x.replace(/[\(\)"]/, '-');
  x = x.replace(/-[-]+/, '-');
  x = x.replace(/-$/, '');
  return x;
}
function art_auto_uri() {
  document.getElementById('ArticleForm').uri.value = art_translit(document.getElementById('ArticleForm').title.value);
}
{/literal}</script>

<script type="text/javascript" src="data/admin/jquery.min.js"></script>
<form action="{$urlToSubmit}" method=POST name='ArticleForm' id='ArticleForm'>
<table class="adn">
<tr class="lineb">
  <td align="left" colspan="2">{if $edit_articles}{$smarty.const.STRING_EDIT_ARTICLES}{else}{$smarty.const.ADMIN_NEW_NEWARTICLES}{/if}</td>
</tr>
<tr class="lins">
  <td align="right" width="100px">{$smarty.const.ADMIN_ARTICLES_TITLE}:</td><td><input type=text name='title' value='{if $edit_articles}{$edit_articles.title}{else}{$title}{/if}' style="width: 440px;" class="textp" onblur="JavaScript:if(!$('[name=slug]').attr('value')) art_auto_uri();"></td>
</tr>
<tr class="lins">
  <td align="right">{$smarty.const.ADMIN_ARTICLES_URI}:</td><td><input type=text name='uri' value='{if $edit_articles}{$edit_articles.uri}{else}{$uri}{/if}' style="width: 150px;" class="textp">&nbsp;<a href="JavaScript:art_auto_uri()" style="text-decoration:underline;">[��������]</a></td>
</tr>
</table>
<table class="adn"><tr><td class="separ"><img src="data/admin/pixel.gif" alt="" class="sep"></td></tr><tr><td class="se5"></td></tr></table>
<table class="adn">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.ADMIN_ARTICLES_TEXT_TO_PUBLICATION1}</span></td>
</tr>
<tr><td><textarea name='textToPrePublication' class="admin" id="area1">{if $edit_articles}{$edit_articles.textToPrePublication}{else}{$textToPrePublication}{/if}</textarea></td>
</tr>
</table>
<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adn">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.ADMIN_ARTICLES_TEXT_TO_PUBLICATION2}</span></td>
</tr>
<tr><td><textarea name='textToPublication' class="admin" id="area2">{if $edit_articles}{$edit_articles.textToPublication}{else}{$textToPublication}{/if}</textarea></td>
</tr>
</table>


<table class="adw">

<tr><td width="50%">
<table class="adn">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.ADMIN_PRODUCT_DESC2}</span></td>
</tr>
<tr><td align="left"><textarea name='meta_description' id="meta_description" class="adminall" style="margin-right: 38px;">{if $edit_articles}{$edit_articles.meta_description}{/if}</textarea></td>
</tr>
</table>
</td>
<td width="50%">
<table class="adn">
<tr class="linsz">
<td align="left"><span class="titlecol2">{$smarty.const.ADMIN_PRODUCT_DESC3}</span></td>
</tr>

<tr><td align="left"><textarea name='meta_keywords' id="meta_keywords" class="adminall">{if $edit_articles}{$edit_articles.meta_keywords}{/if}</textarea></td></tr>
</table>
</td></tr></table>


<table class="adn"><tr><td class="se6"></td></tr></table>

<a href="#" onclick="document.getElementById('ArticleForm').submit(); return false" class="inl">{$smarty.const.SAVE_BUTTON}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href="{$smarty.const.ADMIN_FILE}?dpt=modules&amp;sub=articles" class="inl">{$smarty.const.CANCEL_BUTTON}</a>
<input type=hidden name="{if $edit_articles}update_articles{else}articles_save{/if}" value="1">
{if $edit_articles}<input type=hidden name="edit_articles_id" value="{$edit_articles_id}">{/if}
<input type=hidden name=dpt value=modules>
<input type=hidden name=sub value=articles>
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
//var oFCKeditor3 = new FCKeditor( 'area3',720,300) ;
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
<td align="left" width="100%">{$smarty.const.ADMIN_ARTICLES_NAMEF}</td>
<td align="left" class="toph3">{$smarty.const.ADMIN_ARTICLES_DATEM}</td>
<td align="right">{$smarty.const.ADMIN_ARTICLES_FUCTION}</td>
</tr>{assign var="admhl" value=0}
{section name=i loop=$articles_posts}
                {if $admhl eq 1}
<tr><td colspan="3" class="separ"><img src="data/admin/pixel.gif" alt="" class="sep"></td></tr>
{else}{assign var="admhl" value=1}{/if}
<tr class="lineybig hover">
<td align="left"><a href="{$urlToSubmit}&amp;edit={$articles_posts[i].AID}" title="{$smarty.const.ADMIN_EDIT_SMALL}" style="text-decoration:underline;">{$articles_posts[i].title}</a></td>
<td align="left">{$articles_posts[i].update_date}</td>
<td align="right"><a href="{$smarty.const.ARTICLES_ROOT}/{$articles_posts[i].uri}.html">{$smarty.const.ADMIN_SHOW_AUX_PAGE}</a>&nbsp;|&nbsp;<a href="#" onclick="confirmDelete('{$articles_posts[i].AID}','{$smarty.const.QUESTION_DELETE_CONFIRMATION}','{$urlToDelete}&amp;delete=');">X</a></td></tr>
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
<a href="{$urlToSubmit}&amp;add_articles" class="inl">{$smarty.const.ADMIN_ARTICLES_ADD}</a>
{/if}
<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adn"><tr><td class="help"><span class="titlecol2">{$smarty.const.USEFUL_FOR_YOU}</span><div class="helptext">
<p>������ <strong>"������"</strong>.</p>
<p>���������� � ����������� ��������� ������ - <u><a href="http://shopcms-moduli.com/contacts.html?from=shopcmsAdmModArticles" target="_blank" title="������� ������, ��������� � ����� ����">http://shopcms-moduli.com/contacts.html</a></u></p>
</div></td>
        </tr>
      </table>
