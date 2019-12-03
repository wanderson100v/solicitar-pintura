<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Painter extends CI_Controller {
	
	public function index()
	{
        redirect(site_url("painter/read"));
	}
    
    public function read()
    {	            
        $query = $this->input->get('query');
        $this->load->model("painter_model");
        $painters = $this->painter_model->read($query);
        echo json_encode(array("painters"=>$painters));
    }

}