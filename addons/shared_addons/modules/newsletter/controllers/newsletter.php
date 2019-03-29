<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * @author 	 Buitrago
 * @package 	PyroCMS
 * @subpackage 	newsletter Module
 * @category 	Modulos
 * @license 	Apache License v2.0
 */
class Newsletter extends Public_Controller {

    public function __construct() {
        parent::__construct();
        $this->load->model(array('newsletter_m'));
        $this->load->library('session');
    }

    public function insert_email() {
        $post = $this->input->post();
        $this->db->where('email', $post['email']);
        $query = $this->db->get('newsletter');
        $solucion = $query->result();
        if (empty($solucion)):
            $this->db->insert('newsletter', $post);
            $this->session->set_flashdata('proccess', 'ok');
        else:
            $this->session->set_flashdata('proccess', 'error');
        endif;

        redirect('home');
    }

    public function terminos_y_condiciones() {
        $text_info = $this->db->limit(1)->get('newsletter_info')->result();

        $this->template
                ->set('text_info', $text_info[0])
                ->build('terminos_condiciones');
    }

    public function appTerminosycondiciones() {
        $text_info = $this->db->limit(1)->get('newsletter_info')->result();

        $data = array(
            'titulo' => $text_info[0]->title,
            'texto' => strip_tags($text_info[0]->text)
        );

        echo json_encode($data);
    }

}
