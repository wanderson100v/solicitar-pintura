<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Solicitation extends CI_Controller {
	
	public function index()
	{
        redirect(site_url("solicitation/create"));
	}
    
    public function create()
    {	            
        $start_date = $this->input->post('start_date');
        $objects = json_decode($this->input->post('painters_objects'));
        $address = json_decode($this->input->post('address'));
        $fk_client_id = $this->input->post('fk_client_id');
        $fk_painter_id = $this->input->post('fk_painter_id');

        $this->load->model("object_model");
        $this->load->model("request_model");
        $this->load->model("address_model");

        $msgs[0] = $this->db->trans_start();
        $msgs[1] =$this->address_model->create($address);
        $msgs[2] =$this->request_model->create($start_date, $fk_client_id, $fk_painter_id, $this->address_model->id);
        $count = 3;
        foreach($objects as $pobject){
            $msgs[$count]= $this->object_model->create($pobject->title,$pobject->description,$pobject->square_meter, $this->request_model->id);
            $count = $count + 1;
        }
        $this->db->trans_complete();
        avaliable_msgs($msgs, "Sucesso ao cadastrar requisição de serviço");
    }

    public function read($type)
    {	            
        $id = $this->input->get('id');
        $this->load->model("request_model");
        if($type == "client"){
            $requests = $this->request_model->read_fk_client_id($id);
            echo json_encode(array("requests"=> $requests));
            return;
        }
        else if($type == "painter"){
            $requests = $this->request_model->read_fk_painter_id($id);
            echo json_encode(array("requests"=> $requests));
            return;
        }
        echo_error("Busca inválida");
    }


}