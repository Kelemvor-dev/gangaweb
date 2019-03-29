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
                                    <i class="active-opcion ifa fa-circle-o fa-stack-2x">3</i>
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
                                    <i class="active-opcion ifa fa-circle-o fa-stack-2x">3</i>
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
                        <h3><span>Categoria / <?php echo $this->session->userdata('categories')['category'] ?> </span></h3>
                        <span>Por favor diligencia todos los campos</span>
                    </div>
                    <div style="margin-top: 50px">
                        <div class="content clearfix">
                            <?php echo form_open_multipart(site_url('publications/step4'), array('style' => 'margin: auto;width: 50%;')); ?>
                            <div class="row">
                                <div class="nobottommargin clearfix">
                                    <div>
                                        <input type="hidden" name="categoria" value="<?php echo $categorie_id ?>">
                                        <input type="hidden" name="subcategoria" value="<?php echo $subcategorie_id ?>">
                                    </div>
                                    <div class="col_full">
                                        <label for="Titulo">Titulo:</label>
                                        <input type="text" id="login-form-username" name="title" value="" class="form-control">
                                    </div>
                                    <div class="col_full">
                                        <label for="Texto">Descripcion:</label>
                                        <textarea type="text" id="login-form-username" name="text" value="" class="form-control"></textarea>
                                    </div>
                                    <div class="col_full">
                                        <label>Imagenes:</label><br>
                                        <input id="input-3" name="file[]" type="file" class="file" multiple data-show-upload="false" data-show-caption="true"data-show-preview="true">
                                    </div>
                                    <?php if ($subcategorie_id == 3 || $subcategorie_id == 4 || $subcategorie_id == 6 || $subcategorie_id == 2): ?>
                                        <?php if ($subcategorie_id != 2): ?>
                                            <div class="col_full white-section">
                                                <label>Marca:</label><br>
                                                <select class="selectpicker" name="marca" data-live-search="true">
                                                    <?php foreach ($marca_autos as $marca): ?>
                                                        <option value="<?php echo $marca->marca_id ?>"><?php echo $marca->name ?></option>
                                                    <?php endforeach; ?>
                                                </select>
                                            </div>
                                        <?php else: ?>
                                            <div class="col_full white-section">
                                                <label>Marca:</label><br>
                                                <select class="selectpicker" name="marca_moto" data-live-search="true">

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
                                        <div class="col_full white-section">
                                            <label>Año:</label><br>
                                            <select class="selectpicker" name="ano" data-live-search="true">
                                                <?php for ($i = date('Y'); $i >= 1950; $i--): ?>
                                                    <option value="<?php echo $i ?>"><?php echo $i ?></option>
                                                <?php endfor; ?>
                                            </select>
                                        </div>
                                        <div class="col_full">
                                            <label for="Titulo">Kilometraje:</label>
                                            <input type="number" id="login-form-username" name="kilometraje" value="" class="form-control">
                                        </div>
                                        <?php if ($subcategorie_id == 2): ?>
                                            <div class="col_full">
                                                <label for="Titulo">Cilindraje:</label>
                                                <input type="number" id="login-form-username" name="cilindraje" value="" class="form-control">
                                            </div>
                                        <?php endif; ?>
                                        <div class="col_full white-section">
                                            <label>Condición:</label><br>
                                            <select class="selectpicker" name="condicion" data-live-search="true">
                                                <option value="1">Nuevo</option>
                                                <option value="2">Usado</option>
                                            </select>
                                        </div>
                                        <div class="col_full">
                                            <label for="Titulo">Color:</label>
                                            <input type="text" name="color" value="" class="form-control">
                                        </div>
                                        <div class="col_full">
                                            <label for="Titulo">Ciudad:</label>
                                            <input type="text"  name="ciudad" value="" class="form-control">
                                        </div>
                                        <div class="col_full">
                                            <label for="Titulo">Placa:</label>
                                            <input type="text" name="placa" value="" class="form-control">
                                        </div>
                                    <?php endif; ?>
                                    <?php if ($subcategorie_id == 8 || $subcategorie_id == 9 || $subcategorie_id == 10 || $subcategorie_id == 11): ?>
                                        <div class="col_full white-section">
                                            <label>Tipo de vivienda:</label><br>
                                            <select class="selectpicker" name="tipo_vivienda" data-live-search="true">
                                                <option value="casas">Casas</option>
                                                <option value="apartamentos">Apartamentos</option>
                                            </select>
                                        </div>
                                        <div class="row col_full">
                                            <div class="col-md-4" style="padding: 5px">
                                                <label for="Titulo">Cuartos:</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-home"></i></span> 
                                                    <input type="number"  name="cuartos" value="" class="form-control">
                                                </div>       
                                            </div>
                                            <div class="col-md-4" style="padding: 5px">
                                                <label for="Titulo">Baños:</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-bitbucket"></i></span> 
                                                    <input type="number"  name="banos" value="" class="form-control">
                                                </div>       
                                            </div>
                                            <div class="col-md-4" style="padding: 5px">
                                                <label for="Titulo">Garajes:</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-th-large"></i></span> 
                                                    <input type="number"  name="garajes" value="" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-4" style="padding: 5px">
                                                <label for="Titulo">Mts(2):</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-superscript"></i></span> 
                                                    <input type="number"  name="mts" value="" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-4" style="padding: 5px">
                                                <label for="Titulo">Antigüedad:</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-random"></i></span> 
                                                    <input type="number"  name="antiguedad" value="" class="form-control">
                                                    <span class="input-group-addon">Años</span> 
                                                </div>
                                            </div>
                                            <div class="col-md-4" style="padding: 5px">
                                                <label for="Titulo">Estrato:</label>
                                                <div class="input-group">
                                                    <span class="input-group-addon"><i class="icon-legal"></i></span> 
                                                    <input type="number"  name="estrato" value="" class="form-control">
                                                </div>
                                            </div>
                                            <div class="col-md-6" style="padding: 5px">
                                                <label for="Titulo">Ciudad:</label>
                                                <input type="text"  name="ciudad" value="" class="form-control">
                                            </div>
                                            <div class="col-md-6" style="padding: 5px">
                                                <label for="Titulo">Departamento:</label>
                                                <input type="text"  name="departamento" value="" class="form-control">
                                            </div>
                                            <div class="col-md-12" style="padding: 5px">
                                                <label for="Titulo">Direccion:</label>
                                                <input type="text"  name="direccion" value="" class="form-control">
                                            </div>
                                        </div>

                                    <?php endif; ?>
                                    <div class="row col_full">
                                        <div class="col-md-6">
                                            <label for="Titulo">Precio del mercado:</label>
                                            <div class="input-group">
                                                <span class="input-group-addon">$</span> 
                                                <input type="number"  name="precio_real" value="" class="form-control">
                                            </div>       
                                        </div>
                                        <div class="col-md-6">
                                            <label for="Titulo">Precio de tu ganga:</label>
                                            <div class="input-group">
                                                <span class="input-group-addon">$</span> 
                                                <input type="number"  name="precio_ganga" value="" class="form-control">
                                            </div>
                                        </div>
                                    </div>
                                    <input type="submit" class="btn btn-primary btn-lg btn-block" value="Siguiente" />
                                </div>
                            </div>
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