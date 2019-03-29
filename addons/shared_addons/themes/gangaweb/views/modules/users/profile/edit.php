<section id="content clearfix">
    <div class="content-wrap">
        <div class="container clearfix">
            <div class="tabs divcenter nobottommargin clearfix" id="tab-login-register" style="max-width: 500px;">
                <div class="tab-content clearfix" id="tab-register">
                    <div class="panel panel-default nobottommargin">
                        <div class="panel-body" style="padding: 40px;">
                            <h3>Editar Perfil</h3>
                            <?php if (validation_errors()): ?>  
                                <div class="content-wrap" style="padding-bottom: 0px;">
                                    <div class="container clearfix">
                                        <div class="style-msg2" style="background-color: #EEE;">
                                            <div class="msgtitle">Se presento el siguiente inconveniente:</div>
                                            <div class="sb-msg">
                                                <ul>
                                                    <?php echo validation_errors(); ?>
                                                </ul>
                                            </div>
                                        </div>
                                    </div>
                                </div>
                            <?php endif ?>
                            <?php if ($this->session->flashdata('success')): ?>
                                <div class="style-msg2 successmsg">
                                    <div class="msgtitle">Proceso Exitoso:</div>
                                    <div class="sb-msg">
                                        <ul>
                                            <li><?php echo $this->session->flashdata('success') ?></li>
                                        </ul>
                                    </div>
                                </div>
                            <?php endif; ?>

                            <form id="register-form" name="register-form" class="nobottommargin" action="<?php echo site_url('edit-profile') ?>" method="post" accept-charset="utf-8" enctype="multipart/form-data">

                                <div class="col_full">
                                    <label for="register-form-name">Nombre de usuario:</label>
                                    
                                    <?php echo form_input(array('name' => 'display_name', "class" => "form-control","maxlength"=>"20", 'id' => 'display_name', 'value' => set_value('display_name', $display_name))); ?>
                                </div>

                                <?php foreach ($profile_fields as $field): ?>
                                    <?php if ($field['input']): ?>
                                        <div class="col_full">
                                            <label for="<?php echo $field['field_slug']; ?>"><?php echo (lang($field['field_name'])) ? lang($field['field_name']) : $field['field_name']; ?><?php if ($field['required']) echo '<span>*</span>'; ?></label>
                                            <?php echo $field['input']; ?>
                                            <?php if ($field['field_slug'] != 'dob'): ?>
                                                <script>
                                                    var element = document.getElementById("<?php echo $field['field_slug'] ?>");
                                                    element.classList.add("form-control");
                                                </script>
                                            <?php endif; ?>
                                            <p class="help-block"><?php if ($field['instructions']) echo '<p class="instructions">' . $field['instructions'] . '</p>'; ?></p>
                                        </div>
                                    <?php endif; ?>
                                <?php endforeach; ?>
                                <div class="col_full">
                                    <label for="register-form-email">E-mail:</label>
                                    <?php echo form_input(array('name' => 'email', "class" => "form-control", 'id' => 'email', 'value' => $_user->email)); ?>
                                </div>
                                <div class="col_full">
                                    <label for="register-form-email">Contraseña:</label>
                                    <?php echo form_input(array('name' => 'password', "class" => "form-control", 'id' => 'password', 'autocomplete' => "off")); ?>
                                </div>
                                <?php if ($api_key): ?>
                                    <?php if (Settings::get('api_enabled') and Settings::get('api_user_keys')): ?>
                                        <script>
                                            jQuery(function ($) {
                                                $('input#generate_api_key').click(function () {

                                                    var url = "<?php echo site_url('api/ajax/generate_key') ?>",
                                                            $button = $(this);

                                                    $.post(url, function (data) {
                                                        $button.prop('disabled', true);
                                                        $('span#api_key').text(data.api_key).parent('li').show();
                                                    }, 'json');
                                                });
                                            });
                                        </script>
                                    <?php endif; ?>
                                    <div class="tab-pane" id="C">
                                        <div class="large-6 medium-6 small-12 columns">
                                            <label class="control-label" for="email"><?php echo lang('user_email') ?></label>
                                            <div class="controls">
                                                <?php $api_key or print('style="display:none"') ?>><?php echo sprintf(lang('api:key_message'), '<span id="api_key">' . $api_key . '</span>'); ?>
                                            </div>
                                        </div>
                                        <div class="large-6 medium-6 small-12 columns">
                                            <label class="control-label" for="email"><?php echo lang('user_email') ?></label>
                                            <div class="controls">
                                                <input type="button" id="generate_api_key" value="<?php echo lang('api:generate_key') ?>" />
                                            </div>
                                        </div>
                                    </div>
                                <?php endif; ?>
                                <div class="col_full nobottommargin">
                                    <button class="button button-3d button-black nomargin" id="register-form-submit" name="register-form-submit" value="register">Guardar</button>
                                </div>

                            </form>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</section>

