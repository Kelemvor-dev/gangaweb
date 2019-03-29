<section class="item">
    <div class="content">
        <h2>Notificaciones</h2>
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-index"><span>Nuevas Notificaciones</span></a></li>
                <li><a href="#page-text-info"><span>Todas las notificaciones</span></a></li>
            </ul>
            <div class="form_inputs" id="page-index">
                <fieldset>
                    <?php if (!empty($notificaciones)): ?>                       
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="">Mensaje</th>
                                    <th style="">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($notificaciones as $item): ?>
                                    <?php if ($item->state == 0): ?>
                                        <tr>
                                            <td><?php echo $item->message ?></td>
                                            <td>                     
                                                <?php if ($item->process == "pre-order"): ?>
                                                    <a href="<?php echo site_url('admin/publications/#page-shopping') ?>"><i class="fa fa-eye" style="font-size: 30px;text-decoration: none;color: #ff3a3a;" aria-hidden="true"></i></a>                                               
                                                <?php else: ?>
                                                    <a href="<?php echo site_url('admin/publications/getPublication/' . $item->id . '/1/' . $item->publication_id) ?>"><i class="fa fa-eye" style="font-size: 30px;text-decoration: none;color: #ff3a3a;" aria-hidden="true"></i></a>                                               
                                                <?php endif; ?>
                                            </td>
                                        </tr>
                                    <?php endif; ?>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay ninguna notificacion actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>
            <div class="form_inputs" id="page-text-info">
                <fieldset>
                    <?php if (!empty($notificaciones)): ?>                       
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="">Mensaje</th>
                                    <th style="">Acciones</th>
                                </tr>
                            </thead>
                            <tbody>
                                <?php foreach ($notificaciones as $item): ?>
                                    <?php if ($item->state == 1): ?>
                                        <tr>
                                            <td><?php echo $item->message ?></td>
                                            <td>
                                                <?php if ($item->process == "pre-order"): ?>
                                                    <a href="<?php echo site_url('admin/publications/#page-shopping') ?>"><i class="fa fa-eye" style="font-size: 30px;text-decoration: none;color: #ff3a3a;" aria-hidden="true"></i></a>                                               
                                                <?php else: ?>
                                                    <a href="<?php echo site_url('admin/publications/getPublication/' . $item->id . '/1/' . $item->publication_id) ?>"><i class="fa fa-eye" style="font-size: 30px;text-decoration: none;color: #ff3a3a;" aria-hidden="true"></i></a>                                               
                                                <?php endif; ?>
                                            </td>
                                        </tr>
                                    <?php endif; ?>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay ninguna notificacion actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>
        </div>
    </div>
</section>