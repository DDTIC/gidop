<?php

class ConnexionController extends Zend_Controller_Action
{

    public function init()
    {
        $this->_helper->layout()->disableLayout();
    }

    public function indexAction()
    {
        if(isset($_POST['login']) && isset($_POST['password'])){
            if(!empty($_POST['login']) && !empty($_POST['password'])){
                $login=$_POST['login'];
                $password=$_POST['password'];
                
                 $autAdapteur=new Zend_Auth_Adapter_DbTable(Zend_Db_Table::getDefaultAdapter());
                
                $autAdapteur->setTableName('utilisateur')
                            ->setIdentityColumn('login')
                            ->setCredentialColumn('password')
                            //->setCredentialTreatment('MD5(?)')
                            ->setIdentity($login)
                            ->setCredential($password);
                            
                   $connexion=$autAdapteur->authenticate();
                   
                if($connexion->isValid()){
                    $storage=Zend_Auth::getInstance()->getStorage();
                    $storage->write($autAdapteur->getResultRowObject(null));
                    $this->_redirect('Index/index');
                    //$this->_helper->redirector('Index/index');
                }
                else{
                       echo "<script type=\"text/javascript\">
alert('Identifiant ou mot de passe incorrect')</script>";  
                }           
            }
        }
    }

    public function deconnexionAction()
    {
        $ses=Zend_Auth::getInstance();
        $ses=$ses->clearIdentity();
        Zend_Session::destroy();
        $this->_redirect('Connexion/index');
    }


}



