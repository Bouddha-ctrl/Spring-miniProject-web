/**
 * 
 */

	const ContextPath = document.currentScript.getAttribute('path'); 
	const pathname = window.location.pathname;
	var NameClassetoDelete = "";

	try{
		let confirm = document.querySelector("#supprimer")
		confirm.addEventListener('click',()=>{
		
			location.replace(ContextPath+"/cadre/"+NameClassetoDelete+"/delete/"+idClassetoDelete)
	    })
    }catch(error){}

    function GetId(id,classe)
    {
	
		NameClassetoDelete = classe;
		idClassetoDelete = id;
		console.log(NameClassetoDelete,idClassetoDelete);
	}
	
	
	try {

		var check = document.getElementById("checkModal").value;
		var modify = document.querySelector("#modify");
		if (check==1)
		{
			document.getElementById("modiferModal").className = "modal";
			modify.click()
		}else{
			document.getElementById("modiferModal").className = "modal fade";
	
		}
	} catch (error) {}
	


	///get Search param
	if (pathname.includes("list"))
	{
		const queryString = window.location.search;
		const urlParams = new URLSearchParams(queryString);
		const SearchParam = urlParams.get('search')
		
		var words = ["",""]
		var i = 0;
		if (SearchParam!=null && SearchParam!="" && SearchParam.slice(-1)!=':') // trim check if 
		{
			words = SearchParam.split(/:(.+)/) //split in the first occurence
			var list = document.getElementById("SearchSelect").options; // find index of the otion in param
			for(i = 0; i<list.length; i++){
			    if(list[i].value== words[0]) { //Compare
					break;
			    }
			}
				
		}
			
		document.getElementById("SearchInput").value = words[1];
		document.getElementById("SearchSelect").selectedIndex = i;
	
	}

	//search procedure
	var help = document.getElementById("SearchInput").value; //help to return to the general table :findAll
	function getSearchValue()
	{
		var SearchValue = document.getElementById("SearchInput").value.trim(); // remove spacing begin/end
		var SearchBy = document.getElementById("SearchSelect").value;
		var RedirectUrl = "";
		console.log(SearchValue +": "+help);
		if ( SearchValue!="")
		{
			RedirectUrl = ContextPath+"/cadre/"+NameClassetoDelete+"/list?search="+SearchBy+":"+SearchValue ;
		}
		else if (help!="")
		{
			RedirectUrl = ContextPath+"/cadre/"+NameClassetoDelete+"/list" ;
		}
		help = SearchValue;

		if (RedirectUrl != "") location.replace(RedirectUrl);

	}
	
	
