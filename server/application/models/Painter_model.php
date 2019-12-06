<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Painter_model extends CI_Model{
    
    public $id;
    public $description;
    public $dayli_value;
    public $square_meter_value;
    public $fk_client_id;

    public function read_fk_client_id($id)
    {
        $this->db->select("*");
        $this->db->from("painter");
        $this->db->where('painter.fk_client_id', $id);
		return $this->db->get()->row_array();
	}

    public function create($description, $fk_client_id)
    {
        $this->fk_client_id = $fk_client_id;
        $this->description = $description;
        $this->dayli_value = 0.0;
        $this->square_meter_value = 0.0;
        
        if($this->db->insert('painter', $this))
        {
            $this->id = $this->db->insert_id();
            return "Sucesso";
        }
        else return avaliable_error_cod($this->db->error()['code'], "cadastrar pintor");
        
    }

    public function read_id($id){
        $this->db->select("*");
        $this->db->from("painter");
        $this->db->where('painter.id', $id);
		return $this->db->get()->row_array();
	}

    
    public function read($query){
        $this->db->select("painter.id, painter.dayli_value, painter.description, client.name, painter.square_meter_value");
        $this->db->from("painter");
        $this->db->join("client", "painter.fk_client_id = client.id");
        $this->db->like('client.name', $query);
        $this->db->or_like('painter.description', $query);
        $this->db->or_like('painter.square_meter_value', $query);
        $this->db->or_like('painter.dayli_value', $query);
		return $this->db->get()->result_array();
	}


    public function update($id, $description ,$dayli_value, $square_meter_value)
    {
        if( $this->db->update('painter', 
            array(
                'description' => $description,
                'dayli_value' => $dayli_value,
                'square_meter_value' => $square_meter_value,
            ), 
            array('id' => $id)))
            return "Sucesso";
        else return avaliable_error_cod($this->db->error()['code'], "editar pintor");
    }
    
}