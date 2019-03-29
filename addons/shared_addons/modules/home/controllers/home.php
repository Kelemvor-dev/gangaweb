<?php

defined('BASEPATH') OR exit('No direct script access allowed');

class Home extends Public_Controller {

    public function __construct() {
        parent::__construct();
        /* idioma */
        $this->lang_code = 'es';
        $models = array('publications/publications_m');
        $this->load->model($models);
    }

// -----------------------------------------------------------------

    public function index() {
// consultamos los datos del Banner
        $banner = $this->db->get('home_banner')->result();
        $text_info = $this->db->limit(1)->get('home_text_info')->result();
        $outstanding_services = $this->db->where('type', '2')->get('home_outstanding')->result();
        $customers = $this->db->get('home_customers')->result();
        $outstanding_news = $this->db->where('type', '1')->get('home_outstanding')->result();
        $publications = $this->publications_m->getHomedes();



        $this->template
                ->set('text_info', $text_info)
                ->set('enlaces_interes', $outstanding_services)
                ->set('premios', $customers)
                ->set('publicidad', $outstanding_news)
                ->set('banner', $banner)
                ->set('publications', $publications)
                ->build('index');
    }

    public function countNotifications() {
        header("Access-Control-Allow-Origin: *");
        //Procesamos el post desde ionic angular 4
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);
        $this->db->where('state', 0);
        $this->db->where('user_id', $request->user_id);
        $query = $this->db->from('users_notifications');
        $solucion = $query->count_all_results();
        if ($solucion == 0):
            $solucion = 'vacio';
        endif;
        echo json_encode($solucion);
    }

    public function bannerhomeApp() {
        header("Access-Control-Allow-Origin: *");
        $banner = $this->db->get('home_banner')->result();
        echo json_encode($banner);
    }

    public function getPublications() {
        header("Access-Control-Allow-Origin: *");
        $publications = $this->publications_m->getHomedes();
        echo json_encode($publications);
    }

    public function getlistNumnotifications() {
        header("Access-Control-Allow-Origin: *");
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);
        $this->db->where('state', 0);
        $this->db->where('user_id', $request->user_id);
        $query = $this->db->from('users_notifications');
        $query = $this->db->get();
        $notifi = $query->result();
        echo json_encode($notifi);
    }
    
    public function getCategoriesApp() {        
        header("Access-Control-Allow-Origin: *");
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);       
        $tipocategoria = $request->id;
        $categories = $this->publications_m->getCategories($tipocategoria);
        echo json_encode($categories);
    }
    
    public function getProductsbycategorie() {
        header("Access-Control-Allow-Origin: *");
        $postdata = file_get_contents("php://input");
        $request = json_decode($postdata);       
        $tipocategoria = $request->id;
        $categories = $this->publications_m->getProductscategory($tipocategoria);
        echo json_encode($categories);
    }
    
    public function getProductsimages() {
        header("Access-Control-Allow-Origin: *");
        $publicationsimages = $this->publications_m->searhImagespublications();
        echo json_encode($publicationsimages);
    }

}
