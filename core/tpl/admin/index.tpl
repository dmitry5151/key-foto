<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html class="admin">
<head>
<meta http-equiv="content-type" content="text/html; charset={$smarty.const.DEFAULT_CHARSET}">
<link rel="stylesheet" href="data/admin/style.css" type="text/css">
<link rel="icon" href="data/admin/favicon.ico" type="image/x-icon">
<link rel="shortcut icon" href="data/admin/favicon.ico" type="image/x-icon">
<title>{$smarty.const.ADMIN_TITLE}</title>
<script type="text/javascript" src="data/admin/admin.js"></script>
<!-- BEGIN Human friendly URL's -->
<script type="text/javascript" src="data/admin/jquery.min.js"></script>
<script type="text/javascript" src="data/admin/friendly_urls.js"></script>
<!-- END Human friendly URL's -->
{literal}
<!--[if lte IE 6]>
<style type="text/css">
body {behavior:url("data/admin/csshover.htc");}
label{
   // display:inline-block;
}
</style>
<![endif]-->
{/literal}
</head>
<body class="ibody">
<table class="adn">
    <tr>
      <td colspan="2">
        <table class="adn">
          <tr>
            <td class="head"><img src="data/admin/sep.gif" alt=""></td>
            <td class="head toph">&nbsp;&nbsp;{$smarty.const.ADMIN_TMENU1}: <b>{if $smarty.const.CONF_BACKEND_SAFEMODE eq 1}demo{else}{$admintempname}{/if}</b></td>
            <td class="head"><img src="data/admin/sep2.gif" alt=""></td>
            <td class="head toph">{$smarty.const.ADMIN_TMENU2}: <b>{$online_users}</b></td>
            <td class="head"><img src="data/admin/sep2.gif" alt=""></td>
            <td class="head last toph" width="100%"><a href="{$smarty.const.ADMIN_FILE}?order_search_type=SearchByStatusID&amp;checkbox_order_status_{$smarty.const.CONF_NEW_ORDER_STATUS}=1&amp;dpt=custord&amp;sub=new_orders&amp;search=">{$smarty.const.ADMIN_TMENU3}: <b>{$new_orders_count}</b></a></td>
            <td class="head">
              <table class="adw">
                <tr>
                  <td class="head last toph"><a href="{$smarty.const.ADMIN_FILE}">{$smarty.const.ADMINISTRATE_LINK}</a></td>
                  <td class="head"><img src="data/admin/sep2.gif" alt=""></td>
                  <td class="head last toph"><a href="index.php">{$smarty.const.ADMIN_BACK_TO_SHOP}</a></td>
                  <td class="head"><img src="data/admin/sep2.gif" alt=""></td>
                  <td class="head last toph2 toph"><a href="index.php?logout=yes">{$smarty.const.ADMIN_LOGOUT_LINK}</a></td>
                </tr>
              </table>
            </td>
          </tr>
        </table>
      </td>
    </tr>
    <tr>
      <td class="indexb1">{include file="admin/menu.tpl"}</td>
      <td valign="top">{include file="admin/$admin_main_content_template"}</td>
    </tr>
</table>
</body>
</html>
