<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Contact_model extends CI_Model{
    
    public $id;
    public $type;
    public $description;
    public $fk_client_id;

    public function read_fk_client_id($id)
    {
        $this->db->select("*");
        $this->db->from("contact");
        $this->db->where('contact.fk_client_id', $id);
		return $this->db->get()->result_array();
	}
    
    public function create($type, $description, $fk_client_id)
    {
        $this->type = $type;
        $this->description = $description;
        $this->fk_client_id = $fk_client_id;
        if($this->db->insert('contact', $this)) return "Sucesso";
        else return avaliable_error_cod($this->db->error()['code'], "cadastrar contato");
    }

    public function read($id)
    {
        $this->db->where('id', $id);
		return $this->db->get('contact');
	}

    public function update($id, $contact)
    {
        if($this->db->update('contact',$contact, array('id' => $id))) return "Sucesso";
        else return avaliable_error_cod($this->db->error()['code'],"editar contato");
    }

    public function delete($id)
    {
        return ($this->db->delete('contact', array('id' => $id)))? 
            "Sucesso":
            "Erro ao excluir contato";
	}
}