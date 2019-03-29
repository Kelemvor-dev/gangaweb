<!-- Content
============================================= -->
<section id="content clearfix">

    <div class="content-wrap">

        <div class="container clearfix">

            <div class="row clearfix">

                <div class="col-sm-3 clearfix">

                    <div class="list-group">
                        <a href="<?php echo site_url('edit-profile'); ?>" class="list-group-item clearfix">Editar Perfil <i class="icon-user pull-right"></i></a>
                        <!--<a href="#" class="list-group-item clearfix">Mensajes <i class="icon-envelope2 pull-right"></i></a>-->
                        <!--<a href="#" class="list-group-item clearfix">Configuracion <i class="icon-cog pull-right"></i></a>-->
                        <a href="<?php echo site_url('users/logout') ?>" class="list-group-item clearfix">Cerrar sesiòn <i class="icon-line2-logout pull-right"></i></a>
                    </div>

                    <div class="fancy-title topmargin title-border">
                        <h4>Dashboard</h4>
                    </div>

                    <!--<p>Adminstra todas tus publicaciones, mensajes, configuraciones etc. </p>-->
                </div>
                <div class="line visible-xs-block"></div>
                <div class="col-sm-9">
                    <div class="image-profile alignleft">
                        <img class="" width="100%" src="{{ url:base }}files/thumb/<?php echo $profile[0]->imagen ?>" alt="Avatar">
                    </div>

                    <div class="heading-block noborder">
                        <h3>
                            {{ if user:logged_in }}
                            {{ user:first_name }} {{ user:last_name }}
                            {{ endif}}
                        </h3>
                        <span>Dashboard</span>
                    </div>

                    <div class="clear"></div>

                    <div class="row clearfix">

                        <div class="col-md-12">

                            <div class="tabs tabs-alt clearfix" id="tabs-profile">

                                <ul class="tab-nav clearfix">
                                    <li><a href="#tab-feeds"><i class="icon-list"></i> Publicaciones</a></li>
                                    <li><a href="#tab-posts"><i class="icon-pencil2"></i> Informacion Personal</a></li>
     <!--                                     <li><a href="#tab-replies"><i class="icon-reply"></i> Replies</a></li>
                                       <li><a href="#tab-connections"><i class="icon-users"></i> Connections</a></li>-->
                                </ul>

                                <div class="tab-container">

                                    <div class="tab-content clearfix" id="tab-feeds">
                                        <a href="<?php echo site_url('publications') ?>" class="button button-border button-rounded button-fill fill-from-right button-black" style="float: right"><span>Crear Publicacion</span></a>
                                        <div class="clear" style="margin-bottom: 40px"></div>
                                        <div id="portfolio" >
                                            <?php foreach ($publications as $item): ?>
                                                <article class="portfolio-item pf-graphics pf-uielements">
                                                    <div class="portfolio-image my-profile-cont-images">
                                                        <a href="<?php echo site_url('shop/preOrder/'.$item->categoria.'/'.$item->id) ?>">
                                                            <?php $count = 1; ?>
                                                            <?php foreach ($images_publicate as $image): ?>
                                                                <?php if ($item->id == $image->publication_id && $count == 1): ?>
                                                                    <?php $count++ ?>
                                                                    <img src="<?php echo site_url($image->file) ?>" alt="Mac Sunglasses">
                                                                <?php endif; ?>
                                                            <?php endforeach; ?>
                                                        </a>
                                                        <div class="portfolio-overlay">
    <!--                                                            <a href="http://vimeo.com/89396394" class="left-icon" data-lightbox="iframe"><i class="icon-line-play"></i></a>
                                                            <a href="portfolio-single-video.html" class="right-icon"><i class="icon-line-ellipsis"></i></a>-->
                                                        </div>
                                                    </div>
                                                    <div class="portfolio-desc">
                                                        <h3><a href="<?php echo site_url('shop/preOrder/'.$item->categoria.'/'.$item->id) ?>"><?php echo $item->title ?></a></h3>
                                                    </div>
                                                </article>
                                            <?php endforeach; ?>


                                        </div>
                                    </div>
                                    <div class="tab-content clearfix" id="tab-posts">
                                        <div class="col_one_fourth">
                                            <label>Nombre</label></br>
                                            <?php echo $profile[0]->first_name . ' ' . $profile[0]->last_name ?>
                                        </div>
                                        <div class="col_one_fourth">
                                            <label>Telefono</label></br>
                                            <?php echo $profile[0]->phone ?>
                                        </div>
                                        <div class="col_one_fourth">
                                            <label>Celular</label></br>
                                            <?php echo $profile[0]->mobile ?>
                                        </div>
                                        <div class="col_one_fourth">
                                            <label>Documento de identidad</label></br>
                                            <?php echo $profile[0]->documento_de_identidad ?>
                                        </div>
                                        <div class="col_one_fourth">
                                            <label>Email</label></br>
                                            {{ user:email user_id= _user:id }}
                                        </div>                                        
                                    </div>
                                    <!--  
                                                                        <div class="tab-content clearfix" id="tab-replies">
                                    
                                                                            <div class="clear topmargin-sm"></div>
                                                                            <ol class="commentlist noborder nomargin nopadding clearfix">
                                                                                <li class="comment even thread-even depth-1" id="li-comment-1">
                                                                                    <div id="comment-1" class="comment-wrap clearfix">
                                                                                        <div class="comment-meta">
                                                                                            <div class="comment-author vcard">
                                                                                                <span class="comment-avatar clearfix">
                                                                                                    <img alt='' src='http://0.gravatar.com/avatar/ad516503a11cd5ca435acc9bb6523536?s=60' class='avatar avatar-60 photo avatar-default' height='60' width='60' /></span>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="comment-content clearfix">
                                                                                            <div class="comment-author">John Doe<span><a href="#" title="Permalink to this comment">April 24, 2012 at 10:46 am</a></span></div>
                                                                                            <p>Donec sed odio dui. Nulla vitae elit libero, a pharetra augue. Nullam id dolor id nibh ultricies vehicula ut id elit. Integer posuere erat a ante venenatis dapibus posuere velit aliquet.</p>
                                                                                            <a class='comment-reply-link' href='#'><i class="icon-reply"></i></a>
                                                                                        </div>
                                                                                        <div class="clear"></div>
                                                                                    </div>
                                                                                    <ul class='children'>
                                                                                        <li class="comment byuser comment-author-_smcl_admin odd alt depth-2" id="li-comment-3">
                                                                                            <div id="comment-3" class="comment-wrap clearfix">
                                                                                                <div class="comment-meta">
                                                                                                    <div class="comment-author vcard">
                                    
                                                                                                        <span class="comment-avatar clearfix">
                                                                                                            <img alt='' src='http://1.gravatar.com/avatar/30110f1f3a4238c619bcceb10f4c4484?s=40&amp;d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D40&amp;r=G' class='avatar avatar-40 photo' height='40' width='40' /></span>
                                    
                                                                                                    </div>
                                                                                                </div>
                                                                                                <div class="comment-content clearfix">
                                                                                                    <div class="comment-author"><a href='#' rel='external nofollow' class='url'>SemiColon</a><span><a href="#" title="Permalink to this comment">April 25, 2012 at 1:03 am</a></span></div>
                                    
                                                                                                    <p>Nullam id dolor id nibh ultricies vehicula ut id elit.</p>
                                    
                                                                                                    <a class='comment-reply-link' href='#'><i class="icon-reply"></i></a>
                                                                                                </div>
                                                                                                <div class="clear"></div>
                                                                                            </div>
                                                                                        </li>
                                                                                    </ul>
                                                                                </li>
                                    
                                                                                <li class="comment byuser comment-author-_smcl_admin even thread-odd thread-alt depth-1" id="li-comment-2">
                                                                                    <div class="comment-wrap clearfix">
                                                                                        <div class="comment-meta">
                                                                                            <div class="comment-author vcard">
                                                                                                <span class="comment-avatar clearfix">
                                                                                                    <img alt='' src='http://1.gravatar.com/avatar/30110f1f3a4238c619bcceb10f4c4484?s=60&amp;d=http%3A%2F%2F1.gravatar.com%2Favatar%2Fad516503a11cd5ca435acc9bb6523536%3Fs%3D60&amp;r=G' class='avatar avatar-60 photo' height='60' width='60' /></span>
                                                                                            </div>
                                                                                        </div>
                                                                                        <div class="comment-content clearfix">
                                                                                            <div class="comment-author"><a href='http://themeforest.net/user/semicolonweb' rel='external nofollow' class='url'>SemiColon</a><span><a href="#" title="Permalink to this comment">April 25, 2012 at 1:03 am</a></span></div>
                                    
                                                                                            <p>Integer posuere erat a ante venenatis dapibus posuere velit aliquet.</p>
                                    
                                                                                            <a class='comment-reply-link' href='#'><i class="icon-reply"></i></a>
                                                                                        </div>
                                                                                        <div class="clear"></div>
                                                                                    </div>
                                                                                </li>
                                    
                                                                            </ol>
                                    
                                                                        </div>
                                                                        <div class="tab-content clearfix" id="tab-connections">
                                    
                                                                            <div class="row topmargin-sm">
                                                                                <div class="col-md-3 col-sm-6 bottommargin">
                                    
                                                                                    <div class="team">
                                                                                        <div class="team-image">
                                                                                            <img src="{{ url:base }}addons/shared_addons/themes/gangaweb/images/team/3.jpg" alt="John Doe">
                                                                                        </div>
                                                                                        <div class="team-desc">
                                                                                            <div class="team-title"><h4>John Doe</h4><span>CEO</span></div>
                                                                                            <a href="#" class="social-icon inline-block si-small si-light si-rounded si-facebook">
                                                                                                <i class="icon-facebook"></i>
                                                                                                <i class="icon-facebook"></i>
                                                                                            </a>
                                                                                            <a href="#" class="social-icon inline-block si-small si-light si-rounded si-twitter">
                                                                                                <i class="icon-twitter"></i>
                                                                                                <i class="icon-twitter"></i>
                                                                                            </a>
                                                                                            <a href="#" class="social-icon inline-block si-small si-light si-rounded si-gplus">
                                                                                                <i class="icon-gplus"></i>
                                                                                                <i class="icon-gplus"></i>
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                    
                                                                                </div>
                                    
                                                                                <div class="col-md-3 col-sm-6 bottommargin">
                                    
                                                                                    <div class="team">
                                                                                        <div class="team-image">
                                                                                            <img src="{{ url:base }}addons/shared_addons/themes/gangaweb/images/team/2.jpg" alt="Josh Clark">
                                                                                        </div>
                                                                                        <div class="team-desc">
                                                                                            <div class="team-title"><h4>Josh Clark</h4><span>Co-Founder</span></div>
                                                                                            <a href="#" class="social-icon inline-block si-small si-light si-rounded si-facebook">
                                                                                                <i class="icon-facebook"></i>
                                                                                                <i class="icon-facebook"></i>
                                                                                            </a>
                                                                                            <a href="#" class="social-icon inline-block si-small si-light si-rounded si-twitter">
                                                                                                <i class="icon-twitter"></i>
                                                                                                <i class="icon-twitter"></i>
                                                                                            </a>
                                                                                            <a href="#" class="social-icon inline-block si-small si-light si-rounded si-gplus">
                                                                                                <i class="icon-gplus"></i>
                                                                                                <i class="icon-gplus"></i>
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                    
                                                                                </div>
                                    
                                                                                <div class="col-md-3 col-sm-6 bottommargin">
                                    
                                                                                    <div class="team">
                                                                                        <div class="team-image">
                                                                                            <img src="{{ url:base }}addons/shared_addons/themes/gangaweb/images/team/8.jpg" alt="Mary Jane">
                                                                                        </div>
                                                                                        <div class="team-desc">
                                                                                            <div class="team-title"><h4>Mary Jane</h4><span>Sales</span></div>
                                                                                            <a href="#" class="social-icon inline-block si-small si-light si-rounded si-facebook">
                                                                                                <i class="icon-facebook"></i>
                                                                                                <i class="icon-facebook"></i>
                                                                                            </a>
                                                                                            <a href="#" class="social-icon inline-block si-small si-light si-rounded si-twitter">
                                                                                                <i class="icon-twitter"></i>
                                                                                                <i class="icon-twitter"></i>
                                                                                            </a>
                                                                                            <a href="#" class="social-icon inline-block si-small si-light si-rounded si-gplus">
                                                                                                <i class="icon-gplus"></i>
                                                                                                <i class="icon-gplus"></i>
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                    
                                                                                </div>
                                    
                                                                                <div class="col-md-3 col-sm-6">
                                    
                                                                                    <div class="team">
                                                                                        <div class="team-image">
                                                                                            <img src="{{ url:base }}addons/shared_addons/themes/gangaweb/images/team/4.jpg" alt="Nix Maxwell">
                                                                                        </div>
                                                                                        <div class="team-desc">
                                                                                            <div class="team-title"><h4>Nix Maxwell</h4><span>Support</span></div>
                                                                                            <a href="#" class="social-icon inline-block si-small si-light si-rounded si-facebook">
                                                                                                <i class="icon-facebook"></i>
                                                                                                <i class="icon-facebook"></i>
                                                                                            </a>
                                                                                            <a href="#" class="social-icon inline-block si-small si-light si-rounded si-twitter">
                                                                                                <i class="icon-twitter"></i>
                                                                                                <i class="icon-twitter"></i>
                                                                                            </a>
                                                                                            <a href="#" class="social-icon inline-block si-small si-light si-rounded si-gplus">
                                                                                                <i class="icon-gplus"></i>
                                                                                                <i class="icon-gplus"></i>
                                                                                            </a>
                                                                                        </div>
                                                                                    </div>
                                    
                                                                                </div>
                                                                            </div>
                                    
                                                                        </div>-->

                                </div>

                            </div>

                        </div>

                    </div>

                </div>

            </div>

        </div>

    </div>

</section>