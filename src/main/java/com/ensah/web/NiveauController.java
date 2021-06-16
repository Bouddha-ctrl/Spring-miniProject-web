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

import com.ensah.core.metier.Module;
import com.ensah.core.metier.Filiere;

import com.ensah.core.metier.Niveau;
import com.ensah.core.service.Interface.IFiliereService;
import com.ensah.core.service.Interface.INiveauService;

@Controller
@RequestMapping("/cadre/niveau")

public class NiveauController {

	@Autowired
	private INiveauService Niveau_services;
	
	@Autowired
	private IFiliereService Filiere_services;
	
	@RequestMapping("/list")
	public String FiliereList(Model model) {
		
		
		model.addAttribute("ListNiveau", Niveau_services.getAllNiveau());

		return "NiveauList";
	}
	
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addNiveau(@Valid @ModelAttribute("Niveau_Model") Niveau fNiveau, BindingResult bindingResult,@RequestParam("idfiliere") int idFiliere, Model model) {
		
		Filiere f = Filiere_services.GetFiliereById(idFiliere);

		if (bindingResult.hasErrors()) 
		{
			System.out.println("something missing!");

			model.addAttribute("FiliereModel",f);
			return "FiliereDesc";
		}
		
		Niveau_services.add(fNiveau,f);
		
		return "redirect:/cadre/filiere/get/"+idFiliere;
	}
	
	
	@RequestMapping(value = "/get/{idNiveau}", method = RequestMethod.GET)
	public String getNiveau(@PathVariable int idNiveau, Model model) {
		
		
		Niveau n = Niveau_services.GetNiveauById(idNiveau);

		model.addAttribute("Module_Model",new Module());  //Model for new Module
		model.addAttribute("NiveauModel",n);    //info Niveau
		model.addAttribute("UpdateNiveauModel",n); //info Niveau to update
		model.addAttribute("checkModal",0); //show update model or not   1/0

		return "NiveauDesc";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateNiveau(@Valid @ModelAttribute("UpdateNiveauModel") Niveau fNiveau, BindingResult bindingResult, Model model) {
		
		
		if (bindingResult.hasErrors()) 
		{
			System.out.println("something missing!");
			
			Niveau n = Niveau_services.GetNiveauById(fNiveau.getIdNiveau());
			model.addAttribute("Module_Model",new Module());  //model pour nouveau module
			model.addAttribute("NiveauModel",n); //info Niveau
			model.addAttribute("checkModal",1);//show update model or not   1/0
			return "NiveauDesc";
		}
		
		
		Niveau_services.update(fNiveau);
		
		return "redirect:/cadre/niveau/get/"+fNiveau.getIdNiveau();
	}
	
	
	@RequestMapping(value = "/delete/{idNiveau}", method = RequestMethod.GET)
	public String deleteNiveau(@PathVariable int idNiveau, Model model) {
		
		Niveau n = Niveau_services.GetNiveauById(idNiveau);
		Filiere f = n.getFiliere();
		
		Niveau_services.delete(n);
				
		return "redirect:/cadre/filiere/get/"+f.getIdFiliere();
	}
	
	
}
