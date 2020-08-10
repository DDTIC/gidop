<?php

class Application_Model_DbTable_Reaction extends Zend_Db_Table_Abstract
{

    protected $_name = 'reaction';

    public function getAll(){
        $select=$this->select();
        return $this->fetchAll($select);    
    }

    public function getAllV(){
    	$req = "SELECT * FROM v_reaction ORDER BY dateCorrespReaction ASC";
    	$stmt = $this->_db->query($req);
    	return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getV($id){
    	$req = $this->_db->prepare('SELECT * FROM v_reaction WHERE idReaction = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getReactIns($id){
    	$req = $this->_db->prepare('SELECT * FROM v_reaction WHERE idInstruction = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

     public function ajouter($idins,$reaction,$observation,$ref,$date) {
        $data=array(
        'idInstruction'=>$idins,
        'suiteDonnee'=> $reaction,
        'observation'=> $observation,
        'refCorrespondance' => $ref,
        'dateCorrespondance'=>$date
        );
        $this->insert($data);
    }

    public function get($id){
        $select = $this->_db->select();
        $select = $this->select()->where('idReaction = ?', $id);
        $stmt = $this->_db->query($select);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function modifier($id,$idins,$reaction,$observation,$ref,$date) {
        $data = array(
            'idInstruction'=>$idins,
            'suiteDonnee'=> $reaction,
            'observation'=> $observation,
            'refCorrespondance' => $ref,
            'dateCorrespondance'=>$date
        );
        $this->update($data, 'idReaction = '. (int)$id);
    }

    public function supprimer($id){
         $this->delete('idReaction =' . (int)$id);
    }
}

