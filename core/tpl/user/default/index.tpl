{* ������� ����-������ ������� �������� *}
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
{* ����������� ����� ���������� *}
{include file="head.tpl"}
<body>
{if $smarty.const.CONF_SHOP_BILD eq 1 and $isadmin ne "yes"}

{* ��������� � ������������ *}

<table cellspacing="0" cellpadding="0" width="100%" height="100%">
  <tr>
    <td class="profi arc" valign="middle" align="center"><img src="data/{$smarty.const.TPL}/bild.gif" alt="">
	<br><br>{$smarty.const.STRING_BILD}<br>{$smarty.const.STRING_BILD_DES}</td>
  </tr>
</table>

{else}

<table cellspacing="0" cellpadding="0" width="100%"><tr><td valign="top" align="left">

{* ������ ���������� ���������� *}

{if $smarty.const.CONF_DISPLAY_INFO eq 1 and $isadmin eq "yes"}
<table cellspacing="0" cellpadding="0" width="100%" class="print">
  <tr class="mid">
    <td style="background: url('data/admin/fonbot.gif'); height: 23px;"><img src="data/admin/sep.gif" alt=""></td>
    <td width="100%" style="background: url('data/admin/fonbot.gif'); height: 23px;">
      <table cellspacing="0" cellpadding="0" width="100%">
	    <tr class="mid">
	      <td style="padding-bottom: 2px;" nowrap="nowrap" class="stat">&nbsp;&nbsp;{$smarty.const.STRING_EXE_DATA}:&nbsp;<span id="tgenexe">0.000</span>&nbsp;{$smarty.const.TIME_SEK}</td>
	      <td nowrap="nowrap"><img src="data/admin/sep2.gif" alt=""></td>
	      <td style="padding-bottom: 2px;" nowrap="nowrap" class="stat">{$smarty.const.STRING_PREEXE_DATA}:&nbsp;<span id="tgencompile">0.000</span>&nbsp;{$smarty.const.TIME_SEK}</td>
	      <td nowrap="nowrap"><img src="data/admin/sep2.gif" alt=""></td>
	      <td style="padding-bottom: 2px;" nowrap="nowrap" class="stat">{$smarty.const.BD_DO_TIME}:&nbsp;<span id="tgendb">0.000</span>&nbsp;{$smarty.const.TIME_SEK}</td>
	      <td nowrap="nowrap"><img src="data/admin/sep2.gif" alt=""></td>
	      <td style="padding-bottom: 2px;" nowrap="nowrap" class="stat">{$smarty.const.STRING_ALL_EXETIME}:&nbsp;<span id="tgenall">0.000</span>&nbsp;{$smarty.const.TIME_SEK}</td>
	      <td nowrap="nowrap"><img src="data/admin/sep2.gif" alt=""></td>
	      <td width="95%" style="padding-bottom: 2px;" nowrap="nowrap" class="stat">{$smarty.const.STRING_DO_COUNT}:&nbsp;<span id="tgensql">0</span></td>
		</tr>
      </table>
	</td> 
  </tr>
</table>
<script type="text/javascript">doLStat('do=stat');</script>
{/if}

{* ����� ��������� �� ������� *}
{if $exploerrors ne ""}{$exploerrors}{/if}

{* ���� *}

<div class="fix print"></div>
<table cellspacing="0" cellpadding="0" width="100%" class="print">
  <tr>
    <td class="headlink bf" align="left"><a href="{$smarty.const.CONF_FULL_SHOP_URL}">�������</a>
    <span class="delm">|</span><a href="{if $smarty.const.CONF_MOD_REWRITE eq 1}news.html{else}index.php?news=yes{/if}">�������</a>
    <span class="delm">|</span><a href="{if $smarty.const.CONF_MOD_REWRITE eq 1}price.html{else}index.php?show_price=yes{/if}">�����-����</a>
    <span class="delm">|</span><a href="{1|@fu_make_url_pages}">� ��������</a>
    <span class="delm">|</span><a href="index.php?links_exchange=yes">C�����</a>
    <span class="delm">|</span><a href="{if $smarty.const.CONF_OPEN_SHOPPING_CART_IN_NEW_WINDOW eq 1}javascript:open_window('index.php?do=cart',500,300);{else}{if $smarty.const.CONF_MOD_REWRITE eq 1}cart.html{else}index.php?shopping_cart=yes{/if}{/if}">�������</a>
    <span class="delm">|</span><a href="{if $smarty.const.CONF_MOD_REWRITE eq 1}feedback.html{else}index.php?feedback=yes{/if}">��������</a></td>
  </tr>
</table>

{* ����� *}

<table cellspacing="0" cellpadding="0" width="100%" class="print">
  <tr>
    <td class="htba" valign="middle" align="left"><span class="fonta">�������� ��������</span><br><span class="fontb">�������� ��� ������ ������ ��������-��������</span></td>
    <td class="htbb" valign="middle" align="center"></td>
  </tr>
</table>

{* ����� ������ ������� *}

<table cellspacing="0" cellpadding="0" width="100%" class="print">
  <tr>
    <td class="poisk">
      <form action="index.php" method="get" name="formpoisk" id="formpoisk">
        <table cellspacing="0" cellpadding="0">
          <tr class="mid">
            <td class="poisk1"><b>{$smarty.const.STRING_SEARCH}</b></td>
            <td>{section name=sert loop=$searchstrings}<input type="hidden" name='search_string_{$smarty.section.sert.index}' value='{$searchstrings[sert]}'>{/section}
            <input type="text" name="searchstring" id="searchauto" class="pform" value="{$searchstring}"></td>
            <td style="padding: 0px 20px 0px 10px;"><input type="image" src="data/{$smarty.const.TPL}/srg.gif"></td>
            <td><input type="checkbox" name="inside" {if $search_in_results}checked{/if}></td>
            <td style="padding: 0px 34px 0px 4px; color: #ffffff;"><b>{$smarty.const.STRING_SEARCH_IN_RESULTS}</b></td>
            <td><a href="{if $smarty.const.CONF_MOD_REWRITE eq 1}wide_search.html{else}index.php?search_with_change_category_ability=yes{/if}"><b>{$smarty.const.ADVANCED_SEARCH_LINK}</b></a></td>
          </tr>
        </table>
      </form>
    </td>
  </tr>
</table>

{* ����������� ����� *}

<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="container">
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
		  
		  {* ����� ������� (���� ���� �����) *}
          
		  {if $countlb > 0}
          <td id="left" valign="top" align="center" class="print"><div class="fil1 white"></div>
          {include file="blocks.tpl" binfo=$left_blocks bclass="hdb" nopad=1 balign="center"}
          <img src="data/{$smarty.const.TPL}/pixel.gif" class="fixwidth" alt="">
          </td>
          {/if}
          
		  <td class="center" align="left" valign="top">
		  
		  {* ������� ����� *}
          
		  {include file="blocks.tpl" binfo=$top_blocks bclass="hdbtop" balign="left"}
		  
		  {* ����� ����������� �������� *}
          
		  {include file="$main_content_template"}
		  
		  {* ������ ����� *}
          
		  {include file="blocks.tpl" binfo=$bottom_blocks bclass="hdbtop" balign="left"}
          </td>
		  
		  {* ������ ������� (���� ���� �����) *}
		  
		  {if $countrb > 0}
          <td id="right" valign="top" align="center" class="print"><div class="fil1 white"></div>
          {include file="blocks.tpl" binfo=$right_blocks bclass="hdb" nopad=1 balign="center"}
          <img src="data/{$smarty.const.TPL}/pixel.gif" class="fixwidth" alt=""></td>
		  {/if}
		  
        </tr>
      </table>
    </td>
  </tr>
</table>

{* ������ *}

<table cellspacing="0" cellpadding="0" width="100%" class="print">
 <tr>
  <td>
    <div class="fix" style="border-bottom: 1px solid #ffffff;"></div>
    <table cellspacing="0" cellpadding="0" width="100%"><tr><td class="btbl">� 2009 ��������-�������</td></tr></table>
  </td>
 </tr>
</table>

</td></tr></table>

{* ���������� �������� ajax ����� *}
<script type="text/javascript">printcart();</script>

{/if}
</body></html>