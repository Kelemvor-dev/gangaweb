<section class="item">
    <div class="content">
        <h2>Home / Slider</h2>
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-modal"><span><?php echo $titulo; ?></span></a></li>
            </ul>
            <div class="form_inputs" id="page-modal">
                <?php echo form_open_multipart(site_url('admin/home/edit_modal/' . (isset($modal) ? $modal->id : '0') . '/' . $lang_admin), 'class="crud"'); ?>
                <div class="inline-form">
                    <fieldset>
                        <ul>
                            <li>
                                <label for="name">Imagen
                                    <small>
                                        - Imagen Permitidas gif | jpg | png | jpeg<br>
                                    </small>
                                </label>
                                <div class="input">
                                    <?php if (!empty($modal->image)): ?>
                                        <div>
                                            <img src="<?php echo site_url($modal->image) ?>" width="298">
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
                                <div class="input"><?php echo form_input('title', (isset($modal->title)) ? $modal->title : set_value('title'), 'class="dev-input-title"'); ?></div>
                            </li>
                            <li>
                                <label for="name">Link <span>*</span></label>
                                <div class="input"><?php echo form_input('link', (isset($modal->link)) ? $modal->link : set_value('link'), 'class="dev-input-link"'); ?></div>
                            </li>
                            <li>
                                <label for="name">Texto <span>*</span></label>
                                <div class="input"><?php echo form_textarea('text', (isset($modal->text)) ? $modal->text : set_value('text'), 'class="dev-input-text"'); ?></div>
                            </li>
                            <li>
                                <label for="name">Fecha <span>*</span></label>
                                <div class="input">
                                    <input type="date" name="date" value="<?php echo (isset($modal->date)) ? $modal->date : set_value('date') ?>">
                                </div>
                            </li>
                        </ul>
                        <?php
                        echo (isset($modal)) ? form_hidden('id', $modal->id) : null;
                        $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'cancel')));
                        ?>
                    </fieldset>
                </div>
                <?php echo form_close(); ?>
            </div>
        </div>
    </div>
</section>