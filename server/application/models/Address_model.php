<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Address_model extends CI_Model{

    public $id;
    public $zip_code;
    public $street;
    public $neighborhood;
    public $city;
    public $state;
    public $country;

    public function create($address)
    {
        if($this->db->insert('address', $address))
        {
            $this->id = $this->db->insert_id();
            return "Sucesso";
        }
        else return avaliable_error_cod($this->db->error()['code'], "cadastrar endereço");
    }

    public function read_id($id)
    {
        $this->db->where('id', $id);
		return $this->db->get('address')->row_array();
	}

    public function update($id, $address)
    {   
        if($this->db->update('address',$address, array('id' => $id)))
            return "Sucesso";
        else return avaliable_error_cod($this->db->error()['code'], "editar endereço");
    }

    public function delete($id)
    {
        return ($this->db->delete('address', array('id' => $id)))? 
            "Sucesso":
            avaliable_error_cod($this->db->error()['code'], "excluir endereço");;
	}
}