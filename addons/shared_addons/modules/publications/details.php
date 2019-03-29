<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Module_publications extends Module {

    public $version = '1.1';

    public function info() {
        return array(
            'name' => array(
                'es' => 'Publicaciones',
                'en' => 'Publicaciones',
            ),
            'description' => array(
                'es' => 'Publicaciones',
                'en' => 'Publicaciones',
            ),
            'frontend' => true,
            'backend' => true,
            'menu' => 'content',
        );
    }

    public function install() {

        return TRUE;
    }

    public function uninstall() {
       
        return true;
    }

    public function upgrade($old_version) {
        return true;
    }

    public function help() {
        return "Modulo by Jeyson Garcia";
    }

}
