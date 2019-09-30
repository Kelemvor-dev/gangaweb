<?php if ($this->session->flashdata('proccess') == 'ok'): ?>
    <div class="message-alert style-msg successmsg messages-sistem hidden-xs">
        <div class="sb-msg"><i class="icon-thumbs-up"></i><strong> Proceso exitoso!</strong> Se ha guardado correctamente</div>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    </div>
    <div class="message-alert style-msg successmsg messages-sistem-movile visible-xs">
        <div class=""><i class="icon-thumbs-up"></i><strong> Proceso exitoso!</strong></div>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    </div>
<?php endif; ?>
<?php if ($this->session->flashdata('proccess') == 'error'): ?>
    <div class="message-alert style-msg errormsg messages-sistem hidden-xs">
        <div class="sb-msg"><i class="icon-remove"></i><strong> Proceso no admitido! </strong>No se ha podido guardar correctamente</div>
    </div>
    <div class="message-alert style-msg errormsg messages-sistem-movile visible-xs">
        <div class=""><i class="icon-eye"></i><strong> La peticion ya existe!</strong></div>
        <button type="button" class="close" data-dismiss="alert" aria-hidden="true">&times;</button>
    </div>

<?php endif; ?>
<div id="top-social">
    <ul>
        <li><a href="#" class="si-facebook"><span class="ts-icon"><i class="icon-facebook"></i></span><span class="ts-text">Facebook</span></a></li>
        <li><a href="#" class="si-twitter"><span class="ts-icon"><i class="icon-twitter"></i></span><span class="ts-text">Twitter</span></a></li>
        <li><a href="#" class="si-call"><span class="ts-icon"><i class="icon-call"></i></span><span class="ts-text">(571) 6750215</span></a></li>
        <li><a href="mailto:sologangacolombia@gmail.com" class="si-email3"><span class="ts-icon"><i class="icon-envelope-alt"></i></span><span class="ts-text">sologangacolombia@gmail.com</span></a></li>
    </ul>
</div><!-- #top-social end -->