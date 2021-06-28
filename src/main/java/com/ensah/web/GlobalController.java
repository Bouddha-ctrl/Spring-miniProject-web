package com.ensah.web;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileNotFoundException;
import java.io.InputStream;
import java.util.ArrayList;
import java.util.Date;
import java.util.List;

import javax.servlet.ServletContext;
import javax.servlet.http.HttpSession;

import org.apache.log4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.validation.SmartValidator;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.commons.CommonsMultipartFile;

import com.ensah.core.metier.*;
import com.ensah.core.service.Interface.IFiliereService;
import com.ensah.core.service.Interface.IImportDataService;
import com.fasterxml.jackson.core.JsonProcessingException;
import com.fasterxml.jackson.core.type.TypeReference;
import com.fasterxml.jackson.databind.JsonMappingException;
import com.fasterxml.jackson.databind.ObjectMapper;

@Controller
@RequestMapping("/cadre")
public class GlobalController {
	
	private Logger LOGGER = Logger.getLogger(getClass().getName());

	@Autowired
	private IFiliereService Filiere_services;
	
	@Autowired
	private ServletContext servletContext;
	
	@Autowired
	private IImportDataService ImportDataService;


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
