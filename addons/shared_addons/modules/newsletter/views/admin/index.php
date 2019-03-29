<section class="item">
    <div class="content">
    	<h2>Newsletter</h2>
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-index"><span>Correos</span></a></li>
                <li><a href="#page-text-info"><span>Terminos y condiciones</span></a></li>
            </ul>

			<div class="form_inputs" id="page-index">
                <fieldset>
                    <?php if (!empty($newsletter)): ?>
						<?php echo anchor('admin/newsletter/export_newsletter/', '<span>Exportar a Excel</span>', 'class="btn blue"'); ?>
                        <table border="0" class="table-list" cellspacing="0">
                            <thead>
                                <tr>
                                    <th style="width: 100%">Correos</th>
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
                                <?php foreach ($newsletter as $item): ?>
                                    <tr>
                                        <td><?php echo $item->email ?></td>
                                    </tr>
                                <?php endforeach ?>
                            </tbody>
                        </table>
                    <?php else: ?>
                        <p style="text-align: center">No hay un correo actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

            <!-- TEXTO INFORMATIVO -->
            <div class="inline-form" id="page-text-info">
                <fieldset>
                    <?php if (isset($text_info)): ?>
                        <?php echo form_open_multipart(site_url('admin/newsletter/edit_text_info/'), 'class="crud"'); ?>
                        <fieldset>
                            <ul>
                                <li>
                                    <label for="title">Titulo <span>*</span></label>
                                    <div class="input"><?php echo form_input('title', (isset($text_info->title)) ? $text_info->title : set_value('title'), 'class="dev-input-text" style="width:100%" maxlength="100"'); ?></div>
                                </li>
                                <script>tinymce.init({selector: 'textarea'});</script>
                                <li>
                                    <label for="name">Texto <span>*</span></label>
                                    <div class="input">
                                        <?php echo form_textarea(array('id' => 'text-wysiwyg', 'name' => 'text', 'value' => (isset($text_info->text)) ? $text_info->text : set_value('text') , 'style' =>"width: 100%;height: 800px")) ?>
                                    </div>
                                </li>
<!--                                <li>
                                    <label for="name">Terminos y Condiciones
                                        <small>
                                            - Archivos permitidos doc|docx|txt|pdf|xls|xlsx<br>
                                        </small>
                                    </label>
                                    <?php if (isset($text_info->terms_cond) && !empty($text_info->terms_cond)): ?>
                                        <div>
                                            <a href="<?php echo site_url($text_info->terms_cond) ?>" target="_blank">Descargar</a>
                                        </div>
                                    <?php endif; ?>
                                    <div class="btn-false">
                                        <div class="btn">Examinar</div>
                                        <?php echo form_upload('terms_cond', set_value('terms_cond'), ' id="terms_cond"'); ?>
                                    </div>
                                </li>-->
                            </ul>
                            <?php
                                $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel')));
                            ?>
                        </fieldset>
                        <?php echo form_close(); ?>
                    <?php else: ?>
                        <p style="text-align: center">No hay datos actualmente</p>
                    <?php endif ?>
                </fieldset>
            </div>

        </div>
    </div>
</section>