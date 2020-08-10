<?php

class DossierordinaireController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        $tabDossier = new Application_Model_DbTable_dossierordinaire;
        $this->view->listeDossier = $tabDossier->getAllV();
    }

    public function ajouterAction()
    {
        $tabStr = new Application_Model_DbTable_Structure;
        $tabSt = new Application_Model_DbTable_Statutdossier;
        $this->view->listeStr = $tabStr->getAll();
        $this->view->listeSt = $tabSt->getAll();

        if ($this->getRequest()->isPost()) {
             
            $idstr = $this->getRequest()->getPost('idstr');
            $idst = $this->getRequest()->getPost('idst');
            $objet = $this->getRequest()->getPost('objet');
            $ref = $this->getRequest()->getPost('ref');
            $date = $this->getRequest()->getPost('date');
            $synthese = $this->getRequest()->getPost('synthese');
            $observation = $this->getRequest()->getPost('observation');
            if(isset($idstr) && !empty($idstr) && isset($idst) && !empty($idst) && isset($objet) &&
                !empty($objet) && isset($ref) && !empty($ref) && isset($date) && !empty($date) && isset($synthese) && 
                !empty($synthese) && isset($observation)) {
                    
                try{
                    $tabDossier = new Application_Model_DbTable_Dossierordinaire;
                    $tabDossier->ajouter($idstr,$idst,$objet,$ref,$date,$synthese,$observation);
                    $this->view->etat = 1;
                    
                }
                catch(Exception $e){
                    $this->view->etat = -1; 
                    $this->view->essai = "ok";
                    $this->view->erreur = $e->getMessage();  
                }
            }
        } 
         
    }

    public function modifierAction()
    {
        $tabStr = new Application_Model_DbTable_Structure;
        $tabSt = new Application_Model_DbTable_Statutdossier;
        $tabDossier = new Application_Model_DbTable_Dossierordinaire;
        $this->view->listeStr = $tabStr->getAll();
        $this->view->listeSt = $tabSt->getAll();
        $this->view->id = $this->getParam('id', 0);
        $this->view->dossier = $tabDossier->getV($this->view->id);

        if ($this->getRequest()->isPost()) {
            $id = $this->getRequest()->getPost('id'); 
            $idstr = $this->getRequest()->getPost('idstr');
            $idst = $this->getRequest()->getPost('idst');
            $objet = $this->getRequest()->getPost('objet');
            $ref = $this->getRequest()->getPost('ref');
            $date = $this->getRequest()->getPost('date');
            $synthese = $this->getRequest()->getPost('synthese');
            $observation = $this->getRequest()->getPost('observation');
            if(isset($id) && !empty($id) && isset($idstr) && !empty($idstr) && isset($idst) && !empty($idst) && isset($objet) &&
                !empty($objet) && isset($ref) && !empty($ref) && isset($date) && !empty($date) && isset($synthese) && 
                !empty($synthese) && isset($observation)) {
                   
                try{
                    $tabDossier = new Application_Model_DbTable_Dossierordinaire;
                    $tabDossier->modifier($id,$idstr,$idst,$objet,$ref,$date,$synthese,$observation);
                    $tabStr = new Application_Model_DbTable_Structure;
                    $tabSt = new Application_Model_DbTable_Statutdossier;
                    $tabDossier = new Application_Model_DbTable_Dossierordinaire;
                    $this->view->listeStr = $tabStr->getAll();
                    $this->view->listeSt = $tabSt->getAll();
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
        $this->view->id = $this->getParam('id', 0);
        if ($this->getRequest()->isPost()) {
            $id = $this->getRequest()->getPost('id');
            if(isset($id) && !empty($id)) {
                   
                try{
                    $tabDossier = new Application_Model_DbTable_Dossierordinaire;
                    $tabDossier->supprimer($id);
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

    public function formajouterAction()
    {
        // action body
    }

    public function formsupprimerAction()
    {
        // action body
    }

    public function formmodifierAction()
    {
        // action body
    }

    public function agentAction()
    {
        $this->view->id = $this->getParam('id', 0);
        $this->view->idstr = $this->getParam('idstr', 0);
        $tabStr = new Application_Model_DbTable_Structure;
        $tabDossier = new Application_Model_DbTable_Dossierordinaire;
        $tabAgent = new Application_Model_DbTable_Agent;
        $tabAI = new Application_Model_DbTable_Agentimpliquedo;

        $this->view->dossier = $tabDossier->getV($this->view->id);
        $this->view->structure = $tabStr->get($this->view->idstr);
        $this->view->listeAgent = $tabAgent->getAllV();
        $this->view->listeAiDossier = $tabAI->getAgentDossier($this->view->id);

    }

    public function loadtabagentAction()
    {
        $this->_helper->layout->disableLayout();
        if ($this->getRequest()->isPost()) {
            $idagent = $this->getRequest()->getPost('idagent');
            $iddossier = $this->getRequest()->getPost('iddossier');
            $tabAgent = new Application_Model_DbTable_Agent;
            $tabAI = new Application_Model_DbTable_Agentimpliquedo;

            $this->view->idagent = $idagent;
            $this->view->id = $iddossier;
            $tabAI->ajouter($idagent, $iddossier,"Impliqué");
            $this->view->listeAiDossier = $tabAI->getAgentDossier($iddossier);
        }
        
    }

    public function responsableAction()
    {
        $this->_helper->layout->disableLayout();
        if ($this->getRequest()->isPost()) {
            $idagent = $this->getRequest()->getPost('idagent');
            $iddossier = $this->getRequest()->getPost('iddossier');
            //$tabAgent = new Application_Model_DbTable_Agent;
            $tabAI = new Application_Model_DbTable_Agentimpliquedo;

            //$this->view->idagent = $idagent;
            $tabAI->modifier($idagent, $iddossier,"Responsable");
            //$this->view->listeAiDossier = $tabAI->getAgentDossier($iddossier);
        }
    }

    public function supagentAction()
    {
        $this->view->id = $this->getParam('id', 0);
        
        if(isset($id) && !empty($id)) {
                   
            try{
                    $tabAI = new Application_Model_DbTable_Agentimpliquedo;
                    $tabAI->supprimer($id);
                    $this->view->etat = 1;
                    
                }
                catch(Exception $e){
                    $this->view->etat = -1; 
                    $this->view->erreur = $e->getMessage();  
                }
        }
        $this->_helper->redirector('agent');
        
    }


}





















