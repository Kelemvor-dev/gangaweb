<section id="content clearfix">
    <div class="content-wrap">
        <div class="container clearfix">
            <div class="row clearfix">
                <div class="clearfix">
                    <div class="fancy-title title-dotted-border title-center">
                        <h1>Pasos para realizar una <span>publicación</span></h1>
                    </div>
                    <!--OPCION VISIBLE PARA MOBIL-->
                    <div class="row visible-xs" style="margin: auto;width: 50%;">
                        <div class="col-md-3" style="z-index: 0">
                            <div class="feature-box fbox-center fbox-dark fbox-effect">
                                <div class="fbox-icon non-margin">
                                    <i class="active-opcion ifa fa-circle-o fa-stack-2x">4</i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!--OPCIONES VISIBLES PARA PC-->
                    <div class="row hidden-xs" style="margin: auto;width: 50%;">
                        <div style="width: 45%;height: 100px;z-index: 1;position: absolute;"></div>
                        <div class="col-md-3" style="z-index: 0">
                            <div class="feature-box fbox-center fbox-dark fbox-effect">
                                <div class="fbox-icon non-margin">
                                    <i class="ifa fa-circle-o fa-stack-2x">1</i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="z-index: 0">
                            <div class="feature-box fbox-center fbox-dark fbox-effect">
                                <div class="fbox-icon non-margin">
                                    <i class="ifa fa-circle-o fa-stack-2x">2</i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="z-index: 0">
                            <div class="feature-box fbox-center fbox-dark fbox-effect">
                                <div class="fbox-icon non-margin">
                                    <i class="ifa fa-circle-o fa-stack-2x">3</i>
                                </div>
                            </div>
                        </div>
                        <div class="col-md-3" style="z-index: 0">
                            <div class="feature-box fbox-center fbox-dark fbox-effect">
                                <div class="fbox-icon non-margin">
                                    <i class="active-opcion ifa fa-circle-o fa-stack-2x">4</i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- PASOS NO MOBILES -->
                    <div class="title-block">
                        <h3><span>Enviar Publicaion</span></h3>
                        <span>A continuacion selecciona el metodo de publicacion</span>
                    </div>
                    <div style="margin-top: 50px">
                        <div class="content clearfix">
                            <?php echo form_open_multipart(site_url('publications/savePubli/'. $id), array('style' => 'margin: auto;width: 80%;')); ?>
                            <div class="pricing bottommargin clearfix">
                                <div class="col-sm-4">
                                    <div class="pricing-box">
                                        <div class="pricing-title">
                                            <h3>Plata</h3>
                                        </div>
                                        <div class="pricing-price">
                                            <span class="price-unit">$</span> Gratis<span class="price-tenure"></span>
                                        </div>
                                        <div class="pricing-features">
                                            <ul>
                                                <li>Publicacion</li>
                                                <li>No destacados</li>
                                                <li><strong>No </strong> publicidad</li>
                                                <li><strong>No </strong> soporte</li>
                                                <li>No sello de calidad</li>
                                            </ul>
                                        </div>
                                        <div class="pricing-action">
                                            <div>
                                                <input id="radio-1" class="radio-style" name="plan" value="1" type="radio">
                                                <label for="radio-1" class="radio-style-3-label">Selecciona</label>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-sm-4">

                                    <div class="pricing-box best-price">
                                        <div class="pricing-title">
                                            <h3>Oro</h3>
                                            <span>El mas popular</span>
                                        </div>
                                        <div class="pricing-price">
                                            <span class="price-unit">$</span>3 %<span class="price-tenure">Sobre la venta</span>
                                        </div>
                                        <div class="pricing-features">
                                            <ul>
                                                <li>Publicacion</li>
                                                <li>En destacados</li>
                                                <li><strong>Con </strong> publicidad</li>
                                                <li><strong>No </strong> soporte</li>
                                                <li>No sello de calidad</li>
                                            </ul>
                                        </div>
                                        <div class="pricing-action">
                                            <div>
                                                <input id="radio-2" class="radio-style" name="plan" value="2" type="radio">
                                                <label for="radio-2" class="radio-style-3-label">Selecciona</label>
                                            </div>
                                        </div>
                                    </div>

                                </div>

                                <div class="col-sm-4">

                                    <div class="pricing-box">
                                        <div class="pricing-title">
                                            <h3>Diamante</h3>
                                        </div>
                                        <div class="pricing-price">
                                            <span class="price-unit">$</span>5 %<span class="price-tenure">Sobre la venta</span>
                                        </div>
                                        <div class="pricing-features">
                                            <ul>
                                                <li>Publicacion</li>
                                                <li>En destacados</li>
                                                <li><strong>Con </strong> publicidad</li>
                                                <li><strong>Con </strong> soporte</li>
                                                <li>Con sello de calidad</li>
                                            </ul>
                                        </div>
                                        <div class="pricing-action">
                                            <div>
                                                <input id="radio-3" class="radio-style" name="plan" value="3" type="radio">
                                                <label for="radio-3" class="radio-style-3-label">Selecciona</label>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            </div>
                            <input type="submit" class="btn btn-primary btn-lg btn-block" value="Finalizar Publicacion" />
                            <?php echo form_close(); ?>
                        </div>
                    </div>
                    <div style="margin-top: 40px;">
                        <a href="javascript:history.back(1)" class="button button-border button-rounded button-fill fill-from-right button-black" style="float: right"><span>Regresar</span></a>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>