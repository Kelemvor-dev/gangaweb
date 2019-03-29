<script src="http://ajax.googleapis.com/ajax/libs/jquery/2.1.1/jquery.min.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/jquery.validate.js"></script>
<script src="http://ajax.aspnetcdn.com/ajax/jquery.validate/1.13.1/additional-methods.js"></script>
<style type="text/css">
    .error{
        color: red;
        font-weight: bold;
    }
</style>
<script>
    var j = jQuery.noConflict();
    j().ready(function () {
        // validate signup form on keyup and submit
        j("#reset-pass").validate({
            rules: {
                email: {
                    required: true,
                    email: true
                }
            },
            messages: {
                email: "Ingrese una dirección de email valida"
            },
            submitHandler: function (form) {
                form.submit();
            }
        });

    });
</script>
<section id="content clearfix">
    <div class="content-wrap">
        <div class="container clearfix" align="center">
            <h2 class="text-center">Restablecer Contraseña</h2>
            <?php if (!empty($error_string)): ?>
                <div class="error-box">
                    <?php echo $error_string; ?>
                </div>
            <?php endif; ?>
            <?php if (!empty($success_string)): ?>
                <div class="success-box">
                    <?php echo $success_string ?>
                </div>
            <?php else: ?>
                <?php echo form_open('users/reset_pass', array('id' => 'reset-pass')) ?>               
                <?php /* ?><label for="email"><?php echo lang('user:reset_instructions') ?></label><?php */ ?>
                <input type="text" name="email" style=" width: 50%" maxlength="100" value="<?php echo set_value('email') ?>" class="form-control" placeholder="Ingresa tu Email" />
                <br />
                <div class="btn_edit_pro" style=" text-align: center;">
                    <?php echo form_submit('', 'Restablecer Contraseña', "class='btn btn-primary btn-right'") ?>
                </div>
                <?php echo form_close() ?>
            <?php endif ?>
        </div>
    </div>
</section>