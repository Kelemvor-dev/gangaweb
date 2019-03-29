<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 *
 * @author 	
 * @package 	PyroCMS
 * @subpackage 	others_conf Module
 * @category 	Modulos
 * @license 	Apache License v2.0
 */
class Admin extends Admin_Controller {

    public function __construct() {
        parent::__construct();
        //$this->lang->load('others_conf');
        $this->template->append_metadata($this->load->view('fragments/wysiwyg', null, TRUE));
        $this->load->model(array('newsletter_m'));
        $this->template->append_js('module::tinymce/tinymce.min.js');
    }

    // -----------------------------------------------------------------

    public function index() {
        // otras configuraciones
        $pagination = create_pagination('admin/newsletter/index', $this->newsletter_m->count_all(), 10);
        $newsletter = $this->newsletter_m->limit($pagination['limit'], $pagination['offset'])->get_all();

        //Consultamos los datos del texto informativo
        $text_info = $this->db->limit(1)->get('newsletter_info')->result();

        $this->template
                ->set('newsletter', $newsletter)
                ->set('pagination', $pagination)
                ->set('text_info', $text_info[0])
                ->build('admin/index');
    }

    public function export_newsletter($status = 1) {
        $this->load->library(array('to_excel'));
        $headers = array();
        $namefile = "correos";

        $namefile = 'Usuarios';
        $datosSql = $this->db
                ->select('nw.email AS Correo')
                ->from('newsletter AS nw')
                ->get();

        $i = 0;

        foreach ($datosSql->result_array() as $row => $value) {
            $i = 0;
            foreach ($value as $row2 => $value2) {
                array_push($headers, $row2);
                $i++;
            }
            break;
        }
        $arrayExcel = $datosSql->result();
        array_unshift($arrayExcel, $headers);
        //$this->to_excel->WriteMatriz($arrayExcel); 
        //$this->to_excel->Download($namefile); // lo manda con vista protegida
        $this->to_excel($datosSql, $namefile);
    }

    // pasar un query sql de codeigniter a excel
    function to_excel($datosSql, $filename = 'exceloutput') {
        $encabezadoExcel = '';  // just creating the var for field headers to append to below
        $datosExcel = '';  // just creating the var for field data to append to below	     

        $obj = & get_instance();

        if ($datosSql->num_rows() == 0) {
            echo '<p>La tabla no tiene datos.</p>';
        } else {
            foreach ($datosSql->result_array() as $row => $value) {
                $encabezadoExcel = '';
                foreach ($value as $row2 => $value2) {
                    $encabezadoExcel .= $row2 . "\t";
                }
            }

            foreach ($datosSql->result() as $row) {
                $lineaExcel = '';
                foreach ($row as $value) {
                    if ((!isset($value)) OR ( $value == "")) {
                        $value = "\t";
                    } else {
                        $value = str_replace('"', '""', $value);
                        $value = '"' . $value . '"' . "\t";
                    }
                    $lineaExcel .= $value;
                }
                $datosExcel .= trim($lineaExcel) . "\n";
            }

            $datosExcel = str_replace("\r", "", $datosExcel);

            // pasar los datos de utf-8 a ansi
            $datosExcel = iconv('UTF-8', 'ISO-8859-1', $datosExcel);
            $encabezadoExcel = iconv('UTF-8', 'ISO-8859-1', $encabezadoExcel);
            //header("Content-type: application/x-msdownload; charset=utf-8"");
            //header("Content-type: application/vnd.ms-excel; charset=utf-8");  //for Excel 5/2003 formats
            header("Content-type: application/vnd.openxmlformats-officedocument.spreadsheetml.sheet");  // for Excel 2007
            //header('Content-type: text/csv; charset=ISO-8859-1');
            header("Content-Disposition: attachment; filename=$filename.xls");
            echo "$encabezadoExcel\n$datosExcel";
        }
    }

    public function edit_text_info($lang_admin = 'es') {
        // reglas de validación


        unset($_POST['btnAction']); // borramos el dato del boton submit
        $_POST['lang'] = $lang_admin; // guardamos el dato del idioma
        $data = $_POST; // guardamos los datos del post en una variable

        $config['upload_path'] = './' . UPLOAD_PATH . '/newsletter_info';
        $config['allowed_types'] = 'gif|jpg|jpeg|png|doc|docx|txt|pdf|xls|xlsx';
        $config['max_size'] = 2050;
        $config['encrypt_name'] = true;

        $this->load->library('upload', $config);

        @$terms_cond = $_FILES['terms_cond']['name'];

        if (!empty($terms_cond)) {
            if ($this->upload->do_upload('terms_cond')) {
                $datos = array('upload_data' => $this->upload->data());
                $path = UPLOAD_PATH . 'newsletter_info/' . $datos['upload_data']['file_name'];
                $terms_cond = array('terms_cond' => $path);
                $data = array_merge($data, $terms_cond);
                $obj = $this->db->get('newsletter_info')->row();
                @unlink(site_url($obj->terms_cond));
            } else {
                $this->session->set_flashdata('error', $this->upload->display_errors());
                redirect('admin/newsletter/index/#page-text-info');
            }
        }

        // actualizamos el registro
        if ($this->db->update('newsletter_info', $data)) {
            $this->session->set_flashdata('success', 'Los registros se actualizarón con éxito.');
        } else {
            $this->session->set_flashdata('success', lang('home:error_message'));
        }
        redirect('admin/newsletter/index/#page-text-info');
    }

}
