<section id="content clearfix">
    <div class="content-wrap">
        <div class="container clearfix">
            <div class="row clearfix">
                <div class="clearfix">
                    <div class="title-block">
                        <h3><span>En cuál de nuestros productos esta interesado</span></h3>
                        <span>Porfavor seleciona una categoria</span>
                    </div>
                    <div style="margin-top: 50px">
                        <div class="content clearfix">
                            <div id="portfolio" class="portfolio grid-container portfolio-4 portfolio-masonry portfolio-margin clearfix">

                                <!--PC Y TABLETS-->
                                <?php foreach ($categories as $category): ?>
                                    <?php if ($category->main == 0): ?>
                                        <article class="portfolio-item pf-media pf-icons">
                                            <a style="cursor: pointer" href="<?php echo site_url('shop/products/' . $category->title.'/'.$category->id) ?>">
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