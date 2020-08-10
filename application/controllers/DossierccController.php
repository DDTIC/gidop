<?php

class DossierccController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $tabDossier = new Application_Model_DbTable_dossiercc;
        $this->view->listeDossier = $tabDossier->getAllV();
    }

    public function ajouterAction()
    {
        $tabtdc = new Application_Model_DbTable_Typedossierconseil;
        $this->view->listetdc = $tabtdc->getAll();

        if ($this->getRequest()->isPost()) {    
            $idType = $this->getRequest()->getPost('idType');
            $objetDossierCC = $this->getRequest()->getPost('objetDossierCC');
            $refLettreConvocation = $this->getRequest()->getPost('refLettreConvocation');
            $refRapport = $this->getRequest()->getPost('refRapport');
            $dateCC = $this->getRequest()->getPost('dateCC');
            $syntheseDossierCC = $this->getRequest()->getPost('syntheseDossierCC');
            $orientationCC = $this->getRequest()->getPost('orientationCC');
            $echeanceMiseOeuvre = $this->getRequest()->getPost('echeanceMiseOeuvre');
            $observationCC = $this->getRequest()->getPost('observationCC');
            if(isset($idType) && !empty($idType) && isset($objetDossierCC) && !empty($objetDossierCC) && 
            isset($refLettreConvocation) && !empty($refLettreConvocation) && isset($refRapport) && !empty($refRapport)
             && isset($dateCC) && !empty($dateCC) && isset($syntheseDossierCC) && !empty($syntheseDossierCC) &&
              isset($orientationCC) && !empty($orientationCC) && isset($echeanceMiseOeuvre) && !empty($echeanceMiseOeuvre) 
                ) {
                    
                try{
                    $tabDossier = new Application_Model_DbTable_Dossiercc;
                    $tabDossier->ajouter($idType,$objetDossierCC,$refLettreConvocation,$refRapport,$dateCC,	
                    $syntheseDossierCC,	$orientationCC,	$echeanceMiseOeuvre,$observationCC);
                    $this->view->etat = 1;
                    
                }
                catch(Exception $e){
                   echo $e;
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

        $tabDossier = new Application_Model_DbTable_Dossiercc;
        $this->view->id = $this->getParam('id', 0);
        $this->view->dossier = $tabDossier->getV($this->view->id);

        if ($this->getRequest()->isPost()) {    
            $idDossierCC = $this->getRequest()->getPost('idDossierCC'); 
            $idType = $this->getRequest()->getPost('idType');
            $objetDossierCC = $this->getRequest()->getPost('objetDossierCC');
            $refLettreConvocation = $this->getRequest()->getPost('refLettreConvocation');
            $refRapport = $this->getRequest()->getPost('refRapport');
            $dateCC = $this->getRequest()->getPost('dateCC');
            $syntheseDossierCC = $this->getRequest()->getPost('syntheseDossierCC');
            $orientationCC = $this->getRequest()->getPost('orientationCC');
            $echeanceMiseOeuvre = $this->getRequest()->getPost('echeanceMiseOeuvre');
            $observationCC = $this->getRequest()->getPost('observationCC');
            if(isset($idDossierCC) && !empty($idDossierCC) && 
                isset($idType) && !empty($idType) && isset($objetDossierCC) && !empty($objetDossierCC) && 
            isset($refLettreConvocation) && !empty($refLettreConvocation) && isset($refRapport) && !empty($refRapport)
             && isset($dateCC) && !empty($dateCC) && isset($syntheseDossierCC) && !empty($syntheseDossierCC) &&
              isset($orientationCC) && !empty($orientationCC) && isset($echeanceMiseOeuvre) && !empty($echeanceMiseOeuvre) 
                ) {
                    
                try{
                    $tabDossier = new Application_Model_DbTable_Dossiercc;
                    $tabDossier->modifier($idDossierCC,$idType,$objetDossierCC,$refLettreConvocation,$refRapport,$dateCC,	
                    $syntheseDossierCC,	$orientationCC,	$echeanceMiseOeuvre,$observationCC);

                    $tabDossier = new Application_Model_DbTable_Dossiercc;
                    $this->view->id = $this->getParam('id', 0);
                    $this->view->dossier = $tabDossier->getV($this->view->id);
                    $this->view->etat = 1;
                    
                }
                catch(Exception $e){
                   echo $e;
                    $this->view->etat = -1; 
                   //$this->view->essai = "ok";
                    $this->view->erreur = $e->getMessage();  
                }
            }
        } 
    }

    public function supprimerAction()
    {
        $tabDossier = new Application_Model_DbTable_Dossiercc;
        $this->view->id = $this->getParam('id', 0);
        $this->view->dossier = $tabDossier->get($this->view->id);
        if ($this->getRequest()->isPost()) {
            $id = $this->getRequest()->getPost('id');
            if(isset($id) && !empty($id)) {
                   
                try{
                    $tabDossier = new Application_Model_DbTable_Dossiercc;
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







