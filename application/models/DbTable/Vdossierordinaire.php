<?php

class Application_Model_DbTable_Vdossierordinaire extends Zend_Db_Table_Abstract
{

    protected $_name = 'v_dossierordinaire';

    public function getAll(){
        $select=$this->select();
        return $this->fetchAll($select);    
    }
}

