<section class="title">
    <h4>categories / Editar</h4>
</section>
<script>tinymce.init({selector: 'textarea'});</script>
<section class="item">
    <div class="content">
        <?php foreach ($categories as $new): ?>
            <?php echo form_open_multipart(site_url('admin/categories/edit/' . $new->id)); ?>
            <div>
                <section>
                    <label>Titulo</label></br>
                    <input type="text" name="title" value="<?php echo $new->title ?>" class="dev-input-title">
                </section>
                <section>                
                    <label>Categoria Padre</label></br>
                    <select name="main">
                        <option value="0" <?php if($new->main == 0): echo 'selected'; endif; ?>>Categoria Padre</option>
                        <?php if (!empty($categories)): ?>
                            <?php foreach ($main as $category): ?>
                                <option value="<?php echo $category->id ?>" <?php if($new->main == $category->id ): echo 'selected'; endif; ?>><?php echo $category->title ?></option>
                            <?php endforeach; ?>
                        <?php endif; ?>
                    </select>
                </section>            
                <section>
                    <img width="10%" src="<?php echo site_url('' . $new->file) ?>"><bR>
                    <label>Imagen</label></br>
                    <span>La imagen requerida es de 570x450</span>
                    <input type="file" name="file" value="<?php echo $new->file ?>" class="dev-input-title">
                </section>           
            </div>
            <div class="buttons float-right padding-top">
                <button type="submit" name="btnAction" value="save" class="btn blue">Guardar</button>
                <a href="<?php echo site_url('admin/categories') ?>" class="btn red cancel">Cancelar</a>
            </div>
            <?php echo form_close(); ?>
        <?php endforeach; ?>
    </div>
</section>