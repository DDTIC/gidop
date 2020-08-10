<?php

class Application_Model_DbTable_Agentimpliquedo extends Zend_Db_Table_Abstract
{

    protected $_name = 'agentimpliquedo';

    public function getAll(){
        $select=$this->select();
        return $this->fetchAll($select);    
    }

    public function getAllV(){
    	$req = "SELECT * FROM v_agent ORDER BY nomAgent,prenomAgent DESC";
    	$stmt = $this->_db->query($req);
    	return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function get($idagent, $iddossier){
    	$req = $this->_db->prepare('SELECT * FROM v_agentimpliquedo WHERE idAgent = ? AND idDossierO = ? ');
   		$req ->execute(array((int)$idagent,(int)$iddossier));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getM($iddossier){
    	$req = $this->_db->prepare('SELECT * FROM v_agentimpliquedo WHERE idAgent = ? AND idDossierO = ? ');
   		$req ->execute(array((int)$idagent,(int)$iddossier));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }



    public function getAgentDossier($id){
    	$req = $this->_db->prepare('SELECT * FROM v_agentimpliquedo WHERE idDossierO = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

     public function ajouter($idagent,$iddossier,$role) {
        $data=array(
        'idAgent'=>$idagent,
        'idDossierO'=> $iddossier,
        'RoleAgent'=> $role
        );
        $this->insert($data);
    }

    public function modifier($idagent,$iddossier,$role){
        $req = $this->_db->prepare('UPDATE agentimpliquedo SET roleAgent=? WHERE idAgent = ? AND idDossierO = ? ');
        $req ->execute(array($role,(int)$idagent,(int)$iddossier));
    }

    
}

