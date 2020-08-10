<?php

class CompterenduinstanceController extends Zend_Controller_Action
{

    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
    $tabCR = new Application_Model_DbTable_Compterenduinstance();
    $this->view->listeCR = $tabCR->getAllV();
    }

    public function ajouterAction()
    {
        $tabinst = new Application_Model_DbTable_Instancerepresentation();
        $this->view->listeinst = $tabinst->getAllV();

        if ($this->getRequest()->isPost()) {    
            $idInstance = $this->getRequest()->getPost('idInstance');
            $objetCR = $this->getRequest()->getPost('objetCR');
            $difficulte = $this->getRequest()->getPost('difficulte');
            $decision = $this->getRequest()->getPost('decision');
            $perspective = $this->getRequest()->getPost('perspective');
            $dateDebut = $this->getRequest()->getPost('dateDebut');
            $dateFin = $this->getRequest()->getPost('dateFin');
            if(isset($idInstance) && !empty($idInstance) && isset($objetCR) && !empty($objetCR) && isset($difficulte) &&
                 isset($decision) && !empty($decision) && isset($perspective) 
                 && isset($dateDebut) && !empty($dateDebut) && isset($dateFin)
                && !empty($dateFin)) 
                {
                    
                try{
                    $tabcr = new Application_Model_DbTable_Compterenduinstance;
                    $tabcr->ajouter($idInstance,$objetCR,$difficulte,$decision,$perspective,$dateDebut,$dateFin);
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
        $tabinst = new Application_Model_DbTable_Instancerepresentation();
        $this->view->listeinst = $tabinst->getAllV();
        $tabcr = new Application_Model_DbTable_Compterenduinstance();
        $this->view->id = $this->getParam('id', 0);
        $this->view->cr = $tabcr->getV($this->view->id);

        if ($this->getRequest()->isPost()) { 
            $idCR = $this->getRequest()->getPost('idCR');   
            $idInstance = $this->getRequest()->getPost('idInstance');
            $objetCR = $this->getRequest()->getPost('objetCR');
            $difficulte = $this->getRequest()->getPost('difficulte');
            $decision = $this->getRequest()->getPost('decision');
            $perspective = $this->getRequest()->getPost('perspective');
            $dateDebut = $this->getRequest()->getPost('dateDebut');
            $dateFin = $this->getRequest()->getPost('dateFin');
            if(isset($idCR) && !empty($idCR) &&
                isset($idInstance) && !empty($idInstance) && isset($objetCR) && !empty($objetCR) && isset($difficulte) &&
                 isset($decision) && !empty($decision) && isset($perspective) 
                 && isset($dateDebut) && !empty($dateDebut) && isset($dateFin)
                && !empty($dateFin)) 
                {
                    
                try{
                    $tabcr = new Application_Model_DbTable_Compterenduinstance;
                    $tabcr->modifier($idCR,$idInstance,$objetCR,$difficulte,$decision,$perspective,$dateDebut,$dateFin);

                    $tabcr = new Application_Model_DbTable_Compterenduinstance();
                    $this->view->id = $this->getParam('id', 0);
                    $this->view->cr = $tabcr->getV($this->view->id);
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
        $tabcr = new Application_Model_DbTable_Compterenduinstance();
        $this->view->id = $this->getParam('id', 0);
        $this->view->cr = $tabcr->getV($this->view->id);
        if ($this->getRequest()->isPost()) {
            $id = $this->getRequest()->getPost('id');
            if(isset($id) && !empty($id)) {
                   
                try{
                    $tabcr = new Application_Model_DbTable_Compterenduinstance();
                    $tabcr->supprimer($id);
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







