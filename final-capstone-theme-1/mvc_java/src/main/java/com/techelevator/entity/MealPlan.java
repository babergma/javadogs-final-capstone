package com.techelevator.entity;

import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.List;

public class MealPlan {
    private int mealPlanID;
    private String mealPlanName;
    private List<Recipe> recipeList = new ArrayList<>();
    private Recipe mainDish;


    public int getMealPlanID() {
        return mealPlanID;
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

    public void setMealPlanID(int mealPlanID) {
        this.mealPlanID = mealPlanID;
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
