<?php if (count($data) >= 1): ?>
    <li class="" style="float: right" >
        <a href="#" data-toggle="modal" data-target="#myModal">                                       
            <div align="center" style="border: solid;border-radius: 27px;width: auto;height: 40px;padding: 8px;margin-top: -10px;background: #b74011;color: white;">
                <i class="icon-bell-alt" style="border: solid;border-radius: 37px;width: 40px;height: 40px;padding: 7px;margin-top: -10px;"></i><b style="margin: 0px 15px;"><?php echo count($data) ?></b>
            </div>                                        
        </a>
    </li>
<?php else: ?>
    <li class="" style="float: right" >
        <a href="#" data-toggle="modal" data-target="#myModal">                                       
            <div align="center" style="border: solid;border-radius: 27px;width: auto;height: 40px;padding: 8px;margin-top: -10px;background: #1abc9c;color: white;">
                <i class="icon-bell-alt" style="border: solid;border-radius: 37px;width: 40px;height: 40px;padding: 7px;margin-top: -10px;"></i><b style="margin: 0px 15px;"></b>
            </div>                                        
        </a>    
    </li>
<?php endif; ?>
<div class="modal fade" id="myModal" tabindex="-1" role="dialog" aria-labelledby="myModalLabel" aria-hidden="true">
    <div class="modal-dialog">
        <div class="modal-body">
            <div class="modal-content">
                <div class="modal-header" style="background-color: #1abc9c;">
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                    <h4 class="modal-title" id="myModalLabel" style="color: white">Notificaciones</h4>
                </div>
                <div class="modal-body">
                    <?php foreach ($data as $item): ?>
                        <div class="">
                            <div class="thumbnail" style="border-color: #1abc9c;">
                                <div class="caption">
                                    <a href="<?php echo site_url('publications/seeNotification/' . $item->id . '/' . $item->process.'/'.$item->publication_id) ?>" class="icon-line-circle-check buton-notification" role="button"></a>
                                    <?php if ($item->process == 'acepto'): ?>
                                        <h4>Publicacion Aceptada</h4>
                                    <?php endif; ?>
                                    <?php if ($item->process == 'declino'): ?>
                                        <h4>Publicacion Declinada</h4>
                                    <?php endif; ?>
                                    <?php if ($item->process == 'elimino'): ?>
                                        <h4>Publicacion Eliminada</h4>
                                    <?php endif; ?>
                                    <?php if ($item->process == 'termino'): ?>
                                        <h4>Gracias por comprar con nosotros</h4>
                                    <?php endif; ?>
                                    <div><?php echo $item->message ?></div>                                    
                                </div>
                            </div>
                        </div>
                    <?php endforeach; ?>
                </div>
            </div>
        </div>
    </div>
</div>