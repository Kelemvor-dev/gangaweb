<section class="item">
    <div class="content">
        <h2>Publicaciones</h2>
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-index"><span>Ver Publicacion</span></a></li>
            </ul>
            <div class="form_inputs" id="page-index">
                <fieldset>
                    <?php if (!empty($publication)): ?>  
                        <section id="content" style="margin-top: 25px !important;">
                            <div id="content-body">
                                <div class="one_half" id="widget-areas">
                                    <section class="title">
                                        <h4>Publicacion</h4>
                                    </section>
                                    <section class="item">
                                        <div class="content">
                                            <?php foreach ($publication as $publicate): ?>   
                                                <div>
                                                    <h1><?php echo $publicate->title ?></h1>                                                        
                                                </div>
                                                <fieldset>
                                                    <ul>
                                                        <?php if ($publicate->marca): ?>
                                                            <li class="even col-md-6">Marca: <?php echo $publicate->marca ?></li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->marca_moto): ?>
                                                            <li class="even col-md-6">Marca: <?php echo $publicate->marca_moto ?></li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->ano): ?>
                                                            <li class="even col-md-6"> Año: <?php echo $publicate->ano ?></li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->kilometraje): ?>
                                                            <li class="even col-md-6"> Kilometraje: <?php echo number_format($publicate->kilometraje) ?> km</li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->cilindraje): ?>
                                                            <li class="even col-md-6">Cilindraje: <?php echo $publicate->cilindraje ?></li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->color): ?>
                                                            <li class="even col-md-6"> Color: <?php echo $publicate->color ?></li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->placa): ?>
                                                            <li class="even col-md-6"> Placa: <?php echo $publicate->placa ?></li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->tipo_vivienda): ?>
                                                            <li class="even col-md-6"> Tipo de vivienda: <?php echo $publicate->tipo_vivienda ?></li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->cuartos): ?>
                                                            <li class="even col-md-6"> Nro de cuartos: <?php echo $publicate->cuartos ?></li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->banos): ?>
                                                            <li class="even col-md-6"> Nro de baños: <?php echo $publicate->banos ?></li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->garajes): ?>
                                                            <li class="even col-md-6"> Nro de garajes: <?php echo $publicate->garajes ?></li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->mts): ?>
                                                            <li class="even col-md-6"> Mts(2): <?php echo $publicate->mts ?> mts</li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->antiguedad): ?>
                                                            <li class="even col-md-6"> Antiguedad: <?php echo $publicate->antiguedad ?> años</li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->estrato): ?>
                                                            <li class="even col-md-6"> Estrato: <?php echo $publicate->estrato ?></li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->ciudad): ?>
                                                            <li class="even col-md-6"> Ciudad: <?php echo $publicate->ciudad ?></li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->departamento): ?>
                                                            <li class="even col-md-6"> Departamento: <?php echo $publicate->departamento ?></li>
                                                        <?php endif; ?>
                                                        <?php if ($publicate->direccion): ?>
                                                            <li class="even col-md-6"> Direccion: <?php echo $publicate->direccion ?></li>
                                                        <?php endif; ?>
                                                        <li class="even col-md-6">Porcentaje de la ganga: <?php echo intval(($publicate->precio_real - $publicate->precio_ganga) / ($publicate->precio_real) * 100) ?>% de ganga</li>
                                                        <li class="even col-md-6"><span>Precio real:</span> $<?php echo number_format($publicate->precio_real) ?><br> <span> Ganga:</span> <?php echo number_format($publicate->precio_ganga) ?></li>
                                                        <li class="even col-md-6"><p><?php echo $publicate->text ?></p></li>                                                        
                                                    </ul>
                                                </fieldset>
                                                <?php foreach ($imagesPublications as $image): ?>
                                                    <?php if ($publicate->id == $image->publication_id): ?>
                                                        <div><img width="400" src="<?php echo site_url($image->file) ?>"></div>
                                                    <?php endif; ?>
                                                <?php endforeach; ?>
                                            <?php endforeach; ?>
                                        </div>
                                    </section>
                                </div>
                                <div class="one_half last">
                                    <section class="title">
                                        <h4>Usuario de la publicacion</h4>
                                    </section>
                                    <section class="item">
                                        <div class="content">
                                            <fieldset>
                                                <ul>
                                                    <?php foreach ($publication as $item): ?>
                                                        <li class="even col-md-6">
                                                            <label for="nombre">Nombre</label>
                                                            <div class="input">
                                                                <?php echo $item->first_name . ' ' . $item->last_name ?>
                                                            </div>
                                                        </li>
                                                        <li class="even col-md-6">
                                                            <label for="correo">Correo</label>
                                                            <div class="input">
                                                                <?php echo $item->email ?>
                                                            </div>
                                                        </li>
                                                        <li class="even col-md-6">
                                                            <label for="telefono">Telefono</label>
                                                            <div class="input">
                                                                <?php echo $item->phone ?>
                                                            </div>
                                                        </li>
                                                        <li class="even col-md-6">
                                                            <label for="telefono">Celular</label>
                                                            <div class="input">
                                                                <?php echo $item->mobile ?>
                                                            </div>
                                                        </li>
                                                        <li class="even col-md-6">
                                                            <label for="telefono">Documento de identidad</label>
                                                            <div class="input">
                                                                <?php echo $item->documento_de_identidad ?>
                                                            </div>
                                                        </li>
                                                        <li class="even col-md-6">
                                                            <label for="telefono">Plan de la publicacion</label>
                                                            <div class="input">
                                                                <?php if ($item->plan == 1): ?>
                                                                    <div>Plata</div>
                                                                <?php endif; ?>
                                                                <?php if ($item->plan == 2): ?>
                                                                    <div>Oro</div>
                                                                <?php endif; ?>
                                                                <?php if ($item->plan == 3): ?>
                                                                    <div>Diamante</div>
                                                                <?php endif; ?>
                                                            </div>
                                                        </li>
                                                    <?php endforeach; ?>
                                                </ul>
                                            </fieldset>
                                        </div>
                                    </section>
                                </div>  
                                <div class="one_half last" style="margin-top: 70px">
                                    <section class="title">
                                        <h4>Acciones</h4>
                                    </section>
                                    <section class="item">
                                        <div class="content">
                                            <?php foreach ($publication as $item): ?>
                                                <?php echo form_open_multipart(site_url('admin/publications/saveNotification/' . $item->user_id . '/' . $item->id.'/'.$item->comprador_id)); ?>
                                                <section>
                                                    <label>Mensaje</label></br>
                                                    <textarea type="text" name="message" style="width: 95%;height: 100px"></textarea>               
                                                </section>
                                                <?php if ($item->state == 0): ?>
                                                    <button type="submit" name="notifi[]" value="acepto" onclick="return confirm('Esta seguro? Recuerde que al hacer esto pondra al publico contenido explicito de un producto');" class="btn green" style="font-size: 11px;">Aceptar Publicacion</button>
                                                <?php endif; ?>
                                                <?php if ($item->state == 0): ?>
                                                    <button type="submit" name="notifi[]" value="declino" onclick="return confirm('Esta seguro? Solo debe utilizar esta opcion para que el usuario cambie un item del producto para su posterior actualizacion');" class="btn orange" style="font-size: 11px;">Devolver Publicacion</button>
                                                <?php endif; ?>
                                                <button type="submit" name="notifi[]" value="elimino" onclick="return confirm('Esta seguro? Esta opcion elimina definitivamente del sistema la publicacion');" class="btn red" style="font-size: 11px;">Eliminar Publicacion</button>
                                                <button type="submit" name="notifi[]" value="termino" onclick="return confirm('Esta seguro? Con esta opcion damos por teminada la publicacion este es el proceso con el que se finaliza una compra');" class="btn blue" style="font-size: 11px;">Publicacion Comprada</button>
                                                <?php if ($item->comprador_id != 0): ?>
                                                    <button type="submit" name="notifi[]" value="no-disponible" onclick="return confirm('Esta seguro? Este proceso solo es para cuando el producto sea verificado y no tenga existencia');" class="btn orange" style="font-size: 11px;">No esta disponible</button>
                                                <?php endif; ?>
                                                <?php echo form_close(); ?>
                                            <?php endforeach; ?>
                                        </div>
                                    </section>
                                </div> 
                            </div>
                        </section>
                    <?php endif ?>
                </fieldset>
            </div>
        </div>
    </div>
</section>