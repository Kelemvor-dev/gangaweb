<?php
defined('BASEPATH') or exit('No direct script access allowed');

class Module_Newsletter extends Module
{
    public $version = '1.2';

    public function info() {
        return array(
            'name' => array(
                'es' => 'Newsletter',
                'en' => 'Newsletter',
            ),
            'description' => array(
                'es' => 'Newsletter',
                'en' => 'Newsletter',
            ),
            'frontend' => true,
            'backend' => true,
            'menu' => 'content',
        );
    }

    public function install()
    {
        // otras configuraciones
		$this->dbforge->drop_table('newsletter');

        $newsletter = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'auto_increment' => true
            ),

            'email' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
        );

        $this->dbforge->add_field($newsletter);
        $this->dbforge->add_key('id', true);

        $this->dbforge->create_table('newsletter');

        $this->dbforge->drop_table('newsletter_info');


        $text_info = array(
            'id' => array(
                'type' => 'INT',
                'constraint' => '11',
                'auto_increment' => true
            ),
            'title' => array(
                'type' => 'VARCHAR',
                'constraint' => '100',
                'null' => true
            ),
            'text' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
            'terms_cond' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
            'link' => array(
                'type' => 'VARCHAR',
                'constraint' => '455',
                'null' => true
            ),
            'lang' => array(
                'type' => 'VARCHAR',
                'constraint' => '2',
                'null' => true,
                'default' => 'es',
            ),
        );

        $this->dbforge->add_field($text_info);
        $this->dbforge->add_key('id', true);

        $this->dbforge->create_table('newsletter_info') AND is_dir($this->upload_path . 'newsletter_info') OR @mkdir($this->upload_path . 'newsletter_info', 0777, TRUE);
        
        $data = array(
            'title' => '',
            'text' => '',
            'terms_cond' => '',
            'link' => '',
        );

        $this->db->insert('newsletter_info', $data);

        return TRUE;
    }

    public function uninstall() {
        $this->dbforge->drop_table('newsletter');
        return true;
    }

    public function upgrade($old_version) {
        return true;
    }



    public function help() {
        return "Pagina inicial del sitio desarrollada a la medida.";
    }

}

