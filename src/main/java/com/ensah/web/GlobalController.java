package com.ensah.web;

import java.io.File;
import java.io.FileInputStream;
import java.util.Date;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.ensah.core.metier.*;
import com.ensah.core.service.Interface.ICoordinationService;
import com.ensah.core.service.Interface.IEnseignantService;
import com.ensah.core.service.Interface.IFiliereService;
import com.fasterxml.jackson.databind.ObjectMapper;
import com.fasterxml.jackson.dataformat.xml.XmlMapper;

@Controller
@RequestMapping("/cadre")
public class GlobalController {
	
	private Logger LOGGER = Logger.getLogger(getClass().getName());

	@Autowired
	private IFiliereService Filiere_services;
	
	@Autowired
	private IEnseignantService Enseigant_services;
	
	@Autowired
	private ICoordinationService Coordination_services;
	
	@Autowired
	private ServletContext servletContext;public GlobalController() {
		// TODO Auto-generated constructor stub
	}
	
	@RequestMapping(value = "/a")
	public String a(Model  model) {
		
		
		return null;
	}
	
	
	
	@RequestMapping(value = "/tree")
	public String tree(Model  model) {
		model.addAttribute("ListFiliere", Filiere_services.getAllFiliere());
		
		return "Tree";
	}
	
	@RequestMapping(value = "/uploadFile", method = RequestMethod.POST)
	 @ResponseBody
	 public String uploadFile(@RequestParam("file") CommonsMultipartFile file, HttpSession session) {
		System.out.println("td");
	 try {


		 System.out.println(file.getOriginalFilename());
	 } catch (Exception e) {

	 e.printStackTrace();

	 return "Failure";
	 }

	 return "Success";
	 }
}
