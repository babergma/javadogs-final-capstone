package com.techelevator.dao;

import com.techelevator.entity.Ingredient;
import com.techelevator.entity.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Statement;
import java.util.ArrayList;
import java.util.List;

@Component
public class JDBCRecipeDAO implements RecipeDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCRecipeDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    @Override
    @Transactional
    public Recipe saveRecipe(Recipe recipe) {
        String sql = "INSERT INTO recipe(author_id, recipeName, cooktime, servingsize" +
                ", calories, cookinginstruction, visible)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?) RETURNING recipe_id";
        Long newId = jdbcTemplate.queryForObject(sql, Long.class,
                recipe.getAuthorID(),
                recipe.getRecipeName(),
                recipe.getCookTime(),
                recipe.getServingSize(),
                recipe.getCalories(),
                recipe.getCookingInstruction(),
                recipe.isVisible());
        recipe.setRecipeId(newId);
        return recipe;
    }

    public List<String> getIngredientTypes() {
        String sql = "";
        SqlRowSet ingredientTypeList = jdbcTemplate.queryForRowSet(sql);
        List<String> typeList = new ArrayList<>();
        while (ingredientTypeList.next()) {
            typeList.add(ingredientTypeList.getString("measurementtypename"));
        }
        return typeList;
    }

    @Transactional
    public void addIngredientToRecipe(Recipe recipe, Ingredient ingredient) {
        String sql = "INSERT INTO ingredient_recipe(recipe_id, ingredient_id, measurementamount, measurementtype_id) " +
                " VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, recipe.getRecipeId(), ingredient.getIngredientID(), ingredient.getMeasurementAmount(), ingredient.getMeasurement().getMeasurementid());
    }

    @Transactional
    public Recipe addIngredientListToRecipe(Recipe recipe, List<Ingredient> ingredients) {
        Recipe newRecipe = saveRecipe(recipe);
        for (Ingredient ingredient : ingredients) {
            addIngredientToRecipe(recipe, ingredient);
        }
        return newRecipe;
    }

    @Override
    public void updateRecipeByRecipeId(Recipe recipe) {
        String sqlUpdateRecipe = "UPDATE recipe " +
                " SET recipename = ?," +
                " cooktime = ?," +
                " calories = ?," +
                " cookinginstruction = ?," +
                " visible = ?" +
                " WHERE recipe_id = ?";
        jdbcTemplate.update(sqlUpdateRecipe, recipe.getRecipeName(), recipe.getCookTime(),
                recipe.getCalories(), recipe.getCookingInstruction(), recipe.isVisible(), recipe.getRecipeId());
    }

    @Override
    public List<Recipe> getAllRecipesByUserId(Long user_id) {
        String sqlSearchForRecipe = "SELECT * " +
                "FROM recipe " +
                "JOIN person ON recipe.author_id = person.user_id " +
                "WHERE user_id = ?";
        List<Recipe> recipeList = new ArrayList<>();
        SqlRowSet recipe = jdbcTemplate.queryForRowSet(sqlSearchForRecipe, user_id);
        while (recipe.next()) {
            Recipe thisRecipe = new Recipe();
            thisRecipe.setRecipeId(recipe.getLong("recipe_id"));
            thisRecipe.setRecipeName(recipe.getString("recipename"));
            recipeList.add(thisRecipe);
        }
        return recipeList;
    }

    @Override
    public List<Ingredient> getAllIngredientsByRecipeId(Long recipe_id) {
        String sql = "SELECT * " +
                "FROM ingredient i " +
                "JOIN ingredient_recipe ir ON i.ingredient_id = ir.ingredient_id " +
                "JOIN recipe r ON r.recipe_id = ir.recipe_id";
        List<Ingredient> ingredients = new ArrayList<>();
        SqlRowSet ingredientList = jdbcTemplate.queryForRowSet(sql);
        while (ingredientList.next()) {
            Ingredient thisIngredient = new Ingredient();
            thisIngredient.setIngredientID(ingredientList.getInt("ingredient_id"));
            thisIngredient.setIngredientName(ingredientList.getString("ingredientname"));
            ingredients.add(thisIngredient);
        }
        return ingredients;
    }

    @Override
    public Recipe getRecipeByRecipeId(Long recipe_id) {
        String sql = "SELECT * " +
                "FROM recipe " +
                "WHERE recipe_id = ? ";
        SqlRowSet recipe = jdbcTemplate.queryForRowSet(sql, recipe_id);
        Recipe thisRecipe = new Recipe();
        thisRecipe.setRecipeId(recipe.getLong("recipe_id"));

        return thisRecipe;
    }


    @Transactional
    public void deleteRecipeByRecipeID(Long recipe_id) {
        deleteFromIngredientRecipe(recipe_id);
        String sql = "DELETE FROM recipe where recipe_id = ?";
        jdbcTemplate.update(sql, recipe_id);
    }

    @Transactional
    public void deleteFromIngredientRecipe(Long recipe_id) {
        String sql = "DELETE FROM ingredient_recipe WHERE recipe_id = ?";
        jdbcTemplate.update(sql, recipe_id);
    }


}


