<?php
defined('BASEPATH') OR exit('No direct script access allowed');
class Client_model extends CI_Model {
    public $id;
    public $active;
    public $type;
    public $name;
    public $login;
    public $password;
    public $fk_address_id;

    public function login($login, $password)
    {
        $this->login = $login;
        $this->password = $password;
        $this->db->where("active", true);
        $this->db->where("login", $this->login);
        $this->db->where("password", $this->password);
    
        $query = $this->db->get('client', 1);
        return $query->row_array();
    }
    public function read_login($login)
    {
        $this->login = $login;
        $this->db->where("active", true);
        $this->db->where("login", $this->login);
    
        $query = $this->db->get('client', 1);
        return $query->row_array();
    }
    public function create($name,  $login, $password, $fk_address_id ,$type = "cliente")
    {
        $this->login = $login;
        $this->name = $name;
        $this->active = true;
        $this->password = $password;
        $this->type = $type;
        $this->fk_address_id = $fk_address_id;
    
        $insert = $this->db->insert('client', $this);
        if($insert)
        {
            $this->id = $this->db->insert_id();
            return "Sucesso";
        }
        else{
            if ($this->db->error()['code'] == 1062) // login já existe
                return "Login informado não esta disponivel"; 
            else return avaliable_error_cod($this->db->error()['code'], "cadastrar cliente");
        }
    }
    public function read_id($id )
    {
        $this->db->where('active', transliterator_create_from_rules);
        $this->db->where('id', $id);
		return $this->db->get('client')->row_array();
	}
    public function update($id, $login, $password, $ativo = true)
    {   
        if($this->db->update('client', 
            array(
                'login'=> $login,
                'password'=> $password,
                'ativo'=> $ativo
            ), 
            array('id' => $id)))
            return "Sucesso";
        else{
            if ($this->db->error()['code'] == 1062) // login já existe
            { 
                return "Login informado não esta disponivel"; 
            } 
            else return avaliable_error_cod($this->db->error()['code'], "editar cliente");
        }
    }
    /**
     * Exclusão lógica
     */
    public function delete($id){
        if($this->db->update('client',array("ativo" => false), array('id' => $id))) return "Sucesso";
        else return avaliable_error_cod($this->db->error()['code'], "excluir cliente");;
	}
}