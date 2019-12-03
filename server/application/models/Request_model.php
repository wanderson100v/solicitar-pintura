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
        $situations = array(
            "novo", 
            "solicitacao-aceita",
            "orcamento-aceito",
            "em-progresso",
            "finalizado",
            "solicitacao-rejeitada",
            "cancelado-pintor"
        );
        $this->db->select("request.*,  client.name, address.zip_code,
            address.zip_code,  address.street,  address.neighborhood,
            address.city,  address.state, address.country");
        $this->db->from("request");
        $this->db->join("address", "address.id = request.fk_address_id");
        $this->db->join("painter", "painter.id = request.fk_painter_id");
        $this->db->join("client", "client.id = painter.fk_client_id");
        $this->db->where('request.fk_client_id', $id);
        $this->db->where_in("request.situation", $situations);
		return $this->db->get()->result_array();
    }
    
    public function read_fk_painter_id($id)
    {
        $situations = array(
            "novo", 
            "solicitacao-aceita",
            "orcamento-aceito",
            "em-progresso",
            "finalizado",
            "orcamento-rejeitado",
            "cancelado-cliente"
        );
        $this->db->select("request.*,  client.name,  address.zip_code,
            address.zip_code,  address.street,  address.neighborhood,
            address.city,  address.state, address.country");
        $this->db->from("request");
        $this->db->join("address", "address.id = request.fk_address_id");
        $this->db->join("client", "client.id = request.fk_client_id");
        $this->db->where('request.fk_painter_id', $id);
        $this->db->where_in("request.situation", $situations);
		return $this->db->get()->result_array();
    }

    
    public function create($start_date, $fk_client_id, $fk_painter_id, $fk_address_id)
    {
        $this->start_date = $start_date;
        $this->fk_client_id = $fk_client_id;
        $this->fk_painter_id = $fk_painter_id;
        $this->fk_address_id = $fk_address_id;
        $this->situation = "novo";
        if($this->db->insert('request', $this))
        {
            $this->id = $this->db->insert_id();
            return "Sucesso";
        }
        else return avaliable_error_cod($this->db->error()['code'], "cadastrar requisição de serviço");
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
        else return avaliable_error_cod($this->db->error()['code'], "editar requisição de serviço");
    }

    public function delete($id)
    {
        return ($this->db->delete('request', array('id' => $id)))? 
            "Sucesso":
            avaliable_error_cod($this->db->error()['code'], "excluir requisição de serviço");
	}
}