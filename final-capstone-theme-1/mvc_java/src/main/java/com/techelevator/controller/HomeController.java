package com.techelevator.controller;

import com.techelevator.dao.IngredientDAO;
import com.techelevator.dao.RecipeDao;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

@Controller
public class HomeController {



	public HomeController(){
	}

	@RequestMapping(path="/", method=RequestMethod.GET)
	public String displayHomePage() {

		return "index";
	}

	@RequestMapping(path="/error", method=RequestMethod.GET)
	public String displayErrorPage() {
		return "error";
	}


}
