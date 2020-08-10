<?php

class Application_Model_DbTable_Typedossierconseil extends Zend_Db_Table_Abstract
{

    protected $_name = 'typedossierconseil';

    public function getAll(){
        $select=$this->select();
        return $this->fetchAll($select);
    }
     public function ajouter($lib) {
        $data=array(
        'libType'=>$lib
        );
        $this->insert($data);
    }

    public function get($id){
        $select = $this->_db->select();
        $select = $this->select()->where('idType = ?', $id);
        $stmt = $this->_db->query($select);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function modifier($id,$lib) {
        $data = array(
            'libType'=>$lib
        );
        $this->update($data, 'idType = '. (int)$id);
    }

    public function supprimer($id){
         $this->delete('idType =' . (int)$id);
    }
}

