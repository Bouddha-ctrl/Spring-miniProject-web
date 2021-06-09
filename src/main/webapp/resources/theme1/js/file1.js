/**
 * 
 */

	var NameClassetoDelete = document.currentScript.getAttribute('classe'); 
	var ContextPath = document.currentScript.getAttribute('path'); 
	
	let confirm = document.querySelector("#supprimer")
	
	confirm.addEventListener('click',()=>{
	
		location.replace(ContextPath+"/cadre/"+NameClassetoDelete+"/delete/"+idClassetoDelete)
    })
    
    function GetId(id)
    {
    
		idClassetoDelete = id
	}
	
	
	
	function validateform()
	{
		console.log("vide");
		var titre = document.modifyForm.titre.value;
		var alias = document.modifyForm.alias.value;
		
		console.log(titre);
		console.log(alias);
		
		
		if (titre == null || titre == "")
		{
			console.log("titre vide");
		}
		
		
		return false;
	
	}