{* шаблон короткого описния товара *}
{*
<div class="more-ss">
    {if $product_info.picture}                
        <a href="{$product_info|@fu_make_url}"><img src="data/medium/{$product_info.picture}" alt="{$product_info.name}" style="height: auto; width: 100%" /></a>
        {else}
            {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}
            <a href="{$product_info|@fu_make_url}"><img src="data/empty.gif" alt="no photo" style="width: 100%" /></a>
            {/if}
        {/if}
    <a href="#lightbox" class="fancybox"><div class="caption-ss">Свойства</div></a>
</div>
*}
<div class="more-ss">
    {if $product_info.picture}                
        <a href="#lightbox" class="fancybox"><img src="data/medium/{$product_info.picture}" alt="{$product_info.name}" style="height: auto; width: 100%" /></a>
        {else}
            {if $smarty.const.CONF_DISPLAY_NOPHOTO eq 1}
            <a href="#lightbox" class="fancybox"><img src="data/empty.gif" alt="no photo" style="width: 100%" /></a>
            {/if}
        {/if}
    <a  href="#lightbox" class="fancybox"><div class="caption-ss">Свойства</div></a>
</div>    
        
{* Временный контейнер, отображаемый во всплывающем боксе *}

<div id="lightbox" style="display: none">
    <article class="dwa-post dwa-article">
        <table width="100%" cellspacing="0" cellpadding="2">
            <tbody><tr>
                    <td>
                        <h1 style="font-size:16px" class="dwa-postheader"><img style="vertical-align: middle; border: none; margin-bottom: 10px" src="data/Key-foto/images/icon-photo.png">
                            n0003
                            &nbsp;-&nbsp;g8 2006 саммит флаги 3</h1>
                    </td>
                    <td width="300" align="right" style="text-align: right; vertical-align: middle; padding: 0">
                        <div style="border-radius:10px; background: #ddd; width: 100%; height: 60px;">
                            <table width="100%" cellspacing="0" cellpadding="0" height="100%"><tbody><tr>
                                        <td width="150" class="price" id="optionPrice" style="text-align: center; vertical-align: middle">90&nbsp;руб.</td>
                                        <td width="150" style="text-align: right; vertical-align: middle">
                                            <form class="box" id="DetailCartForm" name="HiddenFieldsForm" method="post" action="index.php?productID=241">
                                                <input type="hidden" name="multyaddcount" value="1">
                                                <a onclick="doLoad('do=cart&amp;addproduct=241&amp;option_select_hidden_1=' + document.HiddenFieldsForm.option_select_hidden_1.value + '&amp;xcart=yes&amp;multyaddcount=' + document.HiddenFieldsForm.multyaddcount.value + '');
                                                return false" href="#" class="mega-button">В корзину<img style="border:none" src="data/Key-foto/images/megabutton_cart.png"></a>


                                                <input type="hidden" value="58" name="option_select_hidden_1">
                                            </form>
                                        </td>
                                    </tr></tbody></table>
                        </div>
                    </td>
                </tr>
            </tbody></table>

        <div class="dwa-postcontent dwa-postcontent clearfix"><!-- Основной центральный блок -->
            <div class="dwa-content-layout"><!-- Автономный текстовый блок -->
                <div class="dwa-content-layout-row">
                    <div style="width: 100%" class="dwa-layout-cell layout-item">

                    </div>
                </div>
            </div>
            <div class="fil2"></div>



            <div class="dwa-content-layout">
                <div class="dwa-content-layout-row">
                    <div style="width: 400px; text-align: center" class="dwa-layout-cell layout-item">

                        <a onclick="return hs.expand(this)" class="highslide" href="data/big/n0003.jpg"><img style="margin:0px" id="n0003.jpg" alt="g8 2006 саммит флаги 3" src="data/medium/n0003.jpg"></a>
                    </div>
                    <div style="width: 100%" class="dwa-layout-cell layout-item">
                        <div style="background: none" id="tabs" class="ui-tabs ui-widget ui-widget-content ui-corner-all">
                            <ul class="ui-tabs-nav ui-helper-reset ui-helper-clearfix ui-widget-header ui-corner-all" role="tablist">
                                <li class="ui-state-default ui-corner-top ui-tabs-active ui-state-active" role="tab" tabindex="0" aria-controls="tabs-1" aria-labelledby="ui-id-1" aria-selected="true"><a href="http://key-foto.com/nacionalnaya-simvolika/g8-2006-sammit-flagi-3.html#tabs-1" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-1">Характеристики</a></li>
                                <li class="ui-state-default ui-corner-top" role="tab" tabindex="-1" aria-controls="tabs-2" aria-labelledby="ui-id-2" aria-selected="false"><a href="http://key-foto.com/nacionalnaya-simvolika/g8-2006-sammit-flagi-3.html#tabs-2" class="ui-tabs-anchor" role="presentation" tabindex="-1" id="ui-id-2">Описание</a></li>
                            </ul>
                            <div id="tabs-1" aria-labelledby="ui-id-1" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" aria-expanded="true" aria-hidden="false">
                                <table width="100%" cellspacing="0" cellpadding="5" class="zebra">
                                    <caption style="font-size:12px; text-align: left">Характеристики фотографии</caption>
                                    <thead>
                                        <tr>
                                            <th>Лицензия</th>
                                            <th>Стоимость</th>
                                            <th>Выбор</th>
                                        </tr>
                                    </thead>
                                    <tbody>

                                    <form name="MainForm" method="post" action="index.php?productID=241"></form>




                                    <!--td>Лицензия:</td-->

                                    <tr>
                                        <td>XSMALL 15.0*10.0 см (425*283 рх)</td>
                                        <td class="base-price" style="text-align: center">20</td>
                                        <td style="text-align: center"><input type="radio" value="-70:56" name="license"></td>
                                    </tr>
                                    <tr>
                                        <td>SMALL 30.0*20.0 см (849*566 рх)</td>
                                        <td class="base-price" style="text-align: center">60</td>
                                        <td style="text-align: center"><input type="radio" value="-30:57" name="license"></td>
                                    </tr>
                                    <tr>
                                        <td>MEDIUM 14.4*9.6 см (1698*1132 рх)</td>
                                        <td class="base-price" style="text-align: center">90</td>
                                        <td style="text-align: center"><input type="radio" checked="" value="0:58" name="license"></td>
                                    </tr>
                                    <tr>
                                        <td>LARGE 20.7*18.8 см (2450*1633 рх)</td>
                                        <td class="base-price" style="text-align: center">150</td>
                                        <td style="text-align: center"><input type="radio" value="60:59" name="license"></td>
                                    </tr>
                                    <tr>
                                        <td>XLARGE 29.3*19.6 см (4250*2830 рх)</td>
                                        <td class="base-price" style="text-align: center">300</td>
                                        <td style="text-align: center"><input type="radio" value="210:60" name="license"></td>
                                    </tr>
                                    <tr>
                                        <td>XXLARGE 42.3*28.2 см (6000*4000 рх)</td>
                                        <td class="base-price" style="text-align: center">400</td>
                                        <td style="text-align: center"><input type="radio" value="310:61" name="license"></td>
                                    </tr>
                                    <tr>
                                        <td>Расширенная лицензия</td>
                                        <td class="base-price" style="text-align: center">2000</td>
                                        <td style="text-align: center"><input type="radio" value="1910:62" name="license"></td>
                                    </tr>

                                    </tbody>
                                </table>
                            </div>
                            <div id="tabs-2" aria-labelledby="ui-id-2" class="ui-tabs-panel ui-widget-content ui-corner-bottom" role="tabpanel" style="display: none;" aria-expanded="false" aria-hidden="true">
                                <br>
                            </div>
                        </div>
                    </div>
                </div>
            </div> 

            
        </div>
    </article>
</div>
