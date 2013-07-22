{* шаблон блока голосования *}
<div class="dwa-block clearfix">
    <div class="dwa-blockcontent">
        {if $survey_question}
        <form action="index.php" method=GET id="survey">
            <b>{$survey_question}</b>
            <div class="fil"></div>
            <table cellspacing="0" cellpadding="0" align="center">
                {section name=y loop=$survey_answers max=10}
                <tr>
                    <td height="18" valign="middle" style="padding-bottom: 2px;"><input type="radio" name="answer" value='{$smarty.section.y.index}'></td>
                    <td valign="middle" align="left">&nbsp;{$survey_answers[y]}</td>
                </tr>
                {/section}
            </table>
            <br>{$smarty.const.STRING_ALL_VOTES}: <b>{$voters_count}</b>
            <div class="fil"></div>
            <input type="hidden" name="save_voting_results" value="yes">
            <div align="center">
                <a class="dwa-button" href="#" onclick="document.getElementById('survey').submit(); return false">{$smarty.const.ANSWER_TO_DISCUSSION}</a>
            </div>
            <div class="fil1"></div>
            <div align="center">
                <a class="dwa-button" href="index.php?view_voting_results=yes">{$smarty.const.STRING_ANSWER_VRESULT}</a>
            </div>
        </form>
        {else}{$smarty.const.STRING_NO_SURV}{/if}
    </div>
</div>