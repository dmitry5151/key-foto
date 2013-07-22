{* ������ ����� ������ ������� ������ (� ������������ ���������� � ��������) *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?dpt=conf&amp;sub=payment' title='`$smarty.const.EDIT_BUTTON`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$smarty.const.STRING_ORDERING`}{else}{assign var="postheader" value=$smarty.const.STRING_ORDERING}{/if}
{*include file="header.tpl" header=$postheader*}
<article class="dwa-post dwa-article">
    <h1 class="dwa-postheader">{$postheader}</h1>
    <div class="dwa-postcontent dwa-postcontent clearfix">
        <div class="dwa-content-layout">
            <div class="dwa-content-layout-row">
            <div class="dwa-layout-cell layout-item" style="width: 100%" >
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{$smarty.const.STRING_ORDER_PAYMENT}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hmin" align="left">
	  <form name='MainForm' method="POST" action="" id="MainForm">
      {if $payment_methods}{if $billingAddressID > 0 || $smarty.const.CONF_ORDERING_REQUEST_BILLING_ADDRESS == '0'}
      <input type="hidden" name="continue_button" id="continue_button" value=2>
      {else}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbtop error" align="center">{$smarty.const.STRING_PLEASE_SPECIFY_ADDRESS}</td>
        </tr>
      </table>
      {/if}{/if}
      <table cellspacing="1" cellpadding="0" width="100%" class="zebra">
        <tr>
          <td class="lt pad" valign="middle" colspan="2">{$smarty.const.STRING_SELECT_ORDER_PAYMENT_METHOD_PROMPT}</td>
        </tr>
        {if !$payment_methods}
        <tr>
          <td class="pad error" align="left" valign="middle">{$smarty.const.STRING_NO_PAYMENT_METHODS_TO_SELECT}</td>
        </tr>
      </table>
      {else}
      {section name=i loop=i loop=$payment_methods}
      <tr>
          <td class="pad" align="center" valign="middle"><input type="radio" name="select_payment_method" id="select_payment_method_{$smarty.section.i.index}"
                                {if $smarty.section.i.index == 0}
                                        checked
                                {/if}
                                value="{$payment_methods[i].PID}"
                                ></td>
          <td class="pad" width="99%" align="left" valign="middle"><b>{$payment_methods[i].Name}</b><br>{$payment_methods[i].description}</td>
      </tr>
      {/section}
      </table>
      <script type="text/javascript">
        function select_payment_methodClickHandler()
        {literal}{{/literal}
        {if $payment_methods_count > 1}
                        for( i=0; i<{$payment_methods_count}; i++ )
                                if(document.getElementById('select_payment_method_'+i))
                                if (document.getElementById('select_payment_method_'+i).checked )
                                {literal}
                                {
                                        document.getElementById('continue_button').value = 1;
                                        break;

                                }
                                {/literal}
                                if (document.getElementById('continue_button').value != 2 )
                                {literal}
                                {
                                        document.getElementById('MainForm').submit();
                                        return false;
                                }{/literal}else return alert('{$smarty.const.STRING_SELECT_ORDER_PAYMENT_METHOD_PROMPT}');

        {elseif $payment_methods_count eq 1}
                                document.getElementById('MainForm').submit();
                                return false;
        {/if}

        {literal}}{/literal}
      </script>
      {/if}
	  </form>
    </td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot"><a class="dwa-button" href="#" onclick="select_payment_methodClickHandler(); return false;">{$smarty.const.CONTINUE_BUTTON}</a></td>
  </tr>
</table>
</div>
            </div>
        </div>
    </div>
</article>