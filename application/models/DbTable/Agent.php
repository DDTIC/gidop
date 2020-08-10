<?php

class Application_Model_DbTable_Agent extends Zend_Db_Table_Abstract
{

    protected $_name = 'agent';
    
    public function getAll(){
        $select=$this->select();
        return $this->fetchAll($select);    
    }

    public function getAllV(){
    	$req = "SELECT * FROM v_agent ORDER BY nomAgent,prenomAgent DESC";
    	$stmt = $this->_db->query($req);
    	return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getV($id){
    	$req = $this->_db->prepare('SELECT * FROM v_agent WHERE idAgent = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function getAgentOrdonne (){
        $req="SELECT * FROM agent order by nomAgent asc";
        $stmt = $this->_db->query($req);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }

     public function ajouter($idDepartement,$idfonction,$matriculeAgent,$nomAgent,$prenomAgent,$telAgent,$emailAgent,$Sexe) {
        $data=array(
        'idDepartement'=>$idDepartement,
        'idfonction'=> $idfonction,
        'matriculeAgent'=> $matriculeAgent,
        'nomAgent' => $nomAgent,
        'prenomAgent'=>$prenomAgent,
        'telAgent'=>$telAgent,
        'emailAgent'=>$emailAgent,
        'Sexe'=>$Sexe
        );
        $this->insert($data);
    }

    public function get($id){
        $select = $this->_db->select();
        $select = $this->select()->where('idAgent = ?', $id);
        $stmt = $this->_db->query($select);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function modifier($id,$idDepartement,$idfonction,$matriculeAgent,$nomAgent,$prenomAgent,$telAgent,$emailAgent,$Sexe) {
        $data = array(
        'idDepartement'=>$idDepartement,
        'idfonction'=> $idfonction,
        'matriculeAgent'=> $matriculeAgent,
        'nomAgent' => $nomAgent,
        'prenomAgent'=>$prenomAgent,
        'telAgent'=>$telAgent,
        'emailAgent'=>$emailAgent,
        'Sexe'=>$Sexe
        );
        $this->update($data, 'idAgent = '. (int)$id);
    }

    public function supprimer($id){
         $this->delete('idAgent =' . (int)$id);
    }

}

