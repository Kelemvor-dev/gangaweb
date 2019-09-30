<section id="content clearfix">
    <div class="content-wrap">
        <?php foreach ($publications as $publicate): ?>
            <section id="page-title">

                <div class="container clearfix">
                    <h1><?php echo $publicate->title ?></h1>
                    <ol class="breadcrumb">
                        <li>Inicio</li>
                        <li class="active">Compra</li>
                    </ol>
                </div>

            </section><!-- #page-title end -->

            <!-- Content
            ============================================= -->
            <section id="content">

                <div class="content-wrap">

                    <div class="container clearfix">

                        <div class="single-product">

                            <div class="product">

                                <div class="col_two_fifth">

                                    <!-- Product Single - Gallery
                                    ============================================= -->
                                    <div class="product-image">
                                        <div class="fslider" data-pagi="false" data-arrows="false" data-thumbs="true">
                                            <div class="flexslider">
                                                <div class="slider-wrap" data-lightbox="gallery">
                                                    <?php foreach ($imagesPublications as $image): ?>
                                                        <?php if ($publicate->id == $image->publication_id): ?>
                                                            <div class="slide" data-thumb="<?php echo site_url($image->file) ?>"><a href="<?php echo site_url($image->file) ?>" title="<?php echo $publicate->title ?>" data-lightbox="gallery-item"><img src="<?php echo site_url($image->file) ?>" alt="Pink Printed Dress"></a></div>
                                                        <?php endif; ?>
                                                    <?php endforeach; ?>


                                                </div>
                                            </div>
                                        </div>
                                        <div class="sale-flash"><?php echo intval(($publicate->precio_real - $publicate->precio_ganga) / ($publicate->precio_real) * 100) ?>% de ahorro</div>
                                    </div><!-- Product Single - Gallery End -->

                                </div>

                                <div class="col_two_fifth product-desc">

                                    <!-- Product Single - Price
                                    ============================================= -->
                                    <div class="product-price"><del>Precio real $<?php echo number_format($publicate->precio_real) ?></del><br> <ins> Ganga $<?php echo number_format($publicate->precio_ganga) ?></ins></div>

                                    <!-- Product Single - Rating
                                    ============================================= -->
                                    <!--                                    <div class="product-rating">
                                                                            <i class="icon-star3"></i>
                                                                            <i class="icon-star3"></i>
                                                                            <i class="icon-star3"></i>
                                                                            <i class="icon-star-half-full"></i>
                                                                            <i class="icon-star-empty"></i>
                                                                        </div> Product Single - Rating End -->

                                    <div class="clear"></div>
                                    <div class="line"></div>

                                    <!-- Product Single - Quantity & Cart Button
                                    ============================================= -->

                                    <!--                                        <div class="quantity clearfix">
                                                                                <input type="button" value="-" class="minus">
                                                                                <input type="text" step="1" min="1"  name="quantity" value="1" title="Qty" class="qty" size="4" />
                                                                                <input type="button" value="+" class="plus">
                                                                            </div>-->
                                    <?php if ($publicate->state == 3): ?>
                                        <div><h4>Este producto ya no se encuentra disponible</h4></div>
                                    <?php else: ?>
                                        <?php if ($publicate->user_id == $this->session->userdata('id')): ?>
                                            <div><h4>No puedes comprar este producto la publicacion te pertenece</h4></div>
                                        <?php else: ?>
                                            <?php if ($publicate->comprador_id == 0): ?>
                                                <?php if ($this->session->userdata('id')): ?>
                                                    <a href="#" data-toggle="modal" data-target="#orderFormModal-<?php echo $publicate->id ?>" class="add-to-cart button nomargin">Enviar solicitud de compra</a>
                                                <?php else: ?>
                                                    <a href="<?php echo site_url('register') ?>" class="add-to-cart button nomargin">Enviar solicitud de compra</a>
                                                <?php endif; ?>
                                            <?php else: ?>
                                                <?php if ($publicate->comprador_id == $this->session->userdata('id')): ?>
                                                    <div><h4>Felicidades! Tu peticion de compra fue enviada pronto uno de nuestros acesores se pondra en contacto con tigo para el proceso de compra</h4></div>
                                                <?php else: ?>
                                                    <div><h4>Lo sentimos! Este producto se encuentra en proceso de compra</h4></div>
                                                <?php endif; ?>
                                            <?php endif; ?>
                                        <?php endif; ?>
                                    <?php endif; ?>
                                    <div class="modal fade" id="orderFormModal-<?php echo $publicate->id ?>" tabindex="-1" role="dialog" aria-labelledby="orderFormModalLabel" aria-hidden="true">
                                        <div class="modal-dialog" style="width: 80%;">
                                            <div class="modal-content">
                                                <div class="modal-header">
                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                    <h4 class="modal-title" id="reviewFormModalLabel"><?php echo $termsConditions->title ?></h4>
                                                </div>
                                                <div class="modal-body">
                                                    <form class="nobottommargin" id="template-reviewform" name="template-reviewform" action="#" method="post">
                                                        <div>
                                                            <?php echo $termsConditions->text ?>                                                            
                                                        </div>
                                                        <div class="col_full nobottommargin">
                                                            <?php if ($publicate->user_id != $this->session->userdata('id')): ?>
                                                                <a href="<?php echo site_url('shop/preorderProduct/' . $publicate->id . '/' . $publicate->categoria) ?>" class="button button-3d nomargin" style="text-align: center;font-size: 10px;width: 100%">Acepto los terminos y condiciones, Proceder con la peticion de compra</a>
                                                            <?php endif; ?>
                                                        </div>
                                                    </form>
                                                </div>
                                            </div><!-- /.modal-content -->
                                        </div><!-- /.modal-dialog -->
                                    </div><!-- /.modal -->

                                    <div class="clear"></div>
                                    <div class="line"></div>

                                    <!-- Product Single - Short Description
                                    ============================================= -->
                                    <ul class="iconlist">


                                        <?php if ($publicate->marca): ?>
                                            <li><i class="icon-caret-right"></i>Marca: <?php echo $publicate->marca ?></li>
                                        <?php endif; ?>
                                        <?php if ($publicate->marca_moto): ?>
                                            <li><i class="icon-caret-right"></i>Marca: <?php echo $publicate->marca_moto ?></li>
                                        <?php endif; ?>
                                        <?php if ($publicate->ano): ?>
                                            <li><i class="icon-caret-right"></i> Año: <?php echo $publicate->ano ?></li>
                                        <?php endif; ?>
                                        <?php if ($publicate->kilometraje): ?>
                                            <li><i class="icon-caret-right"></i> Kilometraje: <?php echo number_format($publicate->kilometraje) ?> km</li>
                                        <?php endif; ?>
                                        <?php if ($publicate->cilindraje): ?>
                                            <li><i class="icon-caret-right"></i>Cilindraje: <?php echo $publicate->cilindraje ?></li>
                                        <?php endif; ?>
                                        <?php if ($publicate->color): ?>
                                            <li><i class="icon-caret-right"></i> Color: <?php echo $publicate->color ?></li>
                                        <?php endif; ?>
                                        <?php if ($publicate->placa): ?>
                                            <li><i class="icon-caret-right"></i> Placa: <?php echo $publicate->placa ?></li>
                                        <?php endif; ?>
                                        <?php if ($publicate->tipo_vivienda): ?>
                                            <li><i class="icon-caret-right"></i> Tipo de vivienda: <?php echo $publicate->tipo_vivienda ?></li>
                                        <?php endif; ?>
                                        <?php if ($publicate->cuartos): ?>
                                            <li><i class="icon-caret-right"></i> Nro de cuartos: <?php echo $publicate->cuartos ?></li>
                                        <?php endif; ?>
                                        <?php if ($publicate->banos): ?>
                                            <li><i class="icon-caret-right"></i> Nro de baños: <?php echo $publicate->banos ?></li>
                                        <?php endif; ?>
                                        <?php if ($publicate->garajes): ?>
                                            <li><i class="icon-caret-right"></i> Nro de garajes: <?php echo $publicate->garajes ?></li>
                                        <?php endif; ?>
                                        <?php if ($publicate->mts): ?>
                                            <li><i class="icon-caret-right"></i> Mts(2): <?php echo $publicate->mts ?> mts</li>
                                        <?php endif; ?>
                                        <?php if ($publicate->antiguedad): ?>
                                            <li><i class="icon-caret-right"></i> Antiguedad: <?php echo $publicate->antiguedad ?> años</li>
                                        <?php endif; ?>
                                        <?php if ($publicate->estrato): ?>
                                            <li><i class="icon-caret-right"></i> Estrato: <?php echo $publicate->estrato ?></li>
                                        <?php endif; ?>
                                        <?php if ($publicate->ciudad): ?>
                                            <li><i class="icon-caret-right"></i> Ciudad: <?php echo $publicate->ciudad ?></li>
                                        <?php endif; ?>
                                        <?php if ($publicate->departamento): ?>
                                            <li><i class="icon-caret-right"></i> Departamento: <?php echo $publicate->departamento ?></li>
                                        <?php endif; ?>
                                        <?php if ($publicate->direccion): ?>
                                            <li><i class="icon-caret-right"></i> Direccion: <?php echo $publicate->direccion ?></li>
                                        <?php endif; ?>
                                    </ul><!-- Product Single - Short Description End -->

                                    <!-- Product Single - Meta
                                    ============================================= -->
                                    <div class="panel panel-default product-meta">
                                        <div class="panel-body">
                                            <?php $id_unico = uniqid(); ?>
                                            <span itemprop="productID" class="sku_wrapper">SKU: <span class="sku"><?php echo $id_unico ?></span></span>
                                        </div>
                                    </div><!-- Product Single - Meta End -->

                                    <!-- Product Single - Share
                                    ============================================= -->
                                </div>

                                <div class="col_one_fifth col_last">
                                    <?php if ($publicate->sello_calidad == 1): ?>
                                        <a href="#" title="Brand Logo" class="hidden-xs"><img class="image_fade" src="{{ url:base }}addons/shared_addons/themes/gangaweb/images/garantie.png" alt="Brand Logo"></a>

                                        <div class="feature-box fbox-plain fbox-dark fbox-small">
                                            <div class="fbox-icon">
                                                <i class="icon-thumbs-up2"></i>
                                            </div>
                                            <h3>100% Original</h3>
                                            <p class="notopmargin">Ganga garantiza que este producto es de calidad y cumple con todas sus espesificaciones como se muestra en el detalle de esta publicacion</p>
                                        </div>
                                    <?php endif; ?>
                                    <?php if ($publicate->shiping == 1): ?>
                                        <div class="feature-box fbox-plain fbox-dark fbox-small">
                                            <div class="fbox-icon">
                                                <i class="icon-truck2"></i>
                                            </div>
                                            <h3>Envio gratis</h3>
                                            <p class="notopmargin">Envio gratis a nivel nacional</p>
                                        </div>
                                    <?php endif; ?>
                                    <!--                                    <div class="feature-box fbox-plain fbox-dark fbox-small">
                                                                            <div class="fbox-icon">
                                                                                <i class="icon-undo"></i>
                                                                            </div>
                                                                            <h3>30-Days Returns</h3>
                                                                            <p class="notopmargin">Return or exchange items purchased within 30 days.</p>
                                                                        </div>-->

                                </div>

                                <div class="col_full nobottommargin">

                                    <div class="tabs clearfix nobottommargin" id="tab-1">

                                        <ul class="tab-nav clearfix">
                                            <li><a href="#tabs-2"><i class="icon-info-sign"></i><span class="hidden-xs"> Preguntas y Respuestas</span></a></li>
                                            <li><a href="#tabs-1"><i class="icon-align-justify2"></i><span class="hidden-xs"> Descripcion</span></a></li>                                            
                                            <!--<li><a href="#tabs-3"><i class="icon-star3"></i><span class="hidden-xs"> Calificaciones del vendedor</span></a></li>-->
                                        </ul>

                                        <div class="tab-container">

                                            <div class="tab-content clearfix" id="tabs-1">
                                                <p><?php echo $publicate->text ?></p>
                                            </div>
                                            <div class="tab-content clearfix" id="tabs-2">

                                                <div id="reviews" class="clearfix">
                                                    <ol class="commentlist clearfix">
                                                        <li class="comment even thread-even depth-1" id="li-comment-1">
                                                            <?php foreach ($questions as $key => $question): ?>
                                                                <?php if ($publicate->id == $question->publication_id and $question->state == 1): ?>
                                                                    <div id="comment-1" class="comment-wrap clearfix" style=" margin-top: 30px">
                                                                        <div class="comment-meta">
                                                                            <div class="comment-author vcard">
                                                                                <span class="comment-avatar clearfix">
                                                                                    <img alt='' src='{{ url:base }}files/thumb/<?php echo $question->imagen ?>' height='60' width='60' /></span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="comment-content clearfix">
                                                                            <div class="comment-author"><?php echo $question->first_name ?><span><?php echo $question->created_on ?></span></div>
                                                                            <p><?php echo $question->comment ?></p>
                                                                        </div>
                                                                        <div class="clear"></div>
                                                                        <?php foreach ($answers as $answer): ?>                                                                            
                                                                            <?php if ($question->id == $answer->question_id and $answer->state == 1): ?>                                                                        
                                                                                <div class="divider divider-right"><i class="icon-comment"></i></div>
                                                                                <div id="comment-1" class="comment-wrap clearfix">
                                                                                    <div class="comment-meta">
                                                                                        <div class="comment-author vcard">
                                                                                            <span class="comment-avatar clearfix">
                                                                                                <img alt='' src='{{ url:base }}files/thumb/<?php echo $answer->imagen ?>' height='60' width='60' /></span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="comment-content clearfix">
                                                                                        <div class="comment-author"><?php echo $answer->first_name ?><span><?php echo $answer->created_on ?></span></div>
                                                                                        <p><?php echo $answer->answer ?></p>
                                                                                    </div>

                                                                                    <div class="clear"></div>
                                                                                </div>                                                                               
                                                                            <?php endif; ?>
                                                                            <?php if ($question->id == $answer->question_id and $answer->state == 0 and $answer->user_id == $this->session->userdata('id')): ?>                                                                        
                                                                                <div class="divider divider-right"><i class="icon-comment"></i></div>
                                                                                <div id="comment-1" class="comment-wrap clearfix">
                                                                                    <div class="comment-meta">
                                                                                        <div class="comment-author vcard">
                                                                                            <span class="comment-avatar clearfix">
                                                                                                <img alt='' src='{{ url:base }}files/thumb/<?php echo $answer->imagen ?>' height='60' width='60' /></span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="comment-content clearfix">
                                                                                        <div class="comment-author"><?php echo $answer->first_name ?><span><?php echo $answer->created_on ?></span></div>
                                                                                        <p><?php echo $answer->answer ?></p>
                                                                                    </div>

                                                                                    <div class="clear"></div>
                                                                                </div>
                                                                            <?php endif; ?>
                                                                            <?php if ($question->id == $answer->question_id and $answer->state == 2): ?>                                                                        
                                                                                <div class="divider divider-right"><i class="icon-comment"></i></div>
                                                                                <div id="comment-1" class="comment-wrap clearfix">
                                                                                    <div class="comment-meta">
                                                                                        <div class="comment-author vcard">
                                                                                            <span class="comment-avatar clearfix">
                                                                                                <img alt='' src='{{ url:base }}files/thumb/<?php echo $answer->imagen ?>' height='60' width='60' /></span>
                                                                                        </div>
                                                                                    </div>
                                                                                    <div class="comment-content clearfix">
                                                                                        <div class="comment-author"><?php echo $answer->first_name ?><span><?php echo $answer->created_on ?></span></div>
                                                                                        <div class="style-msg alertmsg" style="margin-top:20px">
                                                                                            <div class="sb-msg"><i class="icon-warning-sign"></i><strong>Advertencia!</strong> Esta respuesta fue eliminada por no cumplir con nuestros terminos y condiciones.</div>
                                                                                        </div>
                                                                                    </div>

                                                                                    <div class="clear"></div>
                                                                                </div>
                                                                            <?php endif; ?>
                                                                        <?php endforeach; ?>
                                                                    </div>
                                                                <?php endif; ?>
                                                                <?php if ($publicate->id == $question->publication_id and $question->state == 1 and $publicate->user_id == $this->session->userdata('id')): ?>
                                                                    <a href="#" data-toggle="modal" data-target="#answerFormModal-<?php echo $question->id ?>" class="button button-3d nomargin fright">Añadir Respuesta</a>
                                                                <?php endif; ?>
                                                                <div class="modal fade" id="answerFormModal-<?php echo $question->id ?>" tabindex="-1" role="dialog" aria-labelledby="answerFormModalLabel" aria-hidden="true">
                                                                    <div class="modal-dialog">
                                                                        <div class="modal-content">
                                                                            <div class="modal-header">
                                                                                <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                                <h4 class="modal-title" id="reviewFormModalLabel">Preguntas y respuestas</h4>
                                                                            </div>
                                                                            <div class="modal-body">
                                                                                <form class="nobottommargin" id="template-reviewform" name="template-reviewform" action="<?php echo site_url('publications/createAnswer/' . $publicate->id . '/' . $publicate->categoria . '/' . $question->id) ?>" method="post">                                    
                                                                                    <div class="col_full">
                                                                                        <label for="template-reviewform-comment">Ingrese su respuesta aqui <small>*</small></label>
                                                                                        <textarea class="required form-control" id="template-reviewform-comment" name="answer" rows="6" cols="30"></textarea>
                                                                                    </div>
                                                                                    <div align='center' class="col_full nobottommargin">
                                                                                        <button class="button button-3d nomargin"  type="submit" id="template-reviewform-submit" name="template-reviewform-submit" value="submit">Enviar Respuesta</button>
                                                                                    </div>
                                                                                </form>
                                                                            </div>
                                                                            <div class="modal-footer">
                                                                                <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                            </div>
                                                                        </div><!-- /.modal-content -->
                                                                    </div><!-- /.modal-dialog -->
                                                                </div>
                                                                <?php if ($publicate->id == $question->publication_id and $question->state == 0 and $question->user_id == $this->session->userdata('id')): ?>
                                                                    <div id="comment-1" class="comment-wrap clearfix" style=" margin-top: 30px">
                                                                        <div class="comment-meta">
                                                                            <div class="comment-author vcard">
                                                                                <span class="comment-avatar clearfix">
                                                                                    <img alt='' src='{{ url:base }}files/thumb/<?php echo $question->imagen ?>' height='60' width='60' /></span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="comment-content clearfix">
                                                                            <div class="comment-author"><?php echo $question->first_name ?><span><?php echo $question->created_on ?></span></div>
                                                                            <p><?php echo $question->comment ?></p>
                                                                        </div>
                                                                        <div class="clear"></div>
                                                                    </div>
                                                                <?php endif; ?>
                                                                <?php if ($publicate->id == $question->publication_id and $question->state == 2): ?>
                                                                    <div id="comment-1" class="comment-wrap clearfix" style=" margin-top: 30px">
                                                                        <div class="comment-meta">
                                                                            <div class="comment-author vcard">
                                                                                <span class="comment-avatar clearfix">
                                                                                    <img alt='' src='{{ url:base }}files/thumb/<?php echo $question->imagen ?>' height='60' width='60' /></span>
                                                                            </div>
                                                                        </div>
                                                                        <div class="comment-content clearfix">
                                                                            <div class="comment-author"><?php echo $question->first_name ?><span><?php echo $question->created_on ?></span></div>
                                                                            <div class="style-msg alertmsg" style="margin-top:20px">
                                                                                <div class="sb-msg"><i class="icon-warning-sign"></i><strong>Advertencia!</strong> Esta pregunta fue eliminada por no cumplir con nuestros terminos y condiciones.</div>
                                                                            </div>
                                                                        </div>
                                                                        <div class="clear"></div>
                                                                    </div>
                                                                <?php endif; ?>
                                                            <?php endforeach; ?>                                                                 
                                                        </li>
                                                    </ol>

                                                    <!-- Modal Reviews
                                                    ============================================= -->
                                                    {{ if user:logged_in }}
                                                    <?php if ($publicate->user_id != $this->session->userdata('id') and $publicate->state != 3): ?>
                                                        <a href="#" data-toggle="modal" data-target="#reviewFormModal-<?php echo $question->id ?>" class="button button-3d nomargin fright">Añadir Pregunta</a>
                                                    <?php endif; ?>
                                                    {{else}}
                                                    <a href="<?php echo site_url('users/login') ?>" class="button button-3d nomargin fright">Login</a>
                                                    {{endif}}
                                                    <div class="modal fade" id="reviewFormModal-<?php echo $question->id ?>" tabindex="-1" role="dialog" aria-labelledby="reviewFormModalLabel" aria-hidden="true">
                                                        <div class="modal-dialog">
                                                            <div class="modal-content">
                                                                <div class="modal-header">
                                                                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                                                                    <h4 class="modal-title" id="reviewFormModalLabel">Preguntas y respuestas</h4>
                                                                </div>
                                                                <div class="modal-body">
                                                                    <form class="nobottommargin" id="template-reviewform" name="template-reviewform" action="<?php echo site_url('publications/createCommit/' . $publicate->id . '/' . $publicate->categoria) ?>" method="post">                                    
                                                                        <div class="col_full">
                                                                            <label for="template-reviewform-comment">Ingrese su pregunta aqui <small>*</small></label>
                                                                            <textarea class="required form-control" id="template-reviewform-comment" name="comment" rows="6" cols="30"></textarea>
                                                                        </div>
                                                                        <div align='center' class="col_full nobottommargin">
                                                                            <button class="button button-3d nomargin"  type="submit" id="template-reviewform-submit" name="template-reviewform-submit" value="submit">Enviar pregunta</button>
                                                                        </div>
                                                                    </form>
                                                                </div>
                                                                <div class="modal-footer">
                                                                    <button type="button" class="btn btn-default" data-dismiss="modal">Close</button>
                                                                </div>
                                                            </div><!-- /.modal-content -->
                                                        </div><!-- /.modal-dialog -->
                                                    </div><!-- /.modal -->
                                                    <!-- Modal Reviews End -->

                                                </div>
                                            </div>
                                            <!--                                            <div class="tab-content clearfix" id="tabs-3">
                                            
                                                                                            <div id="reviews" class="clearfix">
                                            
                                                                                                <ol class="commentlist clearfix">
                                            
                                                                                                    <li class="comment even thread-even depth-1" id="li-comment-1">
                                                                                                        <div id="comment-1" class="comment-wrap clearfix">
                                            
                                                                                                            <div class="comment-meta">
                                                                                                                <div class="comment-author vcard">
                                                                                                                    <span class="comment-avatar clearfix">
                                                                                                                        <img alt='' src='http://0.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=60' height='60' width='60' /></span>
                                                                                                                </div>
                                                                                                            </div>
                                            
                                                                                                            <div class="comment-content clearfix">
                                                                                                                <div class="comment-author">John Doe<span><a href="#" title="Permalink to this comment">April 24, 2014 at 10:46AM</a></span></div>
                                                                                                                <p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Quo perferendis aliquid tenetur. Aliquid, tempora, sit aliquam officiis nihil autem eum at repellendus facilis quaerat consequatur commodi laborum saepe non nemo nam maxime quis error tempore possimus est quasi reprehenderit fuga!</p>
                                                                                                                <div class="review-comment-ratings">
                                                                                                                    <i class="icon-star3"></i>
                                                                                                                    <i class="icon-star3"></i>
                                                                                                                    <i class="icon-star3"></i>
                                                                                                                    <i class="icon-star3"></i>
                                                                                                                    <i class="icon-star-half-full"></i>
                                                                                                                </div>
                                                                                                            </div>
                                            
                                                                                                            <div class="clear"></div>
                                            
                                                                                                        </div>
                                                                                                    </li>
                                            
                                                                                                    <li class="comment even thread-even depth-1" id="li-comment-1">
                                                                                                        <div id="comment-1" class="comment-wrap clearfix">
                                            
                                                                                                            <div class="comment-meta">
                                                                                                                <div class="comment-author vcard">
                                                                                                                    <span class="comment-avatar clearfix">
                                                                                                                        <img alt='' src='http://0.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=60' height='60' width='60' /></span>
                                                                                                                </div>
                                                                                                            </div>
                                            
                                                                                                            <div class="comment-content clearfix">
                                                                                                                <div class="comment-author">Mary Jane<span><a href="#" title="Permalink to this comment">June 16, 2014 at 6:00PM</a></span></div>
                                                                                                                <p>Quasi, blanditiis, neque ipsum numquam odit asperiores hic dolor necessitatibus libero sequi amet voluptatibus ipsam velit qui harum temporibus cum nemo iste aperiam explicabo fuga odio ratione sint fugiat consequuntur vitae adipisci delectus eum incidunt possimus tenetur excepturi at accusantium quod doloremque reprehenderit aut expedita labore error atque?</p>
                                                                                                                <div class="review-comment-ratings">
                                                                                                                    <i class="icon-star3"></i>
                                                                                                                    <i class="icon-star3"></i>
                                                                                                                    <i class="icon-star3"></i>
                                                                                                                    <i class="icon-star-empty"></i>
                                                                                                                    <i class="icon-star-empty"></i>
                                                                                                                </div>
                                                                                                            </div>
                                            
                                                                                                            <div class="clear"></div>
                                            
                                                                                                        </div>
                                                                                                    </li>
                                            
                                                                                                </ol>
                                                                                            </div>
                                            
                                                                                        </div>-->

                                        </div>

                                    </div>

                                </div>

                            </div>

                        </div>

                        <div class="clear"></div><div class="line"></div>
                    </div>

                </div>

            </section><!-- #content end -->
        <?php endforeach; ?>
    </div>
</section>