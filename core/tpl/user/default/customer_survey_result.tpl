{* ������ ����������� ����������� *}

{if $show_survey_results eq 1}
{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?dpt=modules&amp;sub=survey&amp;edit_poll=`$survey_id`' title='`$smarty.const.EDIT_BUTTON`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$smarty.const.STRING_SURV_INDEX`}{else}{assign var="postheader" value=$smarty.const.STRING_SURV_INDEX}{/if}
{include file="header.tpl" header=$postheader}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left">{$survey_question}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">
	  {if $user_voted eq 1}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="error cattop" align="center">{$smarty.const.STRING_VOTINGERR}</td>
        </tr>
      </table>
      {/if}
      <table cellspacing="0" cellpadding="0" width="70%" align="center">
        {section name=y loop=$survey_answers}
        <tr>
          <td colspan="2" style="padding: 8px 0 3px 0;"><b>{$survey_answers[y]}</b>&nbsp;&nbsp;({$smarty.const.STRING_VOTES}: {$survey_results[y]})</td>
        </tr>
        <tr>
          <td width="99%" style="background: url('data/{$smarty.const.TPL}/tonel.gif')"><img src="data/{$smarty.const.TPL}/mainbar.gif" height="11"
          alt="" width="{if $voters_count ne 0}{math equation="round(100 * $survey_results[y] / $voters_count)"}{else}0{/if}%"></td>
          <td>&nbsp;&nbsp;<b>{if $voters_count ne 0}{math equation="round(100 * $survey_results[y] / $voters_count)"}{else}0{/if}%</b></td>
        </tr>
        {/section}
      </table>
      <br>
      <br>
      <table cellspacing="0" cellpadding="0" align="center">
        <tr>
          <td><img src="data/{$smarty.const.TPL}/poll.gif" alt=""></td>
          <td valign="middle">&nbsp;&nbsp;{$smarty.const.STRING_ALL_VOTES}: <b>{$voters_count}</b></td>
        </tr>
      </table></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot">&nbsp;</td>
  </tr>
</table>
{/if}