<section class="title">
    <h4>Home</h4>
</section>
<section class="item">
    <div class="content">
        <div class="tabs"> 
            <ul class="tab-menu">
                <li><a href="#page-banner"><span>Banner</span></a></li>
                <li><a href="#page-outstanding"><span>Clientes/Marcas</span></a></li>
                <li><a href="#page-services"><span>Texto Informativo</span></a></li>                                          
            </ul>

            <!-- BANNER -->

            <div class="form_inputs" id="page-banner">
                <fieldset>
                    <?php echo anchor('admin/home/edit_banner/0/' . $lang_admin, '<span>+ Crear Slide</span>', 'class="btn blue"'); ?>
                    <br>
                    <br>
                    <?php if (!empty($banner)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 20%">Imagen</th>
                                    <th style="width: 20%">Titulo</th>
                                    <th style="width: 20%">Texto</th>
                                    <th style="width: 20%">Link</th>
                                    <th class="width: 20%">Acciones</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <div class="inner filtered"><?php $this->load->view('admin/partials/pagination') ?></div>
                                    </td>
                                </tr>
                            </tfoot>
                            <tbody>
                                <?php foreach ($banner as $slide): ?>
                                    <tr>
                                        <td>
                                            <?php if (!empty($slide->image)): ?>
                                                <img src="<?php echo site_url($slide->image); ?>" style="width: 139px;">
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo $slide->title ?></td>
                                        <td><?php echo $slide->text ?></td>
                                        <td><a href="<?php echo $slide->link ?>"><?php echo $slide->link ?></a></td>
                                        <td>
                                            <?php echo anchor('admin/home/edit_banner/' . $slide->id . '/' . $lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/home/delete_banner/' . $slide->id, lang('global:delete'), array('class' => 'confirm btn red small')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>

                    <?php else: ?>
                        <p style="text-align: center">No hay un slide actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

            <!-- NOTICIAS -->

            <div class="form_inputs" id="page-outstanding">
                <fieldset>

                    <?php
                    echo anchor('admin/home/edit_outstanding/1/0/' . $lang_admin, '<span>+ Crear</span>', 'class="btn blue"');
                    ?>
                    <br>
                    <br>
                    <?php if (!empty($outstanding_news)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 20%">Imagen</th>
                                    <th style="width: 30%">Titulo</th>
                                    <th style="width: 30%">Link</th>
                                    <th class="width: 20%">Acciones</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <div class="inner filtered"><?php $this->load->view('admin/partials/pagination') ?></div>
                                    </td>
                                </tr>
                            </tfoot>
                            <tbody>
                                <?php foreach ($outstanding_news as $outstanding): ?>
                                    <tr>
                                        <td>
                                            <?php if (!empty($outstanding->image)): ?>
                                                <div style="height: 80px;width: 170px;overflow: hidden"><img src="<?php echo site_url($outstanding->image); ?>" width="170"></div>
                                            <?php endif; ?>
                                        </td>
                                        <td><?php echo $outstanding->title ?></td>
                                        <td><a href="<?php echo $outstanding->link ?>"><?php echo $outstanding->link ?></a></td>
                                        <td>
                                            <?php echo anchor('admin/home/edit_outstanding/' . $outstanding->type . '/' . $outstanding->id . '/' . $lang_admin, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/home/delete_outstanding/' . $outstanding->id . '#page-outstanding', lang('global:delete'), array('class' => 'confirm btn red small')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>

                    <?php else: ?>
                        <p style="text-align: center">No hay Noticias Destacadas actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

            <!-- SERVICIOS -->

            <div class="form_inputs" id="page-services">
                <fieldset>

                    <?php
                    if (count($outstanding_services) < 1) {
                        echo anchor('admin/home/edit_outstanding/2/0/' . $lang_admin, '<span>+ Crear</span>', 'class="btn blue"');
                    }
                    ?>
                    <br>
                    <br>

                    <?php if (!empty($outstanding_services)): ?>

                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>                                    
                                    <th style="width: 20%">Titulo</th>
                                    <th style="width: 30%">Texto</th>
                                    <th style="width: 30%">Link</th>
                                    <th class="width: 20%">Acciones</th>
                                </tr>
                            </thead>
                            <tfoot>
                                <tr>
                                    <td colspan="6">
                                        <div class="inner filtered"><?php $this->load->view('admin/partials/pagination') ?></div>
                                    </td>
                                </tr>
                            </tfoot>
                            <tbody>
                                <?php foreach ($outstanding_services as $outstanding): ?>
                                    <tr>                                        
                                        <td><?php echo $outstanding->title ?></td>
                                        <td><?php echo $outstanding->text ?></td>
                                        <td><a href="<?php echo $outstanding->link ?>"><?php echo $outstanding->link ?></a></td>
                                        <td>
                                            <?php echo anchor('admin/home/edit_outstanding/' . $outstanding->type . '/' . $outstanding->id, lang('global:edit'), 'class="btn green small"'); ?>
                                            <?php echo anchor('admin/home/delete_outstanding/' . $outstanding->id, lang('global:delete'), array('class' => 'confirm btn red small')) ?>
                                        </td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>

                    <?php else: ?>
                        <p style="text-align: center">No hay Noticias Destacadas actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>
        </div>
    </div>
</section>