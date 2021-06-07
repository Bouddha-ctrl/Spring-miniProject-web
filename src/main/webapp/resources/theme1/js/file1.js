/**
 * 
 */

	var classe = document.currentScript.getAttribute('classe'); 
	var path = document.currentScript.getAttribute('path'); 
	
	let confirm = document.querySelector("#supprimer")
	
	confirm.addEventListener('click',()=>{
		console.log(path+"/cadre/"+classe+"/delete/"+idjs)
		location.replace(path+"/cadre/"+classe+"/delete/"+idjs)
    })
    
    function GetId(id){
		idjs = id
	}