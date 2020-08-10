<?php

class DossiercmController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
    $tabDossier = new Application_Model_DbTable_dossiercm;
    $this->view->listeDossier = $tabDossier->getAllV();
    }

    public function ajouterAction()
    {
                $tabtdc = new Application_Model_DbTable_Typedossierconseil;
        $this->view->listetdc = $tabtdc->getAll();

        $tabag = new Application_Model_DbTable_Agent();
        $this->view->listeag = $tabag->getAgentOrdonne();

        $tabstr = new Application_Model_DbTable_Structure();
        $this->view->listeStr = $tabstr->getAll();

        if ($this->getRequest()->isPost()) {    
            $idType = $this->getRequest()->getPost('idType');
            $idStructure = $this->getRequest()->getPost('idStructure');
            $idAgent = $this->getRequest()->getPost('idAgent');
            $numeroSGGCM = $this->getRequest()->getPost('numeroSGGCM');
            $dateCM = $this->getRequest()->getPost('dateCM');
            $objetDossierCM = $this->getRequest()->getPost('objetDossierCM');
            $refDossierCM = $this->getRequest()->getPost('refDossierCM');
            $refTexteAdopte = $this->getRequest()->getPost('refTexteAdopte');
            $dateSignature = $this->getRequest()->getPost('dateSignature');
            $decisionCM = $this->getRequest()->getPost('decisionCM');
            $syntheseDossierCM = $this->getRequest()->getPost('syntheseDossierCM');
            $observationCM = $this->getRequest()->getPost('observationCM');
            if(isset($idType) && !empty($idType) && isset($idStructure) && !empty($idStructure) && 
            isset($idAgent) && !empty($idAgent) && isset($numeroSGGCM) && !empty($numeroSGGCM) && isset($dateCM) &&
                !empty($dateCM) && isset($objetDossierCM) && !empty($objetDossierCM) && isset($refDossierCM) 
                && !empty($refDossierCM) && isset($refTexteAdopte) && !empty($refTexteAdopte) && isset($dateSignature)
                && !empty($dateSignature) && isset($decisionCM) && !empty($decisionCM) && isset($syntheseDossierCM)
                && !empty($syntheseDossierCM) && isset($observationCM)
                ) {
                    
                try{
                    $tabDossier = new Application_Model_DbTable_Dossiercm;
                    $tabDossier->ajouter($idType,$idStructure,$idAgent,$numeroSGGCM,$objetDossierCM,$dateCM,$refDossierCM,$dateSignature,$syntheseDossierCM,$decisionCM,$observationCM,$refTexteAdopte);
                    $this->view->etat = 1;
                    
                }
                catch(Exception $e){
                   // echo $e;
                    $this->view->etat = -1; 
                   //$this->view->essai = "ok";
                    $this->view->erreur = $e->getMessage();  
                }
            }
        } 
    }

    public function modifierAction()
    {                   
        $tabtdc = new Application_Model_DbTable_Typedossierconseil;
        $this->view->listetdc = $tabtdc->getAll();
        
        $tabag = new Application_Model_DbTable_Agent();
        $this->view->listeag = $tabag->getAgentOrdonne();

        $tabstr = new Application_Model_DbTable_Structure();
        $this->view->listeStr = $tabstr->getAll();

        $tabDossier = new Application_Model_DbTable_Dossiercm;
        $this->view->id = $this->getParam('id', 0);
        $this->view->dossier = $tabDossier->getV($this->view->id);

        if ($this->getRequest()->isPost()) {   
            $idDossierCM = $this->getRequest()->getPost('idDossierCM'); 
            $idType = $this->getRequest()->getPost('idType');
            $idStructure = $this->getRequest()->getPost('idStructure');
            $idAgent = $this->getRequest()->getPost('idAgent');
            $numeroSGGCM = $this->getRequest()->getPost('numeroSGGCM');
            $dateCM = $this->getRequest()->getPost('dateCM');
            $objetDossierCM = $this->getRequest()->getPost('objetDossierCM');
            $refDossierCM = $this->getRequest()->getPost('refDossierCM');
            $refTexteAdopte = $this->getRequest()->getPost('refTexteAdopte');
            $dateSignature = $this->getRequest()->getPost('dateSignature');
            $decisionCM = $this->getRequest()->getPost('decisionCM');
            $syntheseDossierCM = $this->getRequest()->getPost('syntheseDossierCM');
            $observationCM = $this->getRequest()->getPost('observationCM');
            if(isset($idType) && !empty($idType) && isset($idStructure) && !empty($idStructure) && 
            isset($idAgent) && !empty($idAgent) && isset($numeroSGGCM) && !empty($numeroSGGCM) && isset($dateCM) &&
                !empty($dateCM) && isset($objetDossierCM) && !empty($objetDossierCM) && isset($refDossierCM) 
                && !empty($refDossierCM) && isset($refTexteAdopte) && !empty($refTexteAdopte) && isset($dateSignature)
                && !empty($dateSignature) && isset($decisionCM) && !empty($decisionCM) && isset($syntheseDossierCM)
                && !empty($syntheseDossierCM) && isset($observationCM)
                ) {
                   
                try{
                    $tabDossier = new Application_Model_DbTable_Dossiercm;
                    $tabDossier->modifier($idDossierCM,$idType,$idStructure,$idAgent,$numeroSGGCM,$objetDossierCM,$dateCM,$refDossierCM,$dateSignature,
                    $syntheseDossierCM,$decisionCM,$observationCM,$refTexteAdopte);

                    $tabDossier = new Application_Model_DbTable_Dossiercm;
                    $this->view->id = $this->getParam('id', 0);
                    $this->view->dossier = $tabDossier->getV($this->view->id);
                    $this->view->etat = 1;
                    
                }
                catch(Exception $e){
                    $this->view->etat = -1; 
                    $this->view->erreur = $e->getMessage();  
                }
            }
        }

    }

    public function supprimerAction()
    {
        $tabDossier = new Application_Model_DbTable_Dossiercm;
        $this->view->id = $this->getParam('id', 0);
        $this->view->dossier = $tabDossier->get($this->view->id);
        if ($this->getRequest()->isPost()) {
            $id = $this->getRequest()->getPost('id');
            if(isset($id) && !empty($id)) {
                   
                try{
                    $tabDossier = new Application_Model_DbTable_Dossiercm;
                    $tabDossier->supprimer($id);
                    $this->view->etat = 1;
                    
                    
                }
                catch(Exception $e){
                    $this->view->etat = -1; 
                    //$this->view->erreur = $e->getMessage();  
                }
            }
            $this->_helper->redirector('index');
        }
    }


}







