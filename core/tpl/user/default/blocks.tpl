{* ������ ������ ������ *}

{section name=b loop=$binfo}

{* ������������ ��������� ����� *}

{assign var="preheader" value="<a href='`$smarty.const.ADMIN_FILE`?dpt=conf&amp;sub=blocks_edit&amp;edit=`$binfo[b].bid`' title='`$smarty.const.EDIT_BUTTON`' style='float: right;'>+</a>"}
{if $isadmin eq "yes" && $binfo[b].title ne ""}{assign var="postheader" value=`$preheader``$binfo[b].title`}{else}{assign var="postheader" value=$binfo[b].title}{/if}

{* ����� ��������� ����� *}

{include file="header.tpl" header=$postheader nopad=$nopad}

{* ����� ���������� ����� *}

<table cellspacing="0" cellpadding="0" width="100%">
  <tr>
    <td class="{$bclass}" align="{$balign}">{if $binfo[b].html eq 1}{include file="blocks/`$binfo[b].url`" blocknum=$smarty.section.b.index}{else}{$binfo[b].content}{/if}</td>
  </tr>
</table>
{if $binfo[b].title ne "" && $nopad ne 1}<table cellspacing="0" cellpadding="0" width="100%"><tr><td class="hdbot">&nbsp;</td></tr></table>{/if}

{/section}