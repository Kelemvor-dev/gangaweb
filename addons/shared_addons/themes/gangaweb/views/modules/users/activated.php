<div class="row mt">
    <div class="col-lg-6 col-md-6 col-sm-6 col-xs-12 col-lg-offset-3 col-md-offset-3 col-sm-offset-3">
    	<div class="box box-body">

<h2 class="text-center" id="page_title"><?php echo lang('user:login_header') ?></h2>

<div class="success-box">
	<?php echo $this->lang->line('user:activated_message') ?>
</div>

<?php echo form_open('users/login', array('id'=>'login')) ?>
<br />
<ul class="cam_registro">
	<li>
		<label for="email"><?php echo lang('global:email') ?></label>
		<?php echo form_input('email', '', 'maxlength="40" class="form-control"') ?>
	</li>
	
	<li>
		<label for="password"><?php echo lang('global:password') ?></label>
		<?php echo form_password('password', '', 'maxlength="40" class="form-control"') ?>
	</li>
	
	<li class="btn-registro">
		<input type="submit" value="<?php echo lang('user:login_btn') ?>" name="btnLogin" class="btn btn-primary btn-right" />
	</li>
</ul>
<?php echo form_close() ?>

		</div>
	</div>
</div>