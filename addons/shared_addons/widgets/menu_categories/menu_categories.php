<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Widget_menu_categories extends Widgets {

    // The widget title,  this is displayed in the admin interface
    public $title = array(
        'en' => 'menu_categories',
        'es' => 'Categorias(Widget)'
    );
    public $description = array(
        'en' => 'menu_categories',
        'es' => 'Categorias(Widget)'
    );
    // The author's name
    public $author = 'Jeyson Garcia';
    // The authors website for the widget
    public $website = '';
    //current version of your widget
    public $version = '1.0';

    public function run() {        
        $query = $this->db->get('categories');
        $solucion = $query->result();
        return array('data' => $solucion);
    }

}
