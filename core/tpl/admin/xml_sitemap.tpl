<h1 style="margin-bottom:-4px;">��������� Sitemap �����</h1>

{if $resultMsg}<div style="width:100%;border:#6f8ddf solid 1px;margin:10px 0px;padding:5px 10px;font-weight:bold;color:#6f8ddf;">
	{$resultMsg|escape:'html'}
</div>{/if}
{if $resultError}<div style="width:100%;border:#f00 solid 1px;margin:10px 0px;padding:5px 10px;font-weight:bold;color:#f00;">
	������: {$resultError|escape:'html'}
</div>{/if}
{if $sitemapFileDate}<div style="width:100%;margin:10px 0px;padding:5px 10px;font-style:italic;">
	���� ������������ {$sitemapFileDate|escape:'html'}
</div>{/if}

<form action="admin.php?dpt=modules&sub=xml_sitemap" method="post" name="xml_sitemap" id="xml_sitemap">

<input type="hidden" name="fACTION" value="gen_sitemap">
<tbody>
	<tr class="lins">
		<td align="left">
		  <p><strong>�������� � ����� ����� �������:</strong></p>
  		<input type="checkbox" id="includeCatalog" name="includeCatalog" value="1"{if !$smarty.post.fACTION || $smarty.post.includeCatalog} checked="checked"{/if} />&nbsp;<label for="includeCatalog" style="position:relative;top:-4px;">������� �������</label><br />
  		<input type="checkbox" id="includeStatpages" name="includeStatpages" value="1"{if !$smarty.post.fACTION || $smarty.post.includeStatpages} checked="checked"{/if} />&nbsp;<label for="includeStatpages" style="position:relative;top:-4px;">����������� ��������</label><br />
  		<input type="checkbox" id="includeNews" name="includeNews" value="1"{if !$smarty.post.fACTION || $smarty.post.includeNews} checked="checked"{/if} />&nbsp;<label for="includeNews" style="position:relative;top:-4px;">�������</label><br />
  		{if $moduleArticles}<input type="checkbox" id="includeArticles" name="includeArticles" value="1"{if !$smarty.post.fACTION || $smarty.post.includeArticles} checked="checked"{/if} />&nbsp;<label for="includeArticles" style="position:relative;top:-4px;">������</label><br />{/if}
		</td>
	</tr>
	<tr class="lins">
		<td align="left">
			<input type="submit" name="submit" value="������������" />
		</td>
	</tr>
</tbody>

</form>


<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adn">
  <tr>
    <td class="help"><span class="titlecol2">{$smarty.const.USEFUL_FOR_YOU}</span>
<div class="helptext">
<p>������ ��� ��������� ����� ����� � <a style="text-decoration:underline;" href="http://www.sitemaps.org/" target="_blank" title="������� ������, ��������� � ����� ����">������� XMS Sitemap</a>. ��������������� ����� �������� �� ������ <a style="text-decoration:underline;" href="{$sitemapUrl}">{$sitemapUrl}</a></p>
<p>����������� ��������� - <a style="text-decoration:underline;" href="http://shopcms-moduli.com/contacts.html?from=modShopcmsXmlSitemap" target="_blank" title="���������� ������� � �������� ��� CMS (��������� � ����� ����)">http://shopcms-moduli.com/contacts.html</a></p>
</div></td>
  </tr>
</table>
