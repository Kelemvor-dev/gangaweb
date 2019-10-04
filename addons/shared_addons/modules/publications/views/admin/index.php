<section class="item">
    <div class="content">
        <h2>Publicaciones</h2>
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-index"><span>Nuevas publicaciones</span></a></li>
                <li><a href="#page-text-info"><span>Publicaciones del sistema</span></a></li>
                <li><a href="#page-questions"><span>Activacion de preguntas</span></a></li>
                <li><a href="#page-answers"><span>Activacion de respuestas</span></a></li>
                <li><a href="#page-shopping"><span>Peticiones de compra</span></a></li>
            </ul>

            <div class="form_inputs" id="page-index">
                <fieldset>
                    <?php if (!empty($publications)): ?>                       
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="">Titulo</th>
                                    <th style="">Nombre</th>
                                    <th style="">Telefono</th>
                                    <th style="">Celular</th>
                                    <th style="">Documento de identidad</th>
                                    <th style="">Acciones</th>
                                </tr>
                            </thead>

                            <tbody>
                                <?php foreach ($publications as $item): ?>
                                    <?php if ($item->state == 0): ?>
                                        <tr>
                                            <td><?php echo $item->title ?></td>
                                            <td><?php echo $item->first_name . ' ' . $item->last_name ?></td>
                                            <td><?php echo $item->phone ?></td>
                                            <td><?php echo $item->mobile ?></td>
                                            <td><?php echo $item->documento_de_identidad ?></td>
                                            <td>
                                                <a href="<?php echo site_url('admin/publications/seePublication/' . $item->id) ?>"><i class="fa fa-eye" style="font-size: 30px;text-decoration: none;color: #ff3a3a;" aria-hidden = "true"></i> Sin publicar</a>                                           
                                            </td>
                                        </tr>
                                    <?php endif; ?>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay un correo actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

            <div class="form_inputs" id="page-text-info">
                <fieldset>
                    <?php if (!empty($publications)): ?>                       
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="">Titulo</th>
                                    <th style="">Nombre</th>
                                    <th style="">Telefono</th>
                                    <th style="">Celular</th>
                                    <th style="">Documento de identidad</th>
                                    <th style="">Acciones</th>
                                </tr>
                            </thead>

                            <tbody>
                                <?php foreach ($publications as $item): ?>
                                    <?php if ($item->state == 1): ?>
                                        <tr>
                                            <td><?php echo $item->title ?></td>
                                            <td><?php echo $item->first_name . ' ' . $item->last_name ?></td>
                                            <td><?php echo $item->phone ?></td>
                                            <td><?php echo $item->mobile ?></td>
                                            <td><?php echo $item->documento_de_identidad ?></td>
                                            <td>                                            
                                                <a href="<?php echo site_url('admin/publications/seePublication/' . $item->id) ?>"><i class = "fa fa-pencil-square-o" style = "font-size: 30px;text-decoration: none;color: green;" aria-hidden = "true"></i></a>                                           
                                                <?php if ($item->sello_calidad == 0): ?>
                                                    <a href="<?php echo site_url('admin/publications/selloCalidad/' . $item->id . '/1') ?>" onclick="return confirm('Esta seguro? Este sello verifica que nosotros validamos personalmente el producto');" class="btn green" style="font-size: 11px;float: right;margin-left: 10px">Activar sello de calidad</a>
                                                <?php else: ?>
                                                    <a href="<?php echo site_url('admin/publications/selloCalidad/' . $item->id . '/0') ?>" onclick="return confirm('Esta seguro? La publicacion ya no tendra nuestro sello de calidad');" class="btn red" style="font-size: 11px;float: right;margin-left: 10px">Desactivar sello de calidad</a>
                                                <?php endif; ?>
                                                <?php if ($item->destacado == 0): ?>
                                                    <a href="<?php echo site_url('admin/publications/destacar/' . $item->id . '/1') ?>" onclick="return confirm('Esta seguro? Esta publicacion se visualizara en el home');" class="btn green" style="font-size: 11px;float: right;">Destacar</a>
                                                <?php else: ?>
                                                    <a href="<?php echo site_url('admin/publications/destacar/' . $item->id . '/0') ?>" onclick="return confirm('Esta seguro? La publicacion ya no aparecera en el home');" class="btn red" style="font-size: 11px;float: right;">Dejar de destacar</a>
                                                <?php endif; ?>
                                                <?php if ($item->shiping == 0): ?>
                                                    <a href="<?php echo site_url('admin/publications/shiping/' . $item->id . '/1') ?>" class="btn green" style="font-size: 11px;float: right;margin-right: 10px">Envio gratis</a>
                                                <?php else: ?>
                                                    <a href="<?php echo site_url('admin/publications/shiping/' . $item->id . '/0') ?>" class="btn red" style="font-size: 11px;float: right;margin-right: 10px">Sin envio gratis</a>
                                                <?php endif; ?>
                                            </td>
                                        </tr>
                                    <?php endif; ?>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay un correo actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>


            <div class="form_inputs" id="page-questions">
                <fieldset>
                    <?php if (!empty($questions)): ?>                       
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 15%">Usuario</th>
                                    <th style="">Pregunta</th>
                                    <th style="width: 15%">Creado el</th>
                                    <th style="width: 20%">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($questions as $item): ?>
                                    <?php if ($item->state == 0): ?>
                                        <tr>                                            
                                            <td><?php echo $item->first_name . ' ' . $item->last_name ?></td>
                                            <td><?php echo $item->comment ?></td>
                                            <td><?php echo $item->created_on ?></td>
                                            <td>
                                                <a class="btn green" href="<?php echo site_url('admin/publications/activeQuestion/' . $item->id . '/1') ?>">Activar</a>
                                                <a class="btn red" href="<?php echo site_url('admin/publications/activeQuestion/' . $item->id . '/2') ?>">Eliminar</a>
                                            </td>
                                        </tr>
                                    <?php endif; ?>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay un correo actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

            <div class="form_inputs" id="page-answers">
                <fieldset>
                    <?php if (!empty($answers)): ?>                       
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 15%">Usuario</th>
                                    <th style="">Pregunta</th>
                                    <th style="width: 15%">Creado el</th>
                                    <th style="width: 20%">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($answers as $item): ?>
                                    <?php if ($item->state == 0): ?>
                                        <tr>                                            
                                            <td><?php echo $item->first_name . ' ' . $item->last_name ?></td>
                                            <td><?php echo $item->answer ?></td>
                                            <td><?php echo $item->created_on ?></td>
                                            <td>
                                                <a class="btn green" href="<?php echo site_url('admin/publications/activeAnswer/' . $item->id . '/1') ?>">Activar</a>
                                                <a class="btn red" href="<?php echo site_url('admin/publications/activeAnswer/' . $item->id . '/2') ?>">Eliminar</a>
                                            </td>
                                        </tr>
                                    <?php endif; ?>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay un correo actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

            <div class="form_inputs" id="page-shopping">
                <fieldset>
                    <?php if (!empty($shopping)): ?>                       
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="">Publicacion</th>
                                    <th style="">Comprador</th>
                                    <th style="">Telefono</th>
                                    <th style="">Celular</th>
                                    <th style="">Documento de identidad</th>
                                    <th style="">Acciones</th>
                                </tr>
                            </thead>

                            <tbody>
                                <?php foreach ($shopping as $item): ?>
                                    <?php if ($item->comprador_id != 0): ?>
                                        <tr>
                                            <td><?php echo $item->title ?></td>
                                            <td><?php echo $item->first_name . ' ' . $item->last_name ?></td>
                                            <td><?php echo $item->phone ?></td>
                                            <td><?php echo $item->mobile ?></td>
                                            <td><?php echo $item->documento_de_identidad ?></td>
                                            <td>
                                                <?php if ($item->state != 3): ?>
                                                    <a class="btn blue" href="<?php echo site_url('admin/publications/seePublication/' . $item->id) ?>">Finalizar proceso de compra</a>                                           
                                                <?php else: ?>
                                                    <a class="btn red" href="<?php echo site_url('admin/publications/seePublication/' . $item->id) ?>">El proceso esta finalizado</a>
                                                <?php endif; ?>
                                            </td>
                                        </tr>
                                    <?php endif; ?>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay un correo actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

        </div>
    </div>
</section>