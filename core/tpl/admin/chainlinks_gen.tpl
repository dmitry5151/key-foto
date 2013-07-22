{if $resultMsg}<div style="width:100%;border:#6f8ddf solid 1px;margin:10px 0px;padding:5px 10px;font-weight:bold;color:#6f8ddf;">
	{$resultMsg|escape:'html'}
</div>{/if}

<form action="admin.php?dpt=modules&sub=chainlinks_gen" method="post" name="chainlinks_gen" id="chainlinks_gen">

<input type="hidden" name="fACTION" value="chainlinking_gen">
<tbody>
	<tr class="lineb">
		<td align="left">ћаксимальное количество ссылок в блоке</td>
	</tr>
	<tr class="lins">
		<td align="left">
			<input name="linksCount" value="{$linksCount}" size="20" class="textp" maxlength="2" type="text" title="„исло от 0 до 10">
		</td>
	</tr>
	<tr class="lins">
		<td align="left">
		ѕерелинковка ограничена категори€ми:
		<input name="catlist" value="{$catlist|escape:'html'}" size="50" class="textp" maxlength="300" type="text" title="—писок цифровых ID категорий через зап€тую">
		</td>
	</tr>
	<tr class="lins">
		<td align="left">
			<a href="#" onclick="document.getElementById('chainlinks_gen').submit(); return false" class="inl">√енерировать</a>
		</td>
	</tr>
</tbody>

</form>


<table class="adn"><tr><td class="se6"></td></tr></table>
<table class="adn">
  <tr>
    <td class="help"><span class="titlecol2">{$smarty.const.USEFUL_FOR_YOU}</span>
<div class="helptext">
<p>ѕерелинковка сайта цыклическими ссылками поднимает статический вес внутренних страниц в поисковых системах. —сылки из каждого товара ведут на товары других категорий, поэтому наиболее эффективно модуль перелинковки работает с каталогом, где много категорий и значительное количество товаров в них.</p>
<p><strong>¬нимание!</strong> јвтоматическа€ перелинковка всех товаров разрывает все существующие ссылочные циклы и создает новые, что может быть нежелательно дл€ полностью проиндексированного сайта.</p>
<p>“ехническа€ поддержка - <a style="text-decoration:underline;" href="http://trickywebs.org.ua/contacts.html?from=modShopcmsChainlinks" target="_blank" title="–азработка модулей и плагинов дл€ CMS (откроетс€ в новом окне)">http://trickywebs.org.ua</a></p>
</div></td>
  </tr>
</table>
