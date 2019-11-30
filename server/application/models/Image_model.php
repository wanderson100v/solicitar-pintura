<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class image_model extends CI_Model{
    
    public $id;
    public $image;
    public $fk_portfolio_id;

    public function read_fk_portfolio_id($id)
    {
        $this->db->select("*");
        $this->db->from("image");
        $this->db->where('image.fk_portfolio_id', $id);
		return $this->db->get()->result_array();
	}
    
    public function create($image, $fk_portfolio_id)
    {
        $this->image = $image;
        $this->fk_portfolio_id = $fk_portfolio_id;
        if($this->db->insert('image', $this))
        {
            $this->id = $this->db->insert_id();
            return "Sucesso";
        }
        else
        {
            return "Ocorreu um erro ao cadastrar imagem de portifólio" ;
        }
    }

    public function read($id)
    {
        $this->db->where('id', $id);
		return $this->db->get('image');
	}

    public function update($id, $image)
    {
        if($this->db->update('image',$image, array('id' => $id)))
            return "Sucesso";
        else
            return "Ocorreu um erro ao editar imagem de portifólio";
    }

    public function delete($id)
    {
        return ($this->db->delete('image', array('id' => $id)))? 
            "Sucesso":
            "Erro ao excluir imagem de portifólio";
	}
}