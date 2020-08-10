<?php

class Application_Model_DbTable_Statutdossier extends Zend_Db_Table_Abstract
{

    protected $_name = 'statutdossier';

    public function getAll(){
        $select=$this->select();
        return $this->fetchAll($select);
    }
     public function ajouter($lib) {
        $data=array(
        'libStatut'=>$lib
        );
        $this->insert($data);
    }

    public function get($id){
        $select = $this->_db->select();
        $select = $this->select()->where('idStatut = ?', $id);
        $stmt = $this->_db->query($select);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function modifier($id,$lib) {
        $data = array(
            'libStatut'=>$lib
        );
        $this->update($data, 'idStatut = '. (int)$id);
    }

    public function supprimer($id){
         $this->delete('idStatut =' . (int)$id);
    }
}

