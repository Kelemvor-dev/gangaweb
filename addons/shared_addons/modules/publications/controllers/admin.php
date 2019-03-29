<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @author 	Jeyson Garcia
 * @package 	PyroCMS
 * @subpackage 	publications Module
 * @category 	Modulos
 * @license 	Apache License v2.0
 */
class Admin extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        $models = array('categories/categories_m', 'publications/publications_m');
        $this->load->model($models);
    }

    public function index() {

        $pagination = create_pagination('admin/publications/index', $this->publications_m->count_all(), 10);
        $publications = $this->publications_m->getPublications($pagination['limit'], $pagination['offset']);
        $shopping = $this->publications_m->getPublicationbyshopping();
        $questions = $this->publications_m->getQuestions();
        $answers = $this->publications_m->getAnswers();

        $this->template
                ->set('publications', $publications)
                ->set('pagination', $pagination)
                ->set('questions', $questions)
                ->set('answers', $answers)
                ->set('shopping',$shopping)
                ->build('admin/index');
    }

    public function listNotifications() {
        if (isset($this->current_user->id)) {
            
        } else {
            redirect('users/login/users');
        }

        $notifi = $this->publications_m->getNotifications();

        $this->template
                ->set('notificaciones', $notifi)
                ->title('Notificaciones')
                ->build('admin/notifications');
    }

    public function getPublication($id, $state, $id_publication) {
        if ($state):
            $data = array(
                'state' => $state
            );

            $this->db->where('id', $id);
            $this->db->update('admin_notifications', $data);

            redirect('admin/publications/seePublication/' . $id_publication);
        else:
            redirect('admin/publications/seePublication/' . $id_publication);
        endif;
    }

    public function seePublication($id) {
        $publication = $this->publications_m->getPublication($id);
        $imagesPublications = $this->publications_m->searhImagespublications($id);
        $this->template
                ->set('publication', $publication)
                ->set('imagesPublications', $imagesPublications)
                ->build('admin/publication');
    }

    public function saveNotification($user_id, $publication_id, $comprador_id) {
        if ($_POST['notifi'][0] == 'acepto'):

            $data = array(
                'user_id' => $user_id,
                'publication_id' => $publication_id,
                'message' => $_POST['message'],
                'process' => $_POST['notifi'][0]
            );
            $this->db->insert('users_notifications', $data);

            $publi = array(
                'state' => 1,
            );
            $this->db->where('id', $publication_id);
            $this->db->update('publications', $publi);

        endif;
        if ($_POST['notifi'][0] == 'declino'):
            $data = array(
                'user_id' => $user_id,
                'publication_id' => $publication_id,
                'message' => $_POST['message'],
                'process' => $_POST['notifi'][0]
            );
            $this->db->insert('users_notifications', $data);

            $publi = array(
                'state' => 2,
            );
            $this->db->where('id', $publication_id);
            $this->db->update('publications', $publi);

        endif;
        if ($_POST['notifi'][0] == 'elimino'):
            $data = array(
                'user_id' => $user_id,
                'publication_id' => $publication_id,
                'message' => $_POST['message'],
                'process' => $_POST['notifi'][0]
            );
            $this->db->insert('users_notifications', $data);

            $this->db->delete('publications', array('id' => $publication_id));

        endif;
        if ($_POST['notifi'][0] == 'termino'):
            $data = array(
                'user_id' => $comprador_id,
                'publication_id' => $publication_id,
                'message' => $_POST['message'],
                'process' => $_POST['notifi'][0]
            );

            $this->db->insert('users_notifications', $data);

            $publi = array(
                'state' => 3,
            );
            $this->db->where('id', $publication_id);
            $this->db->update('publications', $publi);

        endif;
        
        if ($_POST['notifi'][0] == 'no-disponible'):
            $data = array(
                'user_id' => $comprador_id,
                'publication_id' => $publication_id,
                'message' => $_POST['message'],
                'process' => $_POST['notifi'][0]
            );

            $this->db->insert('users_notifications', $data);

            $publi = array(
                'state' => 4,
            );
            $this->db->where('id', $publication_id);
            $this->db->update('publications', $publi);

        endif;
        
        redirect('admin/publications/seePublication/' . $publication_id);
    }

    public function destacar($id, $state) {
        $publi = array(
            'destacado' => $state,
        );
        $this->db->where('id', $id);
        $this->db->update('publications', $publi);
        redirect('admin/publications#page-text-info');
    }

    public function selloCalidad($id, $state) {
        $publi = array(
            'sello_calidad' => $state,
        );
        $this->db->where('id', $id);
        $this->db->update('publications', $publi);
        redirect('admin/publications#page-text-info');
    }

    public function shiping($id, $state) {
        $publi = array(
            'shiping' => $state,
        );
        $this->db->where('id', $id);
        $this->db->update('publications', $publi);
        redirect('admin/publications#page-text-info');
    }

    public function activeQuestion($id, $state) {

        $publication = $this->publications_m->getPublicationbyQuestion($id);
        if ($state == 1):
            $data = array(
                'user_id' => $publication[0]->user_id,
                'publication_id' => $publication[0]->publication_id,
                'message' => 'Una persona tiene una pregunta respecto a tu producto "' . $publication[0]->title . '"',
                'process' => 'question-ok'
            );
            $this->db->insert('users_notifications', $data);
        endif;
        if ($state == 2):
            $data = array(
                'user_id' => $publication[0]->repuesta_usuario,
                'publication_id' => $publication[0]->publication_id,
                'message' => 'La pregunta del producto "' . $publication[0]->title . '" no cumple con nuestros terminos y condiciones reformula la pregunta o ponte en contacto con servicio al cliente',
                'process' => 'question-delete'
            );
            $this->db->insert('users_notifications', $data);
        endif;

        $publi = array(
            'state' => $state,
        );
        $this->db->where('id', $id);
        $this->db->update('questions', $publi);

        redirect('admin/publications#page-questions');
    }

    public function activeAnswer($id, $state) {
        $publication = $this->publications_m->getPublicationbyAnswer($id);
        if ($state == 1):
            $data = array(
                'user_id' => $publication[0]->pregunta_usuario,
                'publication_id' => $publication[0]->publication_id,
                'message' => 'Hola! tienes una respuesta del producto "' . $publication[0]->title . '"',
                'process' => 'answer-ok'
            );
            $this->db->insert('users_notifications', $data);
        endif;
        if ($state == 2):
            $data = array(
                'user_id' => $publication[0]->repuesta_usuario,
                'publication_id' => $publication[0]->publication_id,
                'message' => 'La respuesta del producto "' . $publication[0]->title . '" no cumple con nuestros terminos y condiciones reformula la respuesta o ponte en contacto con servicio al cliente',
                'process' => 'answer-delete'
            );
            $this->db->insert('users_notifications', $data);
        endif;

        $publi = array(
            'state' => $state,
        );
        $this->db->where('id', $id);
        $this->db->update('answers', $publi);
        redirect('admin/publications#page-answers');
    }

}
