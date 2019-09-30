<section id="slider" class="slider-parallax swiper_wrapper full-screen clearfix" style="height: 426px !important;">
    <div class="slider-parallax-inner" >
        <div class="swiper-container swiper-parent">
            <div class="swiper-wrapper">
                <?php foreach ($banner as $banner): ?>
                    <div class="swiper-slide dark" style="background-image: url('{{ url:base }}<?php echo $banner->image ?>')">
                        <div class="container clearfix">
                            <div class="slider-caption slider-caption-center">
                                <h2 data-caption-animate="fadeInUp" style="font-size:36px"><?php echo $banner->title ?></h2>
                                <p data-caption-animate="fadeInUp" data-caption-delay="200" style="color:<?php echo $banner->color_text ?>;font-size:<?php echo $banner->position_text ?>px; backgrund-color:<?php echo $banner->color_text ?>; opacity:0.5;"><?php echo $banner->text ?></p>
                                <p data-caption-animate="fadeInUp" data-caption-delay="200">
                                    <a href="<?php echo site_url('shop') ?>" class="button button-3d button-rounded button-red">Compra</a>
                                    {{ if user:logged_in }}
                                    <a href="<?php echo site_url('publications') ?>" class="button button-3d button-rounded button-red">Vende</a>
                                    {{ else }}
                                    <a href="<?php echo site_url('users/login') ?>" class="button button-3d button-rounded button-red">Vende</a>
                                    {{ endif }}
                                </p>
                            </div>
                        </div>
                    </div>

                <?php endforeach; ?>
                <!--                <div class="swiper-slide dark">
                                    <div class="container clearfix">
                                        <div class="slider-caption slider-caption-center">
                                            <h3 data-caption-animate="fadeInUp">Lorem ipsum dolor sit amet</h3>
                                            <p data-caption-animate="fadeInUp" data-caption-delay="200">Sed ut perspiciatis unde omnis iste natus error sit voluptatem accusantium doloremque laudantium</p>
                                            <p data-caption-animate="fadeInUp" data-caption-delay="200">
                                                <a href="<?php echo site_url('shop') ?>" class="button button-3d button-rounded button-red">Compra</a>
                                                {{ if user:logged_in }}
                                                <a href="<?php echo site_url('publications') ?>" class="button button-3d button-rounded button-red">Vende</a>
                                                {{ else }}
                                                <a href="<?php echo site_url('users/login') ?>" class="button button-3d button-rounded button-red">Vende</a>
                                                {{ endif }}
                                            </p>
                                        </div>
                                    </div>
                                    <div class="video-wrap">
                                        <video id="slide-video" poster="{{ url:base }}addons/shared_addons/themes/gangaweb/images/videos/explore.jpg" preload="auto" loop autoplay muted>
                                            <source src='{{ url:base }}addons/shared_addons/themes/gangaweb/images/videos/explore.webm' type='video/webm' />
                                            <source src='{{ url:base }}addons/shared_addons/themes/gangaweb/images/videos/explore.mp4' type='video/mp4' />
                                        </video>
                                        <div class="video-overlay" style="background-color: rgba(0,0,0,0.55);"></div>
                                    </div>
                                </div>-->                
            </div>
            <div id="slider-arrow-left"><i class="icon-angle-left"></i></div>
            <div id="slider-arrow-right"><i class="icon-angle-right"></i></div>
        </div>
        <a href="#" data-scrollto="#content" data-offset="100" class="dark one-page-arrow"><i class="icon-angle-down infinite animated fadeInDown"></i></a>
    </div>
</section>
<section>
    <div class="row visible-xs">
        <div class="col-md-3" style="z-index: 0">
            <div class="feature-box fbox-center fbox-dark fbox-effect">
                <div class="fbox-icon non-margin" style="    height: 50px;">
                    <a href="<?php echo site_url('shop') ?>" class="button button-3d button-rounded button-red" style="height: 39px;position: absolute;margin-left: -101px;width: 109px;">Compra</a>
                    {{ if user:logged_in }}
                    <a href="<?php echo site_url('publications') ?>" class="button button-3d button-rounded button-red" style="height: 39px;position: absolute;margin-left: 91%;width: 109px;">Vende</a>
                    {{ else }}
                    <a href="<?php echo site_url('users/login') ?>" class="button button-3d button-rounded button-red" style="height: 39px;position: absolute;margin-left: 91%;width: 109px;">Vende</a>
                    {{ endif }}
                </div>
            </div>
        </div>
    </div>
</section>
{{ if user:logged_in }}
{{ else }}
<!--<section id="content">
    <div class="content-wrap">
        <div class="container clearfix">
            <div class="col_one_third nobottommargin">
                <div class="well well-lg nobottommargin">
                    <form id="login-form" name="login-form" class="nobottommargin" action="<?php echo site_url('users/login') ?>" method="post" accept-charset="utf-8">
                        <h3>Iniciar sesión</h3>
                        <div style="display:none;">
                            <input type="hidden" name="redirect_to" value="">
                        </div>
                        <div class="col_full">
                            <label for="login-form-username">E-mail:</label>
                            <input type="text" id="login-form-username" name="email" value="" class="form-control">
                        </div>
                        <div class="col_full">
                            <label for="login-form-password">Contraseña:</label>
                            <input type="password" id="login-form-password" name="password" value="" class="form-control">
                        </div>
                        <div class="col_full nobottommargin">
                            <button class="button button-3d nomargin" id="login-form-submit" name="login-form-submit" value="login">Entrar</button>
                            <a href="<?php echo site_url('users/reset_pass') ?>" class="fright">Recuperar contraseña?</a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col_two_third col_last nobottommargin">
                <h3>No tienes cuenta? Registrate Ya.</h3>
                <form id="register-form" name="register-form" class="nobottommargin" action="<?php echo site_url('register') ?>" method="post" accept-charset="utf-8">
                    <div class="col_half">
                        <label for="register-form-name">Nombres:</label>
                        <input type="text" id="register-form-name" name="first_name" value="" class="form-control">
                    </div>
                    <div class="col_half col_last">
                        <label for="register-form-email">Apellidos:</label>
                        <input type="text" id="register-form-email" name="last_name" value="" class="form-control">
                    </div>
                    <div class="clear"></div>
                    <div class="col_half">
                        <label for="register-form-name">E-mail:</label>
                        <input type="email" id="register-form-name" name="email" value="" class="form-control">
                        <input type="text" name="d0ntf1llth1s1n" value=" " class="form-control" style="display:none">
                    </div>
                    <div class="col_half col_last">
                        <label for="register-form-email">Contraseña</label>
                        <input type="password" id="register-form-email" name="password" value="" class="form-control">
                    </div>
                    <div class="clear"></div>
                    <div class="col_full nobottommargin">
                        <button class="button button-3d button-black nomargin" id="register-form-submit" name="register-form-submit" value="register">Registrarse</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>-->
{{ endif}}
<section id="content">
    <div class="row clearfix common-height module-background">
        <?php foreach ($enlaces_interes as $enlaces): ?>
            <div class="col-md-6 center col-padding module-background">
                <div>
                    <div class="heading-block nobottomborder">
                        <!--<span class="before-heading color">Lorem ipsum dolor sit amet</span>-->
                        <h3><?php echo $enlaces->title ?></h3>
                    </div>

                    <div class="center bottommargin">
                        <a href="<?php echo $enlaces->link ?>" data-lightbox="iframe" style="position: relative;">
                            <img src="{{ url:base }}<?php echo $enlaces->image ?>" alt="Video">
                            <span class="i-overlay nobg"><img src="{{ url:base }}addons/shared_addons/themes/gangaweb/images/icons/video-play.png" alt="Play"></span>
                        </a>
                    </div>
                    <p class="lead nobottommargin"><?php echo $enlaces->text ?></p>
                </div>
            </div>
        <?php endforeach; ?>
        <div class="col-md-6 center col-padding module-background">
            <div class="row-fluid">
                <?php foreach ($publications as $key => $item): ?>
                    <?php if ($key <= 15): ?>
                        <?php if ($item->sello_calidad == 1): ?>
                            <div class="garantie-logo-home">
                                <img src="<?php echo site_url("addons/shared_addons/themes/gangaweb/images/garantie.png") ?>">
                            </div>
                        <?php endif; ?>
                        <div id="shop">
                            <div>
                                <div class="col-md-4 center" style="height: 128px;overflow: hidden;padding: 4px;">
                                    <div class="product-image" style="">
                                        <a href="<?php echo site_url('shop/preOrder/' . $item->categoria . '/' . $item->id) ?>"><img src="<?php echo site_url($item->file) ?>" width="100%" height="auto"></a>
                                        <div class="sale-flash"><?php echo intval(($item->precio_real - $item->precio_ganga) / ($item->precio_real) * 100) ?>% de ahorro</div>
                                        <div class="product-overlay">
                                            <a href="" class="item-quick-view" style="width: 100%;"><i class="icon-zoom-in2"></i><span> Más información</span></a>
                                        </div>
                                    </div>
                                </div>
                            </div>
                        </div>
                    <?php endif; ?>
                <?php endforeach; ?>              
            </div>
        </div>
    </div>
    <div class="col-md-12 center col-padding" style="background-color: #F5F5F5;">
        <?php foreach ($publications as $key => $item): ?>
            <?php if ($key > 15): ?>
                <?php if ($item->sello_calidad == 1): ?>
                    <div class="garantie-logo-home">
                        <img src="<?php echo site_url("addons/shared_addons/themes/gangaweb/images/garantie.png") ?>">
                    </div>
                <?php endif; ?>
                <div id="shop">
                    <div>
                        <div class="col-md-2 center" style="padding: 4px;">
                            <div class="product-image" style="height: auto;">
                                <a href="<?php echo site_url('shop/preOrder/' . $item->categorie . '/' . $item->id) ?>"><img src="<?php echo site_url($item->file) ?>" width="100%" height="auto"></a>
                                <div class="sale-flash"><?php echo intval(($item->precio_real - $item->precio_ganga) / ($item->precio_real) * 100) ?>% de ahorro</div>
                                <div class="product-overlay">
                                    <a href="" class="item-quick-view" style="width: 100%;"><i class="icon-zoom-in2"></i><span> Más información</span></a>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            <?php endif; ?>
        <?php endforeach; ?>        
    </div>
</section>
<!--<div class="container clearfix" style="width: 100% !important"></br></br></div>-->
<div class="container clearfix" style="width: 100% !important">
    <div id="oc-clients" class="owl-carousel image-carousel carousel-widget" data-margin="60" data-loop="true" data-nav="false" data-autoplay="5000" data-pagi="false" data-items-xxs="2" data-items-xs="3" data-items-sm="4" data-items-md="5" data-items-lg="6">
        <?php foreach ($publicidad as $item): ?>
            <div class="oc-item">
                <a href="<?php echo $item->link ?>" target="_blank">
                    <img src="{{ url:base }}<?php echo $item->image ?>" alt="Clients">
                </a>
            </div>
        <?php endforeach; ?>
    </div>
</div>


</section>