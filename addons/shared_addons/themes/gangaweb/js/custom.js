/* 
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
$(function () {
    $('.message-alert').delay(6500).queue(function () {
        $(this).remove();
    });
    
});
function modalNotheme(){    
    $('.modal-backdrop').remove();
}
function searchProducts() {
    $('.searh-results').empty();
    $('.searh-results').append('<div align="center"><img width="450" src="' + ganga.base_url + 'addons/shared_addons/themes/gangaweb/images/preloader-find.gif"></div>');
    $.post(ganga.base_url + "shop/filterProducts", {searh: $('#searh').val()})
            .done(function (data) {
                var obj = JSON.parse(data);
                if (obj != '') {
                    $('.searh-results').empty();
                    $.each(obj, function (key, value) {
                        $('.searh-results').append('<article class="portfolio-item pf-media pf-icons"> <div class="portfolio-image cont-search-images"> <a href="' + ganga.base_url + 'shop/preOrder/' + value.categoria + '/' + value.id + '"> <img src="' + ganga.base_url + value.file + '" alt="Open Imagination">  <div style="cursor:pointer; " class="portfolio-overlay"></div></a></div><div style="width: 100%;margin-bottom: -8px;" class="portfolio - desc"> <h4 style="height: 53px; overflow: hidden; margin-bottom: -2px;"><a href="' + ganga.base_url + 'shop/preOrder/' + value.categoria + '/' + value.id + '">' + value.title + '</a></h4> <span>Precio real $' + new Intl.NumberFormat().format(value.precio_real) + '</br>Ganga $' + new Intl.NumberFormat().format(value.precio_ganga) + '</span> </div> </article>');
                    });
                } else {
                    $('.searh-results').empty();
                    $('.searh-results').append('<div align="center"><h2>No hay resultados para tu búsqueda</h2></div>');
                }
            });
}