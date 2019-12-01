<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Object_model extends CI_Model{
    
    public $id;
    public $title;
    public $description;
    public $color;
    public $square_meter;
    public $image;
    public $fk_request_id;

    public function read_fk_request_id($id)
    {
        $this->db->select("*");
        $this->db->from("object");
        $this->db->where('object.fk_request_id', $id);
		return $this->db->get()->result_array();
	}
    
    public function create($title, $description, $image, $color, $square_meter, $fk_request_id)
    {
        $this->title = $title;
        $this->description = $description;
        $this->image = $image;
        $this->color = $color;
        $this->square_meter = $square_meter;
        $this->fk_request_id = $fk_request_id;
        if($this->db->insert('object', $this))
        {
            $this->id = $this->db->insert_id();
            return "Sucesso";
        }
        else return avaliable_error_cod($this->db->error()['code'], "cadastrar abjeto para pintura");
    }

    public function read_id($id)
    {
        $this->db->where('id', $id);
		return $this->db->get('object');
	}

    public function update($id, $object)
    {
        if($this->db->update('object',$object, array('id' => $id)))
            return "Sucesso";
        else return avaliable_error_cod($this->db->error()['code'], "editar abjeto para pintura");
    }

    public function delete($id)
    {
        return ($this->db->delete('object', array('id' => $id)))? 
            "Sucesso":
            avaliable_error_cod($this->db->error()['code'], "exluir abjeto para pintura");
	}
}