<script>tinymce.init({selector: 'textarea'});</script>
<section class="title">
    <h4>categories</h4>    
</section>
<section class="item">
    <div class="content">
        <div class="tabs">
            <ul class="tab-menu">                
                <li><a href="#page-banner"><span>categories</span></a></li>
            </ul>  
            <div class="form_inputs" id="page-banner">
                <fieldset>
                    <a href="<?php echo site_url('admin/categories/create') ?>" class="btn blue"><span>+ Crear</span></a> 
                    <br>
                    <br>
                    <table border="0" class="table-list" cellspacing="0">
                        <thead>
                            <tr>
                                <th style="width: 30%">Imagen</th>
                                <th style="width: 40%">Titulo</th>                              
                                <th class="width: 10%">Acciones</th>
                            </tr>
                        </thead>                            
                        <tbody>

                            <?php foreach ($categories as $new): ?>
                                <tr>
                                    <td>
                                        <img width="100%" src="<?php echo site_url('' . $new->file) ?>">
                                    </td>
                                    <td>
                                        <?php echo $new->title ?>
                                    </td>                                  
                                    <td>
                                        <a href="<?php echo site_url('admin/categories/edit/' . $new->id) ?>" class="btn green small">Editar</a>
                                        <a href="<?php echo site_url('admin/categories/delete/' . $new->id) ?>" onClick="javascript: return confirm('¿Estas seguro?');" class="btn red small confirm button">Eliminar</a>
                                    </td>  
                                </tr>
                            <?php endforeach; ?>                            
                        </tbody>
                    </table>
                </fieldset>
            </div>
        </div>
    </div>
</section>
