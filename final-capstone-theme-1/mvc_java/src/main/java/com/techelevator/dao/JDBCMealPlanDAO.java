package com.techelevator.dao;

import com.techelevator.entity.Ingredient;
import com.techelevator.entity.MealPlan;
import com.techelevator.entity.Recipe;

import java.util.List;

public class JDBCMealPlanDAO implements MealPlanDao {

    @Override
    public List<MealPlan> getAllMealPlansByUserId(Long user_id) {
        return null;
    }

    @Override
    public List<Ingredient> getAllIngredientsByMealPlan(MealPlan mealPlan) {
        return null;
    }

    @Override
    public MealPlan addRecipeListToMealPlan(MealPlan mealPlan, List<Recipe> recipeList) {
        return null;
    }

    @Override
    public void updateMealPlan(MealPlan mealPlan) {

    }

    @Override
    public void deleteSingleRecipeFromMealPlan(Long mealPlan_id, Long recipe_id) {

    }

    @Override
    public void updateMealPlanByRecipe(MealPlan mealPlan, Recipe recipe) {

    }
}
