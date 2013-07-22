{* шаблон журнала посещений *}

{*include file="header.tpl.html" header=$smarty.const.STRING_VISIT_LOG*}
<article class="dwa-post dwa-article">
    <h2 class="dwa-postheader">{$smarty.const.STRING_VISIT_LOG}</h2>
    <div class="dwa-postcontent dwa-postcontent clearfix">
        <div class="dwa-content-layout">
            <div class="dwa-content-layout-row">
            <div class="dwa-layout-cell layout-item" style="width: 100%" >
<table cellspacing="0" cellpadding="0" width="100%" class="navigator">
  <tr>
    <td align="center"><a href='index.php?contact_info=yes'>{$smarty.const.STRING_CONTACT_INFORMATION_DOWN_CASE}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?address_book=yes'>{$smarty.const.STRING_ADDRESS_BOOK}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?order_history=yes'>{$smarty.const.STRING_ORDER_HISTORY}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?visit_history=yes'>{$smarty.const.STRING_VISIT_HISTORY}</a>{if $smarty.const.CONF_AFFILIATE_PROGRAM_ENABLED}&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?affiliate=yes&amp;sub=balance'>{$smarty.const.STRING_AFFILIATE_PROGRAM}</a>{/if}</td>
  </tr>
</table>
<div class="fil2"></div>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hmin">
	  {if $visits}
      <table cellspacing="1" cellpadding="0" width="100%" class="zebra">
        <tr>
          <td class="lt pad" align="left">{$smarty.const.STRING_VISIT_LOG}</td>
        </tr>
        {section name=i loop=$visits}
        <tr>
          <td class="padt" align="left">{$visits[i].customer_logtime}</td>
        </tr>
        {/section}
      </table>
      {else}{$smarty.const.STRING_EMPTY_LIST}{/if}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
</div>
            </div>
        </div>
    </div>
</article>
