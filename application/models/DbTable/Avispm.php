<?php

class Application_Model_DbTable_Avispm extends Zend_Db_Table_Abstract
{

    protected $_name = 'avispm';

    public function getAll(){
        $select=$this->select();
        return $this->fetchAll($select);    
    }

    public function getAllV(){
    	$req = "SELECT * FROM v_avis ORDER BY dateCorrespAvis ASC";
    	$stmt = $this->_db->query($req);
    	return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getV($id){
    	$req = $this->_db->prepare('SELECT * FROM v_avis WHERE idAvisPM = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getAvisDossier($id){
    	$req = $this->_db->prepare('SELECT * FROM v_avis WHERE idDossierO = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

     public function ajouter($iddossier,$avis,$dateavis,$ref,$date) {
        $data=array(
        'idDossierO'=>$iddossier,
        'avisPM'=> $avis,
        'dateAvisPM'=> $dateavis,
        'refCorrespondance' => $ref,
        'dateCorrespondance'=>$date
        );
        $this->insert($data);
    }

    public function get($id){
        $select = $this->_db->select();
        $select = $this->select()->where('idAvisPM = ?', $id);
        $stmt = $this->_db->query($select);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function modifier($id,$iddossier,$avis,$dateavis,$ref,$date) {
        $data = array(
        'idDossierO'=>$iddossier,
        'avisPM'=> $avis,
        'dateAvisPM'=> $dateavis,
        'refCorrespondance' => $ref,
        'dateCorrespondance'=>$date
        );
        $this->update($data, 'idAvisPM = '. (int)$id);
    }

    public function supprimer($id){
         $this->delete('idAvisPM =' . (int)$id);
    }
}

