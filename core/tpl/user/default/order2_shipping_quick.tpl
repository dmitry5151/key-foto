{* ������ ����� ������ ������� �������� (��� ����������� ���������� � ��������) *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?dpt=conf&amp;sub=shipping' title='`$smarty.const.EDIT_BUTTON`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$smarty.const.STRING_ORDERING`}{else}{assign var="postheader" value=$smarty.const.STRING_ORDERING}{/if}
{include file="header.tpl" header=$postheader}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{$smarty.const.STRING_ORDER_SHIPPING}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hmin" align="left">
	  <form name='MainForm' method="POST" action="" id="MainForm">
        {if $shipping_methods}
        <input type="hidden" name="continue_button" id="continue_button" value=2>
        {/if}
        <table cellspacing="1" cellpadding="0" width="100%" class="gre">
          <tr>
            <td class="lt pad" valign="middle" colspan="3">{$smarty.const.STRING_SELECT_ORDER_SHIPPING_METHOD_PROMPT}</td>
          </tr>
          {if $shipping_methods}
          {section name=i loop=$shipping_methods}
          {if $shipping_costs[i] ne "n/a"}
          <tr>
            <td class="pad" align="center" valign="middle"><input type="radio" name="select_shipping_method" id="select_shipping_method_{$smarty.section.i.index}" value="{$shipping_methods[i].SID}" {if $shipping_methods_count == 1} checked{/if}></td>
            <td class="pad" align="left" valign="middle" width="99%"><b>{$shipping_methods[i].Name}</b><br>
              {$shipping_methods[i].description}</td>
            <td class="pad" align="left" valign="middle" style="white-space: nowrap">{if $shipping_costs[i][0].rate ne ""}{count item=_CostsNum array=$shipping_costs[i]}
              {if $_CostsNum>1}
              <select name="shServiceID[{$shipping_methods[i].SID}]">
                {foreach from=$shipping_costs[i] item=_Rate}                                                
                <option value="{$_Rate.id}">{$_Rate.name} - {$_Rate.rate}</option>
                {/foreach}                                        
              </select>
              {else}{$shipping_costs[i][0].rate}{/if}{else}{$smarty.const.STRING_ZERO_SHIPPING}{/if}</td>
          </tr>
          {/if}
          {/section}
          {else}
          <tr>
            <td class="pad error" align="left" valign="middle">{$smarty.const.STRING_NO_SHIPPING_METHODS_TO_SELECT}</td>
          </tr>
          {/if}
        </table>
        <script type="text/javascript">
        function select_shipping_methodClickHandler()
        {literal}{{/literal}

        {if $shipping_methods_count > 1}
                        for( i=0; i<{$shipping_methods_count}; i++ )
                                if(document.getElementById('select_shipping_method_'+i))
                                if (document.getElementById('select_shipping_method_'+i).checked )
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
                                }{/literal}else return alert('{$smarty.const.STRING_SELECT_ORDER_SHIPPING_METHOD_PROMPT}');
        {elseif $shipping_methods_count eq 1}
                                document.getElementById('MainForm').submit();
                                return false;
		{/if}
		
        {literal}}{/literal}
        </script>
      </form>
	</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot"><a href="#" onclick="select_shipping_methodClickHandler(); return false;">{$smarty.const.CONTINUE_BUTTON}</a></td>
  </tr>
</table>