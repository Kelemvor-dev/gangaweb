<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Admin extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        $models = array('categories_m');
        $this->load->model($models);
        $this->template->append_js('module::tinymce/tinymce.min.js');
    }

    public function index() {
        $categories = $this->categories_m->get_categories();
        $this->template
                ->set('categories', $categories)
                ->build('admin/index');
    }

    // categories

    public function create() {
        $categories = $this->categories_m->get_categories();
        $this->template
                ->set('categories', $categories)
                ->build('admin/create');
    }

    public function save() {
        $post = $this->input->post();
        $file = $_FILES['file']['name'];
        $this->categories_m->save($post, $file);
        redirect('admin/categories/#page-banner');
    }

    public function edit($id) {
        $post = $this->input->post();
        if ($post):
            $file = $_FILES['file']['name'];
            $this->categories_m->update_category($id, $post, $file);
            redirect('admin/categories/#page-banner');
        endif;
        $categories = $this->categories_m->get_categories($id);
        $main = $this->categories_m->get_categories();
        $this->template
                ->set('categories', $categories)
                ->set('main', $main)
                ->build('admin/edit');
    }

    public function delete($id) {

        $this->db->delete('categories', array('id' => $id));
        $this->session->set_flashdata('success', 'Proceso éxitoso.');
        redirect('admin/categories/#page-banner');
    }

}
