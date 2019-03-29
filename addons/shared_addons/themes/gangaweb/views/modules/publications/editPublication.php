<section id="content clearfix">
    <div class="content-wrap">
        <div class="container clearfix">
            <div class="row clearfix">
                <div class="content clearfix">
                    <?php echo form_open_multipart(site_url('publications/saveEditpublication/'.$publication->id), array('style' => 'margin: auto;width: 50%;')); ?>
                    <div class="row">
                        <div class="nobottommargin clearfix">
                            <div>
                                <input type="hidden" name="categoria" value="<?php echo $publication->categoria ?>">
                                <input type="hidden" name="subcategoria" value="<?php echo $publication->subcategoria ?>">
                            </div>
                            <div class="col_full">
                                <label for="Titulo">Titulo:</label>
                                <input type="text" id="login-form-username" name="title" value="<?php echo $publication->title ?>" class="form-control">
                            </div>
                            <div class="col_full">
                                <label for="Texto">Descripcion:</label>
                                <textarea type="text" id="login-form-username" name="text" value="" class="form-control" style="height: 200px"><?php echo $publication->text ?></textarea>
                            </div>
                            <div class="col_full">
                                <label>Imagenes:</label><br>
                                <input id="input-3" name="file[]" type="file" class="file" multiple data-show-upload="false" data-show-caption="true" data-show-preview="true">
                                <?php foreach ($imagesPublications as $image): ?>
                                    <?php if ($publication->id == $image->publication_id): ?>
                                        <div class="col_two_fifth" style="margin-top: 30px">
                                            <div class="thumbnail">
                                                <img src="<?php echo site_url($image->file) ?>" style="display: block;">
                                                <div align='center' class="caption">                                                    
                                                    <a href="<?php echo site_url('publications/deleteImage/' . $image->id . '/' . $id_noti . '/' . $process . '/' . $publication->id) ?>" class="btn btn-danger" role="button">Eliminar</a>
                                                </div>
                                            </div>
                                        </div>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                            </div>
                            <?php if ($publication->subcategoria == 3 || $publication->subcategoria == 4 || $publication->subcategoria == 6 || $publication->subcategoria == 2): ?>
                                <?php if ($publication->subcategoria != 2): ?>
                                    <div class="col_full white-section">
                                        <label>Marca:</label><br>
                                        <select class="selectpicker" name="marca" data-live-search="true">
                                            <?php foreach ($marca_autos as $marca): ?>
                                                <option value="<?php echo $marca->marca_id ?>" <?php if ($marca->marca_id == $publication->marca): ?>selected=""<?php endif; ?>><?php echo $marca->name ?></option>
                                            <?php endforeach; ?>
                                        </select>
                                    </div>
                                <?php else: ?>
                                    <div class="col_full white-section">
                                        <label>Marca:</label><br>
                                        <select class="selectpicker" name="marca_moto" data-live-search="true">

                                            <option value="AG" <?php if ('AG' == $publication->marca_moto): ?>selected=""<?php endif; ?>>AG</option>

                                            <option value="Agusta" <?php if ('Agusta' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Agusta</option>

                                            <option value="AJS" <?php if ('AJS' == $publication->marca_moto): ?>selected=""<?php endif; ?>>AJS</option>

                                            <option value="Akt" <?php if ('Akt' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Akt</option>

                                            <option value="AMC" <?php if ('AMC' == $publication->marca_moto): ?>selected=""<?php endif; ?>>AMC</option>

                                            <option value="Aprilia" <?php if ('Aprilia' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Aprilia</option>

                                            <option value="Ayco" <?php if ('Ayco' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Ayco</option>

                                            <option value="Bajaj" <?php if ('Bajaj' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Bajaj</option>

                                            <option value="Benelli" <?php if ('Benelli' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Benelli</option>

                                            <option value="Beta" <?php if ('Beta' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Beta</option>

                                            <option value="BMW" <?php if ('BMW' == $publication->marca_moto): ?>selected=""<?php endif; ?>>BMW</option>

                                            <option value="Boss" <?php if ('Boss' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Boss</option>

                                            <option value="Buell" <?php if ('Buell' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Buell</option>

                                            <option value="Cagiva" <?php if ('Cagiva' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Cagiva</option>

                                            <option value="Can Am" <?php if ('Can Am' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Can Am</option>

                                            <option value="Ducati" <?php if ('Ducati' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Ducati</option>

                                            <option value="Energy Motion" <?php if ('Energy Motion' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Energy Motion</option>

                                            <option value="Gasgas" <?php if ('Gasgas' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Gasgas</option>

                                            <option value="Gilera" <?php if ('Gilera' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Gilera</option>

                                            <option value="Harley Davidson" <?php if ('Harley Davidson' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Harley Davidson</option>

                                            <option value="Hero" <?php if ('Hero' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Hero</option>

                                            <option value="Honda" <?php if ('Honda' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Honda</option>

                                            <option value="Honlei" <?php if ('Honlei' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Honlei</option>

                                            <option value="Husqvarna" <?php if ('Husqvarna' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Husqvarna</option>

                                            <option value="Hyusung" <?php if ('Hyusung' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Hyusung</option>

                                            <option value="Jialing" <?php if ('Jialing' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Jialing</option>

                                            <option value="Kawasaki" <?php if ('Kawasaki' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Kawasaki</option>

                                            <option value="KTM" <?php if ('KTM' == $publication->marca_moto): ?>selected=""<?php endif; ?>>KTM</option>

                                            <option value="Kymco" <?php if ('Kymco' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Kymco</option>

                                            <option value="Lambretta" <?php if ('Lambretta' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Lambretta</option>

                                            <option value="Lifan" <?php if ('Lifan' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Lifan</option>

                                            <option value="Max-Motor" <?php if ('Max-Motor' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Max-Motor</option>

                                            <option value="MD Bikes" <?php if ('MD Bikes' == $publication->marca_moto): ?>selected=""<?php endif; ?>>MD Bikes</option>

                                            <option value="Piaggio" <?php if ('Piaggio' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Piaggio</option>

                                            <option value="Polaris" <?php if ('Polaris' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Polaris</option>

                                            <option value="Qingqi" <?php if ('Qingqi' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Qingqi</option>

                                            <option value="Roke Yourany" <?php if ('Roke Yourany' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Roke Yourany</option>

                                            <option value="Royal Enfield" <?php if ('Royal Enfield' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Royal Enfield</option>

                                            <option value="Sachs" <?php if ('Sachs' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Sachs</option>

                                            <option value="Sigma" <?php if ('Sigma' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Sigma</option>

                                            <option value="Suzuki" <?php if ('Suzuki' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Suzuki</option>

                                            <option value="SYM" <?php if ('SYM' == $publication->marca_moto): ?>selected=""<?php endif; ?>>SYM</option>

                                            <option value="Takasaki" <?php if ('Takasaki' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Takasaki</option>

                                            <option value="Triumph" <?php if ('Triumph' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Triumph</option>

                                            <option value="TVS" <?php if ('TVS' == $publication->marca_moto): ?>selected=""<?php endif; ?>>TVS</option>

                                            <option value="United Motors" <?php if ('United Motors' == $publication->marca_moto): ?>selected=""<?php endif; ?>>United Motors</option>

                                            <option value="Vento" <?php if ('Vento' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Vento</option>

                                            <option value="Vespa" <?php if ('Vespa' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Vespa</option>

                                            <option value="Victory" <?php if ('Victory' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Victory</option>

                                            <option value="Yakima" <?php if ('Yakima' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Yakima</option>

                                            <option value="Yamaha" <?php if ('Yamaha' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Yamaha</option>

                                            <option value="Otro" <?php if ('Otro' == $publication->marca_moto): ?>selected=""<?php endif; ?>>Otro</option>

                                        </select>
                                    </div>
                                <?php endif; ?>
                                <div class="col_full white-section">
                                    <label>Año:</label><br>
                                    <select class="selectpicker" name="ano" data-live-search="true">
                                        <?php for ($i = date('Y'); $i >= 1950; $i--): ?>
                                            <option value="<?php echo $i ?>" <?php if ($i == $publication->ano): ?>selected=""<?php endif; ?>><?php echo $i ?></option>
                                        <?php endfor; ?>
                                    </select>
                                </div>
                                <div class="col_full">
                                    <label for="Titulo">Kilometraje:</label>
                                    <input type="number" id="login-form-username" name="kilometraje" value="<?php echo $publication->kilometraje ?>" class="form-control">
                                </div>
                                <?php if ($publication->subcategoria == 2): ?>
                                    <div class="col_full">
                                        <label for="Titulo">Cilindraje:</label>
                                        <input type="number" id="login-form-username" name="cilindraje" value="<?php echo $publication->cilindraje ?>" class="form-control">
                                    </div>
                                <?php endif; ?>
                                <div class="col_full white-section">
                                    <label>Condición:</label><br>
                                    <select class="selectpicker" name="condicion" data-live-search="true">
                                        <option value="1" <?php if ('1' == $publication->condicion): ?>selected=""<?php endif; ?>>Nuevo</option>
                                        <option value="2" <?php if ('2' == $publication->condicion): ?>selected=""<?php endif; ?>>Usado</option>
                                    </select>
                                </div>
                                <div class="col_full">
                                    <label for="Titulo">Color:</label>
                                    <input type="text" name="color" value="<?php echo $publication->color ?>" class="form-control">
                                </div>
                                <div class="col_full">
                                    <label for="Titulo">Placa:</label>
                                    <input type="text" name="placa" value="<?php echo $publication->placa ?>" class="form-control">
                                </div>
                            <?php endif; ?>
                            <?php if ($publication->subcategoria == 8 || $publication->subcategoria == 9 || $publication->subcategoria == 10 || $publication->subcategoria == 11): ?>
                                <div class="col_full white-section">
                                    <label>Tipo de vivienda:</label><br>
                                    <select class="selectpicker" name="tipo_vivienda" data-live-search="true">
                                        <option value="casas" <?php if ('casas' == $publication->tipo_vivienda): ?>selected=""<?php endif; ?>>Casas</option>
                                        <option value="apartamentos" <?php if ('apartamentos' == $publication->tipo_vivienda): ?>selected=""<?php endif; ?>>Apartamentos</option>
                                    </select>
                                </div>
                                <div class="row col_full">
                                    <div class="col-md-4" style="padding: 5px">
                                        <label for="Titulo">Cuartos:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icon-home"></i></span> 
                                            <input type="number"  name="cuartos" value="<?php echo $publication->cuartos ?>" class="form-control">
                                        </div>       
                                    </div>
                                    <div class="col-md-4" style="padding: 5px">
                                        <label for="Titulo">Baños:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icon-bitbucket"></i></span> 
                                            <input type="number"  name="banos" value="<?php echo $publication->banos ?>" class="form-control">
                                        </div>       
                                    </div>
                                    <div class="col-md-4" style="padding: 5px">
                                        <label for="Titulo">Garajes:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icon-th-large"></i></span> 
                                            <input type="number"  name="garajes" value="<?php echo $publication->garajes ?>" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4" style="padding: 5px">
                                        <label for="Titulo">Mts(2):</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icon-superscript"></i></span> 
                                            <input type="number"  name="mts" value="<?php echo $publication->mts ?>" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-4" style="padding: 5px">
                                        <label for="Titulo">Antigüedad:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icon-random"></i></span> 
                                            <input type="number"  name="antiguedad" value="<?php echo $publication->antiguedad ?>" class="form-control">
                                            <span class="input-group-addon">Años</span> 
                                        </div>
                                    </div>
                                    <div class="col-md-4" style="padding: 5px">
                                        <label for="Titulo">Estrato:</label>
                                        <div class="input-group">
                                            <span class="input-group-addon"><i class="icon-legal"></i></span> 
                                            <input type="number"  name="estrato" value="<?php echo $publication->estrato ?>" class="form-control">
                                        </div>
                                    </div>
                                    <div class="col-md-6" style="padding: 5px">
                                        <label for="Titulo">Ciudad:</label>
                                        <input type="text"  name="ciudad" value="<?php echo $publication->ciudad ?>" class="form-control">
                                    </div>
                                    <div class="col-md-6" style="padding: 5px">
                                        <label for="Titulo">Departamento:</label>
                                        <input type="text"  name="departamento" value="<?php echo $publication->departamento ?>" class="form-control">
                                    </div>
                                    <div class="col-md-12" style="padding: 5px">
                                        <label for="Titulo">Direccion:</label>
                                        <input type="text"  name="direccion" value="<?php echo $publication->direccion ?>" class="form-control">
                                    </div>
                                </div>

                            <?php endif; ?>
                            <div class="row col_full">
                                <div class="col-md-6">
                                    <label for="Titulo">Precio del mercado:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">$</span> 
                                        <input type="number"  name="precio_real" value="<?php echo $publication->precio_real ?>" class="form-control">
                                    </div>       
                                </div>
                                <div class="col-md-6">
                                    <label for="Titulo">Precio de tu ganga:</label>
                                    <div class="input-group">
                                        <span class="input-group-addon">$</span> 
                                        <input type="number"  name="precio_ganga" value="<?php echo $publication->precio_ganga ?>" class="form-control">
                                    </div>
                                </div>
                            </div>
                            <input type="submit" class="btn btn-primary btn-lg btn-block" value="Terminar" />
                        </div>
                    </div>
                    <?php echo form_close(); ?>
                </div>
            </div>
        </div>
    </div>
</section>