<section id="content clearfix">
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
    <div class="content-wrap">
        <div class="container clearfix">
            <div class="col_one_third nobottommargin">
                <div class="well well-lg nobottommargin">
                    <form id="login-form" name="login-form" class="nobottommargin" action="<?php echo site_url('users/login') ?>" method="post" accept-charset="utf-8">
                        <h3>Iniciar sesión</h3>
                        <div style="display:none;">
                            <input type="hidden" name="redirect_to" value="">
                        </div>
                        <div class="col_full">
                            <label for="login-form-username">E-mail:</label>
                            <input type="text" id="login-form-username" name="email" value="" class="form-control">
                        </div>
                        <div class="col_full">
                            <label for="login-form-password">Contraseña:</label>
                            <input type="password" id="login-form-password" name="password" value="" class="form-control">
                        </div>
                        <div class="col_full nobottommargin">
                            <button class="button button-3d nomargin" id="login-form-submit" value="login">Entrar</button>
                            <a href="<?php echo site_url('users/reset_pass') ?>" class="fright">Recuperar contraseña?</a>
                        </div>
                    </form>
                </div>
            </div>
            <div class="col_two_third col_last nobottommargin">
                <h3>No tienes cuenta? Registrate Ya.</h3>
                <form id="register-form" name="register-form" class="nobottommargin" action="<?php echo site_url('register') ?>" method="post" accept-charset="utf-8">
                    <div class="col_half">
                        <label for="register-form-name">Nombres:</label>
                        <input type="text" id="register-form-name" name="first_name" value="" class="form-control">
                    </div>
                    <div class="col_half col_last">
                        <label for="register-form-email">Apellidos:</label>
                        <input type="text" id="register-form-email" name="last_name" value="" class="form-control">
                    </div>
                    <div class="clear"></div>
                    <div class="col_half">
                        <label for="register-form-name">E-mail:</label>
                        <input type="email" id="register-form-name" name="email" value="" class="form-control">
                        <input type="text" name="d0ntf1llth1s1n" value=" " class="form-control" style="display:none">
                    </div>
                    <div class="col_half col_last">
                        <label for="register-form-email">Contraseña</label>
                        <input type="password" id="register-form-email" name="password" value="" class="form-control">
                    </div>
                    <div class="clear"></div>
                    <div class="col_full nobottommargin">
                        <button class="button button-3d button-black nomargin" id="register-form-submit" name="register-form-submit" value="register">Registrarse</button>
                    </div>
                </form>
            </div>
        </div>
    </div>
</section>