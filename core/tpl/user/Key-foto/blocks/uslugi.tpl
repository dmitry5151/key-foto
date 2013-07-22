{strip}
<div class="dwa-vmenublock clearfix">
    <div class="dwa-vmenublockheader">
        <span class="t">{$postheader}</span>
    </div>
    <div class="dwa-vmenublockcontent">
        <ul class="dwa-vmenu">
            <li><a {if $smarty.server.REQUEST_URI == "/pages/fotopechat-na-stekle-vitrazhi-i-zerkala.html"}class="active"{/if} href="{20|@fu_make_url_pages}">Печать на стекле</a></li>
            <li><a {if $smarty.server.REQUEST_URI == "/pages/pechat-na-keramicheskoy-plitke-keramogranite-naturalnom-kamne.html"}class="active"{/if} href="{21|@fu_make_url_pages}">Печать на керамической плитке</a></li>
            <li><a {if $smarty.server.REQUEST_URI == "/pages/fotopechat-na-mdf-i-dvp-panelyah-dereve-i-fanere.html"}class="active"{/if} href="{22|@fu_make_url_pages}">На деревянных поверхностях</a></li>
            <li><a {if $smarty.server.REQUEST_URI == "/pages/pryamaya-pechat-na-pvh-plastike-penokartone-gofrokartone.html"}class="active"{/if} href="{23|@fu_make_url_pages}">Печать на пластике ПВХ</a></li>
        </ul>
    </div>
</div>
{/strip}    