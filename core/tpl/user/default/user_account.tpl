{* ������� ������� '������ �������' *}

{include file="header.tpl" header=$smarty.const.STRING_ACC_USER}

<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left"><a href='index.php?contact_info=yes'>{$smarty.const.STRING_CONTACT_INFORMATION_DOWN_CASE}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?address_book=yes'>{$smarty.const.STRING_ADDRESS_BOOK}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?order_history=yes'>{$smarty.const.STRING_ORDER_HISTORY}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?visit_history=yes'>{$smarty.const.STRING_VISIT_HISTORY}</a>{if $smarty.const.CONF_AFFILIATE_PROGRAM_ENABLED}&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?affiliate=yes&amp;sub=balance'>{$smarty.const.STRING_AFFILIATE_PROGRAM}</a>{/if}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td width="50%" align="left" valign="top">	  
	  {include file="header.tpl" header=$smarty.const.STRING_CONTACT_INFORMATION_DOWN_CASE}      
	  <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbtop" align="left">
		    <table cellspacing="0" cellpadding="0">
              <tr>
                <td>{$smarty.const.CUSTOMER_FIRST_NAME}:&nbsp;</td>
                <td><b>{$first_name}</b></td>
              </tr>
              <tr>
                <td style="height: 3px;"></td>
              </tr>
              <tr>
                <td>{$smarty.const.CUSTOMER_LAST_NAME}:&nbsp;</td>
                <td><b>{$last_name}</b></td>
              </tr>
              <tr>
                <td style="height: 3px;"></td>
              </tr>
              <tr>
                <td>{$smarty.const.CUSTOMER_EMAIL}:&nbsp;</td>
                <td><b>{$Email}</b></td>
              </tr>
              <tr>
                <td style="height: 3px;"></td>
              </tr>
              <tr>
                <td>{$smarty.const.CUSTOMER_LOGIN}:&nbsp;</td>
                <td><b>{$login}</b></td>
              </tr>
              <tr>
                <td style="height: 3px;"></td>
              </tr>
              {section name=i loop=$additional_field_values}
              <tr>
                <td>{$additional_field_values[i].reg_field_name}:&nbsp;</td>
                <td><b>{$additional_field_values[i].reg_field_value}</b></td>
              </tr>
              {/section}
              {if $custgroup_name}
              {if $discount}
              <tr>
                <td>{$smarty.const.STRING_DISCOUNT}:&nbsp;</td>
                <td>{$discount}%</td>
              </tr>
              {/if}
              {if $min_discount}
              <tr>
                <td>{$smarty.const.STRING_MIN_DISCOUNT}:&nbsp;</td>
                <td>{$min_discount}%</td>
              </tr>
              {/if}
              {/if}
            </table>
		  </td>
        </tr>
      </table></td>
    <td><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim" alt=""></td>
    <td width="50%" align="left" valign="top">	  
	  {include file="header.tpl" header=$smarty.const.STRING_ADDRESS_BOOK}      
	  <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbtop" align="left">{if $addressStr}{$smarty.const.STRING_DEFAULT_ADDRESS}:<br><br><b>{$addressStr}</b>{/if}</td>
        </tr>
      </table>
	</td>
  </tr>
  <tr>
    <td width="50%" align="left" valign="top">
	  <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbot"><a href="index.php?contact_info=yes">{$smarty.const.EDIT_BUTTON}</a></td>
        </tr>
      </table>
	</td>
    <td><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim" alt=""></td>
    <td width="50%" align="left" valign="top">
	  <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbot"><a href="index.php?address_book=yes">{$smarty.const.STRING_ADDRESSES}</a></td>
        </tr>
      </table>
	</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td width="50%" align="left" valign="top">	  
	  {include file="header.tpl" header=$smarty.const.STRING_ORDER_HISTORY}      
	  <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbtop" align="left">
		    <table cellspacing="0" cellpadding="0">
              {section name=i loop=$status_distribution}
              <tr>
                <td align="left">{if $status_distribution[i].count != 0}{$status_distribution[i].count} {$smarty.const.STRING_COUNT_ORDER_IN_STATUS} <b>'{$status_distribution[i].status_name}'</b>{/if}</td>
              </tr>
              {/section}
            </table>
	      </td>
        </tr>
      </table>
	</td>
    <td><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim" alt=""></td>
    <td width="50%" align="left" valign="top">
	  {include file="header.tpl" header=$smarty.const.STRING_VISIT_LOG}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbtop" align="left">{$visits_count} {$smarty.const.STRING_RECORDS}</td>
        </tr>
      </table></td>
  </tr>
  <tr>
    <td width="50%" align="left" valign="top">
	  <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbot"><a href="index.php?order_history=yes">{$smarty.const.STRING_SHOPPING_HISTORY}</a></td>
        </tr>
      </table>
	</td>
    <td><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim" alt=""></td>
    <td width="50%" align="left" valign="top">
	  <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbot"><a href="index.php?visit_history=yes">{$smarty.const.STRING_VISIT_LOG}</a></td>
        </tr>
      </table>
	</td>
  </tr>
</table>
{if $smarty.const.CONF_AFFILIATE_PROGRAM_ENABLED eq 1}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td align="left" valign="top">
	  {include file="header.tpl" header=$smarty.const.STRING_AFFILIATE_PROGRAM}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbtop" align="left">{if $affiliate_customers}{$smarty.const.STRING_AFFILIATE_CUSTOMERS}: <b>{$affiliate_customers}</b>{else}{$smarty.const.STRING_AFFILIATE_NO_CUSTOMERS}{/if}<br>
		      <div align="left" style="line-height: 16px;"><a href="index.php?affiliate=yes&amp;sub=balance">{$smarty.const.AFFP_USER_BALANCE}</a>
			  <br><a href="index.php?affiliate=yes&amp;sub=payments_history">{$smarty.const.AFFP_PAYMENTS_HISTORY}</a>
			  <br><a href="index.php?affiliate=yes&amp;sub=attract_guide">{$smarty.const.AFFP_ATTRACT_GUIDE}</a>
			  <br>{if $smarty.const.CONF_AFFILIATE_EMAIL_NEW_COMMISSION or $smarty.const.CONF_AFFILIATE_EMAIL_NEW_PAYMENT}<a href="index.php?affiliate=yes&amp;sub=settings">{$smarty.const.STRING_MODULE_SETTING}</a><br>{/if}</div></td>
        </tr>
      </table>
	</td>
  </tr>
  <tr>
    <td align="left" valign="top">
	  <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="hdbot"><a href='index.php?affiliate=yes&amp;sub=balance'>{$smarty.const.STRING_AFFILIATE_PROGRAM}</a></td>
        </tr>
      </table>
	</td>
  </tr>
</table>
{/if}