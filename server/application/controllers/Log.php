<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Log extends CI_Controller {
	
	public function index()
	{
        redirect(site_url("log/login"));
	}
    public function in()
    {	            
      $login = $this->input->post("login");
      $password = $this->input->post("password");

      $this->load->model("client_model");
      $this->load->model("address_model");
      $this->load->model("contact_model");
      $client  = $this->client_model->login($login, md5($password));
      if($client != null){
        $client["address"] = $this->address_model->read_id($client["FK_ADDRESS_id"]);
        $client["email"] = $this->contact_model->read_fk_client_id_type($client["id"],"email");
        $client["tel_number"] = $this->contact_model->read_fk_client_id_type($client["id"], "telefone");
        if($client['type'] == "cliente")
            echo json_encode(array("type"=> "cliente", "client" => $client));
        else if($client['type'] == "pintor"){
            $this->load->model("painter_model");
            $painter = $this->painter_model->read_fk_client_id($client["id"]);
            $painter["client"] = $client;
            echo json_encode(array("type"=> "pintor", "painter" => $painter));
        }else 
            echo_error("Tipo de cliente inválidos");
    }else
        echo_error("Login ou senha inválidos");
      
    }
  
}