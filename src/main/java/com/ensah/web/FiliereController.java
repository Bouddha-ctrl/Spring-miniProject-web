package com.ensah.web;

import java.io.File;
import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.Files;
import java.nio.file.Path;
import java.util.List;

import javax.servlet.MultipartConfigElement;
import javax.validation.Valid;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.context.annotation.Bean;
import org.springframework.http.MediaType;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.MultipartResolver;

import com.ensah.core.metier.Coordination;
import com.ensah.core.metier.Filiere;
import com.ensah.core.metier.Niveau;
import com.ensah.core.model.CoordinationModel;
import com.ensah.core.service.Interface.IEnseignantService;
import com.ensah.core.service.Interface.IFiliereService;
import com.ensah.core.service.Interface.IImportDataService;

@Controller
@RequestMapping("/cadre/filiere")
public class FiliereController {

	@Autowired
	private IFiliereService Filiere_services;
	
	@Autowired
	private IEnseignantService Enseignant_services;
	
	@Autowired
	private IImportDataService ImportDataService;
	
	@RequestMapping("/list")
	public String FiliereList(@RequestParam(required = false,name="search") String searchParam, Model model) {
		model.addAttribute("Filiere_model",new Filiere()); //add filiere form
		
		if (searchParam != null && !searchParam.isEmpty())
		{
			model.addAttribute("ListFiliere",Filiere_services.getSearch(searchParam));
		}
		else
		{
		model.addAttribute("ListFiliere", Filiere_services.getAllFiliere());
		}
		
		return "FiliereList";
	}
	

	@RequestMapping(value = "/addFile", method = RequestMethod.POST, consumes = MediaType.MULTIPART_FORM_DATA_VALUE)
	public String addFile(@RequestParam("fileJson") MultipartFile multipart,Model model) throws IOException {
		
		String content = new String(multipart.getBytes(), StandardCharsets.UTF_8);
		String etat = ImportDataService.importData(content);
		System.out.println(etat);
		
		model.addAttribute("Filiere_model",new Filiere()); //add filiere form
		model.addAttribute("AddFileState",etat); //display modal
		model.addAttribute("ListFiliere", Filiere_services.getAllFiliere());

		
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
	public String getFiliere(@PathVariable int idFiliere, Model model) {
		
		Filiere f = Filiere_services.GetFiliereById(idFiliere);
       
		model.addAttribute("ListEnseignant",Enseignant_services.getAllEnseignant());

		model.addAttribute("Coordination_Model",new CoordinationModel());
		
		model.addAttribute("Niveau_Model",new Niveau());//Model for new Niveau
		
		model.addAttribute("FiliereModel",f);   //info Filiere
		
		model.addAttribute("UpdateFiliereModel",f); //info Filiere to update
		model.addAttribute("checkModal",0); //show update modal or not   1/0
		return "FiliereDesc";
	}
	
	@RequestMapping(value = "/update", method = RequestMethod.POST)
	public String updateNiveau(@Valid @ModelAttribute("UpdateFiliereModel") Filiere fFiliere, BindingResult bindingResult, Model model) {
		
		System.out.println("checking");
		if (bindingResult.hasErrors()) 
		{
			System.out.println("something missing!");
			
			Filiere f = Filiere_services.GetFiliereById(fFiliere.getIdFiliere());
			
			model.addAttribute("Niveau_Model",new Niveau());//Model for new Niveau
			model.addAttribute("Coordination_Model",new CoordinationModel());//Model for new coordination
			model.addAttribute("FiliereModel",f);   //info Filiere
			model.addAttribute("checkModal",1); //show update model or not   1/0
			return "FiliereDesc";
		}
		
		Filiere_services.update(fFiliere);
		
		return "redirect:/cadre/filiere/get/"+fFiliere.getIdFiliere();
	}
	
	@RequestMapping(value = "/delete/{idFiliere}", method = RequestMethod.GET)
	public String deleteFiliere(@PathVariable int idFiliere, Model model) {

		Filiere_services.deleteById(idFiliere);
				
		return "redirect:/cadre/filiere/list";
	}
	
	
	
}
