{* ������ ������� �������� ������ *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?dpt=modules&amp;sub=linkexchange' title='`$smarty.const.EDIT_BUTTON`' style='float: right;'>+</a>"}
{if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$smarty.const.STRING_MODULES_LINKEXCHANGE`}{else}{assign var="postheader" value=$smarty.const.STRING_MODULES_LINKEXCHANGE}{/if}
{include file="header.tpl" header=$postheader}

{if $le_categories}

<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left"><a href="index.php?links_exchange=yes" style="float: right;">{$smarty.const.ADMIN_LE_ALL_CATEGORIES}</a>{$smarty.const.STRING_LE_CATEGORIES}</td>
  </tr>
</table>

<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">
	  <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td valign="top" align="left" width="50%">
		    {section name=i max=$le_categories_pr loop=$le_categories}
            <table cellspacing="0" cellpadding="0">
              {if $smarty.section.i.index ne 0}
              <tr>
                <td style="height: 3px;" colspan="2"></td>
              </tr>
			  {/if}
              <tr>
                <td align="left" valign="middle">{if $le_categories[i].le_cID!=$le_CategoryID}<img src="data/{$smarty.const.TPL}/tree1.gif" alt=""></td>
                <td align="left" valign="middle"><a href="{"msg=&amp;page=1&amp;le_categoryID=`$le_categories[i].le_cID`"|set_query}">{$le_categories[i].le_cName}</a> {else}{assign var="le_CategoryName" value=$le_categories[i].le_cName}<img src="data/{$smarty.const.TPL}/tree1.gif" alt=""></td>
                <td class="bf" align="left" valign="middle">{$le_categories[i].le_cName}{/if}</td>
              </tr>
            </table>
            {/section}
		  </td>
          <td valign="top" align="left" width="50%">
            {section name=i start=$le_categories_pr loop=$le_categories}
            <table cellspacing="0" cellpadding="0">
              {if $smarty.section.i.index ne 0}
              <tr>
                <td style="height: 3px;" colspan="2"></td>
              </tr>
			  {/if}
              <tr>
                <td align="left" valign="middle">{if $le_categories[i].le_cID!=$le_CategoryID}<img src="data/{$smarty.const.TPL}/tree1.gif" alt=""></td>
                <td align="left" valign="middle"><a href="{"msg=&amp;page=1&amp;le_categoryID=`$le_categories[i].le_cID`"|set_query}">{$le_categories[i].le_cName}</a> {else}{assign var="le_CategoryName" value=$le_categories[i].le_cName}<img src="data/{$smarty.const.TPL}/tree1.gif" alt=""></td>
                <td class="bf" align="left" valign="middle">{$le_categories[i].le_cName}{/if}</td>
              </tr>
            </table>
            {/section}
		  </td>
        </tr>
      </table>
	</td>
  </tr>
</table>
{/if}

{if $le_links}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left"><b>{$smarty.const.STRING_LE_LINKS}</b></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">
	  {assign var="verifi" value=0}
      {foreach from=$le_links item=_le_link}
      {if $verifi eq 1}
      <div class="fil"></div>
      {else}{assign var="verifi" value=1}{/if}<a href="{$_le_link.le_lURL}">{$_le_link.le_lText}</a> - {$_le_link.le_lDesk}{/foreach}
      {if $last_page>1}
      <table cellspacing="0" cellpadding="0" width="100%">
        <tr>
          <td class="cattop" align="center">{if $curr_page>1}<a href ="{"page=`$curr_page-1`&amp;show_all="|set_query}">{$smarty.const.STRING_PREVIOUS}</a>{/if}{foreach from=$le_lister_range item=_page}&nbsp;|&nbsp;{if $_page!=$curr_page or $showAllLinks}<a href="{"page=`$_page`&amp;show_all="|set_query}">{$_page}</a>{else}<b>{$_page}</b>{/if}{/foreach}{if $curr_page<$last_page}&nbsp;|&nbsp;<a href ="{"page=`$curr_page+1`&amp;show_all="|set_query}">{$smarty.const.STRING_NEXT}</a>{/if}&nbsp;|&nbsp;{if $showAllLinks}<b>{$smarty.const.STRING_SHOWALL}</b>{else}<a href ="{"show_all=yes"|set_query}">{$smarty.const.STRING_SHOWALL}</a>{/if}</td>
        </tr>
      </table>
      {/if}
	</td>
  </tr>
</table>
{/if}

<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left"><b>{$smarty.const.STRING_LE_ADD_LINK}</b></td>
  </tr>
</table>
{if $error}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="error cattop" align="center">{$error}</td>
  </tr>
</table>
{/if}
{if $error_ok}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="oki cattop" align="center">{$error_ok}</td>
  </tr>
</table>
{/if}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbtop" align="left">
	  <form action="{$REQUEST_URI}" method="POST" name="forml" id="forml">
        <input name="fACTION" value="ADD_LINK" type="hidden">
        <input name="fREDIRECT" value="{$REQUEST_URI}" type="hidden">
        <table cellspacing="0" cellpadding="0">
          <tr>
            <td>{$smarty.const.ADMIN_LE_LINK_CATEGORY}</td>
          </tr>
          <tr>
            <td style="height: 2px;"></td>
          </tr>
          <tr>
            <td><select name="LINK[le_lCategoryID]">
                <option value="0">{$smarty.const.ADMIN_NOT_DEFINED}</option>
                
                {foreach from=$le_categories item=_category}
                                
                <option value="{$_category.le_cID}"
                                        {if $le_CategoryID==$_category.le_cID} selected="selected"
                                        {elseif $pst_LINK.le_lCategoryID==$_category.le_cID} selected="selected"
                                        {/if}
                                        >{$_category.le_cName}</option>
                
                {/foreach}
                        
              </select></td>
          </tr>
          <tr>
            <td style="height: 6px;"></td>
          </tr>
          <tr>
            <td>{$smarty.const.ADMIN_LE_LINK_URL}</td>
          </tr>
          <tr>
            <td style="height: 2px;"></td>
          </tr>
          <tr>
            <td><input name="LINK[le_lURL]" value="{if $pst_LINK.le_lURL}{$pst_LINK.le_lURL}{else}http://{/if}" type="text" style="width: 220px;"></td>
          </tr>
          <tr>
            <td style="height: 6px;"></td>
          </tr>
          <tr>
            <td>{$smarty.const.ADMIN_LE_LINK_TEXT}</td>
          </tr>
          <tr>
            <td style="height: 2px;"></td>
          </tr>
          <tr>
            <td><input name="LINK[le_lText]" value="{$pst_LINK.le_lText}" style="width: 220px;" type="text"></td>
          </tr>
          <tr>
            <td style="height: 6px;"></td>
          </tr>
          <tr>
            <td>{$smarty.const.STRING_DESCRIPTION}</td>
          </tr>
          <tr>
            <td style="height: 2px;"></td>
          </tr>
          <tr>
            <td><textarea name="LINK[le_lDesk]" style="height: 80px; width: 270px;">{$pst_LINK.le_lDesk}</textarea>
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
        </table>
      </form></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot"><a href="#" onclick="document.getElementById('forml').submit(); return false">{$smarty.const.OK_BUTTON3}</a></td>
  </tr>
</table>