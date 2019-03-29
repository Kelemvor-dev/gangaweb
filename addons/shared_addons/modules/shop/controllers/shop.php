<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class shop extends Public_Controller {

    public function __construct() {
        parent::__construct();

        $models = array('categories/categories_m', 'shop/shop_m', 'publications/publications_m');
        $this->load->model($models);
    }

    public function index() {

        $categories = $this->categories_m->get_categories();

        $this->template
                ->set('categories', $categories)
                ->build('index');
    }

    public function products($name, $category_id) {
        $publications = $this->shop_m->searhBycategorie($category_id, $_POST);
        $imagesPublications = $this->shop_m->searhImagespublications();
        $marca_autos = $this->categories_m->get_marca_autos();

        $this->template
                ->set('publications', $publications)
                ->set('categorieId', $category_id)
                ->set('imagesPublications', $imagesPublications)
                ->set('marca_autos', $marca_autos)
                ->build('products');
    }

    public function preOrder($category_id, $id) {

        $publications = $this->shop_m->searhByproduct($id);
        $imagesPublications = $this->shop_m->searhImagespublications($id);
        $questions = $this->shop_m->getQuestions();
        $answers = $this->shop_m->getAnswers();
        $termsConditions = $this->shop_m->getTermsConditions();


        $this->template
                ->set('publications', $publications)
                ->set('categorieId', $category_id)
                ->set('imagesPublications', $imagesPublications)
                ->set('questions', $questions)
                ->set('answers', $answers)
                ->set('termsConditions', $termsConditions[0])
                ->build('preorder');
    }

    public function filterProducts() {

        $results = $this->shop_m->searhProduct($_POST['searh']);
        echo json_encode($results);
    }

    public function preorderProduct($id, $categorie) {
        $data = array(
            'comprador_id' => $this->session->userdata('id'),
        );
        $this->db->where('id', $id);
        $this->db->update('publications', $data);

        $notifi = array(
            'publication_id' => $id,
            'message' => 'Hay una nueva peticion de compra revisa su proceso cuanto antes! ',
            'state' => '0',
            'process' => 'pre-order'
        );
        $this->db->insert('admin_notifications', $notifi);

        $data = array(
            'user_id' => $this->session->userdata('id'),
            'publication_id' => $id,
            'message' => 'Proceso exitoso! Tu peticion de compra fue enviada pronto uno de nuestros acesores se pondra en contacto con tigo para el proceso de compra',
            'process' => 'ok'
        );
        $this->db->insert('users_notifications', $data);

        redirect('shop/preOrder/' . $categorie . '/' . $id);
    }

}
