<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class Widget_notifications extends Widgets {

    // The widget title,  this is displayed in the admin interface
    public $title = array(
        'en' => 'notifications',
        'es' => 'notifications'
    );
    public $description = array(
        'en' => 'notifications',
        'es' => 'notifications'
    );
    // The author's name
    public $author = 'Jeyson Garcia';
    // The authors website for the widget
    public $website = '';
    //current version of your widget
    public $version = '1.0';

    public function run() {
        $this->db->where('state', 0);
        $this->db->where('user_id', $this->session->userdata('id'));
        $query = $this->db->get('users_notifications');
        $solucion = $query->result();
        return array('data' => $solucion);
    }

}
