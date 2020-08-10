<?php

class InstructionController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $tabIns = new Application_Model_DbTable_instruction;
        $this->view->listeInstruction = $tabIns->getAllV();
    }

    public function ajouterAction()
    {
        $tabStr = new Application_Model_DbTable_Structure;
        $this->view->listeStr = $tabStr->getAll();

        if ($this->getRequest()->isPost()) {
             
            $iddossier = $this->getRequest()->getPost('iddossier');
            $instruction = $this->getRequest()->getPost('instruction');
            $dateins = $this->getRequest()->getPost('dateins');
            $echeance = $this->getRequest()->getPost('echeance');
            $refcoresp = $this->getRequest()->getPost('refcoresp');
            $datecoresp = $this->getRequest()->getPost('datecoresp');
            if(isset($iddossier) && !empty($iddossier) && isset($instruction) && !empty($instruction) && isset($dateins) &&
                !empty($dateins) && isset($echeance) && isset($refcoresp) && !empty($refcoresp) && isset($datecoresp) && 
                !empty($datecoresp)) {
                    
                try{
                    $tabInstruction = new Application_Model_DbTable_Instruction;
                    $tabInstruction->ajouter($iddossier,$instruction,$dateins,$echeance,$refcoresp,$datecoresp);
                    $this->view->etat = 1;
                    
                }
                catch(Exception $e){
                    $this->view->etat = -1;
                    $this->view->erreur = $e->getMessage();  
                }
            }
        } 
    }

    public function modifierAction()
    {
        $tabStr = new Application_Model_DbTable_Structure;
        $tabDossier = new Application_Model_DbTable_Dossierordinaire;
        $tabIns = new Application_Model_DbTable_Instruction;
        $this->view->id = $this->getParam('id', 0);
        $this->view->idstr = $this->getParam('idstr', 0);
        $this->view->listeStr = $tabStr->getAll();
        $this->view->dossier = $tabDossier->getStrDossier($this->view->idstr);
        $this->view->id = $this->getParam('id', 0);
        $this->view->instruction = $tabIns->getV($this->view->id);

        if ($this->getRequest()->isPost()) {
            $id = $this->getRequest()->getPost('id'); 
            $iddossier = $this->getRequest()->getPost('iddossier');
            $instruction = $this->getRequest()->getPost('instruction');
            $dateins = $this->getRequest()->getPost('dateins');
            $echeance = $this->getRequest()->getPost('echeance');
            $refcoresp = $this->getRequest()->getPost('refcoresp');
            $datecoresp = $this->getRequest()->getPost('datecoresp');
            if(isset($id) && !empty($id) && isset($iddossier) && !empty($iddossier) && isset($instruction) && !empty($instruction) && isset($dateins) &&
                !empty($dateins) && isset($echeance) && isset($refcoresp) && !empty($refcoresp) && isset($datecoresp) && 
                !empty($datecoresp)) {
                    
                try{
                    $tabInstruction = new Application_Model_DbTable_Instruction;
                    $tabInstruction->modifier($id,$iddossier,$instruction,$dateins,$echeance,$refcoresp,$datecoresp);
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
        $this->view->id = $this->getParam('id', 0);
        if ($this->getRequest()->isPost()) {
            $id = $this->getRequest()->getPost('id');
            if(isset($id) && !empty($id)) {
                   
                try{
                    $tabInstruction = new Application_Model_DbTable_Instruction;
                    $tabInstruction->supprimer($id);
                    $this->view->etat = 1;
                    
                    
                }
                catch(Exception $e){
                    $this->view->etat = -1; 
                    $this->view->erreur = $e->getMessage();  
                }
            }
            $this->_helper->redirector('index');
        }
    }

    public function loaddossierAction()
    {
        $this->_helper->layout->disableLayout();
        if ($this->getRequest()->isPost()) {
            $idstr = $this->getRequest()->getPost('idstr');
            $tabDossier = new Application_Model_DbTable_dossierordinaire;
            $this->view->listeDostr = $tabDossier->getStrDossier($idstr);
        }
        
    }

    public function chargerdossierAction()
    {
        // action body
    }


}











