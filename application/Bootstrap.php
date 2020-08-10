<?php

class Bootstrap extends Zend_Application_Bootstrap_Bootstrap
{
	
	protected function _initView() 
{ 
    
    $view = new Zend_View(); 
    
    $view->headMeta()->appendHttpEquiv('Content-Type', 'text/html; charset=UTF-8');
    $view->headTitle('GIDoP');
        
    $viewRenderer = Zend_Controller_Action_HelperBroker::getStaticHelper('viewRenderer');
    $viewRenderer->setView($view);
    $view->addHelperPath('ZendX/JQuery/View/Helper/','ZendX_JQuery_View_Helper');
    ZendX_JQuery::enableView($view);
    
    $view->setEscape('htmlentities');
    $view->setEncoding('UTF-8');
    
 
    $viewRenderer = new Zend_Controller_Action_Helper_ViewRenderer();
    $viewRenderer->setView($view);
    Zend_Controller_Action_HelperBroker::addHelper($viewRenderer);
     
	$view->date = new Zend_Date('fr_FR');
    
    
        
} 

    protected function _initHelpers(){
    	
        
    }
    
}
