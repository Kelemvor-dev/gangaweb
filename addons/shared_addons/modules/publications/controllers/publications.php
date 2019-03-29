<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class publications extends Public_Controller {

    public function __construct() {
        parent::__construct();

        $models = array('categories/categories_m', 'publications/publications_m');
        $this->load->model($models);
    }

    public function index() {
        if (isset($this->current_user->id)) {
            
        } else {
            redirect('users/login/users');
        }

        $categories = $this->categories_m->get_categories();

        $this->template
                ->set('categories', $categories)
                ->build('index');
    }

    public function step2($category, $id) {

        if (isset($this->current_user->id)) {
            
        } else {
            redirect('users/login/users');
        }

        $categories = $this->categories_m->get_categories_by_main($id);

        $this->load->library('session');
        $this->session->unset_userdata('categories');
        $categorias["categories"] = array('category' => $category);
        $this->session->set_userdata($categorias);

        $this->template
                ->set('categories', $categories)
                ->set('categorie_id', $id)
                ->build('step2');
    }

    public function step3($category, $id, $categorie_id) {

        if (isset($this->current_user->id)) {
            
        } else {
            redirect('users/login/users');
        }

        $categories = $this->categories_m->get_categories($id);
        $marca_autos = $this->categories_m->get_marca_autos();


        $this->load->library('session');
        $this->session->unset_userdata('categories');
        $categorias["categories"] = array('category' => $category);
        $this->session->set_userdata($categorias);

        $this->template
                ->set('categories', $categories)
                ->set('categorie_id', $categorie_id)
                ->set('subcategorie_id', $id)
                ->set('marca_autos', $marca_autos)
                ->build('step3');
    }

    public function step4() {
        $post = $this->input->post();
        $publication_id = $this->publications_m->save($post, $_FILES);

        $this->template
                ->set('id', $publication_id)
                ->build('step4');
    }

    public function savePubli($id) {
        $data = array(
            'plan' => $_POST['plan']
        );

        $this->db->where('id', $id);
        $this->db->update('publications', $data);


        $notifi = array(
            'publication_id' => $id,
            'message' => 'Hay una nueva publicacion revisa su proceso cuanto antes! ',
            'state' => '0'
        );
        $this->db->insert('admin_notifications', $notifi);

        redirect('my-profile');
    }

    public function seeNotification($id, $procces, $publication_id) {
        $data = array(
            'state' => 1,
        );

        $this->db->where('id', $id);
        $this->db->update('users_notifications', $data);

        if ($procces == 'question-ok' or $procces == 'question-delete' or $procces == 'answer-ok' or $procces == 'answer-delete'):
            $publication = $this->publications_m->getPublication($publication_id);
            redirect('shop/preOrder/' . $publication[0]->categoria . '/' . $publication_id);
        endif;

        if ($procces == 'declino'):
            $publication = $this->publications_m->getPublication($publication_id);
            if ($publication[0]->user_id != $this->session->userdata('id')):
                redirect('home');
            endif;
            $imagesPublications = $this->publications_m->searhImagespublications($publication_id);
            $marca_autos = $this->categories_m->get_marca_autos();
            $this->template
                    ->set('publication', $publication[0])
                    ->set('imagesPublications', $imagesPublications)
                    ->set('marca_autos', $marca_autos)
                    ->set('id_noti', $id)
                    ->set('process', $procces)
                    ->build('editPublication');
        else:
            redirect('my-profile');
        endif;
    }

    public function deleteImage($id, $id_noti, $process, $id_publication) {
        $this->db->delete('images_publicate', array('id' => $id));
        redirect('publications/seeNotification/' . $id_noti . '/' . $process . '/' . $id_publication . '');
    }

    public function saveEditpublication($id) {
        $post = $this->input->post();
        $process = $this->publications_m->saveEdit($id, $post, $_FILES);

        $data = array(
            'user_id' => $this->session->userdata('id'),
            'publication_id' => $id,
            'message' => 'Proceso Exitoso! Su publicacion fue editada con exito uno de nuestros administradores revisara su solicitud lo mas pronto posible gracias por contar con nosotros',
            'process' => 'in_progress'
        );
        $this->db->insert('users_notifications', $data);

        $notifi = array(
            'publication_id' => $id,
            'message' => 'Se realizo el proceso de edicion de una publicacion revisa su proceso cuanto antes! ',
            'state' => '0'
        );
        $this->db->insert('admin_notifications', $notifi);

        redirect('home');
    }

    public function createCommit($publication_id, $categorie_id) {
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }

        $data = array(
            'user_id' => $this->session->userdata('id'),
            'comment' => $_POST['comment'],
            'publication_id' => $publication_id,
            'ip_address' => $ip
        );

        $this->db->insert('questions', $data);

        $this->session->set_flashdata('proccess', 'ok');

        redirect('shop/preOrder/' . $categorie_id . '/' . $publication_id . '');
    }

    public function createAnswer($publication_id, $categorie_id, $question_id) {
        if (!empty($_SERVER['HTTP_CLIENT_IP'])) {
            $ip = $_SERVER['HTTP_CLIENT_IP'];
        } elseif (!empty($_SERVER['HTTP_X_FORWARDED_FOR'])) {
            $ip = $_SERVER['HTTP_X_FORWARDED_FOR'];
        } else {
            $ip = $_SERVER['REMOTE_ADDR'];
        }

        $data = array(
            'user_id' => $this->session->userdata('id'),
            'question_id' => $question_id,
            'answer' => $_POST['answer'],
            'ip_address' => $ip
        );

        $this->db->insert('answers', $data);

        $this->session->set_flashdata('proccess', 'ok');

        redirect('shop/preOrder/' . $categorie_id . '/' . $publication_id . '');
    }

}
