package com.techelevator.dao;

import com.techelevator.entity.Ingredient;
import com.techelevator.entity.Recipe;

import java.util.List;

public interface RecipeDao {
    public Recipe saveRecipe(Recipe recipe);

    public List<Recipe> getAllRecipesByUserId(Long user_id);

    public List<Ingredient> getAllIngredientsByRecipeId(Long recipe_id);

    public Recipe getRecipeByRecipeId(Long recipe_id);

    public Recipe addIngredientListToRecipe(Recipe recipe, List<Ingredient> ingredients);

    public void deleteRecipeByRecipeID(Long recipe_id);

    public void updateRecipeByRecipeId(Recipe recipe);
}
