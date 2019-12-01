<?php
defined('BASEPATH') OR exit('No direct script access allowed');

function avaliable_msgs($msgs, $sucess_msg){
    foreach ($msgs as $msg) {
        if($msg != "Sucesso"){
            echo json_encode(array('state'=> 'danger','msg'=> $msg));
            return $msg;
        }
    }
    echo json_encode(array('state'=> 'success','msg'=> $sucess_msg));
}

function echo_error($error){
    echo json_encode(array('state'=> "danger",'msg'=> $error));
}

function avaliable_error_cod($cod, $generic_error){
    $error = "Erro ao ";
    if($cod ==  1048) return $error.$generic_error.": Um campo obrigatório não foi informado";
    else return "Erro desconhecido ao ".$generic_error ." Contate administrador do sistema";
}