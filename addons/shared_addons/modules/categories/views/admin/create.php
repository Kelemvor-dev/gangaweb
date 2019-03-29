<section class="title">
    <h4>categories / Crear</h4>
</section>
<script>tinymce.init({selector: 'textarea'});</script>
<section class="item">
    <div class="content">
        <?php echo form_open_multipart(site_url('admin/categories/save/')); ?>
        <div>
            <select name="main">
                <option value="0">Categoria Padre</option>
                <?php if (!empty($categories)): ?>
                    <?php foreach ($categories as $category): ?>
                        <?php if ($category->main == 0):  ?>
                        <option value="<?php echo $category->id ?>"><?php echo $category->title ?></option>
                        <?php endif; ?>
                    <?php endforeach; ?>
                <?php endif; ?>
            </select>

            <section>
                <label>Titulo</label></br>
                <input type="text" name="title" value="" class="dev-input-title">
            </section>
            <section>
                <label>Imagen</label></br>
                <input type="file" name="file" value="" class="dev-input-title">
            </section>            
        </div>
        <div class="buttons float-right padding-top">
            <button type="submit" name="btnAction" value="save" class="btn blue">Guardar</button>
            <a href="<?php echo site_url('admin/categories') ?>" class="btn red cancel">Cancelar</a>
        </div>
        <?php echo form_close(); ?>
    </div>
</section>