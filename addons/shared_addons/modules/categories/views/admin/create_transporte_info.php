<section class="title">
    <h4>Crear Slide</h4>
</section>
<section class="item">
    <div class="content">
        <?php echo form_open_multipart(site_url('admin/categories/save_categories_info')); ?>
        <div style="padding: 20px;">
            <section>
                <label>Imagen</label></br>
                <input type="file" name="file" value="" class="dev-input-title">
            </section>            
        </div>
        </br>
        <div class="buttons float-right padding-top">
            <button type="submit" class="btn blue">Guardar</button>
            <a href="<?php echo site_url('admin/categories') ?>" class="btn red cancel">Cancelar</a>
        </div>
        <?php echo form_close(); ?>
    </div>
</section>