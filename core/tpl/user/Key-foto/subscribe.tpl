{* ������ ����� �������� ����� *}

{include file="header.tpl" header=$smarty.const.STRING_NEWS_SUBSCRIBE}

{if $subscribe == NULL}
{if $error_message}
<table cellspacing="0" cellpadding="0" width="100%"><tr><td class="error hdbtop" align="center">{$error_message}</td></tr></table>
<table cellspacing="0" cellpadding="0" width="100%"><tr><td class="hdbot">&nbsp;</td></tr></table>
{/if}
{else}
<table cellspacing="0" cellpadding="0" width="100%"><tr><td class="oki hdbtop" align="center">{$smarty.const.STRING_THANK_YOU_NEWS}</td></tr></table>
<table cellspacing="0" cellpadding="0" width="100%"><tr><td class="hdbot">&nbsp;</td></tr></table>
{/if}

{if $un_pol}
{if $un_pol == 1}
<table cellspacing="0" cellpadding="0" width="100%"><tr><td class="oki hdbtop" align="center">{$smarty.const.STRING_DESUBS_OK}</td></tr></table>
<table cellspacing="0" cellpadding="0" width="100%"><tr><td class="hdbot">&nbsp;</td></tr></table>
{else}
<table cellspacing="0" cellpadding="0" width="100%"><tr><td class="error hdbtop" align="center">{$smarty.const.STRING_DESUBS_NO}</td></tr></table>
<table cellspacing="0" cellpadding="0" width="100%"><tr><td class="hdbot">&nbsp;</td></tr></table>
{/if}
{/if}