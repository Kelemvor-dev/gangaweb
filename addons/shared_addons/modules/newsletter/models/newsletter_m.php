<?php
if (!defined('BASEPATH'))
    exit('No direct script access allowed');
/**
 * @author  Brayan Acebo
 */
class Newsletter_m extends MY_Model {
    public function __construct() {
        parent::__construct();
        $this->_table = $this->db->dbprefix . 'newsletter';
    }		public function get_newsletter_info()	{		$data = $this->db->limit(1)->get('newsletter_info')->row();		if(!empty($data))        {            $data->terms_cond = site_url($data->terms_cond);        }		return $data;			}
}