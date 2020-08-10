<?php

class Application_Model_DbTable_Annee extends Zend_Db_Table_Abstract
{

    protected $_name = 'annee';
    public function getAll(){
        $select=$this->select();
        return $this->fetchAll($select);    
    }

}

