package com.ensah.web;

import java.util.List;

import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.ensah.core.metier.Filiere;
import com.ensah.core.metier.Niveau;
import com.ensah.core.service.Interface.IFiliereService;

@Controller
@RequestMapping("/cadre/filiere")
public class FiliereController {

	@Autowired
	private IFiliereService Filiere_services;
	
	
	@RequestMapping("/list")
	public String FiliereList(Model model) {
		
		
		model.addAttribute("ListFiliere", Filiere_services.getAllFiliere());
		model.addAttribute("Filiere_model",new Filiere());

		return "FiliereList";
	}
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addFiliere(@Valid @ModelAttribute("Filiere_model") Filiere fFiliere, BindingResult bindingResult, Model model) {
		

		if (bindingResult.hasErrors()) 
		{
			System.out.println("something missing!");

			
			model.addAttribute("ListFiliere", Filiere_services.getAllFiliere());
			return "FiliereList";
		}

		Filiere_services.add(fFiliere);
		
		return "redirect:/cadre/filiere/list";
	}
	
	@RequestMapping(value = "/get/{idFiliere}", method = RequestMethod.GET)
	public String getFiliere(@PathVariable String idFiliere, Model model) {
		
		Filiere f = Filiere_services.GetFiliereById(idFiliere);

		model.addAttribute("FiliereModel",f);
		model.addAttribute("Niveau_Model",new Niveau());
		model.addAttribute("ListNiveau",f.getNiveaux());
		return "FiliereDesc";
	}
	
	@RequestMapping(value = "/delete/{idFiliere}", method = RequestMethod.GET)
	public String deleteFiliere(@PathVariable String idFiliere, Model model) {

		Filiere_services.deleteById(idFiliere);
				
		return "redirect:/cadre/filiere/list";
	}
	
	
	
}
