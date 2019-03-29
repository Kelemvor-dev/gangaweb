<?php foreach ($data as $item): ?>
    <?php if ($item->main == 0): ?>
        <ul class="mega-menu-column col-md-2">
            <li class="mega-menu-title"><a href="<?php echo site_url('shop/products/' . $item->title . '/' . $item->id) ?>"><div><?php echo $item->title ?></div></a>
                <ul>
                    <?php foreach ($data as $submenu): ?>
                        <?php if ($item->id == $submenu->main): ?>
                            <li>
                                <a href="<?php echo site_url('shop/products/' . $submenu->title . '/' . $submenu->id) ?>">
                                    <div>
                                        <i class="icon-circle-blank"></i>
                                        <?php echo $submenu->title ?>
                                    </div>
                                </a>
                            </li>
                        <?php endif; ?>
                    <?php endforeach; ?>
                </ul>
            </li>
        </ul>
    <?php endif; ?>
<?php endforeach; ?>