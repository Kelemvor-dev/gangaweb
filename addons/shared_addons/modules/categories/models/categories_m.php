<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

/**
 * @jeyson garcia
 */

class categories_m extends MY_Model {

    protected $cache = array();

    public function __construct() {
        parent::__construct();
    }

    public function save($post, $file) {

        $data = array(
            'title' => trim($post['title']),
            'main' => $post['main'],
        );

        if (!empty($file)) {
            $config['upload_path'] = './' . UPLOAD_PATH . '/categories';
            $config['allowed_types'] = 'jpg|png|jpeg';
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);
            if ($this->upload->do_upload('file')) {
                $datos = array('upload_data' => $this->upload->data());
                $path = UPLOAD_PATH . 'categories/' . $datos['upload_data']['file_name'];
                $file = array('file' => $path);
                $data = array_merge($data, $file);
            } else {
                var_dump($this->upload->display_errors());
                die;
            }
        }
        $this->db->insert('categories', $data);
        $this->session->set_flashdata('success', 'Los registros se guardaron con éxito.');
        return true;
    }

    public function update_category($id, $post, $file) {

        $data = array(
            'title' => str_replace(' ','', $post['title']),
            'main' => $post['main'],
        );

        if (!empty($file)) {
            $config['upload_path'] = './' . UPLOAD_PATH . '/categories';
            $config['allowed_types'] = 'jpg|png|jpeg';
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);
            if ($this->upload->do_upload('file')) {
                $datos = array('upload_data' => $this->upload->data());
                $path = UPLOAD_PATH . 'categories/' . $datos['upload_data']['file_name'];
                $file = array('file' => $path);
                $data = array_merge($data, $file);
            } else {
                var_dump($this->upload->display_errors());
                die;
            }
        }
        $this->db->where('id', $id);
        $this->db->update('categories', $data);
        $this->session->set_flashdata('success', 'Los registros se guardaron con éxito.');
        return true;
    }

    

    public function get_categories($id = NULL) {
        if ($id):
            $this->db->where('id', $id);
        endif;
        $query = $this->db->get('categories');
        $solucion = $query->result();

        return $solucion;
    }
    
    public function get_marca_autos($id = NULL) {
        if ($id):
            $this->db->where('id', $id);
        endif;
        $query = $this->db->get('marca_autos');
        $solucion = $query->result();

        return $solucion;
    }
    public function get_categories_by_main($id = NULL) {
        if ($id):
            $this->db->where('main', $id);
        endif;
        $query = $this->db->get('categories');
        $solucion = $query->result();

        return $solucion;
    }

}
