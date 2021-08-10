package com.techelevator.entity;

import org.hibernate.validator.constraints.Email;
import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Pattern;
import javax.validation.constraints.Size;
import java.util.List;

public class User {

	public static final String CUSTOMER_ROLE = "CUSTOMER";
	public static final String GUEST_ROLE = "GUEST_ROLE";

	private Long id;

	private String role;

    @NotBlank(message = "Email is required")
	@Email(message = "Must be a valid email address")
	private String userName;

	@Size(min = 10, message = "Password too short, must be at least 10")
	@Pattern.List({
			@Pattern(regexp = ".*[a-z].*", message = "Must have a lower case"),
			@Pattern(regexp = ".*[A-Z].*", message = "Must have a capital")
	})
	private String password;

	private String confirmPassword;

    @NotBlank(message = "First Name is required")
    private String firstName;

    @NotBlank(message = "Last Name is required")
    private String lastName;

    private String height;
    private String weight;
    private String birthday;
    private String goal;
    private List<Ingredient> groceryList;

    public String getHeight() {
        return height;
    }

    public void setHeight(String height) {
        this.height = height;
    }

    public String getWeight() {
        return weight;
    }

    public void setWeight(String weight) {
        this.weight = weight;
    }

    public String getBirthday() {
        return birthday;
    }

    public void setBirthday(String birthday) {
        this.birthday = birthday;
    }

    public String getGoal() {
        return goal;
    }

    public void setGoal(String goal) {
        this.goal = goal;
    }

    public List<Ingredient> getGroceryList() {
        return groceryList;
    }

    public void setGroceryList(List<Ingredient> groceryList) {
        this.groceryList = groceryList;
    }

    public User(){
    	this.role = CUSTOMER_ROLE;
	}

    public Long getId() {
        return id;
    }

    public void setId(Long id) {
        this.id = id;
    }

    /**
     * @return the role
     */
    public String getRole() {

    	return role;
    }

    /**
     * @param role the role to set
     */
    public void setRole(String role) {

    	this.role = role;
    }

    public String getUserName() {

    	return userName;
    }

    public void setUserName(String userName) {

    	this.userName = userName;
    }

    public String getPassword() {

    	return password;
    }

    public void setPassword(String password) {

    	this.password = password;
    }

    public String getConfirmPassword() {

    	return confirmPassword;
    }

    public void setConfirmPassword(String confirmPassword) {

    	this.confirmPassword = confirmPassword;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }


    @Override
    public String toString() {
        return firstName+ " " + lastName;
    }
}
