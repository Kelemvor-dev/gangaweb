<?php

if (!defined('BASEPATH'))
    exit('No direct script access allowed');

class publications_m extends MY_Model {

    public function __construct() {
        parent::__construct();
    }

    public function save($post, $files) {

        $data = array(
            'user_id' => $this->session->userdata('id'),
        );
        $post = array_merge($post, $data);
        $this->db->insert('publications', $post);
        $publication_id = $this->db->insert_id();
        $images = array(
            'publication_id' => $publication_id,
        );

        $filesCount = count($_FILES['file']['name']);

        for ($i = 0; $i < $filesCount; $i++) {
            $_FILES['file' . $i]['name'] = $_FILES['file']['name'][$i];
            $_FILES['file' . $i]['type'] = $_FILES['file']['type'][$i];
            $_FILES['file' . $i]['tmp_name'] = $_FILES['file']['tmp_name'][$i];
            $_FILES['file' . $i]['error'] = $_FILES['file']['error'][$i];
            $_FILES['file' . $i]['size'] = $_FILES['file']['size'][$i];


            $config['upload_path'] = './' . UPLOAD_PATH . '/publications';
            $config['allowed_types'] = 'jpg|png|jpeg';
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if ($this->upload->do_upload('file' . $i)) {
                $datos = array('upload_data' => $this->upload->data());
                $path = UPLOAD_PATH . 'publications/' . $datos['upload_data']['file_name'];
                $file = array('file' => $path);
                $images = array_merge($images, $file);
                $this->db->insert('images_publicate', $images);
            }
        }
        $this->session->set_flashdata('success', 'Los registros se guardaron con éxito.');
        return $publication_id;
    }

    public function saveEdit($id, $post, $files) {

        $data = array(
            'user_id' => $this->session->userdata('id'),
            'state' => '0'
        );
        $post = array_merge($post, $data);

        $this->db->where('id', $id);
        $this->db->update('publications', $post);

        $images = array(
            'publication_id' => $id,
        );

        $filesCount = count($_FILES['file']['name']);

        for ($i = 0; $i < $filesCount; $i++) {
            $_FILES['file' . $i]['name'] = $_FILES['file']['name'][$i];
            $_FILES['file' . $i]['type'] = $_FILES['file']['type'][$i];
            $_FILES['file' . $i]['tmp_name'] = $_FILES['file']['tmp_name'][$i];
            $_FILES['file' . $i]['error'] = $_FILES['file']['error'][$i];
            $_FILES['file' . $i]['size'] = $_FILES['file']['size'][$i];


            $config['upload_path'] = './' . UPLOAD_PATH . '/publications';
            $config['allowed_types'] = 'jpg|png|jpeg';
            $config['encrypt_name'] = true;

            $this->load->library('upload', $config);
            $this->upload->initialize($config);
            if ($this->upload->do_upload('file' . $i)) {
                $datos = array('upload_data' => $this->upload->data());
                $path = UPLOAD_PATH . 'publications/' . $datos['upload_data']['file_name'];
                $file = array('file' => $path);
                $images = array_merge($images, $file);
                $this->db->insert('images_publicate', $images);
            }
        }
        $this->session->set_flashdata('success', 'Los registros se guardaron con éxito.');
        return TRUE;
    }

    public function getPublications($a, $b) {
        $this->db->order_by("default_publications.state", "ASC");
        $this->db->limit($a, $b);
        $this->db->group_by('default_publications.id');
        $this->db->select('default_publications.id,default_publications.title,default_publications.precio_real,default_publications.precio_ganga,default_publications.categoria,default_publications.state,default_publications.destacado,default_publications.sello_calidad,default_publications.shiping, default_users.email, default_profiles.first_name, default_profiles.last_name, default_profiles.phone, default_profiles.mobile, default_profiles.documento_de_identidad');
        $this->db->from('default_publications');
        $this->db->join('default_users', 'default_users.id = default_publications.user_id');
        $this->db->join('default_profiles', 'default_profiles.user_id = default_users.id');
        $query = $this->db->get();
        $products = $query->result();
//        echo $this->db->last_query();
//        die;
        return $products;
    }

    public function getPublicationbyshopping() {
        $this->db->group_by('default_publications.id');
        $this->db->select('default_publications.*, default_users.email, default_profiles.first_name, default_profiles.last_name, default_profiles.phone, default_profiles.mobile, default_profiles.documento_de_identidad');
        $this->db->from('default_publications');
        $this->db->join('default_users', 'default_users.id = default_publications.comprador_id');
        $this->db->join('default_profiles', 'default_profiles.user_id = default_users.id');
        $query = $this->db->get();
        $products = $query->result();
//        echo $this->db->last_query();
//        die;
        return $products;
    }

    public function getPublication($id) {
        $this->db->where('default_publications.id', $id);
        $this->db->group_by('default_publications.id');
        $this->db->select('default_publications.*, default_users.email, default_profiles.first_name, default_profiles.last_name, default_profiles.phone, default_profiles.mobile, default_profiles.documento_de_identidad');
        $this->db->from('default_publications');
        $this->db->join('default_users', 'default_users.id = default_publications.user_id');
        $this->db->join('default_profiles', 'default_profiles.user_id = default_users.id');
        $query = $this->db->get();
        $products = $query->result();
//        echo $this->db->last_query();
//        die;
        return $products;
    }

    public function getNotifications() {
        $this->db->select('*');
        $this->db->from('admin_notifications');
        $query = $this->db->get();
        $notifi = $query->result();
        return $notifi;
    }

    public function searhImagespublications($id = null) {
        if ($id):
            $this->db->where('publication_id', $id);
        endif;
        $query = $this->db->get('images_publicate');
        $images_publicate = $query->result();

        return $images_publicate;
    }

    public function getHomedes() {
        $this->db->where('destacado', 1);
        $this->db->group_by('default_publications.id');
        $this->db->select('default_publications.*,ROUND((default_publications.precio_real - default_publications.precio_ganga)/(default_publications.precio_real)*100) as porcentaje,images_publicate.file');
        $this->db->from('default_publications');
        $this->db->join('images_publicate', 'images_publicate.publication_id = default_publications.id');
        $query = $this->db->get();
        $products = $query->result();
//        echo $this->db->last_query();
//        die;
        return $products;
    }

    public function getQuestions() {
        $this->db->order_by('questions.created_on');
        $this->db->select('questions.*,profiles.imagen,profiles.first_name,profiles.last_name,profiles.user_id');
        $this->db->from('questions');
        $this->db->join('profiles', 'profiles.user_id = questions.user_id');
        $query = $this->db->get();
        $questions = $query->result();

        return $questions;
    }

    public function getAnswers() {
        $this->db->order_by('answers.created_on');
        $this->db->select('answers.*,profiles.imagen,profiles.first_name,profiles.last_name,profiles.user_id');
        $this->db->from('answers');
        $this->db->join('profiles', 'profiles.user_id = answers.user_id');
        $query = $this->db->get();
        $answers = $query->result();

        return $answers;
    }

    public function getPublicationbyAnswer($id) {
        $this->db->where('default_answers.id', $id);
        $this->db->select('default_questions.publication_id,default_publications.title,default_publications.user_id,default_answers.user_id AS repuesta_usuario,default_questions.user_id AS pregunta_usuario');
        $this->db->from('default_answers');
        $this->db->join('default_questions', 'default_answers.question_id = default_questions.id');
        $this->db->join('default_publications', 'default_questions.publication_id = default_publications.id');
        $query = $this->db->get();
        $products = $query->result();

        return $products;
    }

    public function getPublicationbyQuestion($id) {
        $this->db->where('default_questions.id', $id);
        $this->db->select('default_questions.publication_id,default_publications.title,default_publications.user_id,default_questions.user_id AS repuesta_usuario');
        $this->db->from('default_questions');
        $this->db->join('default_publications', 'default_questions.publication_id = default_publications.id');
        $query = $this->db->get();
        $products = $query->result();

        return $products;
    }

    public function getCategories($tipo) {
        if ($tipo):
            $this->db->where('main', $tipo);
        else:
            $this->db->where('main', 0);
        endif;
        $query = $this->db->get('categories');
        $solucion = $query->result();

        return $solucion;
    }

    public function getProductscategory($idCategorie) {
        
        
        $this->db->where('state', 1);
        if ($idCategorie == 1 or $idCategorie == 7):
            $this->db->where('categoria', intval($idCategorie));
        else:
            $this->db->where('subcategoria', intval($idCategorie));
        endif;

        if (@$post):
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
            /* Viviendas */
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
        $publications = $query->result();
        return $publications;
    }

}
