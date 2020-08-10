<?php

class Application_Model_DbTable_Dossiercc extends Zend_Db_Table_Abstract
{

    protected $_name = 'dossiercc';
    
    public function getAll(){
        $select=$this->select();
        return $this->fetchAll($select);    
    }

    public function getAllV(){
    	$req = "SELECT * FROM v_dossiercc ORDER BY idDossierCC DESC";
    	$stmt = $this->_db->query($req);
    	return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getV($id){
    	$req = $this->_db->prepare('SELECT * FROM v_dossiercc WHERE idDossierCC = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

     public function ajouter($idType, $objetDossierCC,$refLettreConvocation,$refRapport,$dateCC, 
     $syntheseDossierCC,$orientationCC,	$echeanceMiseOeuvre,$observationCC) {
        $data=array(
        'idType'=> $idType,
        'objetDossierCC' => $objetDossierCC,
        'refLettreConvocation'=>$refLettreConvocation,
        'refRapport'=>$refRapport,
        'dateCC' => $dateCC,
        'syntheseDossierCC'=>$syntheseDossierCC,
        'orientationCC'=>$orientationCC,
        'echeanceMiseOeuvre'=>$echeanceMiseOeuvre,
        'observationCC'=>$observationCC
        );
        $this->insert($data);
    }

    public function get($id){
        $select = $this->_db->select();
        $select = $this->select()->where('idDossierCC = ?', $id);
        $stmt = $this->_db->query($select);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function modifier($idDossierCC,$idType, $objetDossierCC,	$refLettreConvocation,	$refRapport,	$dateCC,	
    $syntheseDossierCC,	$orientationCC,	$echeanceMiseOeuvre,	$observationCC) {
        $data = array(
            'idType'=> $idType,
            'objetDossierCC' => $objetDossierCC,
            'refLettreConvocation'=>$refLettreConvocation,
            'refRapport'=>$refRapport,
            'dateCC' => $dateCC,
            'syntheseDossierCC'=>$syntheseDossierCC,
            'orientationCC'=>$orientationCC,
            'echeanceMiseOeuvre'=>$echeanceMiseOeuvre,
            'observationCC'=>$observationCC
        );
        $this->update($data, 'idDossierCC = '. (int)$idDossierCC);
    }

    public function supprimer($id){
         $this->delete('idDossierCC =' . (int)$id);
    }

}

