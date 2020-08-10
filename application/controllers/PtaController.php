<?php

class PtaController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $tabDossier = new Application_Model_DbTable_Pta;
        $this->view->listeDossier = $tabDossier->getAllV();
         
    }

    public function ajouterAction()
    {
        $taban = new Application_Model_DbTable_Annee();
        $this->view->listean = $taban->getAll();

        if ($this->getRequest()->isPost()) {
            $idAnnee = $this->getRequest()->getPost('idAnnee');
            $libPTA = $this->getRequest()->getPost('libPTA');
            $dateTransmission = $this->getRequest()->getPost('dateTransmission');
            $refCorrespondance = $this->getRequest()->getPost('refCorrespondance');
            
            if(isset($libPTA) && !empty($libPTA) && isset($dateTransmission) && !empty($dateTransmission) 
             && isset($refCorrespondance) && !empty($refCorrespondance && isset($idAnnee) && !empty($idAnnee))) {
                    
                try{
                    $tabDossier = new Application_Model_DbTable_Pta;
                    $tabDossier->ajouter($idAnnee,$libPTA,$dateTransmission,$refCorrespondance);
                    $this->view->etat = 1;
                    
                }
                catch(Exception $e){
                    $this->view->etat = -1; 
                   // $this->view->essai = "ok";
                    $this->view->erreur = $e->getMessage();  
                }
            }
        } 
    }

    public function modifierAction()
    {
        $taban = new Application_Model_DbTable_Annee();
        $this->view->listean = $taban->getAll();

        $tabDossier = new Application_Model_DbTable_Pta();
        $this->view->id = $this->getParam('id', 0);
        $this->view->dossier = $tabDossier->getV($this->view->id);

        if ($this->getRequest()->isPost()) {
            $idPTA = $this->getRequest()->getPost('idPTA');
            $idAnnee = $this->getRequest()->getPost('idAnnee');
            $libPTA = $this->getRequest()->getPost('libPTA');
            $dateTransmission = $this->getRequest()->getPost('dateTransmission');
            $refCorrespondance = $this->getRequest()->getPost('refCorrespondance');
            
            if(isset($idPTA) && !empty($idPTA) && isset($libPTA) && !empty($libPTA) && isset($dateTransmission) && !empty($dateTransmission) 
             && isset($refCorrespondance) && !empty($refCorrespondance && isset($idAnnee) && !empty($idAnnee))) {
                    
                try{
                    $tabDossier = new Application_Model_DbTable_Pta;
                    $tabDossier->modifier($idPTA,$idAnnee,$libPTA,$dateTransmission,$refCorrespondance);

                    $tabDossier = new Application_Model_DbTable_Pta();
                    $this->view->id = $this->getParam('id', 0);
                    $this->view->dossier = $tabDossier->getV($this->view->id);
                    $this->view->etat = 1;
                    
                }
                catch(Exception $e){
                    $this->view->etat = -1; 
                   // $this->view->essai = "ok";
                    $this->view->erreur = $e->getMessage();  
                }
            }
        } 
    }

    public function supprimerAction()
    {
        // action body
    }


}







