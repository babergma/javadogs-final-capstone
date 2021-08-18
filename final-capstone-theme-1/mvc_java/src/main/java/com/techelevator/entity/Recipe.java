package com.techelevator.entity;

import org.hibernate.validator.constraints.NotBlank;

import javax.validation.constraints.Min;
import javax.validation.constraints.NotNull;
import java.time.DayOfWeek;
import java.util.List;
import java.util.Objects;

public class Recipe {
    private Long recipeId;
    private Long authorID;

    @NotBlank(message = "Name is required")
    private String recipeName;

    @Min(value=1, message = "Please enter a value > 1")
    @NotNull(message = "You must enter a cook time")
    private int cookTime;

    @Min(value=1, message = "Please enter a value > 1")
    @NotNull(message = "You must enter a serving size")
    private int servingSize;

    @Min(value=1, message = "Please enter a value > 1")
    @NotNull(message = "You must enter the amount of calories")
    private int calories;
    private String pictureUrl="placeholder.png";

    @NotBlank(message = "Cooking instructions are required")
    private String cookingInstruction;
    private boolean visible;
    private List<Ingredient> ingredientList;
    private DayOfWeek dayOfWeek;
    private TimeOfDay timeOfDay;
    private List<Category> categoryList;

    public List<Category> getCategoryList() {
        return categoryList;
    }

    public void setCategoryList(List<Category> categoryList) {
        this.categoryList = categoryList;
    }

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

    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        Recipe recipe = (Recipe) o;
        return getCookTime() == recipe.getCookTime() && getServingSize() == recipe.getServingSize() && getCalories() == recipe.getCalories() && isVisible() == recipe.isVisible() && Objects.equals(getRecipeId(), recipe.getRecipeId()) && Objects.equals(getAuthorID(), recipe.getAuthorID()) && Objects.equals(getRecipeName(), recipe.getRecipeName()) && Objects.equals(getPictureUrl(), recipe.getPictureUrl()) && Objects.equals(getCookingInstruction(), recipe.getCookingInstruction()) && Objects.equals(getIngredientList(), recipe.getIngredientList()) && getDayOfWeek() == recipe.getDayOfWeek() && getTimeOfDay() == recipe.getTimeOfDay() && Objects.equals(getType(), recipe.getType());
    }

    @Override
    public int hashCode() {
        return Objects.hash(getRecipeId(), getAuthorID(), getRecipeName(), getCookTime(), getServingSize(), getCalories(), getPictureUrl(), getCookingInstruction(), isVisible(), getIngredientList(), getDayOfWeek(), getTimeOfDay(), getType());
    }
}