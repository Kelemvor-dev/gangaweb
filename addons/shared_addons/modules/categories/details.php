<?php

defined('BASEPATH') or exit('No direct script access allowed');

class Module_categories extends Module {

    public $version = '1.0';

    public function info() {
        return array(
            'name' => array(
                'es' => 'categories',
                'en' => 'categories'
            ),
            'description' => array(
                'es' => 'categories ',
                'en' => 'Basic categories'
            ),
            'frontend' => FALSE,
            'backend' => TRUE,
            'menu' => 'content',
        );
    }

    public function install() {
        $this->dbforge->drop_table('categories');
        $categories = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'auto_increment' => TRUE
            ),
            'title' => array(
                'type' => 'VARCHAR',
                'constraint' => '255',
                'null' => true
            ),
            'file' => array(
                'type' => 'TEXT',
                'constraint' => '',
                'null' => true
            ),
            'main' => array(
                'type' => 'int',
                'constraint' => '11',
                'null' => true
            ),
            'icon' => array(
                'type' => 'VARCHAR',
                'constraint' => '255',
                'null' => true
            ),
        );

        $this->dbforge->add_field($categories);
        $this->dbforge->add_key('id', TRUE);

        $this->dbforge->create_table('categories') AND is_dir($this->upload_path . 'categories') OR @ mkdir($this->upload_path . 'categories', 0777, TRUE);
        return TRUE;
    }

    public function uninstall() {
        //Codigo para la desinstalacion del modulo
        $this->dbforge->drop_table('categories');
        return TRUE;
    }

    public function upgrade($old_version) {
        return true;
    }

    public function help() {
        return "Modulo de adminstacion de categorias front-end";
    }

}
