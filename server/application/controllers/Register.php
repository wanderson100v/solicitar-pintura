<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Register extends CI_Controller {
	
	public function index()
	{
        redirect(site_url("client/create"));
	}
    
    public function client()
    {	            
        $name = $this->input->post('name');
        $login = $this->input->post('login');
        $password = $this->input->post('password');
        $confirm_password = $this->input->post('confirm_password');
        $email = $this->input->post('email');
        $tel_number = $this->input->post('tel_number');
        
        if($password != $confirm_password){
            echo_error("a senha e sua confirmação se divergem");
            return;
        }

        $this->load->model("address_model");
        $this->load->model("client_model");
        $this->load->model("contact_model");
        
        $this->db->trans_start();
        $msgs = array(
            $this->address_model->create(array("zip_code" => "0")),
            $this->client_model->create($name, $login, md5($password), $this->address_model->id ),
            $this->contact_model->create("telefone", $tel_number, $this->client_model->id),
            $this->contact_model->create("email", $email, $this->client_model->id),
        );
        avaliable_msgs($msgs, "Sucesso ao cadastrar cliente");
        $this->db->trans_complete();
    }

    public function painter()
    {	            
        $name = $this->input->post('name');
        $login = $this->input->post('login');
        $description = $this->input->post('description');
        $password = $this->input->post('password');
        $confirm_password = $this->input->post('confirm_password');
        $email = $this->input->post('email');
        $tel_number = $this->input->post('tel_number');
        
        if($password != $confirm_password){
            echo_error("a senha e sua confirmação se divergem");
            return;
        }

        $this->load->model("address_model");
        $this->load->model("client_model");
        $this->load->model("painter_model");
        $this->load->model("contact_model");
        
        $this->db->trans_start();
        $msgs = array(
            $this->address_model->create(array("zip_code" => "0")),
            $this->client_model->create($name, $login, md5($password), $this->address_model->id ,"pintor"),
            $this->painter_model->create($description, $this->client_model->id ),
            $this->contact_model->create("telefone", $tel_number, $this->client_model->id),
            $this->contact_model->create("email", $email, $this->client_model->id),
        );
        avaliable_msgs($msgs, "Sucesso ao cadastrar pintor");
        $this->db->trans_complete();
    }
}