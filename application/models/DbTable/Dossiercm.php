<?php

class Application_Model_DbTable_Dossiercm extends Zend_Db_Table_Abstract
{

    protected $_name = 'dossiercm';

    public function getAll(){
        $select=$this->select();
        return $this->fetchAll($select);    
    }

    public function getAllV(){
    	$req = "SELECT * FROM v_dossiercm ORDER BY idDossierCM DESC";
    	$stmt = $this->_db->query($req);
    	return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getV($id){
    	$req = $this->_db->prepare('SELECT * FROM v_dossiercm WHERE idDossierCM = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

     public function ajouter($idType,$idStructure,$idAgent,$numeroSGGCM,$objetDossierCM,$dateCM,$refDossierCM,$dateSignature,
     $syntheseDossierCM,$decisionCM,$observationCM,$refTexteAdopte) {
        $data=array(
        'idType'=> $idType,
        'idStructure'=> $idStructure,
        'idAgent'=> $idAgent,
        'numeroSGGCM' => $numeroSGGCM,
        'objetDossierCM'=>$objetDossierCM,
        'dateCM'=>$dateCM,
        'refDossierCM' => $refDossierCM,
        'dateSignature'=>$dateSignature,
        'syntheseDossierCM'=>$syntheseDossierCM,
        'decisionCM'=>$decisionCM,
        'observationCM'=>$observationCM,
        'refTexteAdopte'=>$refTexteAdopte 
        );
        $this->insert($data);
    }

    public function get($id){
        $select = $this->_db->select();
        $select = $this->select()->where('idDossierCM = ?', $id);
        $stmt = $this->_db->query($select);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function modifier($idDossierCM,$idType,$idStructure,$idAgent,$numeroSGGCM,$objetDossierCM,$dateCM,$refDossierCM,$dateSignature,
     $syntheseDossierCM,$decisionCM,$observationCM,$refTexteAdopte) {
        $data = array(
        'idType'=> $idType,
        'idStructure'=> $idStructure,
        'idAgent'=> $idAgent,
        'numeroSGGCM' => $numeroSGGCM,
        'objetDossierCM'=>$objetDossierCM,
        'dateCM'=>$dateCM,
        'refDossierCM' => $refDossierCM,
        'dateSignature'=>$dateSignature,
        'syntheseDossierCM'=>$syntheseDossierCM,
        'decisionCM'=>$decisionCM,
        'observationCM'=>$observationCM,
        'refTexteAdopte'=>$refTexteAdopte
        );
        $this->update($data, 'idDossierCM = '. (int)$idDossierCM);
    }

    public function supprimer($id){
         $this->delete('idDossierCM =' . (int)$id);
    }
}

