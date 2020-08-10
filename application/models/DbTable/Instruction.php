<?php

class Application_Model_DbTable_Instruction extends Zend_Db_Table_Abstract
{

    protected $_name = 'instruction';

    public function getAll(){
        $select=$this->select();
        return $this->fetchAll($select);    
    }

    public function getAllV(){
    	$req = "SELECT * FROM v_instruction ORDER BY dateCorespInstruction ASC";
    	$stmt = $this->_db->query($req);
    	return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getV($id){
    	$req = $this->_db->prepare('SELECT * FROM v_instruction WHERE idInstruction = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getInsDossier($id){
    	$req = $this->_db->prepare('SELECT * FROM v_instruction WHERE idDossierO = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

     public function ajouter($idDossier,$instruction,$dateInstruction,$delaiReaction,$refCorrespondance,$dateCorrespondance) {
        $data=array(
        'idDossierO'=>$idDossier,
        'instruction'=> $instruction,
        'dateInstruction'=> $dateInstruction,
        'delaiReaction' => $delaiReaction,
        'refCorrespondance'=>$refCorrespondance,
        'dateCorrespondance'=>$dateCorrespondance
        );
        $this->insert($data);
    }

    public function get($id){
        $select = $this->_db->select();
        $select = $this->select()->where('idInstruction = ?', $id);
        $stmt = $this->_db->query($select);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function modifier($id,$idDossier,$instruction,$dateInstruction,$delaiReaction,$refCorrespondance,$dateCorrespondance) {
        $data = array(
            'idDossierO'=>$idDossier,
            'instruction'=> $instruction,
            'dateInstruction'=> $dateInstruction,
            'delaiReaction' => $delaiReaction,
            'refCorrespondance'=>$refCorrespondance,
            'dateCorrespondance'=>$dateCorrespondance
        );
        $this->update($data, 'idInstruction = '. (int)$id);
    }

    public function supprimer($id){
         $this->delete('idInstruction =' . (int)$id);
    }
}

