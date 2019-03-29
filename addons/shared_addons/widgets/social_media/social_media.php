<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Widget_social_media extends Widgets {

    // The widget title,  this is displayed in the admin interface
    public $title = array(
        'en' => 'social_media',
        'es' => 'Redes sociales(Widget)'
    );
    public $description = array(
        'en' => '',
        'es' => 'Configuración de redes sociales'
    );
    // The author's name
    public $author = 'Jeyson Garcia';
    // The authors website for the widget
    public $website = '';
    //current version of your widget
    public $version = '1.0';

    public function run() {
        /* $data = $this->db->get($this->db->dbprefix.'contact_us')->result_array(); */
        $data = $this->db->where('type', '2')->get('home_outstanding')->result();
        return array('data' => $data);
    }

}
