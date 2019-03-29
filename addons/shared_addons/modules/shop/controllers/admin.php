<?php

defined('BASEPATH') OR exit('No direct script access allowed');

/**
 * @author 	Jeyson Garcia
 * @package 	PyroCMS
 * @subpackage 	shop Module
 * @category 	Modulos
 * @license 	Apache License v2.0
 */
class Admin extends Admin_Controller {

    public function __construct() {
        parent::__construct();
    }

    public function index() {
        $this->template
                ->build('admin/index');
    }
    
   


}
