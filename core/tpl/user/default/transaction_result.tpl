{* ������ ���������� ���������� *}

{include file="header.tpl" header=$smarty.const.STRING_TRANSACTRESULT}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">
	  {if $TransactionResult eq 'success'}
      {$smarty.const.STRING_TRANSACTION_RESULT_SUCCESS}
      {elseif  $TransactionResult eq 'failure'}
      {$smarty.const.STRING_TRANSACTION_RESULT_FAILURE}
      {/if}
      {if $log ne "" && $orderID ne ""}<br>{$smarty.const.STRING_TRANSACTRESULT_REDIRECT}<a href="index.php?p_order_detailed={$orderID}">{$smarty.const.STRING_TRANSACTRESULT_GO}</a>{/if}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
