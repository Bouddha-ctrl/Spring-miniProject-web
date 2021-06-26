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

import com.ensah.core.metier.Coordination;
import com.ensah.core.metier.Filiere;
import com.ensah.core.metier.Matiere;
import com.ensah.core.metier.Module;
import com.ensah.core.metier.Niveau;
import com.ensah.core.model.CoordinationModel;
import com.ensah.core.service.Interface.ICoordinationService;
import com.ensah.core.service.Interface.IFiliereService;

@Controller
@RequestMapping("/cadre/coordination")
public class CoordinationController {

	@Autowired
	private ICoordinationService Coodination_services;
	
	@Autowired
	private IFiliereService Filiere_services;
	
	@RequestMapping(value = "/add", method = RequestMethod.POST)
	public String addFiliere(@Valid @ModelAttribute("Coordination_Model") CoordinationModel coord, 
			BindingResult bindingResult,
			@RequestParam("idfiliere") int idFiliere,
			@RequestParam("idenseignant") int idEnseignant, 
			Model model) {

		if (bindingResult.hasErrors()) 
		{
			System.out.println("something missing!");

			Filiere f = Filiere_services.GetFiliereById(idFiliere);

			model.addAttribute("Niveau_Model",new Niveau());//Model for new Niveau
			model.addAttribute("FiliereModel",f);   //info Filiere
			model.addAttribute("checkModal",0); //show update model or not   1/0
			model.addAttribute("UpdateFiliereModel",f); //info Filiere to update

			return "FiliereDesc";
		}

		Coodination_services.add(coord);
		
		return "redirect:/cadre/filiere/get/"+idFiliere;
	}
	
	@RequestMapping(value = "/delete/{idCoordination}", method = RequestMethod.GET)
	public String deleteMatiere(@PathVariable int idCoordination, Model model) {

			Coordination c = Coodination_services.GetCoordinationById(idCoordination);
			Filiere f = c.getFiliere();

			Coodination_services.deleteById(idCoordination);
				
			return "redirect:/cadre/filiere/get/"+f.getIdFiliere();
	}
}
