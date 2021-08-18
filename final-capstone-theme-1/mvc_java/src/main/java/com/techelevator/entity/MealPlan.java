package com.techelevator.entity;

import org.hibernate.validator.constraints.NotBlank;

import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class MealPlan {
    private Long mealPlanId;

    @NotBlank(message = "Name is required")
    private String mealPlanName;
    private List<Recipe> recipeList = new ArrayList<>();
    private Recipe mainDish;


    public Long getMealPlanId() {
        return mealPlanId;
    }

    public String getMealPlanName() {
        return mealPlanName;
    }

    public List<Recipe> getRecipeList() {
        return recipeList;
    }

    public Recipe getMainDish() {
        return mainDish;
    }

    public void setMealPlanId(Long mealPlanId) {
        this.mealPlanId = mealPlanId;
    }

    public void setMealPlanName(String mealPlanName) {
        this.mealPlanName = mealPlanName;
    }

    public void setRecipeList(List<Recipe> recipeList) {
        this.recipeList = recipeList;
    }

    public void setMainDish(Recipe mainDish) {
        this.mainDish = mainDish;
    }

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        MealPlan mealPlan = (MealPlan) o;
        return Objects.equals(getMealPlanId(), mealPlan.getMealPlanId()) && Objects.equals(getMealPlanName(), mealPlan.getMealPlanName()) && Objects.equals(getRecipeList(), mealPlan.getRecipeList()) && Objects.equals(getMainDish(), mealPlan.getMainDish());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getMealPlanId(), getMealPlanName(), getRecipeList(), getMainDish());
    }
}
