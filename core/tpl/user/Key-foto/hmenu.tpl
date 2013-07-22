{assign var=baseurl value="http://`$smarty.const.CONF_SHOP_URL`/"}
<ul class="dwa-hmenu">
    <li><a {if $smarty.server.REQUEST_URI == "/index.html"}class="active"{/if} href="index.html">Главная</a></li>
    <li><a {if $smarty.server.REQUEST_URI == "/pages/fotobank.html"}class="active"{/if} href="{18|@fu_make_url_pages}">Фотобанк</a>
        <ul>
            <li><a href="nacionalnaya-simvolika/">Национальная символика</a></li>
            <li><a href="voennaya-tematika/">Военная тематика</a></li>
            <li><a href="avtomobili/">Автомобили</a></li>
            <li><a href="ekstremalnye-uvlecheniya/">Экстремальные увлечения</a></li>
            <li><a href="urbanisticheskiy-peyzazh/">Урбанистический пейзаж</a></li>
            <li><a href="starinnaya-arhitektura/">Старинная архитектура</a></li>
            <li><a href="peyzazhi/">Пейзажи</a></li>
            <li><a href="zhivotnye/">Животные</a></li>
            <li><a href="tsvety-rasteniya/">Цветы, растения</a></li>
            <li><a href="faktury/">Фактуры</a></li>
            <li><a href="interery/">Интерьеры</a></li>
            <li><a href="dvizheniya-tantsy/">Движения, танцы</a></li>
            <li><a href="religioznaya-simvolika/">Религиозная символика</a></li>
        </ul>
    </li>
    <li><a {if $smarty.server.REQUEST_URI == "/pages/uslugi.html"}class="active"{/if} href="{19|@fu_make_url_pages}">Услуги</a>
        <ul>
            <li><a href="{20|@fu_make_url_pages}">Печать на стекле</a></li>
            <li><a href="{21|@fu_make_url_pages}">Печать на керамической плитке</a></li>
            <li><a href="{22|@fu_make_url_pages}">Печать на деревянных поверхностях</a></li>
            <li><a href="{23|@fu_make_url_pages}">Печать на пластике ПВХ</a></li>
            <li><a href="{24|@fu_make_url_pages}">Печать на жалюзи</a></li>
            <li><a href="{25|@fu_make_url_pages}">Печать на обоях, натяжных потолках</a></li>
            <li><a href="{26|@fu_make_url_pages}">Печать на тканях и коже</a></li>
            <li><a href="{27|@fu_make_url_pages}">Печать на металле, таблички и шильдики</a></li>
            <li><a href="{28|@fu_make_url_pages}">Комплексный дизайн интерьеров</a></li>
        </ul>
    </li>
    <li><a {if $smarty.server.REQUEST_URI == "/pages/"}class="active"{/if} href="{18|@fu_make_url_pages}">Галерея</a></li>
    <li><a {if $smarty.server.REQUEST_URI == "/pages/"}class="active"{/if} href="{18|@fu_make_url_pages}">Прайс</a></li>
    <li><a {if $smarty.server.REQUEST_URI == "/pages/"}class="active"{/if} href="{18|@fu_make_url_pages}">Оборудование</a></li>
    <li><a {if $smarty.server.REQUEST_URI == "/feedback.html"}class="active"{/if} href="feedback.html">Контакты</a></li>
    <li><a {if $smarty.server.REQUEST_URI == "/pages/"}class="active"{/if} href="{18|@fu_make_url_pages}">Пополнить счет</a></li>
</ul>