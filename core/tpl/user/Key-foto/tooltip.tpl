
{if $smarty.const.CONF_DISPLAY_PRCODE eq 1}
<table width='220'>
    <tr>
        <td width='25'><img src='data/Key-foto/images/icon-photo.png' /></td>
        <td width='100%'><!-- Код, если есть -->
        {if $product_info.product_code}<span style='font-size: 12px; height: 25px; vertical-align: middle; display: table-cell; line-height: 25px; line-height: 14px'>{$product_info.product_code} - {$product_info.name}</span>{/if}        
        </td>
    </tr>
</table>
{/if}
<img src='data/medium/{$product_info.picture}'>