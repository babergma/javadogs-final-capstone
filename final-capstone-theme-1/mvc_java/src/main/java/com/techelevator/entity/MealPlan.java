package com.techelevator.entity;

import java.util.ArrayList;
import java.util.List;

public class MealPlan {
    private Long mealPlanId;
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


}
