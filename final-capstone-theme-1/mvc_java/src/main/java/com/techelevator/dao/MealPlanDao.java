package com.techelevator.dao;

import com.techelevator.entity.Ingredient;
import com.techelevator.entity.MealPlan;
import com.techelevator.entity.Recipe;

import java.util.List;

public interface MealPlanDao {

    public List<MealPlan> getAllMealPlansByUserId(Long user_id);
    public List<Ingredient> getAllIngredientsByMealPlan(MealPlan mealPlan);
    public MealPlan addRecipeListToMealPlan(MealPlan mealPlan, List<Recipe> recipeList);
    void updateMealPlan(MealPlan mealPlan);
    public void updateMealPlanByRecipe(MealPlan mealPlan, Recipe recipe);
    public MealPlan getMealPlanByMealPlanId(Long id);
    public void addRecipeListToMealPLan(MealPlan mealPlan, List<Recipe> recipeList);
    public void addRecipeToMealPlan(MealPlan mealPlan, Recipe recipe);
    public MealPlan saveMealPlan(MealPlan mealPlan);
    public MealPlan addAuthorToMealPlan(MealPlan mealPlan, Long user_id);

    void deleteSingleRecipeFromMealPlan(Long mealPlanId, Long thisRecipeID, Long thisDayOfWeekId, Long thisDayOfWeekId1);
}
