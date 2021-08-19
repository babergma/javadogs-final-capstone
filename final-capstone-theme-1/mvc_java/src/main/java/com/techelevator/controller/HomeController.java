package com.techelevator.controller;

import com.techelevator.dao.IngredientDAO;
import com.techelevator.dao.MealPlanDao;
import com.techelevator.dao.RecipeDao;
import com.techelevator.entity.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import java.util.ArrayList;
import java.util.HashSet;
import java.util.List;

@Controller
public class HomeController {


	private IngredientDAO ingredientDAO;
	private RecipeDao recipeDao;
	private MealPlanDao mealPlanDao;

	@Autowired
	public HomeController(IngredientDAO ingredientDAO, RecipeDao recipeDao, MealPlanDao mealPlanDao) {
		this.recipeDao = recipeDao;
		this.ingredientDAO = ingredientDAO;
		this.mealPlanDao = mealPlanDao;
	}


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

	@RequestMapping(path = "/publicviewallrecipes", method = RequestMethod.GET)
	public String displayAllPublicRecipes(ModelMap modelMap) {
		List<Recipe> recipeList = recipeDao.getAllPublicRecipes();
		modelMap.put("recipeList", recipeList);
		return "publicviewallrecipes";

	}

	@RequestMapping(path = "/publicrecipedetails", method = RequestMethod.GET)
	public String displayPublicRecipeDetails(@RequestParam Long id,
									   ModelMap modelMap) {

		Recipe recipe = recipeDao.getRecipeByRecipeId(id);
		modelMap.addAttribute("recipe", recipe);
		return "publicrecipedetails";
	}


	@RequestMapping(path = "/publicsearchresults", method = RequestMethod.GET)
	public String displaySearchResults(@RequestParam(required = false) String searchText,
									   @RequestParam(required = false) String filterBy,
									   ModelMap modelMap) {
		List<Recipe> searchedRecipes = new ArrayList(new HashSet(recipeDao.searchForRecipeByFilter(searchText, filterBy)));
		modelMap.put("searchedRecipes", searchedRecipes);
		return "publicsearchresults";
	}

}
