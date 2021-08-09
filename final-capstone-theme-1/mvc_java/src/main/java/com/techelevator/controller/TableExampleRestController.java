package com.techelevator.controller;

import java.util.List;

import com.techelevator.dao.UserDAO;
import com.techelevator.entity.Employee;
import com.techelevator.util.EmployeeDataTable;
import org.springframework.http.HttpStatus;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.*;

@RestController
@CrossOrigin
@RequestMapping(path="/user")
public class TableExampleRestController {

	@GetMapping("/rest/employees")
	public EmployeeDataTable getTableEmployeeData() {

		return EmployeeDataTable.getInstance();
	}
	@RequestMapping(path="/rest/employee", method= RequestMethod.POST)
	public Employee postTableEmployeeData(Employee employee) {
		//sample, this should go to the database
		return employee;
	}

}
