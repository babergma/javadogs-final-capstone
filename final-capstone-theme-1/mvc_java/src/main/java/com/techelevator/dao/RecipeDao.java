package com.techelevator.dao;

import com.techelevator.entity.Ingredient;
import com.techelevator.entity.Recipe;

import java.util.List;

public interface RecipeDao {
    public Recipe saveRecipe(Recipe recipe);

    public List<Recipe> getAllRecipesByUserId(Long user_id);
    public List<Recipe> getAllPublicRecipes();

    public List<Ingredient> getAllIngredientsByRecipeId(Long recipe_id);

    public Recipe getRecipeByRecipeId(Long recipe_id);

    public Recipe addIngredientListToRecipe(Recipe recipe, List<Ingredient> ingredients);

    public void deleteRecipeByRecipeID(Long recipe_id);

    public void updateRecipeByRecipeId(Recipe recipe, List<Ingredient> ingredients);
    public void updateRecipeByRecipeId(Recipe recipe, Ingredient ingredient);

    void updateRecipe(Recipe recipe);
    public List<Recipe> searchForRecipeByFilter(String searchText, String filterBy);

    public void deleteSingleIngredientFromRecipe(Long recipe_id, Long ingredient_id);
}
