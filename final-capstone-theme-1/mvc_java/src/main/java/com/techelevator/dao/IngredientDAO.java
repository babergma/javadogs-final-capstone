package com.techelevator.dao;

import com.techelevator.entity.Ingredient;

import java.util.List;

public interface IngredientDAO {

    public List<Ingredient> searchForIngredient(String ingredientName);
    public void saveIngredient(Ingredient ingredient);
    public List<Ingredient> getAllIngredients();
    public List<Ingredient> searchForIngredientByUserID(int user_id);

}
