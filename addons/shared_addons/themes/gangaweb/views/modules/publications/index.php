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
                                    <i class="active-opcion ifa fa-circle-o fa-stack-2x">1</i>
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
                                    <i class="active-opcion ifa fa-circle-o fa-stack-2x">1</i>
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
                                    <i class="ifa fa-circle-o fa-stack-2x">4</i>
                                </div>
                            </div>
                        </div>
                    </div>
                    <!-- PASOS NO MOBILES -->
                    <div class="title-block">
                        <h3><span>Categorias</span></h3>
                        <span>Porfavor seleciona una categoria</span>
                    </div>
                    <div style="margin-top: 50px">
                        <div class="content clearfix">
                            <div id="portfolio" class="portfolio grid-container portfolio-4 portfolio-masonry portfolio-margin clearfix">

                                <!--PC Y TABLETS-->
                                <?php foreach ($categories as $category): ?>
                                    <?php if ($category->main == 0): ?>
                                        <article class="portfolio-item pf-media pf-icons">
                                            <a style="cursor: pointer" href="<?php echo site_url('publications/step2/' . $category->title.'/'.$category->id) ?>">
                                                <div class="portfolio-image category-select-publication">
                                                    <img src="<?php echo site_url($category->file) ?>" alt="Open Imagination">
                                                    <div class="portfolio-overlay">
                                                        <div class="portfolio-desc">
                                                            <h3><?php echo $category->title ?></h3>
                                                        </div>
                                                    </div>
                                                </div>
                                            </a>
                                        </article>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            </div>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>