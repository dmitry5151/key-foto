{strip}
<div class="dwa-vmenublock clearfix">{* ������ ������� ������� *}
	<div class="dwa-vmenublockheader">
    	<span class="t">{$postheader}</span>
    </div>
    <div class="dwa-vmenublockcontent">
    	
        <ul class="dwa-vmenu">
            <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/motopompy/"}class="active"{/if} href="motopompy/">���������</a>
                <ul>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/motopompy-dlya-chistoi-vody/"}class="active"{/if} href="motopompy-dlya-chistoi-vody/">��� ������ ����</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/motopompy-dlya-gryaznoi-vody/"}class="active"{/if} href="motopompy-dlya-gryaznoi-vody/">��� ������� ����</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/motopompy-vysokonapornye-pozharnye/"}class="active"{/if} href="motopompy-vysokonapornye-pozharnye/">�������������� (��������)</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/motopompy-dlya-gustyh-i-vyazkih-zhidkostei/"}class="active"{/if} href="motopompy-dlya-gustyh-i-vyazkih-zhidkostei/">��� ������ � ������ ���������</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/poverhnostnye-shlamovye-motopompy/"}class="active"{/if} href="poverhnostnye-shlamovye-motopompy/">������������� ��������</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/rukava/"}class="active"{/if} href="rukava/">������</a>
                        <ul>
                            <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/vsasyvayuszie/"}class="active"{/if} href="vsasyvayuszie/">�����������</a></li>
                            <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/napornye/"}class="active"{/if} href="napornye/">��������</a></li>
                        </ul>
                    </li>
                </ul>
            </li>
            <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/moiki-vysokogo-davleniya/"}class="active"{/if} href="moiki-vysokogo-davleniya/">����� �������� ��������</a>
                <ul>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/s-elektroprivodom/"}class="active"{/if} href="s-elektroprivodom/">� ���������������</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/s-benzinovym-privodom/"}class="active"{/if} href="s-benzinovym-privodom/">� ���������� ��������</a></li>
                    <li><a {if $smarty.server.REQUEST_URI|regex_replace:"/_offset_[0-9]*/" == "/s-dizelnym-privodom/"}class="active"{/if} href="s-dizelnym-privodom/">� ��������� ��������</a></li>
                </ul>
            </li>            
        </ul>
    </div>
</div>
{/strip}