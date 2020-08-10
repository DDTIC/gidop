<?php

class IndexController extends Zend_Controller_Action
{

    public function preDispatch()
    {
     $ses=Zend_Auth::getInstance();
        if(!$ses->hasIdentity()){
            $this->_redirect('Connexion/index');
            //$this->_helper->redirector('Connexion/index');
        }
        
        $this->view->user=$ses->getIdentity();  
    }
    
    public function init()
    {
        /* Initialize action controller here */
    }

    public function indexAction()
    {
        // action body
    }


}

