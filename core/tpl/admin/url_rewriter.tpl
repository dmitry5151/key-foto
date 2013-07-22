<style type="text/css">{literal}

  table.myForm label {
    position: relative;
    top: -3px;
  }
  
  table.myForm {
    border: #D6DFF7 solid 1px;
    margin-bottom: 10px;
  }

{/literal}</style>

{if $errorMsg}<div style="width:100%;border:#ff0000 solid 1px;margin:10px 0px;padding:5px 10px;font-weight:bold;color:#ff0000;">
	������: {$errorMsg}
</div>{/if}
{if $resultMsg}<div style="width:100%;border:#6f8ddf solid 1px;margin:10px 0px;padding:5px 10px;font-weight:bold;color:#6f8ddf;">
	{$resultMsg}
</div>{/if}

<!-- BEGIN Auto-Transliterator Form -->
<form action="{$smarty.const.ADMIN_FILE}?dpt=modules&sub=url_rewriter" method="post" name="url_transliterator" id="url_transliterator" onsubmit="JavaScript: return fu_transliterator_submit();">
<input type="hidden" name="fACTION" value="url_transliterator">

<table class="myForm">
  <tbody>
	  <tr class="lineb">
		  <td align="left">
		    �������������� ���������� �������<br />
		    <span style="font-weight:normal;color:gray;">URL �������� ����� ������ ��������������� �� ��������</span>
		    </td>
	  </tr>
	  <tr class="lins">
		  <td align="left">
        <strong>������������ ������ ���:</strong><br />
			  <input name="setCatSlugs" id="cb_setCatSlugs" type="checkbox" value="1" checked><label for="cb_setCatSlugs">�������� �������</label><br />
			  <input name="setPagesSlugs" id="cb_setPagesSlugs" type="checkbox" value="1" checked><label for="cb_setPagesSlugs">����������� �������</label><br />
			  <input name="setNewsSlugs" id="cb_setNewsSlugs" type="checkbox" value="1" checked><label for="cb_setNewsSlugs">��������</label><br />
			  <br />
			  <input name="rewriteExistingSlugs" id="cb_rewriteExistingSlugs" type="checkbox" value="1"><label for="cb_rewriteExistingSlugs">������������ ������, ������� ��� ������</label><br />
			  <input name="lowercase" id="cb_lowercase" type="checkbox" value="1" checked><label for="cb_lowercase">�� ������������ ������� ������� � �������</label><br />
			  <input name="remHtmlExt" id="cb_remHtmlExt" type="checkbox" value="1"><label for="cb_remHtmlExt">������ ������� ".html"</label><br />
		  </td>
	  </tr>
	  <tr class="lins">
		  <td align="left">
    		<input type="submit" name="submit" value="��������������" />
		  </td>
	  </tr>
  </tbody>
</table>

</form>
<!-- BEGIN Auto-Transliterator Form -->


<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adn">
  <tr>
    <td class="help"><span class="titlecol2">{$smarty.const.USEFUL_FOR_YOU}</span>
<div class="helptext">
<p>������ <strong>"��� ������"</strong> ��������� <strong>�������� ��� URL ������</strong> ��� ������� ��������, � ����� ��� �������� � ����������� �������.</p>
<p>��� ���������� ������ ������ ����� �������������� <strong>��� ������������</strong> ���������������� ������� �����, ������� � ���� ����� ����� ����� � ����� <i>/core/tpl/user/{$smarty.const.CONF_DEFAULT_TEMPLATE}/</i></p>
<p>���������� � ����������� ��������� ������ - <u><a href="http://shopcms-moduli.com/contacts.html?from=shopcmsAdmModFriendlyUrls" target="_blank" title="������� ������, ��������� � ����� �������">http://shopcms-moduli.com/contacts.html</a></u></p>
</div></td>
  </tr>
</table>
