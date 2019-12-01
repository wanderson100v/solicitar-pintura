<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Material_model extends CI_Model{
    
    public $id;
    public $name;
    public $value;
    public $fk_request_id;

    public function read_fk_request_id($id)
    {
        $this->db->select("*");
        $this->db->from("material");
        $this->db->where('material.fk_request_id', $id);
		return $this->db->get()->result_array();
	}
    
    public function create($name, $value, $fk_request_id)
    {
        $this->name = $name;
        $this->value = $value;
        $this->fk_request_id = $fk_request_id;
        if($this->db->insert('material', $this))
        {
            $this->id = $this->db->insert_id();
            return "Sucesso";
        }
        else return avaliable_error_cod($this->db->error()['code'], "cadastrar material para serviço");
        
    }

    public function read_id($id)
    {
        $this->db->where('id', $id);
		return $this->db->get('material');
	}

    public function update($id, $material)
    {
        if($this->db->update('material',$material, array('id' => $id)))
            return "Sucesso";
        else return avaliable_error_cod($this->db->error()['code'], "editar material para serviço");
    }

    public function delete($id)
    {
        return ($this->db->delete('material', array('id' => $id)))? 
            "Sucesso":
            avaliable_error_cod($this->db->error()['code'], "excluir material para serviço");
	}
}