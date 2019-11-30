<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class request_model extends CI_Model{
    
    public $id;
    public $situation;
    public $start_date;
    public $end_date;
    public $amount;
    public $fk_client_id;
    public $fk_painter_id;
    public $fk_address_id;

    public function read_fk_client_id($id)
    {
        $this->db->select("*");
        $this->db->from("request");
        $this->db->where('request.fk_client_id', $id);
		return $this->db->get()->result_array();
    }
    
    public function read_fk_painter_id($id)
    {
        $this->db->select("*");
        $this->db->from("request");
        $this->db->where('request.fk_painter_id', $id);
		return $this->db->get()->result_array();
    }

    
    public function create($start_date, $fk_client_id, $fk_painter_id, $fk_address_id)
    {
        $this->start_date = $start_date;
        $this->fk_client_id = $fk_client_id;
        $this->fk_painter_id = $fk_painter_id;
        $this->fk_address_id = $fk_address_id
        if($this->db->insert('request', $this))
        {
            $this->id = $this->db->insert_id();
            return "Sucesso";
        }
        else
        {
            return "Ocorreu um erro ao cadastrar requisição de serviço" ;
        }
    }

    public function read_id($id)
    {
        $this->db->where('id', $id);
		return $this->db->get('request');
	}

    public function update($id, $request)
    {
        if($this->db->update('request',$request, array('id' => $id)))
            return "Sucesso";
        else
            return "Ocorreu um erro ao editar requisição de serviço";
    }

    public function delete($id)
    {
        return ($this->db->delete('request', array('id' => $id)))? 
            "Sucesso":
            "Erro ao excluir requisição de serviço";
	}
}