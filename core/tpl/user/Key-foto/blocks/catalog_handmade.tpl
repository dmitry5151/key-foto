{strip}
<div class="dwa-vmenublock clearfix">{* Ручной каталог товаров *}
	<div class="dwa-vmenublockheader">
    	<span class="t">{$postheader}</span>
    </div>
    <div class="dwa-vmenublockcontent">
    	
        <ul class="dwa-vmenu">
            <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/motopompy/"}class="active"{/if} href="motopompy/">Мотопомпы</a>
                <ul>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/motopompy-dlya-chistoi-vody/"}class="active"{/if} href="motopompy-dlya-chistoi-vody/">Для чистой воды</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/motopompy-dlya-gryaznoi-vody/"}class="active"{/if} href="motopompy-dlya-gryaznoi-vody/">Для грязной воды</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/motopompy-vysokonapornye-pozharnye/"}class="active"{/if} href="motopompy-vysokonapornye-pozharnye/">Высоконапорные (пожарные)</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/motopompy-dlya-gustyh-i-vyazkih-zhidkostei/"}class="active"{/if} href="motopompy-dlya-gustyh-i-vyazkih-zhidkostei/">Для густых и вязких жидкостей</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/poverhnostnye-shlamovye-motopompy/"}class="active"{/if} href="poverhnostnye-shlamovye-motopompy/">Поверхностные шламовые</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/rukava/"}class="active"{/if} href="rukava/">Рукава</a>
                        <ul>
                            <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/vsasyvayuszie/"}class="active"{/if} href="vsasyvayuszie/">Всасывающие</a></li>
                            <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/napornye/"}class="active"{/if} href="napornye/">Напорные</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/moiki-vysokogo-davleniya/"}class="active"{/if} href="moiki-vysokogo-davleniya/">Мойки высокого давления</a>
                <ul>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/s-elektroprivodom/"}class="active"{/if} href="s-elektroprivodom/">С электроприводом</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/s-benzinovym-privodom/"}class="active"{/if} href="s-benzinovym-privodom/">С бензиновым приводом</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/s-dizelnym-privodom/"}class="active"{/if} href="s-dizelnym-privodom/">С дизельным приводом</a></li>
                </ul>
            </li>            
        </ul>
    </div>
</div>
{/strip}