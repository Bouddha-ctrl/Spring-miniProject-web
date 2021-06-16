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
	
	
	try {
	
	var check = document.getElementById("checkModal").value;
	
	console.log(check);
	var modify = document.querySelector("#modify")
	if (check==1)
	{
		document.getElementById("modiferModal").className = "modal";
		modify.click()
	}else{
		document.getElementById("modiferModal").className = "modal fade";

	}

	} catch (error) {
	
	}
