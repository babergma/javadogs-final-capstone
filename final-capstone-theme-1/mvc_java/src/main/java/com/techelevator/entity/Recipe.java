package com.techelevator.entity;

import com.techelevator.dao.TimeOfDay;

import java.time.DayOfWeek;
import java.util.List;

public class Recipe {
    private Long recipeId;
    private Long authorID;
    private String recipeName;
    private int cookTime;
    private int servingSize;
    private int calories;
    private String pictureUrl = "";
    private String cookingInstruction;
    private boolean visible;
    private List<Ingredient> ingredientList;
    private DayOfWeek dayOfWeek;
    private TimeOfDay timeOfDay;

    public void setDayOfWeek(DayOfWeek dayOfWeek) {
        this.dayOfWeek = dayOfWeek;
    }

    public TimeOfDay getTimeOfDay() {
        return timeOfDay;
    }

    public void setTimeOfDay(TimeOfDay timeOfDay) {
        this.timeOfDay = timeOfDay;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public DayOfWeek getDayOfWeek() {
        return dayOfWeek;
    }

    private String type;

    public Long getRecipeId() {
        return recipeId;
    }

    public Long getAuthorID() {
        return authorID;
    }

    public String getRecipeName() {
        return recipeName;
    }

    public int getCookTime() {
        return cookTime;
    }

    public int getServingSize() {
        return servingSize;
    }

    public void setIngredientList(List<Ingredient> ingredientList) {
        this.ingredientList = ingredientList;
    }

    public int getCalories() {
        return calories;
    }

    public String getPictureUrl() {
        return pictureUrl;
    }

    public String getCookingInstruction() {
        return cookingInstruction;
    }

    public boolean isVisible() {
        return visible;
    }

    public void setRecipeId(Long recipeId) {
        this.recipeId = recipeId;
    }

    public void setAuthorID(Long authorID) {
        this.authorID = authorID;
    }

    public void setRecipeName(String recipeName) {
        this.recipeName = recipeName;
    }

    public void setCookTime(int cookTime) {
        this.cookTime = cookTime;
    }

    public void setServingSize(int servingSize) {
        this.servingSize = servingSize;
    }

    public void setCalories(int calories) {
        this.calories = calories;
    }

    public void setPictureUrl(String pictureUrl) {
        this.pictureUrl = pictureUrl;
    }

    public void setCookingInstruction(String cookingInstruction) {
        this.cookingInstruction = cookingInstruction;
    }

    public void setVisible(boolean visible) {
        this.visible = visible;
    }

    public List<Ingredient> getIngredientList() {
        return ingredientList;
    }
}
