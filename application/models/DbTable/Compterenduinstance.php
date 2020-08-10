<?php

class Application_Model_DbTable_Compterenduinstance extends Zend_Db_Table_Abstract
{

    protected $_name = 'compterenduinstance';
    public function getAll()
    {
        $select=$this->select();
        return $this->fetchAll($select);    
    }

    public function getAllV(){
    	$req = "SELECT * FROM v_instance_cr_structure";
    	$stmt = $this->_db->query($req);
    	return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }

    public function getV($id){
    	$req = $this->_db->prepare('SELECT * FROM v_instance_cr_structure WHERE idCR = ? ');
   		$req ->execute(array((int)$id));
    	return $req->fetchAll(Zend_Db::FETCH_OBJ);
    }

     public function ajouter($idInstance,$objetCR,$difficulte,$decision,$perspective,$dateDebut,$dateFin) {
        $data=array(
        'idInstance'=> $idInstance,
        'objetCR' => $objetCR,
        'difficulte'=>$difficulte,
        'decision'=>$decision,
        'perspective'=>$perspective,
        'dateDebut'=>$dateDebut,
        'dateFin'=>$dateFin
        );
        $this->insert($data);
    }

    public function get($id){
        $select = $this->_db->select();
        $select = $this->select()->where('idCR = ?', $id);
        $stmt = $this->_db->query($select);
        return $stmt->fetchAll(Zend_Db::FETCH_OBJ);
    }
    
    public function modifier($idCR,$idInstance,$objetCR,$difficulte,$decision,$perspective,$dateDebut,$dateFin) {
        $data = array(
            'idInstance'=> $idInstance,
            'objetCR' => $objetCR,
            'difficulte'=>$difficulte,
            'decision'=>$decision,
            'perspective' => $perspective,
            'dateDebut'=>$dateDebut,
            'dateFin'=>$dateFin
        );
        $this->update($data, 'idCR = '. (int)$idCR);
    }

    public function supprimer($id){
         $this->delete('idCR =' . (int)$id);
    }

}

