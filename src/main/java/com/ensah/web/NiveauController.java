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
	public String addNiveau(@Valid @ModelAttribute("Niveau_Model") Niveau fNiveau, BindingResult bindingResult,@RequestParam("idfiliere") String idFiliere, Model model) {
		
		if (bindingResult.hasErrors()) 
		{
			System.out.println("something missing!");

			Filiere f = Filiere_services.GetFiliereById(idFiliere);
			model.addAttribute("FiliereModel",f);
			model.addAttribute("ListNiveau",f.getNiveaux());
			return "FiliereDesc";
		}
		
		Filiere f = Filiere_services.GetFiliereById(idFiliere);
		f.addNiveaux(fNiveau);
		
		Filiere_services.update(f);
		
		//Niveau_services.add(fNiveau);
		
		return "redirect:/cadre/filiere/get/"+idFiliere;
	}
	
	
	@RequestMapping(value = "/get/{idNiveau}", method = RequestMethod.GET)
	public String getNiveau(@PathVariable int idNiveau, Model model) {
		
		
		Niveau n = Niveau_services.GetNiveauById(idNiveau);

		model.addAttribute("Module_Model",new Module());
		model.addAttribute("NiveauModel",n);
		model.addAttribute("ListModule",n.getModules());
		return "NiveauDesc";
	}
	
	
	@RequestMapping(value = "/delete/{idNiveau}", method = RequestMethod.GET)
	public String deleteNiveau(@PathVariable int idNiveau, Model model) {
		
		Niveau n = Niveau_services.GetNiveauById(idNiveau);

		Filiere f = n.getFiliere();
		f.removeNiveaux(n);
		Niveau_services.delete(n);
				
		return "redirect:/cadre/filiere/get/"+f.getIdFiliere();
	}
	
	
}
