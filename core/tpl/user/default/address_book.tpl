{* ������ �������� ����� � ������ �������� *}

{include file="header.tpl" header=$smarty.const.STRING_ADDRESS_BOOK}
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="cbt" align="left"><a href='index.php?contact_info=yes'>{$smarty.const.STRING_CONTACT_INFORMATION_DOWN_CASE}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?address_book=yes'>{$smarty.const.STRING_ADDRESS_BOOK}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?order_history=yes'>{$smarty.const.STRING_ORDER_HISTORY}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?visit_history=yes'>{$smarty.const.STRING_VISIT_HISTORY}</a>{if $smarty.const.CONF_AFFILIATE_PROGRAM_ENABLED}&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?affiliate=yes&amp;sub=balance'>{$smarty.const.STRING_AFFILIATE_PROGRAM}</a>{/if}</td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hmin" align="left"><form action='index.php?address_book=yes' method="post" id="adrform">
        <table cellspacing="1" cellpadding="0" width="100%" class="gre">
          <tr>
            <td class="lt pad" width="5%" nowrap="nowrap" align="left" valign="middle">{$smarty.const.STRING_DEFAULT}</td>
            <td class="lt pad" align="left" valign="middle">{$smarty.const.STRING_SHIPPING_ADDRESS}</td>
            <td class="lt pad" align="left" valign="middle">{$smarty.const.STRING_DO_BLOCK}</td>
          </tr>
          {section name=i loop=$addresses}
          <tr>
            <td align="center" valign="middle"><input type=radio class="radio" {if $defaultAddressID == $addresses[i].addressID} checked {/if} name='DefaultAddress' value='{$addresses[i].addressID}'></td>
            <td class="pad" align="left" valign="middle"><b>{$addresses[i].addressStr}</b></td>
            <td class="pad" align="left" valign="middle"><a href="index.php?address_editor={$addresses[i].addressID}">{$smarty.const.EDIT_BUTTON}</a>
              <div class="fil"></div>
              <a href="#" onclick="confirmDelete({$addresses[i].addressID},'{$smarty.const.QUESTION_DELETE_CONFIRMATION}','index.php?address_book=yes&amp;delete=');">{$smarty.const.DELETE_BUTTON}</a></td>
          </tr>
          {sectionelse}
          <tr>
            <td colspan="3" class="pad" align="center" valign="middle">{$smarty.const.STRING_EMPTY_LIST}</td>
          </tr>
          {/section}
        </table>
        <input type="hidden" value="submit" name='save'>
      </form></td>
  </tr>
</table>
<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="hdbot"><a href="#" onclick="document.getElementById('adrform').submit(); return false">{$smarty.const.SAVE_BUTTON}</a>&nbsp;&nbsp;|&nbsp;&nbsp;<a href='index.php?add_new_address=yes'>{$smarty.const.STRING_ADD_NEW_ADDRESS}</a></td>
  </tr>
</table>
