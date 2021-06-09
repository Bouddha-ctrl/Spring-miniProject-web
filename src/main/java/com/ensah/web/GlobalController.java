package com.ensah.web;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;

import com.ensah.core.service.Interface.IFiliereService;

@Controller
@RequestMapping("/cadre")
public class GlobalController {

	@Autowired
	private IFiliereService Filiere_services;
	
	@RequestMapping("/pedagogie/tree")
	public String tree(Model model) {
		
		model.addAttribute("ListFiliere", Filiere_services.getAllFiliere());

		return "Tree";
	}
}
