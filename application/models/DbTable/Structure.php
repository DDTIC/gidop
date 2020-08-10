<?php

class Application_Model_DbTable_Structure extends Zend_Db_Table_Abstract
{

    protected $_name = 'structure';

    public function getAll()
    {
        $select=$this->select();
        return $this->fetchAll($select);    
    }

    public function getAgentOrdonne ()
    {
        $req="SELECT * FROM structure order by sigleStructure asc";
        $stmt = $this->_db->query($req);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }

     public function ajouter($sstr,$tstr,$nom,$sigle) {
        $data=array(
        'Str_idStructute'=>$sstr,
        'idTypeStr'=> $tstr,
        'nomStructure'=> $nom,
        'sigleStructure' => $sigle
        );
        $this->insert($data);
    }

    public function get($id){
        $select = $this->_db->select();
        $select = $this->select()->where('idStructure = ?', $id);
        $stmt = $this->_db->query($select);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function modifier($id,$sstr,$tstr,$nom,$sigle) {
        $data = array(
            'Str_idStructute'=>$sstr,
            'idTypeStr'=> $tstr,
            'nomStructure'=> $nom,
            'sigleStructure' => $sigle
        );
        $this->update($data, 'idStructure = '. (int)$id);
    }

    public function supprimer($id){
         $this->delete('idStructure =' . (int)$id);
    }
}

