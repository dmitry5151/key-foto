{assign var=baseurl value="http://`$smarty.const.CONF_SHOP_URL`/"}
<ul class="dwa-hmenu">
    <li><a {if $smarty.server.REQUEST_URI == "/index.html"}class="active"{/if} href="index.html">�������</a></li>
    <li><a {if $smarty.server.REQUEST_URI == "/pages/fotobank.html"}class="active"{/if} href="{18|@fu_make_url_pages}">��������</a>
        <ul>
            <li><a href="nacionalnaya-simvolika/">������������ ���������</a></li>
            <li><a href="voennaya-tematika/">������� ��������</a></li>
            <li><a href="avtomobili/">����������</a></li>
            <li><a href="ekstremalnye-uvlecheniya/">������������� ���������</a></li>
            <li><a href="urbanisticheskiy-peyzazh/">��������������� ������</a></li>
            <li><a href="starinnaya-arhitektura/">��������� �����������</a></li>
            <li><a href="peyzazhi/">�������</a></li>
            <li><a href="zhivotnye/">��������</a></li>
            <li><a href="tsvety-rasteniya/">�����, ��������</a></li>
            <li><a href="faktury/">�������</a></li>
            <li><a href="interery/">���������</a></li>
            <li><a href="dvizheniya-tantsy/">��������, �����</a></li>
            <li><a href="religioznaya-simvolika/">����������� ���������</a></li>
        </ul>
    </li>
    <li><a {if $smarty.server.REQUEST_URI == "/pages/uslugi.html"}class="active"{/if} href="{19|@fu_make_url_pages}">������</a>
        <ul>
            <li><a href="{20|@fu_make_url_pages}">������ �� ������</a></li>
            <li><a href="{21|@fu_make_url_pages}">������ �� ������������ ������</a></li>
            <li><a href="{22|@fu_make_url_pages}">������ �� ���������� ������������</a></li>
            <li><a href="{23|@fu_make_url_pages}">������ �� �������� ���</a></li>
            <li><a href="{24|@fu_make_url_pages}">������ �� ������</a></li>
            <li><a href="{25|@fu_make_url_pages}">������ �� �����, �������� ��������</a></li>
            <li><a href="{26|@fu_make_url_pages}">������ �� ������ � ����</a></li>
            <li><a href="{27|@fu_make_url_pages}">������ �� �������, �������� � ��������</a></li>
            <li><a href="{28|@fu_make_url_pages}">����������� ������ ����������</a></li>
        </ul>
    </li>
    <li><a {if $smarty.server.REQUEST_URI == "/pages/"}class="active"{/if} href="{18|@fu_make_url_pages}">�������</a></li>
    <li><a {if $smarty.server.REQUEST_URI == "/pages/"}class="active"{/if} href="{18|@fu_make_url_pages}">�����</a></li>
    <li><a {if $smarty.server.REQUEST_URI == "/pages/"}class="active"{/if} href="{18|@fu_make_url_pages}">������������</a></li>
    <li><a {if $smarty.server.REQUEST_URI == "/feedback.html"}class="active"{/if} href="feedback.html">��������</a></li>
    <li><a {if $smarty.server.REQUEST_URI == "/pages/"}class="active"{/if} href="{18|@fu_make_url_pages}">��������� ����</a></li>
</ul>