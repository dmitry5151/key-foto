{* ������ ������ ��������������� *}

{if $special_offers}
<table cellspacing="0" cellpadding="0" width="100%">
  {section name=i loop=$special_offers}
  {if $smarty.section.i.index is div by $smarty.const.CONF_TAB_COUNT_IN_HOME}
  <tr>
  {/if}
    <td width="{math equation="100 / x" x=$smarty.const.CONF_TAB_COUNT_IN_HOME format="%d"}%" align="left" valign="top">

	{* ������������ �������� ������ *}
	
	{assign var="urlRewr" value=$special_offers[i]|@fu_make_url}
{assign var="link" value="<a class='phead' href='`$urlRewr`'>`$special_offers[i].name`</a>"}
    {assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?productID=`$special_offers[i].productID`&amp;eaction=prod' title='`$smarty.const.STRING_EDITPR`' style='float: right;'>+</a>"}
    {if $isadmin eq "yes"}{assign var="postheader" value=`$preheader``$link`}{else}{assign var="postheader" value=$link}{/if}

	{* ����� �������� ������ *}
	
	{include file="header.tpl" header=$postheader}
	
	{* ����� ����� ������ *}
	
	<table cellspacing="0" cellpadding="0" width="100%">
	  <tr>
	    <td class="hdbtop" align="left">
          <table cellspacing="0" cellpadding="0" width="100%">
            <tr>
              <td valign="middle" align="left">
                <table cellspacing="0" cellpadding="0" style="margin-right: 8px;">
                  <tr>
				    <td class="price">{if $special_offers[i].cena <= 0}{$smarty.const.STRING_NOPRODUCT_IN}{else}{$special_offers[i].Price}{/if}</td>
				  </tr>
                </table>
              </td>
              <td align="right" width="100%">
			    
				{* ����� ������ ���������� ������ � ������� *}
                
				<table cellspacing="0" cellpadding="0" align="right">
				  <tr>
				    <td style="border-left: 1px solid #CCCCCC; padding-left: 8px;" align="left">
                      {if $smarty.const.CONF_SHOW_ADD2CART eq 1  && $smarty.const.CONF_DISP_INDEXCART eq 1}
                      <form action="index.php?categoryID={$special_offers[i].categoryID}&amp;prdID={$special_offers[i].productID}" method=post id="HiddenFieldsForm_{$special_offers[i].productID}" name="HiddenFieldsForm_{$special_offers[i].productID}">
                        {if $smarty.const.CONF_OPEN_SHOPPING_CART_IN_NEW_WINDOW eq 1}
					    <table cellspacing="0" cellpadding="0">
						  <tr>
						    <td><a href="#" onclick="open_window('index.php?do=cart&amp;addproduct={$special_offers[i].productID}&amp;multyaddcount='+document.HiddenFieldsForm_{$special_offers[i].productID}.multyaddcount.value+'',400,300);"><img src="data/{$smarty.const.TPL}/crt.gif" alt=""></a></td>
							<td style="padding-left: 4px;"><input type={if $smarty.const.CONF_MULTYCART==0}hidden{else}text{/if} value="1" name="multyaddcount" {if $smarty.const.CONF_MULTYCART==1}size="2" style="margin-right: 4px; width: 16px;"{/if}><a href="#" onclick="open_window('index.php?do=cart&amp;addproduct={$special_offers[i].productID}&amp;multyaddcount='+document.HiddenFieldsForm_{$special_offers[i].productID}.multyaddcount.value+'',400,300);">{$smarty.const.ADD_TO_CART_STRING}</a></td>
						  </tr>
						</table>
						{else}
						  {if $smarty.const.CONF_CART_METHOD eq 2}
						  <table cellspacing="0" cellpadding="0">
						    <tr>
						      <td><a href="#" onclick="doLoad('do=cart&amp;addproduct={$special_offers[i].productID}&amp;xcart=yes&amp;multyaddcount='+document.HiddenFieldsForm_{$special_offers[i].productID}.multyaddcount.value+''); return false"><img src="data/{$smarty.const.TPL}/crt.gif" alt=""></a></td>
							  <td style="padding-left: 4px;"><input type={if $smarty.const.CONF_MULTYCART==0}hidden{else}text{/if} value="1" name="multyaddcount" {if $smarty.const.CONF_MULTYCART==1}size="2" style="margin-right: 4px; width: 16px;"{/if}><a href="#" onclick="doLoad('do=cart&amp;addproduct={$special_offers[i].productID}&amp;xcart=yes&amp;multyaddcount='+document.HiddenFieldsForm_{$special_offers[i].productID}.multyaddcount.value+''); return false">{$smarty.const.ADD_TO_CART_STRING}</a></td>
						    </tr>
						  </table>
						  {else}
						  <table cellspacing="0" cellpadding="0">
						    <tr>
						      <td><a href="#" onclick="document.getElementById('HiddenFieldsForm_{$special_offers[i].productID}').submit(); return false"><img src="data/{$smarty.const.TPL}/crt.gif" alt=""></a></td>
							  <td style="padding-left: 4px;"><input type={if $smarty.const.CONF_MULTYCART==0}hidden{else}text{/if} value="1" name="multyaddcount" {if $smarty.const.CONF_MULTYCART==1}size="2" style="margin-right: 4px; width: 16px;"{/if}><input type="hidden" name="cart_{$special_offers[i].productID}_x" value="{$special_offers[i].productID}"><a href="#" onclick="document.getElementById('HiddenFieldsForm_{$special_offers[i].productID}').submit(); return false">{$smarty.const.ADD_TO_CART_STRING}</a></td>
						    </tr>
						  </table>
						  {/if}
					    {/if}
					  </form>
                      {/if}
					</td>
			      </tr>
				</table>
			  </td>
			</tr>
	      </table>
		</td>
      </tr>
	</table>
    
	{* �������������� ����� *}
    
	<table cellspacing="0" cellpadding="0" width="100%"><tr><td width="100%" style="background-color: #CCCCCC; height: 1px;"></td></tr></table>
    
	{* ����� �������� ������ � ��� ���������� *}
	
	<table cellspacing="0" cellpadding="0" width="100%">
      <tr>
	    <td class="hdbtop" valign="top" align="left">
          <table cellspacing="0" cellpadding="0" width="100%">
		    <tr>
              
			  {* ����� ���������� ����� (���� �������� � ����������) *}
			  
			  {if $smarty.const.CONF_DISPLAY_FOTO eq 1}
              <td class="imboxl"><div align="right" style="position: relative; float: right;"><div class="semafor sl"><a href="{$special_offers[i]|@fu_make_url}"><img src="data/{$smarty.const.TPL}/pixel.gif" style="margin: 0px;" alt="" width="70" height="70"></a></div><a href="{$special_offers[i]|@fu_make_url}"><img src="data/{$special_offers[i].default_picture}" alt="{$special_offers[i].name}"></a></div></td>
			  {* <a href="{$special_offers[i]|@fu_make_url}"><img src="data/{$special_offers[i].default_picture}" alt="{$special_offers[i].name}"></a> *}
			  {/if}
			  
			  {* ����� �������� �������� ������ *}
			  
			  <td width="100%" align="left" valign="top">{if $special_offers[i].brief_description}{$special_offers[i].brief_description}{/if}</td>

			  {* ����� ���������� ������ (���� �������� � ����������) *}
			  
			  {if $smarty.const.CONF_DISPLAY_FOTO eq 0}
			  <td class="imboxr"><div align="right" style="position: relative; float: right;"><div class="semafor sr"><a href="{$special_offers[i]|@fu_make_url}"><img src="data/{$smarty.const.TPL}/pixel.gif" style="margin: 0px;" alt="" width="70" height="70"></a></div><a href="{$special_offers[i]|@fu_make_url}"><img src="data/{$special_offers[i].default_picture}" alt="{$special_offers[i].name}"></a></div></td>
			  {* <a href="{$special_offers[i]|@fu_make_url}"><img src="data/{$special_offers[i].default_picture}" alt="{$special_offers[i].name}"></a> *}
			  {/if}
			
			</tr>
		  </table>
		</td>
	  </tr>
	</table>
	
	{* ������ ���������... *}
	
	<table cellspacing="0" cellpadding="0" width="100%">
	  <tr>
	    <td class="hdbot"><a href="{$special_offers[i]|@fu_make_url}">{$smarty.const.STRING_MOREPR}</a></td>
      </tr>
	</table>
    </td>
  
  {if ($smarty.section.i.index+1) is div by $smarty.const.CONF_TAB_COUNT_IN_HOME}
  </tr>
  {else}
    <td><img src="data/{$smarty.const.TPL}/pixel.gif" class="delim" alt=""></td>
  {/if}

{/section}
</table>
{/if}