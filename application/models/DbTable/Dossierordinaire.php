<?php

class Application_Model_DbTable_Dossierordinaire extends Zend_Db_Table_Abstract
{

    protected $_name = 'dossierordinaire';

    public function getAll(){
        $select=$this->select();
        return $this->fetchAll($select);    
    }

    public function getAllV(){
    	$req = "SELECT * FROM v_dossierordinaire ORDER BY dateCorrespondance ASC";
    	$stmt = $this->_db->query($req);
    	return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getV($id){
    	$req = $this->_db->prepare('SELECT * FROM v_dossierordinaire WHERE idDossierO = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getStrDossier($id){
    	$req = $this->_db->prepare('SELECT * FROM v_dossierordinaire WHERE idStructure = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

     public function ajouter($str,$statut,$objet,$ref,$date,$synthese,$observation) {
        $data=array(
        'idStructure'=>$str,
        'idStatut'=> $statut,
        'objetDossierO'=> $objet,
        'refCorrespondance' => $ref,
        'dateCorrespondance'=>$date,
        'syntheseDossierO'=>$synthese,
        'observationDossierO' => $observation
        );
        $this->insert($data);
    }

    public function get($id){
        $select = $this->_db->select();
        $select = $this->select()->where('idDossierO = ?', $id);
        $stmt = $this->_db->query($select);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function modifier($id,$str,$statut,$objet,$ref,$date,$synthese,$observation) {
        $data = array(
            'idStructure'=>$str,
            'idStatut'=> $statut,
            'objetDossierO'=> $objet,
            'refCorrespondance' => $ref,
            'dateCorrespondance'=>$date,
            'syntheseDossierO'=>$synthese,
            'observationDossierO' => $observation
        );
        $this->update($data, 'idDossierO = '. (int)$id);
    }

    public function supprimer($id){
         $this->delete('idDossierO =' . (int)$id);
    }

}

