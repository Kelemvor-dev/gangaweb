
{{ theme:partial name="alerts" }}

  <a href="javascript:void()" onclick="history.back();" class="btn-volver"></a>

  <div class="row">
    <div class="col-md-8">
    	<h1 id="page_title" class="tit-inter">
    		<?php /* <?php echo ($this->current_user->id !== $_user->id) ?
    		sprintf(lang('user:edit_title'), $_user->display_name) :
    		lang('profile_edit') ?> */ ?>
    		Cambiar Contraseña
    	</h1>
<div>
	<?php if (validation_errors()):?>
	<div class="error-box">
		<?php echo validation_errors();?>
	</div>
	<?php endif;?>

	<?php echo form_open_multipart('', array('id'=>'user_edit'));?>

	<fieldset id="profile_fields" class="hide">
		<legend class="tit_edit_pro">Cambiar Contraseña</legend>
        
				<label for="display_name"><?php echo lang('profile_display_name') ?></label>
				<div class="input input_edit">
					<?php echo form_input(array('name' => 'display_name', 'id' => 'display_name', 'value' => set_value('display_name', $display_name))) ?>
                </div>

			<?php foreach($profile_fields as $field): ?>
				<?php if($field['input']): ?>
                
						<label for="<?php echo $field['field_slug'] ?>">
							<?php echo (lang($field['field_name'])) ? lang($field['field_name']) : $field['field_name'];  ?>
							<?php if ($field['required']) echo '<span>*</span>' ?>
						</label>

						<?php if($field['instructions']) echo '<p class="instructions">'.$field['instructions'].'</p>' ?>
						
						<div class="input input_edit">
							<?php echo $field['input'] ?>
						</div>
                        
				<?php endif ?>
			<?php endforeach ?>
            
	</fieldset>

	<fieldset id="user_names">
				<label for="email"><?php echo lang('global:email') ?></label>
				<div class="input input_edit">
					<?php echo form_input('email', $_user->email) ?>
				</div>
	</fieldset>

	<fieldset id="user_password" >        
			<div class="input input_edit">
				<label for="password"><?php echo lang('global:password') ?></label><br/>
				<?php echo form_password('password', '', 'autocomplete="off"') ?>
			</div>
            
	</fieldset>
	<fieldset id="user_password" >    
	<div class="input input_edit">
                <label for="confirm_password">Confirme contraseña</label><br />
                <input id="confirm_password" type="password" name="confirm_password" maxlength="100" />
            </div>
    </fieldset>

	<?php if (Settings::get('api_enabled') and Settings::get('api_user_keys')): ?>
		
	<script>
	jQuery(function($) {
		
		$('input#generate_api_key').click(function(){
			
			var url = "<?php echo site_url('api/ajax/generate_key') ?>",
				$button = $(this);
			
			$.post(url, function(data) {
				$button.prop('disabled', true);
				$('span#api_key').text(data.api_key).parent('li').show();
			}, 'json');
			
		});
		
	});
	</script>
		
	<fieldset>
		<legend class="tit_edit_pro"><?php echo lang('profile_api_section') ?></legend>
		
		<?php echo sprintf(lang('api:key_message'), '<span id="api_key">'.$api_key.'</span>') ?>
        <input type="button" id="generate_api_key" value="<?php echo lang('api:generate_key') ?>" />
        
	</fieldset>
	<?php endif ?>

	<div class="btn_edit_pro">
		<?php /* <?php echo form_submit('', lang('profile_save_btn')) ?> */ ?>
		<input type="submit" name="" value="Guardar contraseña" class="btn btn-primary">
    </div>
	<?php echo form_close() ?>
</div>

<br /><br /><br /><br /></div>
    <div class="col-md-4 fix-side-bar">
        
        <!-- Noticias -->
        {{ widgets:instance id="13"}}
        
        <!-- Eventos -->
        <div class="col-lg-12 col-md-12 col-sm-12 col-xs-12">
            {{ widgets:instance id="41"}}
        </div>
        
    </div>
  </div>