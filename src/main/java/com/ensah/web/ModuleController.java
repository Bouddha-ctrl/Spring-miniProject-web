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
import com.ensah.core.metier.Niveau;
import com.ensah.core.service.Interface.IModuleService;
import com.ensah.core.service.Interface.INiveauService;

@Controller
@RequestMapping("/cadre/module")
public class ModuleController {

	@Autowired
	private IModuleService Module_services;
	
	@Autowired
	private INiveauService Niveau_services;
	
	
	
	@RequestMapping("/list")
	public String ModuleList(Model model) {
		
		
		model.addAttribute("ListModule", Module_services.getAllModule());

		return "ModuleList";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addModule(@Valid @ModelAttribute("Module_Model") Module fModule, BindingResult bindingResult,@RequestParam("idniveau") int idNiveau, Model model) {
		
		Niveau n = Niveau_services.GetNiveauById(idNiveau);

		if (bindingResult.hasErrors()) 
		{
			System.out.println("something missing!");
			
			model.addAttribute("NiveauModel",n);
			return "NiveauDesc";
		}

		Module_services.add(fModule, n);
		
		return "redirect:/cadre/niveau/get/"+idNiveau;

	}
	
	@RequestMapping(value = "/get/{idModule}", method = RequestMethod.GET)
	public String getModule(@PathVariable int idModule, Model model) {
		
		Module m = Module_services.GetModuleById(idModule);

		model.addAttribute("ModuleModel",m);
		model.addAttribute("Matiere_Model",new Matiere());
		//model.addAttribute("ListMatiere",m.getMatieres());
		
		return "ModuleDesc";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateNiveau(@Valid @ModelAttribute("ModuleModel") Module fModule, BindingResult bindingResult, Model model) {
		

		Module_services.update(fModule);
		

		return "redirect:/cadre/module/get/"+fModule.getIdModule();
	}
	
	@RequestMapping(value = "/delete/{idModule}", method = RequestMethod.GET)
	public String deleteModule(@PathVariable int idModule, Model model) {

		Module m = Module_services.GetModuleById(idModule);
		Niveau n = m.getNiveau();
		
		Module_services.delete(m);
		
				
		return "redirect:/cadre/niveau/get/"+n.getIdNiveau();

	}
}
