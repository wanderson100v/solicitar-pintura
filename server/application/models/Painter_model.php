<?php
defined('BASEPATH') OR exit('No direct script access allowed');

class Painter_model extends CI_Model{
    
    public $id;
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

    public function create($name, $login, $password, $dayli_value, $square_meter_value)
    {
        $this->load->model('client_model');
        $msg = $this->fk_client_id = $this->client_model->create($name, $login, $password, "pintor");
        if($msg != "Sucesso"){
            return $msg;
        }
        $this->dayli_value = $dayli_value;
        $this->square_meter_value = $square_meter_value;
        $this->fk_client_id = $this->client_model->id;
        
        if($this->db->insert('painter', $this))
        {
            $this->id = $this->db->insert_id();
            return "Sucesso";
        }
        else
        {
            return "Ocorreu um erro ao cadastrar painter" ;
        }
        
    }

    public function read_id($id){
        $this->db->select("*");
        $this->db->from("painter");
        $this->db->where('painter.id', $id);
		return $this->db->get()->row_array();
	}

    public function update($id, $dayli_value, $square_meter_value)
    {
        if( $this->db->update('painter', 
            array(
                'dayli_value' => $dayli_value,
                'square_meter_value' => $square_meter_value,
            ), 
            array('id' => $id)))
            return "Sucesso";
        else
            return "Ocorreu um erro ao editar pintor";
    }
    
}