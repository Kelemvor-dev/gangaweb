<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class shop_m extends MY_Model {

    public function __construct() {
        parent::__construct();
    }

    public function searhBycategorie($idCategorie, $post = NULL) {

        if ($idCategorie == 1 or $idCategorie == 7):
            $this->db->where('categoria', intval($idCategorie));
        else:
            $this->db->where('subcategoria', intval($idCategorie));
        endif;


        if ($post):
            if (@$post['menor']):
                $this->db->where('precio_ganga <= ', intval(@$post['menor']));
            endif;
            if (@$post['mayor']):
                $this->db->where('precio_ganga >= ', intval(@$post['menor']));
            endif;
            if (@$post['condicion']):
                $this->db->where('condicion', intval(@$post['condicion']));
            endif;
            if (@$post['marca']):
                $this->db->where('marca', intval(@$post['marca']));
            endif;
            if (@$post['marca_moto']):
                $this->db->where('marca_moto', @$post['marca_moto']);
            endif;
            if (@$post['ano']):
                $this->db->where('ano', @$post['ano']);
            endif;
            if (@$post['kilometraje']):
                $this->db->where('kilometraje', intval(@$post['kilometraje']));
            endif;
            if (@$post['cilindraje']):
                $this->db->where('cilindraje', intval(@$post['cilindraje']));
            endif;
            /*Viviendas*/
            if (@$post['tipo_vivienda']):
                $this->db->where('tipo_vivienda', intval(@$post['tipo_vivienda']));
            endif;
            if (@$post['cuartos']):
                $this->db->where('cuartos', intval(@$post['cuartos']));
            endif;
            if (@$post['banos']):
                $this->db->where('banos', intval(@$post['banos']));
            endif;
            if (@$post['garajes']):
                $this->db->where('garajes', intval(@$post['garajes']));
            endif;
            if (@$post['mts']):
                $this->db->where('mts', intval(@$post['mts']));
            endif;
            if (@$post['antiguedad']):
                $this->db->where('antiguedad', intval(@$post['antiguedad']));
            endif;
            if (@$post['estrato']):
                $this->db->where('estrato', intval(@$post['estrato']));
            endif;
            if (@$post['ciudad']):
                $this->db->like('ciudad', @$post['ciudad']);
            endif;
            if (@$post['departamento']):
                $this->db->like('departamento', @$post['departamento']);
            endif;
            if (@$post['direccion']):
                $this->db->like('direccion', @$post['direccion']);
            endif;
        endif;

        $query = $this->db->get('publications');
//        echo $this->db->last_query();
        $publications = $query->result();

        return $publications;
    }

    public function searhByproduct($id = null) {
        $this->db->where('id', $id);
        $query = $this->db->get('publications');
        $publications = $query->result();

        return $publications;
    }

    public function searhImagespublications($id = null) {
        if ($id):
            $this->db->where('publication_id', $id);
        endif;
        $query = $this->db->get('images_publicate');
        $images_publicate = $query->result();

        return $images_publicate;
    }

    public function searhProduct($title) {
        $products = '';
        if (!empty($title)):
            $this->db->where('default_publications.state', 1);
            $this->db->group_by('default_publications.id');
            $this->db->like('title', $title);
//            $this->db->like('text', $title);
            $this->db->select('default_publications.id,default_images_publicate.file,default_publications.title,default_publications.precio_real,default_publications.precio_ganga,default_publications.categoria');
            $this->db->from('default_publications');
            $this->db->join('default_images_publicate', 'default_images_publicate.publication_id = default_publications.id');
            $query = $this->db->get();
            $products = $query->result();
        endif;
        return $products;
    }

    public function getQuestions() {
        $this->db->order_by('questions.id', 'ASC');
        $this->db->select('questions.*,profiles.imagen,profiles.first_name,profiles.last_name,profiles.user_id');
        $this->db->from('questions');
        $this->db->join('profiles', 'profiles.user_id = questions.user_id');
        $query = $this->db->get();
        $questions = $query->result();

        return $questions;
    }

    public function getAnswers() {
        $this->db->order_by('answers.id', 'ASC');
        $this->db->select('answers.*,profiles.imagen,profiles.first_name,profiles.last_name,profiles.user_id');
        $this->db->from('answers');
        $this->db->join('profiles', 'profiles.user_id = answers.user_id');
        $query = $this->db->get();
        $answers = $query->result();

        return $answers;
    }

    public function getTermsConditions() {
        $this->db->limit(1);
        $this->db->select('*');
        $this->db->from('newsletter_info');
        $query = $this->db->get();
        $terms = $query->result();

        return $terms;
    }

}
