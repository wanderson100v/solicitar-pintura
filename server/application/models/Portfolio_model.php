<?php 
defined('BASEPATH') OR exit('No direct script access allowed');

class Portfolio_model extends CI_Model{
    
    public $id;
    public $title;
    public $description;
    public $fk_painter_id;

    public function read_fk_painter_id($id)
    {
        $this->db->select("*");
        $this->db->from("portfolio");
        $this->db->where('portfolio.fk_painter_id', $id);
		return $this->db->get()->result_array();
    }

    
    public function create($title, $description, $fk_painter_id)
    {
        $this->description = $description;
        $this->title = $title;
        $this->fk_painter_id = $fk_painter_id;
        if($this->db->insert('portfolio', $this))
        {
            $this->id = $this->db->insert_id();
            return "Sucesso";
        }
        else
        {
            return "Ocorreu um erro ao cadastrar portifólio de pintor" ;
        }
    }

    public function read_id($id)
    {
        $this->db->where('id', $id);
		return $this->db->get('portfolio');
	}

    public function update($id, $portfolio)
    {
        if($this->db->update('portfolio',$portfolio, array('id' => $id)))
            return "Sucesso";
        else
            return "Ocorreu um erro ao editar portifólio de pintor";
    }

    public function delete($id)
    {
        return ($this->db->delete('portfolio', array('id' => $id)))? 
            "Sucesso":
            "Erro ao excluir portifólio de pintor";
	}
}