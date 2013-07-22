{* ������ ������ ����������� �������� ������ ������� *}
<article class="dwa-post dwa-article">
    <h1 class="dwa-postheader">{$smarty.const.ADMIN_SEARCH_BUTTON}</h1>
    <div class="dwa-postcontent dwa-postcontent-0 clearfix"><!-- �������� ����������� ���� -->
        <div class="dwa-content-layout"><!-- ���������� ��������� ���� -->
            <div class="dwa-content-layout-row">
            <div class="dwa-layout-cell layout-item-0" style="width: 100%" >
{if $products_to_show_count > 0}
<table cellspacing="0" cellpadding="0" width="100%" class="zebra">
  <tr>
    <td align="center" style="text-align: center">{$smarty.const.STRING_FOUND} <b>{$products_found}</b> {$smarty.const.STRING_PRODUCTS}</td>
  </tr>
</table>

{* ����� ���������� ������� *}

{if $string_product_sort}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center" style="text-align: center">{$string_product_sort}</td>
  </tr>
</table>
{/if}

{* ����� ��������� �� ��������� *}

{if $search_navigator}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center" style="text-align: center">{$search_navigator}</td>
  </tr>
</table>
{/if}

{* BEGIN Products table *}
<table cellspacing="0" cellpadding="0" width="100%" class="zebra">
  <thead style="background: url('data/ers/images/blockheader.png') repeat scroll 0 0 transparent;">
    <tr>
    {if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
      <th>{$smarty.const.STRING_PRODUCT_CODE}</th>
    {/if}
      <th>����</th>
      <th>{$smarty.const.TABLE_PRODUCT_NAME}</th>
      <th>������.</th>
      <th>��������������</th>    
      <th>{$smarty.const.CURRENT_PRICE}</th>
      <th>�����</th>
    </tr>
  </thead>
  <tbody>
    {section name=u loop=$products_to_show}
    <tr>
      {include file="product_brief-search.tpl" product_info=$products_to_show[u]}
	  </tr>
	  {/section}
  </tbody>
</table>
{* END Products table *}
<div class="fil"></div>

{* ����� ��������� �� ��������� *}

{if $search_navigator}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center" style="text-align: center">{$search_navigator}</td>
  </tr>
</table>
{/if}

{* ����� ���������� ������� *}

{if $string_product_sort}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cattop" align="center" style="text-align: center">{$string_product_sort}</td>
  </tr>
</table>
{/if}

<table cellspacing="0" cellpadding="0" width="100%" class="zebra">
  <tr>
    <td align="center" style="text-align: center">{$smarty.const.STRING_FOUND} <b>{$products_found}</b> {$smarty.const.STRING_PRODUCTS}</td>
  </tr>
</table>
{else}
<table cellspacing="0" cellpadding="0" width="100%" class="zebra">
  <tr>
    <td align="center">{$smarty.const.STRING_NO_MATCHES_FOUND}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{/if}
				</div>
            </div>
        </div>
    </div>
</article>