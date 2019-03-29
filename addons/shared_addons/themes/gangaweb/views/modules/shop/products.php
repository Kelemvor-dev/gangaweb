<section id="content clearfix">
    <div class="content-wrap">
        <!-- Page Title
                        ============================================= -->
        <section id="page-title">
            <div class="container clearfix">
                <h1>Compra</h1>
                <span>Encuentra tu ganga</span>
                <ol class="breadcrumb">
                    <li>Inicio</li>
                    <li class="active">Compra</li>
                </ol>
            </div>
        </section><!-- #page-title end -->

        <!-- Content
        ============================================= -->
        <section id="content">

            <div class="content-wrap">

                <div class="container clearfix">
                    <div class="sidebar nobottommargin">
                        <div class="sidebar-widgets-wrap">

                            <div class="widget widget_links clearfix">
                                <form  action="<?php echo site_url('shop/products/Carros-Camionetas/' . $categorieId) ?>" method="post">                                    
                                    <h4>Ordenar por:</h4>
                                    <div>
                                        <label>Menor que:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon">$</span>
                                            <input type="text" name="menor" value="" class="form-control">
                                        </div>
                                    </div>
                                    <div>
                                        <label>Mayor que:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon">$</span>
                                            <input type="text" name="mayor" value="" class="form-control">
                                        </div>
                                    </div>
                                    <?php if ($categorieId == 1 || $categorieId == 3 || $categorieId == 4 || $categorieId == 6 || $categorieId == 2): ?>
                                        <div class="white-section">
                                            <label>Condición:</label><br>
                                            <select class="selectpicker" name="condicion" data-live-search="true">
                                                <option value="">Seleccione</option>
                                                <option value="1">Nuevo</option>
                                                <option value="2">Usado</option>
                                            </select>
                                        </div>
                                        <?php if ($categorieId != 2): ?>
                                            <div class="white-section">
                                                <label>Marca:</label><br>
                                                <select class="selectpicker" name="marca" data-live-search="true">
                                                    <option value="">Seleccione</option>
                                                    <?php foreach ($marca_autos as $marca): ?>
                                                        <option value="<?php echo $marca->marca_id ?>"><?php echo $marca->name ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        <?php else: ?>
                                            <div class="white-section">
                                                <label>Marca:</label><br>
                                                <select class="selectpicker" name="marca_moto" data-live-search="true">
                                                    <option value="">Seleccione</option>
                                                    <option value="AG">AG</option>

                                                    <option value="Agusta">Agusta</option>

                                                    <option value="AJS">AJS</option>

                                                    <option value="Akt">Akt</option>

                                                    <option value="AMC">AMC</option>

                                                    <option value="Aprilia">Aprilia</option>

                                                    <option value="Ayco">Ayco</option>

                                                    <option value="Bajaj">Bajaj</option>

                                                    <option value="Benelli">Benelli</option>

                                                    <option value="Beta">Beta</option>

                                                    <option value="BMW">BMW</option>

                                                    <option value="Boss">Boss</option>

                                                    <option value="Buell">Buell</option>

                                                    <option value="Cagiva">Cagiva</option>

                                                    <option value="Can Am">Can Am</option>

                                                    <option value="Ducati">Ducati</option>

                                                    <option value="Energy Motion">Energy Motion</option>

                                                    <option value="Gasgas">Gasgas</option>

                                                    <option value="Gilera">Gilera</option>

                                                    <option value="Harley Davidson">Harley Davidson</option>

                                                    <option value="Hero">Hero</option>

                                                    <option value="Honda">Honda</option>

                                                    <option value="Honlei">Honlei</option>

                                                    <option value="Husqvarna">Husqvarna</option>

                                                    <option value="Hyusung">Hyusung</option>

                                                    <option value="Jialing">Jialing</option>

                                                    <option value="Kawasaki">Kawasaki</option>

                                                    <option value="KTM">KTM</option>

                                                    <option value="Kymco">Kymco</option>

                                                    <option value="Lambretta">Lambretta</option>

                                                    <option value="Lifan">Lifan</option>

                                                    <option value="Max-Motor">Max-Motor</option>

                                                    <option value="MD Bikes">MD Bikes</option>

                                                    <option value="Piaggio">Piaggio</option>

                                                    <option value="Polaris">Polaris</option>

                                                    <option value="Qingqi">Qingqi</option>

                                                    <option value="Roke Yourany">Roke Yourany</option>

                                                    <option value="Royal Enfield">Royal Enfield</option>

                                                    <option value="Sachs">Sachs</option>

                                                    <option value="Sigma">Sigma</option>

                                                    <option value="Suzuki">Suzuki</option>

                                                    <option value="SYM">SYM</option>

                                                    <option value="Takasaki">Takasaki</option>

                                                    <option value="Triumph">Triumph</option>

                                                    <option value="TVS">TVS</option>

                                                    <option value="United Motors">United Motors</option>

                                                    <option value="Vento">Vento</option>

                                                    <option value="Vespa">Vespa</option>

                                                    <option value="Victory">Victory</option>

                                                    <option value="Yakima">Yakima</option>

                                                    <option value="Yamaha">Yamaha</option>

                                                    <option value="Otro">Otro</option>

                                                </select>
                                            </div>
                                        <?php endif; ?>
                                        <div class="white-section">
                                            <label>Año:</label><br>
                                            <select class="selectpicker" name="ano" data-live-search="true">
                                                <option value="">Seleccione</option>
                                                <?php for ($i = date('Y'); $i >= 1950; $i--): ?>
                                                    <option value="<?php echo $i ?>"><?php echo $i ?></option>
                                                <?php endfor; ?>
                                            </select>
                                        </div>
                                        <div class="white-section">
                                            <label for="Titulo">Kilometraje:</label>
                                            <input type="number" id="login-form-username" name="kilometraje" value="" class="form-control">
                                        </div>                                    
                                        <div class="white-section">
                                            <label for="Titulo">Cilindraje:</label>
                                            <input type="number" id="login-form-username" name="cilindraje" value="" class="form-control">
                                        </div> 
                                        <div class="white-section">
                                            <label for="Titulo">Ciudad:</label>
                                            <input type="text"  name="ciudad" value="" class="form-control">
                                        </div>
                                    <?php endif; ?>
                                    <?php if ($categorieId == 7 || $categorieId == 8 || $categorieId == 9 || $categorieId == 10 || $categorieId == 11): ?>
                                        <div class="col_full white-section">
                                            <label>Tipo de vivienda:</label><br>
                                            <select class="selectpicker" name="tipo_vivienda" data-live-search="true">
                                                <option value="casas">Casas</option>
                                                <option value="apartamentos">Apartamentos</option>
                                            </select>
                                        </div>
                                        <div class="row col_full">
                                            <div class="col-md-6 white-section" style="padding: 5px">
                                                <label for="Titulo">Cuartos:</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-home"></i></span> 
                                                    <input type="number"  name="cuartos" value="" class="form-control">
                                                </div>       
                                            </div>
                                            <div class="col-md-6 white-section" style="padding: 5px">
                                                <label for="Titulo">Baños:</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-bitbucket"></i></span> 
                                                    <input type="number"  name="banos" value="" class="form-control">
                                                </div>       
                                            </div>
                                            <div class="col-md-6 white-section" style="padding: 5px">
                                                <label for="Titulo">Garajes:</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-th-large"></i></span> 
                                                    <input type="number"  name="garajes" value="" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6 white-section" style="padding: 5px">
                                                <label for="Titulo">Mts(2):</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-superscript"></i></span> 
                                                    <input type="number"  name="mts" value="" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-12 white-section" style="padding: 5px">
                                                <label for="Titulo">Antigüedad:</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-random"></i></span> 
                                                    <input type="number"  name="antiguedad" value="" class="form-control">
                                                    <span class="input-group-addon">Años</span> 
                                                </div>
                                            </div>
                                            <div class="col-md-12 white-section" style="padding: 5px">
                                                <label for="Titulo">Estrato:</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-legal"></i></span> 
                                                    <input type="number"  name="estrato" value="" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6 white-section" style="padding: 5px">
                                                <label for="Titulo">Ciudad:</label>
                                                <input type="text"  name="ciudad" value="" class="form-control">
                                            </div>
                                            <div class="col-md-6 white-section" style="padding: 5px">
                                                <label for="Titulo">Departamento:</label>
                                                <input type="text"  name="departamento" value="" class="form-control">
                                            </div>
                                            <div class="col-md-12 white-section" style="padding: 5px">
                                                <label for="Titulo">Direccion:</label>
                                                <input type="text"  name="direccion" value="" class="form-control">
                                            </div>
                                        </div>

                                    <?php endif; ?>
                                    <div class="white-section" align="center" style="margin-top: 20px">
                                        <button class="button button-border button-rounded button-blue" type="submit">Aplicar filtro</button>
                                    </div>   
                                </form>
                            </div>

                            <!--                            <div class="widget clearfix">
                            
                                                            <h4>Ultimas gangas vendidas</h4>
                                                            <div id="post-list-footer">
                            
                                                                <div class="spost clearfix">
                                                                    <div class="entry-image">
                                                                        <a href="#"><img src="{{ url:base }}addons/shared_addons/themes/gangaweb/images/shop/small/1.jpg" alt="Image"></a>
                                                                    </div>
                                                                    <div class="entry-c">
                                                                        <div class="entry-title">
                                                                            <h4><a href="#">Blue Round-Neck Tshirt</a></h4>
                                                                        </div>
                                                                        <ul class="entry-meta">
                                                                            <li class="color">$29.99</li>
                                                                            <li><i class="icon-star3"></i> <i class="icon-star3"></i> <i class="icon-star3"></i> <i class="icon-star3"></i> <i class="icon-star-half-full"></i></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                            
                                                                <div class="spost clearfix">
                                                                    <div class="entry-image">
                                                                        <a href="#"><img src="{{ url:base }}addons/shared_addons/themes/gangaweb/images/shop/small/6.jpg" alt="Image"></a>
                                                                    </div>
                                                                    <div class="entry-c">
                                                                        <div class="entry-title">
                                                                            <h4><a href="#">Checked Short Dress</a></h4>
                                                                        </div>
                                                                        <ul class="entry-meta">
                                                                            <li class="color">$23.99</li>
                                                                            <li><i class="icon-star3"></i> <i class="icon-star3"></i> <i class="icon-star3"></i> <i class="icon-star-half-full"></i> <i class="icon-star-empty"></i></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                            
                                                                <div class="spost clearfix">
                                                                    <div class="entry-image">
                                                                        <a href="#"><img src="{{ url:base }}addons/shared_addons/themes/gangaweb/images/shop/small/7.jpg" alt="Image"></a>
                                                                    </div>
                                                                    <div class="entry-c">
                                                                        <div class="entry-title">
                                                                            <h4><a href="#">Light Blue Denim Dress</a></h4>
                                                                        </div>
                                                                        <ul class="entry-meta">
                                                                            <li class="color">$19.99</li>
                                                                            <li><i class="icon-star3"></i> <i class="icon-star3"></i> <i class="icon-star3"></i> <i class="icon-star-empty"></i> <i class="icon-star-empty"></i></li>
                                                                        </ul>
                                                                    </div>
                                                                </div>
                            
                                                            </div>
                            
                                                        </div>-->
                        </div>
                    </div>
                    <!-- Post Content
                    ============================================= -->
                    <div class="postcontent nobottommargin col_last">                        
                        <!-- Shop
                        ============================================= -->
                        <div id="shop" class="shop product-1 clearfix ">
                            <?php foreach ($publications as $publicate): ?>
                                <?php if ($publicate->state == 1 or $publicate->state == 3): ?>
                                    <div class="div-divider-left">
                                        <a href="#" data-scrollto="#header"><i class="icon-chevron-up icon-border-circle"></i></a>
                                    </div>
                                    <hr>
                                    <div class="product clearfix">
                                        <?php if ($publicate->sello_calidad == 1): ?>
                                            <div class="garantie-logo">
                                                <img src="<?php echo site_url("addons/shared_addons/themes/gangaweb/images/garantie.png") ?>">
                                            </div>
                                        <?php endif; ?>
                                        <div class="product-image" style="height: auto;">

                                            <?php foreach ($imagesPublications as $image): ?>
                                                <?php if ($publicate->id == $image->publication_id): ?>
                                                    <a href="<?php echo site_url('shop/preOrder/' . $categorieId . '/' . $publicate->id) ?>"><img src="<?php echo site_url($image->file) ?>" width="100%" height="auto"></a>
                                                <?php endif; ?>
                                            <?php endforeach; ?>
                                            <div class="sale-flash"><?php echo intval(($publicate->precio_real - $publicate->precio_ganga) / ($publicate->precio_real) * 100) ?>% de ganga</div>
                                            <div class="product-overlay">
                                                <a href="<?php echo site_url('shop/preOrder/' . $categorieId . '/' . $publicate->id) ?>" class="item-quick-view" style="width: 100%;"><i class="icon-zoom-in2"></i><span> Más información</span></a>
                                            </div>
                                        </div>
                                        <div class="product-desc">
                                            <div class="product-title"><h3><a href="#"><?php echo $publicate->title ?></a></h3></div>
                                            <div class="product-price"><del>Precio real $<?php echo number_format($publicate->precio_real) ?></del> <ins> Ganga $<?php echo number_format($publicate->precio_ganga) ?></ins></div>
                                            <!--                                        <div class="product-rating">
                                                                                        <i class="icon-star3"></i>
                                                                                        <i class="icon-star3"></i>
                                                                                        <i class="icon-star3"></i>
                                                                                        <i class="icon-star3"></i>
                                                                                        <i class="icon-star-half-full"></i>
                                                                                    </div>-->
                                            <p><?php echo substr($publicate->text, 0, 200) ?>...</p>

                                            <ul class="iconlist">

                                                <?php if ($publicate->marca): ?>
                                                    <li><i class="icon-caret-right"></i>Marca: <?php echo $publicate->marca ?></li>
                                                <?php endif; ?>
                                                <?php if ($publicate->marca_moto): ?>
                                                    <li><i class="icon-caret-right"></i>Marca: <?php echo $publicate->marca_moto ?></li>
                                                <?php endif; ?>
                                                <?php if ($publicate->ano): ?>
                                                    <li><i class="icon-caret-right"></i> Año: <?php echo $publicate->ano ?></li>
                                                <?php endif; ?>
                                                <?php if ($publicate->kilometraje): ?>
                                                    <li><i class="icon-caret-right"></i> Kilometraje: <?php echo number_format($publicate->kilometraje) ?> km</li>
                                                <?php endif; ?>
                                                <?php if ($publicate->cilindraje): ?>
                                                    <li><i class="icon-caret-right"></i>Cilindraje: <?php echo $publicate->cilindraje ?></li>
                                                <?php endif; ?>
                                                <?php if ($publicate->color): ?>
                                                    <li><i class="icon-caret-right"></i> Color: <?php echo $publicate->color ?></li>
                                                <?php endif; ?>
                                                <?php if ($publicate->placa): ?>
                                                    <li><i class="icon-caret-right"></i> Placa: <?php echo $publicate->placa ?></li>
                                                <?php endif; ?>
                                                <?php if ($publicate->tipo_vivienda): ?>
                                                    <li><i class="icon-caret-right"></i> Tipo de vivienda: <?php echo $publicate->tipo_vivienda ?></li>
                                                <?php endif; ?>
                                                <?php if ($publicate->cuartos): ?>
                                                    <li><i class="icon-caret-right"></i> Nro de cuartos: <?php echo $publicate->cuartos ?></li>
                                                <?php endif; ?>
                                                <?php if ($publicate->banos): ?>
                                                    <li><i class="icon-caret-right"></i> Nro de baños: <?php echo $publicate->banos ?></li>
                                                <?php endif; ?>
                                                <?php if ($publicate->garajes): ?>
                                                    <li><i class="icon-caret-right"></i> Nro de garajes: <?php echo $publicate->garajes ?></li>
                                                <?php endif; ?>
                                                <?php if ($publicate->mts): ?>
                                                    <li><i class="icon-caret-right"></i> Mts(2): <?php echo $publicate->mts ?> mts</li>
                                                <?php endif; ?>
                                                <?php if ($publicate->antiguedad): ?>
                                                    <li><i class="icon-caret-right"></i> Antiguedad: <?php echo $publicate->antiguedad ?> años</li>
                                                <?php endif; ?>
                                                <?php if ($publicate->estrato): ?>
                                                    <li><i class="icon-caret-right"></i> Estrato: <?php echo $publicate->estrato ?></li>
                                                <?php endif; ?>
                                                <?php if ($publicate->ciudad): ?>
                                                    <li><i class="icon-caret-right"></i> Ciudad: <?php echo $publicate->ciudad ?></li>
                                                <?php endif; ?>
                                                <?php if ($publicate->departamento): ?>
                                                    <li><i class="icon-caret-right"></i> Departamento: <?php echo $publicate->departamento ?></li>
                                                <?php endif; ?>
                                                <?php if ($publicate->direccion): ?>
                                                    <li><i class="icon-caret-right"></i> Direccion: <?php echo $publicate->direccion ?></li>
                                                    <?php endif; ?>
                                            </ul>

                                        </div>
                                    </div>
                                <?php endif; ?>
                            <?php endforeach; ?>
                        </div><!-- #shop end -->

                    </div><!-- .postcontent end -->



                </div>

            </div>

        </section><!-- #content end -->
    </div>
</section>