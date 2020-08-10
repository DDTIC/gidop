<?php

class AvisController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $tabAvis = new Application_Model_DbTable_Avispm;
        $this->view->listeAvis = $tabAvis->getAllV();
    }

    public function ajouterAction()
    {
        $tabStr = new Application_Model_DbTable_Structure;
        $this->view->listeStr = $tabStr->getAll();

        if ($this->getRequest()->isPost()) {
             
            $iddossier = $this->getRequest()->getPost('iddossier');
            $avis = $this->getRequest()->getPost('avis');
            $dateavis = $this->getRequest()->getPost('dateavis');
            $refcoresp = $this->getRequest()->getPost('refcoresp');
            $datecoresp = $this->getRequest()->getPost('datecoresp');
            
            if(isset($iddossier) && !empty($iddossier) && isset($avis) && !empty($avis) && isset($dateavis) && !empty($dateavis) &&
                isset($refcoresp) && !empty($refcoresp) && isset($datecoresp) && !empty($datecoresp)) {
                    
                try{
                    $tabAvis = new Application_Model_DbTable_Avispm;
                    $tabAvis->ajouter($iddossier,$avis,$dateavis,$refcoresp,$datecoresp);
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
        $tabAvis = new Application_Model_DbTable_Avispm;
        $this->view->id = $this->getParam('id', 0);
        $this->view->idstr = $this->getParam('idstr', 0);
        $this->view->listeStr = $tabStr->getAll();
        $this->view->dossier = $tabDossier->getStrDossier($this->view->idstr);
        $this->view->avis = $tabAvis->getV($this->view->id);

        if ($this->getRequest()->isPost()) {
            $id = $this->getRequest()->getPost('id'); 
            $iddossier = $this->getRequest()->getPost('iddossier');
            $avis = $this->getRequest()->getPost('avis');
            $dateavis = $this->getRequest()->getPost('dateavis');
            $refcoresp = $this->getRequest()->getPost('refcoresp');
            $datecoresp = $this->getRequest()->getPost('datecoresp');
            
            if(isset($id) && !empty($id) && isset($iddossier) && !empty($iddossier) && isset($avis) && !empty($avis) && isset($dateavis) && !empty($dateavis) &&
                isset($refcoresp) && !empty($refcoresp) && isset($datecoresp) && !empty($datecoresp)) {
                    
                try{
                    $tabAvis = new Application_Model_DbTable_Avispm;
                    $tabAvis->modifier($id,$iddossier,$avis,$dateavis,$refcoresp,$datecoresp);
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
                    $tabAvis = new Application_Model_DbTable_Avispm;
                    $tabAvis->supprimer($id);
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

    public function loadavisAction()
    {
        $this->_helper->layout->disableLayout();
        if ($this->getRequest()->isPost()) {
            $iddossier = $this->getRequest()->getPost('iddossier');
            $tabAvis = new Application_Model_DbTable_Avispm;
            $this->view->listeAvisDo = $tabAvis->getAvisDossier($iddossier);
        }
    }


}











