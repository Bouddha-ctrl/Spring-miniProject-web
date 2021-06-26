package com.ensah.web;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.ensah.core.metier.Matiere;
import com.ensah.core.metier.Module;
import com.ensah.core.service.Interface.IMatiereService;
import com.ensah.core.service.Interface.IModuleService;

@Controller
@RequestMapping("/cadre/matiere")
public class MatiereController {

	@Autowired
	private IMatiereService Matiere_services;
	
	@Autowired
	private IModuleService Module_services;
	
	
	@RequestMapping("/list")
	public String MatiereList(@RequestParam(required = false,name="search") String searchParam, Model model) {
		
		if (searchParam != null && !searchParam.isEmpty())
		{
			model.addAttribute("ListMatiere",Matiere_services.getSearch(searchParam));
		}
		else
		{
		model.addAttribute("ListMatiere", Matiere_services.getAllMatiere());
		}

		return "MatiereList";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addMatiere(@Valid @ModelAttribute("Matiere_Model") Matiere fMatiere, BindingResult bindingResult,@RequestParam("idmodule") int idModule, Model model) {
		
		Module m = Module_services.GetModuleById(idModule);

		if (bindingResult.hasErrors()) 
		{
			System.out.println("something missing!");
			

			model.addAttribute("ModuleModel",m);
			model.addAttribute("ListMatiere",m.getMatieres());
			
			return "ModuleDesc";
		}

		m.addMatieres(fMatiere);
		Module_services.update(m);
		
		return "redirect:/cadre/module/get/"+idModule;
	}
	
	@RequestMapping(value = "/get/{idMatiere}", method = RequestMethod.GET)
	public String getMatiere(@PathVariable int idMatiere, Model model) {
		

		Matiere m = Matiere_services.GetMatiereById(idMatiere);
		
		model.addAttribute("MatiereModel",m);//info Matiere
		model.addAttribute("UpdateMatiereModel",m); //info Matiere to update
		model.addAttribute("checkModal",0); //show update model or not   1/0
		
		return "MatiereDesc";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateMatiere(@Valid @ModelAttribute("UpdateMatiereModel") Matiere fMatiere, BindingResult bindingResult, Model model) {
		
		if (bindingResult.hasErrors()) 
		{
			System.out.println("something missing!");
			
			Matiere m = Matiere_services.GetMatiereById(fMatiere.getIdMatiere());
			model.addAttribute("MatiereModel",m);//info Matiere
			model.addAttribute("checkModal",1); //show update model or not   1/0

			return "MatiereDesc";
		}
		Matiere_services.update(fMatiere);
		

		return "redirect:/cadre/matiere/get/"+fMatiere.getIdMatiere();
	}
	
	@RequestMapping(value = "/delete/{idMatiere}", method = RequestMethod.GET)
	public String deleteMatiere(@PathVariable int idMatiere, Model model) {

			Matiere m = Matiere_services.GetMatiereById(idMatiere);
			Module mo = m.getModule();

			Matiere_services.deleteById(idMatiere);
				
			return "redirect:/cadre/module/get/"+mo.getIdModule();
	}
}
