package com.techelevator.util;

import com.techelevator.entity.Employee;

import java.util.ArrayList;
import java.util.List;

public class EmployeeDataTable {

    private int draw;
    private int recordsTotal;
    private int recordsFiltered;
    private String returnPath;
    private List<Employee> data;

    public EmployeeDataTable(){

    }

    public EmployeeDataTable(int draw, int recordsTotal, int recordsFiltered, List<Employee> data) {
        this.draw = draw;
        this.recordsTotal = recordsTotal;
        this.recordsFiltered = recordsFiltered;
        this.data = data;
    }

    public String getReturnPath() {
        return returnPath;
    }

    public void setReturnPath(String returnPath) {
        this.returnPath = returnPath;
    }

    public int getDraw() {
        return draw;
    }

    public void setDraw(int draw) {
        this.draw = draw;
    }

    public int getRecordsTotal() {
        return recordsTotal;
    }

    public void setRecordsTotal(int recordsTotal) {
        this.recordsTotal = recordsTotal;
    }

    public int getRecordsFiltered() {
        return recordsFiltered;
    }

    public void setRecordsFiltered(int recordsFiltered) {
        this.recordsFiltered = recordsFiltered;
    }

    public List<Employee> getData() {
        return data;
    }

    public void setData(List<Employee> data) {
        this.data = data;
    }

    public static final EmployeeDataTable getInstance(){
        List<Employee> list = new ArrayList<>(20);
        list.add(new Employee("Airi", "Satou", "Accountant", "Tokyo", "28th Nov 08", "$162,700",1));
        list.add(new Employee("Angelica", "Ramos", "Chief Executive Officer (CEO)", "London", "9th Oct 09", "$1,200,000",2));
        list.add(new Employee("Ashton", "Cox", "Junior Technical Author", "San Francisco", "12th Jan 09", "$86,000",3));
        list.add(new Employee("Bradley", "Greer", "Software Engineer", "London", "13th Oct 12", "$132,000",4));
        list.add(new Employee("Brenden", "Wagner", "Software Engineer", "San Francisco", "7th Jun 11", "$206,850",5));
        list.add(new Employee("Brielle", "Williamson", "Integration Specialist", "New York", "2nd Dec 12", "$372,000",6));
        list.add(new Employee("Bruno", "Nash", "Software Engineer", "London", "3rd May 11", "$163,500",7));
        list.add(new Employee("Caesar", "Vance", "Pre-Sales Support", "New York", "12th Dec 11", "$106,450",8));
        list.add(new Employee("Cara", "Stevens", "Sales Assistant", "New York", "6th Dec 11", "$145,600",9));
        list.add(new Employee("Cedric", "Kelly", "Senior Javascript Developer", "Edinburgh", "29th Mar 12", "$433,060",10));
        list.add(new Employee("Airi", "Satou", "Accountant", "Tokyo", "28th Nov 08", "$162,700",11));
        list.add(new Employee("Airi", "Satou", "Accountant", "Tokyo", "28th Nov 08", "$162,700",12));
        list.add(new Employee("Airi", "Satou", "Accountant", "Tokyo", "28th Nov 08", "$162,700",13));
        list.add(new Employee("Airi", "Satou", "Accountant", "Tokyo", "28th Nov 08", "$162,700",14));
        list.add(new Employee("Airi", "Satou", "Accountant", "Tokyo", "28th Nov 08", "$162,700",15));
        list.add(new Employee("Airi", "Satou", "Accountant", "Tokyo", "28th Nov 08", "$162,700",16));
        list.add(new Employee("Airi", "Satou", "Accountant", "Tokyo", "28th Nov 08", "$162,700",17));
        list.add(new Employee("Airi", "Satou", "Accountant", "Tokyo", "28th Nov 08", "$162,700",18));
        list.add(new Employee("Airi", "Satou", "Accountant", "Tokyo", "28th Nov 08", "$162,700",19));
        list.add(new Employee("Airi", "Satou", "Accountant", "Tokyo", "28th Nov 08", "$162,700",20));
        return new EmployeeDataTable(1, list.size(), list.size(), list);
    }
}
