package com.techelevator.controller;

import com.techelevator.dao.UserDAO;
import com.techelevator.entity.Employee;
import com.techelevator.entity.User;
import com.techelevator.security.AuthorizationFilter;
import com.techelevator.util.EmployeeDataTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

@Controller
public class EmployeeController {

	@RequestMapping(path="/employee/{id}/{returnPath}", method=RequestMethod.GET)
	public String getEmployee(ModelMap modelMap, @PathVariable("id") long id, @PathVariable("returnPath") String returnPath) {
		EmployeeDataTable baseTable = new EmployeeDataTable();
		baseTable.setData(EmployeeDataTable.getInstance().getData());
		Employee employee = null;
		for (Employee currentEmployee:baseTable.getData()) {
			if (currentEmployee.getId()== id) {
				employee = currentEmployee;
				employee.setReturnPath(returnPath);
			}
		}
		modelMap.put("employee", employee);
		return "employee";
	}
	//
//	@RequestMapping(path="/employee", method=RequestMethod.POST)
//	public String postEmployee(ModelMap modelMap) {
//		Employee employee = (Employee) modelMap.get("employee");
//		//save
//		if (employee.getReturnPath().equalsIgnoreCase("rest")) {
//			return "redirect:restTableExample";
//		}
//		return "redirect:basicTableExample";
//	}
	@RequestMapping(path="/employee", method=RequestMethod.POST)
	public String createUser(@Valid @ModelAttribute Employee employee, BindingResult result, RedirectAttributes flash) {
		if(result.hasErrors()) {
			flash.addFlashAttribute("employee", employee);
			flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "employee", result);
			return "redirect:/employee/" + employee.getId() + "/" + employee.getReturnPath();
		}

		//save
		if (employee.getReturnPath().equalsIgnoreCase("rest")) {
			return "redirect:/user/rest/table";
		}
		return "redirect:/user/basic/table";
	}

}
