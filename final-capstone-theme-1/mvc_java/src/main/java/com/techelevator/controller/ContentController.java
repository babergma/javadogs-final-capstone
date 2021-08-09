package com.techelevator.controller;

import com.techelevator.entity.Employee;
import com.techelevator.entity.User;
import com.techelevator.util.EmployeeDataTable;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.validation.Valid;

@Controller
@RequestMapping(path="/user")
public class ContentController {

	public ContentController(){
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
