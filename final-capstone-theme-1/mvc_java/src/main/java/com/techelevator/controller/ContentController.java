package com.techelevator.controller;

import com.techelevator.dao.IngredientDAO;
import com.techelevator.dao.UserDAO;
import com.techelevator.entity.Employee;
import com.techelevator.entity.Ingredient;
import com.techelevator.entity.User;
import com.techelevator.util.EmployeeDataTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.List;


@Controller
@RequestMapping(path="/user")
public class ContentController {

	private IngredientDAO ingredientDAO;

	@Autowired
	public ContentController(IngredientDAO ingredientDAO) {

		this.ingredientDAO = ingredientDAO;
	}

	public ContentController(){
	}

	@RequestMapping(path="/grocerylist", method=RequestMethod.GET)
	public String displayGroceryList(HttpSession session) {
////		List<Ingredient> ingredientList = ingredientDAO.searchForIngredientByUserID();
//		session.setAttribute("ingredients", ingredientList);
		return "grocerylist";
	}

	@RequestMapping(path="/addgrocerylist", method=RequestMethod.GET)
	public String displayAddGroceryList(HttpSession session) {
		List<Ingredient> ingredientList = ingredientDAO.getAllIngredients();
		session.setAttribute("ingredients", ingredientList);
		return "addgrocerylist";
	}


	@RequestMapping(path="/addgrocerylist", method=RequestMethod.POST)
	public String processAddGroceryList(@RequestParam String input) {

		Ingredient ingredient = new Ingredient();
		ingredient.setIngredientName(input);
		ingredientDAO.saveIngredient(ingredient);

		return "redirect:addgrocerylist";
	}


	@RequestMapping(path="/dashboard", method=RequestMethod.GET)
	public String displayDashboard() {
		return "dashboard";
	}

	@RequestMapping(path="/search", method=RequestMethod.GET)
	public String displaySearchResults() {
		return "searchResults";
	}

	@RequestMapping(path="/blank", method=RequestMethod.GET)
	public String displayBlankPage() {

		return "blank";
	}

	@RequestMapping(path="/404", method=RequestMethod.GET)
	public String displayBadPage() {

		return "404";
	}

	@RequestMapping(path="/basic/table", method=RequestMethod.GET)
	public String displayBasicTable() {

		return "basicTableExample";
	}

	@RequestMapping(path="/rest/table", method=RequestMethod.GET)
	public String displayRestTable() {

		return "restTableExample";
	}

	@RequestMapping(path="/buttons", method=RequestMethod.GET)
	public String displayButtons() {

		return "buttons";
	}

	@RequestMapping(path="/cards", method=RequestMethod.GET)
	public String displayCards() {

		return "cards";
	}

	@RequestMapping(path="/charts", method=RequestMethod.GET)
	public String displayCharts() {

		return "charts";
	}

	@RequestMapping(path="/accordion", method=RequestMethod.GET)
	public String displayAccordion(ModelMap modelMap) {
		modelMap.put("employees", EmployeeDataTable.getInstance().getData());
		return "accordionExample";
	}

}