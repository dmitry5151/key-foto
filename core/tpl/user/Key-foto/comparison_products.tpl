{* шаблон раздела сравнения товаров *}

<article class="dwa-post dwa-article">
    <h1 style="margin: 15px 0 0 0" class="dwa-postheader">{$smarty.const.STRING_PRODUCT_COMPARISON}</h1>
    <div class="dwa-postcontent dwa-postcontent clearfix">
        <div class="dwa-content-layout">
            <div class="dwa-content-layout-row">
            <div class="dwa-layout-cell layout-item" style="width: 100%" >
            <div style="margin: 15px 0" align="left"><button class="dwa-button" type="button" onclick="javascript:history.back();">Вернуться назад</button></div>
<table cellspacing="1" cellpadding="0" width="100%" class="zebra">
  <thead style="background: url('data/ers/images/blockheader.png') repeat scroll 0 0 transparent;">  
    <tr>
      {* названия товаров *}
      <th class="lt pad" align="left" valign="middle" width="5%" nowrap="nowrap">{$smarty.const.TABLE_PRODUCT_NAME}</th>
      {section name=i loop=$products}
      <th class="pad" valign="middle" align="left" width="{math equation="round(95 / $products_count)"}%"><a href='index.php?productID={$products[i].productID}'>{$products[i].name}</a></th>
      {/section}
    </tr>
  </thead>
  <tbody>
    <tr>
      {* фотографии товаров *}
      <td class="lt pad" valign="middle" align="left" nowrap="nowrap">{$smarty.const.ADMIN_PRODUCT_PICTURE}</td>
      {section name=i loop=$products}
      <td class="pad" valign="middle" align="left">{if $products[i].picture}<img src="data/small/{$products[i].picture}" alt="{$products[i].name}" width="200" />{else}{if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}<img src="data/empty.gif" alt="">{else}-{/if}{/if}</td>
      {/section}
    </tr>
    <tr>
      {* цены товаров *}
      <td class="lt pad" valign="middle" align="left">{$smarty.const.STRING_PRODUCT_PRICE}</td>
      {section name=i loop=$products}
      <td class="pad price" valign="middle" align="left">{$products[i].PriceWithUnit}</td>
      {/section}
    </tr>
    <tr>
      {* описания товаров *}
      <td class="lt pad" valign="middle" align="left">{$smarty.const.STRING_PRODUCT_BRIEF_DESC}</td>
      {section name=i loop=$products}
      <td class="pad" valign="top" style="vertical-align:top" align="left">{if $products[i].brief_description}{$products[i].brief_description}{else}-{/if}</td>
      {/section}
    </tr>
    {section name=i loop=$definedOptions}
    <tr>
      {* характеристики товаров *}
      <td class="lt pad" valign="middle" align="left" nowrap="nowrap">{$definedOptions[i].name}</td>
      {section name=j loop=$products}
      <td class="pad" valign="middle" align="left">{$products[j][i]}</td>
      {/section}
    </tr>
    {/section}
  </tbody>
</table>
<div style="margin: 15px 0" align="left"><button class="dwa-button" type="button" onclick="javascript:history.back();">Вернуться назад</button></div>
				</div>
            </div>
        </div>
    </div>
</article>
