package com.techelevator.entity;

import java.util.List;

public class Recipe {
    private int recipeId;
    private int authorID;
    private String recipeName;
    private int cookTime;
    private int servingSize;
    private int calories;
    private String pictureUrl;
    private String cookingInstruction;
    private boolean visible;
    private List<Ingredient> ingredientList;


    public int getRecipeId() {
        return recipeId;
    }

    public int getAuthorID() {
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

    public void setRecipeId(int recipeId) {
        this.recipeId = recipeId;
    }

    public void setAuthorID(int authorID) {
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
}
