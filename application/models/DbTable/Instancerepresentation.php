<?php

class Application_Model_DbTable_Instancerepresentation extends Zend_Db_Table_Abstract
{

    protected $_name = 'instancerepresentation';
    public function getAll()
    {
        $select=$this->select();
        return $this->fetchAll($select);    
    }

    public function getAllV(){
    	$req = "SELECT * FROM v_instance_structure";
    	$stmt = $this->_db->query($req);
    	return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }

     public function ajouter($idStructure,$lib) 
     {
        $data=array(
            'idStructure'=>$idStructure,
        'libInstance'=>$lib
        );
        $this->insert($data);
    }

    public function get($id){
        $select = $this->_db->select();
        $select = $this->select()->where('idInstance = ?', $id);
        $stmt = $this->_db->query($select);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function modifier($id,$lib) {
        $data = array(
            'idStructure'=>$idStructure,
        'libInstance'=>$lib
        );
        $this->update($data, 'idInstance = '. (int)$id);
    }

    public function supprimer($id){
         $this->delete('idInstance =' . (int)$id);
    }

}

