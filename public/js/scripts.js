$(document).ready(function(){

    var $corps = $('#corps');
    
    
});
 
function notification($etat){
	if($etat == 1){
	   $.rtnotify({
            title: "",
            message: "op&eacute;ration reussie",
            type: "success",
            permanent: false,
            timeout: 2,
            fade: true,
            width: 300
       });
    }
    else if($etat == -1){
       $.rtnotify({
            title: "",
            message: " Echec de l'op&eacute;ration",
            type: "error",
            permanent: false,
            timeout: 2,
            fade: true,
            width: 300
       });
    }
    else if($etat == 2){
       $.rtnotify({
            title: "",
            message: " Cet enrégistrement existe déjà !",
            type: "error",
            permanent: false,
            timeout: 2,
            fade: true,
            width: 300
       });
    }
    else if($etat == "vide"){
        $.rtnotify({
            title: "",
            message: "Veuillez remplir les champs obligatoires",
            type: "error",
            permanent: false,
            timeout: 2,
            fade: true,
            width: 300
        });
    }
    else if($etat == "videa"){
        $.rtnotify({
            title: "",
            message: "selectionner au moins un patient",
            type: "error",
            permanent: false,
            timeout: 2,
            fade: true,
            width: 300
        });
    }
    else if($etat == "differents"){
        $.rtnotify({
            title: "",
            message: "Les mots de passe sont differents !",
            type: "error",
            permanent: false,
            timeout: 2,
            fade: true,
            width: 300
        })
    }
    else if($etat == "ancien"){
        $.rtnotify({
            title: "",
            message: "L'ancien mot de passe est incorrecte !",
            type: "error",
            permanent: false,
            timeout: 2,
            fade: true,
            width: 300
        });
    } 
    else{
        $.rtnotify({
                title: "",
                message: "Erreur inconnue",
                type: "default",
                permanent: false,
                timeout: 2,
                fade: true,
                width: 300
            });
    }
}
/*function paginations(selecteur,items,numItems,perPage){
    items.slice(perPage).hide();
    selecteur.pagination({
        items: numItems,
        itemsOnPage: perPage,
        cssStyle: "light-theme",
        onPageClick: function(pageNumber) {
            var showFrom = $perPage * (pageNumber-1);
            var showTo = showFrom + $perPage;
            items.hide().slice(showFrom, showTo).show();
        }
    });
}*/