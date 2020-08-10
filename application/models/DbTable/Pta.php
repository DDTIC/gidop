<?php

class Application_Model_DbTable_Pta extends Zend_Db_Table_Abstract
{

    protected $_name = 'pta';
    public function getAll(){
        $select=$this->select();
        return $this->fetchAll($select);    
    }

    public function getAllV(){
    	$req = "SELECT * FROM v_pta ORDER BY idPTA DESC";
    	$stmt = $this->_db->query($req);
    	return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getV($id){
    	$req = $this->_db->prepare('SELECT * FROM v_pta WHERE idPTA = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

     public function ajouter($idAnnee,$libPTA,$dateTransmission,$refCorrespondance) {
        $data=array(
        'idAnnee'=>$idAnnee,
        'libPTA'=>$libPTA,
        'dateTransmission'=> $dateTransmission,
        'refCorrespondance'=> $refCorrespondance 
        );
        $this->insert($data);
    }

    public function get($id){
        $select = $this->_db->select();
        $select = $this->select()->where('idPTA = ?', $id);
        $stmt = $this->_db->query($select);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function modifier($id,$idAnnee,$libPTA,$dateTransmission,$refCorrespondance) {
        $data = array(
            'idAnnee'=>$idAnnee,
            'libPTA'=>$libPTA,
            'dateTransmission'=> $dateTransmission,
            'refCorrespondance'=> $refCorrespondance 
        );
        $this->update($data, 'idPTA = '. (int)$id);
    }

    public function supprimer($id){
         $this->delete('idPTA =' . (int)$id);
    }

}

