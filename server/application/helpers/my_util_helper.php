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


function castObjectClassInArray($object) {
    if(gettype($object)=="array")
    {
        $array = array();
        foreach($object as $elemento)
        {
            array_push($array, castObjectClassInArray($elemento));
        }
        return $array;
    }else{
        $reflectionClass = new ReflectionClass(get_class($object));
        $array = array();
        foreach ($reflectionClass->getProperties() as $property) {
            $property->setAccessible(true);
            if(gettype($property->getValue($object)) == "object")
                $array[$property->getName()] = castObjectClassInArray($property->getValue($object));
            else
                $array[$property->getName()] = $property->getValue($object);
            $property->setAccessible(false);
        }
        return $array;
    }
}