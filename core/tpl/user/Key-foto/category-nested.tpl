{* -> ShapeShift - ������, �������������� ���������� (� ����� ������ - ��������) ���������� �� ������� ��������
   -> ���� �������� � �������� Chrome � ��� �������� �� ��������� ���������� - ���������� ����������� � ����

<script src="data/{$smarty.const.TPL}/js/jquery.shapeshift.min.js"></script>
<script src="data/{$smarty.const.TPL}/js/jquery.ui.touch-punch.min.js"></script>*}

<script src="data/{$smarty.const.TPL}/js/jquery.nested.js"></script>
<script src="data/{$smarty.const.TPL}/js/makeboxes.js"></script>
<link rel="stylesheet" href="data/{$smarty.const.TPL}/js/nested.css" type="text/css" media="screen" />
{* FancyBox - ������ ������������ ���������� � ��������� (��������, �������, �������, ����� *}
<link rel="stylesheet" href="data/{$smarty.const.TPL}/fancybox/source/jquery.fancybox.css" type="text/css" media="screen" />
<script type="text/javascript" src="data/{$smarty.const.TPL}/fancybox/source/jquery.fancybox.pack.js"></script>
{literal}
<script>

$(function() {
    /*
    $('#container-ss').shapeshift({
        gutterX: 3,
        gutterY: 0,
        paddingX: 0,
        paddingY: 0,
    }); // ������������� ������������ ����� Shapeshift
        
    $( document ).tooltip({
            items: "img, [data-geo], [title], [tip]",
            track: true,
            content: function() {
                    var element = $( this );                        
                    if ( element.is( "[tip]" ) ) {
                            return element.attr( "tip" );
                    }
                    if ( element.is( "[title]" ) ) {
                            return element.attr( "title" );
                    }
            }
    });
    */
    $("#container-nested").nested({
        selector: '.box-nested',
        minWidth: 230
    });
    // ������ ����������� ��������� � ��������
    var duration = 200;
    var more = $('#container-ss div.more-ss');
    more.each(function(){
        $(this).hover(function(){
            $(this).find('.caption-ss').slideDown(duration)
        }, function(){
            $(this).find('.caption-ss').slideUp(duration)
        });
    });
    // ���������� ������ FancyBox
    $(".fancybox").fancybox();
});
</script>
{/literal}
{* ������ ������ ������� � ���������� *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?categoryID=`$selected_category.categoryID`&amp;eaction=cat' title='`$smarty.const.ADMIN_ADMIN_MENUNEW1`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$categoryName`}{else}{assign var="postheader" value=$categoryName}{/if}

{* �������� � ������ *}

<article class="dwa-post dwa-article">
    <h1 style="margin: 15px 0" class="dwa-postheader">{if $page_title ne "������� ���������"}{$postheader}{else}����� �� ������� ������{/if}</h1>
    <div class="dwa-postcontent dwa-postcontent clearfix">
        <div class="dwa-content-layout">
            <div class="dwa-content-layout-row">
            <div class="dwa-layout-cell layout-item" style="width: 100%" >
<table cellspacing="0" cellpadding="0" width="100%" class="navigator">
  <tr>
    <td class="cbt" align="left">{if $smarty.const.CONF_SHOW_COUNTPROD eq 1}<span style="float: right;">{$smarty.const.STRING_COUNTPROD}: {$products_to_showc}</span>{/if}<a href="{$smarty.const.CONF_FULL_SHOP_URL}">{$smarty.const.LINK_TO_HOMEPAGE}</a>{section name=i loop=$product_category_path}{if $product_category_path[i].categoryID != 1} / <a href="{$product_category_path[i]|@fu_make_url}">{$product_category_path[i].name}</a>{/if}{/section}</td>
  </tr>
</table>
    <div class="fil2"></div>
{* ����� �������� ��������� (���� ����) *}

{if $selected_category.description and $selected_category.description ne "<br>"}
{*include file="header.tpl" header=$smarty.const.STRING_CATEGORY_DESK*}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td align="left">{*if $selected_category.picture}<img src="data/category/{$selected_category.picture}" alt="{$selected_category.name}" align="left" style="margin: 0px 6px 6px 0px;" width="300">{/if*}{$selected_category.description}</td>
  </tr>
</table>
{/if}
{* ����� �������� ������������ (���� ����) *}

{if $catrescur}
{section name=r loop=$catrescur}
{if $catrescur[r][3] != ""}
{assign var="urlRewr" value=$catrescur[r]|@fu_make_url}
{assign var="tlink" value="<a class='phead' href='`$urlRewr`'>`$catrescur[r].name`</a>"}
{include file="header.tpl" header=$tlink}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">{if $catrescur[r].picture}<a href="{$catrescur[r]|@fu_make_url}"><img src="data/category/{$catrescur[r].picture}" alt="{$catrescur[r].name}" title="{$catrescur[r].name}" align="left" style="margin: 0px 6px 6px 0px;"></a>{/if}{$catrescur[r].description}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot"><a href="{$catrescur[r]|@fu_make_url}">{$smarty.const.STRING_GO_PODCAT}</a></td>
  </tr>
</table>
{/if}
{/section}
{/if}

{if $products_to_show}

{* ����� ���������� ������� *}

 {if $string_product_sort}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
      <td class="cattop" align="center" style="text-align: center">{$string_product_sort}</td>
  </tr>
</table>
{/if}

{* ����� ��������� �� ��������� *}

{if $catalog_navigator}
<div class="dwa-pager">{$catalog_navigator}</div>
{/if}

{* ����� ������� *}
<div id="container-nested">
{section name=u loop=$products_to_show}
    <div class="box-nested size11">
        {include file="product_brief-nested.tpl" product_info=$products_to_show[u]}
    </div>
{/section}
</div>
<div class="cleared"></div>

{* ����� ��������� �� ��������� *}

{if $catalog_navigator}
<div class="dwa-pager">{$catalog_navigator}</div>
{/if}

{* ����� ���������� ������� *}

{if $string_product_sort}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
      <td class="cattop" align="center" style="text-align: center">{$string_product_sort}</td>
  </tr>
</table>
{/if}

{else}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop error" align="center">{if !$search_with_change_category_ability || $advanced_search_in_category}{if $advanced_search_in_category}{$smarty.const.STRING_EMPTY_SEARCH_RESULT}{else}{$smarty.const.STRING_EMPTY_CATEGORY}{/if}{/if}</td>
  </tr>
</table>
{/if}

{* ����� ������ �� �������� ������������� � ��������� *}

{if $categorylinkscat}
{include file="header.tpl" header=$smarty.const.STRING_CAT_USE_AUX}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">{assign var="sett" value=0}
      {section name=icat loop=$categorylinkscat}
      <div {if $sett eq 1}style="margin-top: 4px;"{else}{assign var="sett" value=1}{/if}><a href="{$categorylinkscat[icat][0]|@fu_make_url_pages}">{$categorylinkscat[icat][1]}</a></div>
      {/section}
	</td>
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