<section class="item">
    <div class="content">
        <h2>Home/Slider Clientes</h2>
        <div class="tabs">
            <ul class="tab-menu">
                <li><a href="#page-principal"><span><?php echo $titulo; ?></span></a></li>
            </ul>

            <div class="inline-form" id="page-principal">
                <?php echo form_open_multipart(site_url('admin/home/edit_customers/' . (isset($dataForm) ? $dataForm->id : '0')), 'class="crud"'); ?>
                <fieldset>
                    <ul>                        
                        <li>
                            <label for="name">Nombre <span>*</span></label>
                            <div class="input"><?php echo form_input('name', (isset($dataForm->name)) ? $dataForm->name : set_value('name'), 'class="dev-input-title" style="width:100%"'); ?></div>
                        </li>                        
                    </ul>
                    <?php
                    $this->load->view('admin/partials/buttons', array('buttons' => array('save', 'save_exit', 'cancel')));
                    ?>
                </fieldset>
                <?php echo form_close(); ?>
            </div>

        </div>
    </div>
</section>