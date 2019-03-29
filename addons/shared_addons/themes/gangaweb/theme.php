<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Theme_gangaweb extends Theme {

    public $name = 'Gangaweb';
    public $version = '0.0.1';
    public $author = 'Jeyson Andres Garcia';
    public $author_website = 'https://www.facebook.com/jeyson.garcia';
    public $description = 'Theme for Ganga';
    public $website = 'https://www.facebook.com/jeyson.garcia';
    public $options = array(
        'framework' => array(
            'title' => 'Framework',
            'description' => 'Cambia el framework css',
            'default' => 'Gangaweb',
            'type' => 'select',
            'options' => 'frameworks/materialize = Materialize CSS | frameworks/bootstrap = Boostrap 3 | framework/foundation = Foundation 5',
            'is_required' => TRUE
        ),
    );

}
