<?php

class ReactionController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $tabReact = new Application_Model_DbTable_Reaction;
        $this->view->listeReact = $tabReact->getAllV();

    }

    public function ajouterAction()
    {
        $tabStr = new Application_Model_DbTable_Structure;
        $this->view->listeStr = $tabStr->getAll();
        if ($this->getRequest()->isPost()) {
             
            $idins = $this->getRequest()->getPost('idins');
            $reaction = $this->getRequest()->getPost('reaction');
            $observation = $this->getRequest()->getPost('observation');
            $refcoresp = $this->getRequest()->getPost('refcoresp');
            $datecoresp = $this->getRequest()->getPost('datecoresp');
            if(isset($idins) && !empty($idins) && isset($reaction) &&
                !empty($reaction) && isset($observation) && isset($refcoresp) && !empty($refcoresp) && isset($datecoresp) && 
                !empty($datecoresp)) {
                    
                try{
                    $tabReact = new Application_Model_DbTable_Reaction;
                    $tabReact->ajouter($idins,$reaction,$observation,$refcoresp,$datecoresp);
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
        $this->view->id = $this->getParam('id', 0);
        $this->view->idstr = $this->getParam('idstr', 0);
        $this->view->iddossier = $this->getParam('iddossier', 0);

        $tabStr = new Application_Model_DbTable_Structure;
        $tabDossier = new Application_Model_DbTable_Dossierordinaire;
        $tabIns = new Application_Model_DbTable_instruction;
        $tabReact = new Application_Model_DbTable_reaction;
        
        $this->view->listeStr = $tabStr->getAll();
        $this->view->listedossier = $tabDossier->getStrDossier($this->view->idstr);
        $this->view->listeIns = $tabIns->getInsDossier($this->view->iddossier);
        $this->view->reaction = $tabReact->getV($this->view->id);

        if ($this->getRequest()->isPost()) {
            $id = $this->getRequest()->getPost('id'); 
            $idins = $this->getRequest()->getPost('idins');
            $reaction = $this->getRequest()->getPost('reaction');
            $observation = $this->getRequest()->getPost('observation');
            $refcoresp = $this->getRequest()->getPost('refcoresp');
            $datecoresp = $this->getRequest()->getPost('datecoresp');
            if(isset($id) && !empty($id) && isset($idins) && !empty($idins) && isset($reaction) &&
                !empty($reaction) && isset($observation) && isset($refcoresp) && !empty($refcoresp) && isset($datecoresp) && 
                !empty($datecoresp)) {
                    
                try{
                    $tabReact = new Application_Model_DbTable_Reaction;
                    $tabReact->modifier($id,$idins,$reaction,$observation,$refcoresp,$datecoresp);
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
                    $tabReact = new Application_Model_DbTable_Reaction;
                    $tabReact->supprimer($id);
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

    public function loadinstructionAction()
    {
        $this->_helper->layout->disableLayout();
        if ($this->getRequest()->isPost()) {
            $iddossier = $this->getRequest()->getPost('iddossier');
            $tabIns = new Application_Model_DbTable_instruction;
            $this->view->listeIns = $tabIns->getInsDossier($iddossier);
        }
    }


}











