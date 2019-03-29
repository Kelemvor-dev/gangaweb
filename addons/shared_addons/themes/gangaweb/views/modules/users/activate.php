<div class="row mt">
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-lg-offset-3 col-md-offset-3 col-sm-offset-3">
    	<div class="box box-body">

<h2 class="text-center" id="page_title"><?php echo lang('user:register_header_step2') ?></h2>

<label>Se envio un correo a tu cuenta con el link y codigo de activacion</label>

<div class="workflow_steps">
	<span id="active_step"><?php echo lang('user:register_step1') ?></span>
	<br />
	<span><?php echo lang('user:register_step2') ?></span>
</div>

<?php if(!empty($error_string)): ?>
<div class="error-box">
	<?php echo $error_string ?>
</div>
<?php endif;?>
<?php echo form_open('users/activate', 'id="activate-user"') ?>
<br />
<ul class="cam_registro">
	<li>
		<label for="email"><?php echo lang('global:email') ?></label>
		<?php echo form_input('email', isset($_user['email']) ? $_user['email'] : '', 'maxlength="40" class="form-control"');?>
	</li>

	<li>
		<label for="activation_code"><?php echo lang('user:activation_code') ?></label>
		<?php echo form_input('activation_code', '', 'maxlength="40" class="form-control"');?>
	</li>

	<li class="btn-registro">
		<?php echo form_submit('btnSubmit', lang('user:activate_btn'), 'class="btn btn-primary btn-right"') ?>
	</li>
</ul>
<?php echo form_close() ?>

		</div>
	</div>
</div>