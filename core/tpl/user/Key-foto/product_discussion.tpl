{* ������ ���������� ������� *}

{assign var=postheader value="`$smarty.const.DISCUSSION_TITLE`: `$product_name`"}
<article class="dwa-post dwa-article">    
    <h1 class="dwa-postheader" style="margin: 15px 0;">{$postheader}</h1>
    <div class="dwa-postcontent dwa-postcontent clearfix"><!-- �������� ����������� ���� -->
        <div class="dwa-content-layout"><!-- ���������� ��������� ���� -->
            <div class="dwa-content-layout-row">
                <div class="dwa-layout-cell layout-item" style="width: 100%" >
                    <table cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td class="cbt" align="left"><a class="dwa-button" href="index.php?productID={$productID}">{$smarty.const.DISCUSSION_GO_BACKLINK}</a></td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td class="hmin" align="left">
                                {if $product_reviews ne NULL}
                                {section name=i loop=$product_reviews}
                                {if $smarty.section.i.index ne 0}
                                <div class="fil1 white"></div>
                                {/if}
                                <table cellspacing="1" cellpadding="0" width="100%" class="gre">
                                    <tr>
                                        <td class="lt padt" valign="middle" align="right" nowrap="nowrap">{$smarty.const.DISCUSSION_SUBJECT}:</td>
                                        <td width="99%" class="padt" align="left"><b>{$product_reviews[i].Topic}</b></td>
                                    </tr>
                                    <tr>
                                        <td class="lt padt" valign="middle" align="right" nowrap="nowrap">{$smarty.const.DISCUSSION_NICKNAME}:</td>
                                        <td width="99%" class="padt" align="left">{$product_reviews[i].Author}</td>
                                    </tr>
                                    <tr>
                                        <td class="lt padt" valign="middle" align="right" nowrap="nowrap">{$smarty.const.DISCUSSION_DATE}:</td>
                                        <td width="99%" class="padt" align="left">{$product_reviews[i].add_time}</td>
                                    </tr>
                                    <tr>
                                        <td class="lt padt" valign="middle" align="right" nowrap="nowrap">{$smarty.const.DISCUSSION_BODY}:</td>
                                        <td width="99%" class="padt" align="left">{$product_reviews[i].Body}</td>
                                    </tr>
                                    {if $isadmin eq "yes"}
                                    <tr>
                                        <td class="padt" valign="middle" align="right" nowrap="nowrap">&nbsp;</td>
                                        <td width="99%" class="padt" align="left"><a href="index.php?productID={$productID}&amp;discuss=true&amp;remove_topic={$product_reviews[i][3]}">{$smarty.const.DISCUSSION_DELETE_POST_LINK}</a></td>
                                    </tr>
                                    {/if}
                                </table>
                                {/section}
                                {else}
                                <div align="center" class="padt">{$smarty.const.DISCUSSION_NO_POSTS_ON_ITEM_STRING}</div>
                                {/if} </td>
                        </tr>
                    </table>
                    <h2 style="margin: 15px 0">{$smarty.const.DISCUSSION_ADD_MESSAGE}</h2>
                    <table cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td class="hdbtop" align="left"> {if $error ne NULL}
                                <table cellspacing="0" cellpadding="0" width="100%">
                                    <tr>
                                        <td class="error cattop" align="center">{if $error eq 7}{$smarty.const.ERR_WRONG_CCODE}{else}{$smarty.const.FEEDBACK_ERROR_FILL_IN_FORM}{/if}</td>
                                    </tr>
                                </table>
                                {/if}
                                <form action="index.php" method=post name="formD" id="formD">
                                    <table cellspacing="0" cellpadding="0">
                                        <tr>
                                            <td>{$smarty.const.DISCUSSION_NICKNAME}</td>
                                        </tr>
                                        <tr>
                                            <td style="height: 2px;"></td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" name="nick" maxlength="80" style="width: 220px;" value="{$dis_nic}"></td>
                                        </tr>
                                        <tr>
                                            <td style="height: 6px;"></td>
                                        </tr>
                                        <tr>
                                            <td>{$smarty.const.DISCUSSION_SUBJECT}</td>
                                        </tr>
                                        <tr>
                                            <td style="height: 2px;"></td>
                                        </tr>
                                        <tr>
                                            <td><input type="text" name="topic" maxlength="200" style="width: 220px;" value="{$dis_subject}"></td>
                                        </tr>
                                        <tr>
                                            <td style="height: 6px;"></td>
                                        </tr>
                                        <tr>
                                            <td>{$smarty.const.DISCUSSION_BODY}</td>
                                        </tr>
                                        <tr>
                                            <td style="height: 2px;"></td>
                                        </tr>
                                        <tr>
                                            <td><textarea name=body style="width: 360px; height: 100px;">{$dis_text}</textarea></td>
                                        </tr>
                                        {if $smarty.const.CONF_ENABLE_CONFIRMATION_CODE eq 1}
                                        <tr>
                                            <td style="height: 6px;"></td>
                                        </tr>
                                        <tr>
                                            <td><img src="index.php?do=captcha&amp;{php}echo session_name();{/php}={php}echo session_id();{/php}" alt="code"></td>
                                        </tr>
                                        <tr>
                                            <td style="height: 2px;"></td>
                                        </tr>
                                        <tr>
                                            <td><input name="fConfirmationCode" value="{$smarty.const.STR_ENTER_CCODE}" type="text" style="width: 220px; color: #aaaaaa;" onfocus="if(this.value=='{$smarty.const.STR_ENTER_CCODE}')
                {literal}
                {this.style.color='#000000';this.value='';}
                {/literal}" onblur="if(this.value=='')
                {literal}{{/literal}this.style.color='#aaaaaa';this.value='{$smarty.const.STR_ENTER_CCODE}'{literal}}{/literal}"></td>
                                        </tr>
                                        {/if}
                                        <tr>
                                            <td><input type="hidden" name="add_topic" value="yes">
                                                <input type="hidden" name="productID" value={$productID}>
                                                <input type="hidden" name="discuss" value="yes"></td>
                                        </tr>
                                    </table>
                                </form></td>
                        </tr>
                    </table>
                    <table cellspacing="0" cellpadding="0" width="100%">
                        <tr>
                            <td class="hdbot"><a class="dwa-button" href="#" onclick="validate_disc(this); return false">{$smarty.const.POST_BUTTON}</a>&nbsp;&nbsp;<a class="dwa-button" href="#" onclick="document.getElementById('formD').reset(); return false">{$smarty.const.RESET_BUTTON}</a></td>
                        </tr>
                    </table>
                </div>
            </div>
        </div>
    </div>
</article>