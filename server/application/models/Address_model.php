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
        else
        {
            return "Ocorreu um erro ao cadastrar contato" ;
        }
    }

    public function read($id)
    {
        $this->db->where('id', $id);
		return $this->db->get('address');
	}

    public function update($id, $address)
    {   
        if($this->db->update('address',$address, array('id' => $id)))
            return "Sucesso";
        else
            return "Ocorreu um erro ao editar contato";
    }

    public function delete($id)
    {
        return ($this->db->delete('address', array('id' => $id)))? 
            "Sucesso":
            "Erro ao excluir contato";
	}
}