<section class="item">
    <div class="content">
        <h2>Home / Slider</h2>
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-banner"><span><?php echo $titulo; ?></span></a></li>
            </ul>
            <div class="form_inputs" id="page-banner">
                <?php echo form_open_multipart(site_url('admin/home/edit_banner/' . (isset($banner) ? $banner->id : '0') . '/' . $lang_admin), 'class="crud"'); ?>
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="name">Imagen
                                    <small>
                                        - Imagen Permitidas gif | jpg | png | jpeg<br>
                                        - 1366 × 477 pixels
                                    </small>
                                </label>
                                <div class="input">
                                    <?php if (!empty($banner->image)): ?>
                                        <div>
                                            <img src="<?php echo site_url($banner->image) ?>" width="298">
                                        </div>
                                    <?php endif; ?>
                                    <div class="btn-false">
                                        
                                        <?php echo form_upload('image', '', ' id="image"'); ?>
                                    </div>
                                </div>
                                <br class="clear">
                            </li>
                            <li>
                                <label for="name">Titulo <span>*</span></label>
                                <div class="input"><?php echo form_input('title', (isset($banner->title)) ? $banner->title : set_value('title'), 'class="dev-input-title"'); ?></div>
                            </li>
                            <li>
                                <label for="name">Link <span></span></label>
                                <div class="input"><?php echo form_input('link', (isset($banner->link)) ? $banner->link : set_value('link'), 'class="dev-input-link"'); ?></div>
                            </li>
                            <li>
                                <label for="name">Texto <span>*</span></label>
                                <div class="input"><?php echo form_textarea('text', (isset($banner->text)) ? $banner->text : set_value('text'), 'class="dev-input-text"'); ?></div>
                            </li>
                            <li>
                                <label for="name">Color del texto <span></span></label>
                                <div class="input"><?php echo form_input_color('color_text', (isset($banner->color_text)) ? $banner->color_text : set_value('color_text'), 'class="dev-input-title"'); ?></div>
                            </li>
                            <li>
                                <label for="name">Tamaño del texto <span>Recomendado 12 a 15</span></label>
                                <div class="input"><?php echo form_input('position_text', (isset($banner->position_text)) ? $banner->position_text : set_value('position_text'), 'class="dev-input-title"'); ?></div>
                            </li>
                        </ul>
                        <?php
                        echo (isset($banner)) ? form_hidden('id', $banner->id) : null;
                        $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel')));
                        ?>
                    </fieldset>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</section>