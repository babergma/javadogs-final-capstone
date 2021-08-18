package com.techelevator.dao;

import com.techelevator.entity.Category;
import com.techelevator.entity.Ingredient;
import com.techelevator.entity.Measurement;
import com.techelevator.entity.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;
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
        System.out.println(recipe.getRecipeId());
        String sql = "INSERT INTO recipe(author_id, recipeName, cooktime, servingsize" +
                ", calories, pictureurl, cookinginstruction, visible)" +
                " VALUES (?, ?, ?, ?, ?, ?, ?, ?) RETURNING recipe_id";
        Long newId = jdbcTemplate.queryForObject(sql, Long.class,
                recipe.getAuthorID(),
                recipe.getRecipeName(),
                recipe.getCookTime(),
                recipe.getServingSize(),
                recipe.getCalories(),
                recipe.getPictureUrl(),
                recipe.getCookingInstruction(),
                recipe.isVisible());
        recipe.setRecipeId(newId);
        updateRecipeCategories(recipe);
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

    @Override
    public List<Recipe> getAllRecipesByUserId(Long user_id) {
        String sqlSearchForRecipe = "SELECT * " +
                "FROM recipe " +
                "JOIN person ON recipe.author_id = person.user_id " +
                "WHERE user_id = ? ";
        List<Recipe> recipeList = new ArrayList<>();
        SqlRowSet recipe = jdbcTemplate.queryForRowSet(sqlSearchForRecipe, user_id);
        while (recipe.next()) {
            Recipe thisRecipe = mapResultstoRecipe(recipe);
            recipeList.add(thisRecipe);
        }
        return recipeList;
    }

    @Override
    public List<Recipe> getAllPublicRecipes() {
        String sqlSearchForRecipe = "SELECT * " +
                "FROM recipe " +
                "JOIN person ON recipe.author_id = person.user_id " +
                "WHERE visible = ?";
        List<Recipe> recipeList = new ArrayList<>();
        SqlRowSet recipe = jdbcTemplate.queryForRowSet(sqlSearchForRecipe, true);
        while (recipe.next()) {
            Recipe thisRecipe = mapResultstoRecipe(recipe);
            recipeList.add(thisRecipe);
        }
        return recipeList;
    }

    @Override
    public List<Ingredient> getAllIngredientsByRecipeId(Long recipe_id) {
        String sql = "SELECT * " +
                "FROM ingredient i " +
                "JOIN ingredient_recipe ir ON i.ingredient_id = ir.ingredient_id " +
                "JOIN recipe r ON r.recipe_id = ir.recipe_id " +
                " JOIN measurementtype m on ir.measurementtype_id = m.measurementtype_id " +
                "WHERE r.recipe_id = ?";
        List<Ingredient> ingredients = new ArrayList<>();
        SqlRowSet ingredientList = jdbcTemplate.queryForRowSet(sql, recipe_id);
        while (ingredientList.next()) {
            Ingredient thisIngredient = new Ingredient();
            thisIngredient.setIngredientId(ingredientList.getInt("ingredient_id"));
            thisIngredient.setIngredientName(ingredientList.getString("ingredientname"));
            thisIngredient.setMeasurementAmount(ingredientList.getInt("measurementamount"));
            List<Measurement> measurementList = Measurement.getAllMeasurements();
            for (Measurement measurement : measurementList) {
                if(measurement.name().equalsIgnoreCase(ingredientList.getString("measurementname"))){
                    thisIngredient.setMeasurement(measurement);
                    break;
                }
            }
            ingredients.add(thisIngredient);
        }
        return ingredients;
    }

    @Override
    public Recipe getRecipeByRecipeId(Long recipe_id) {
        String sql = "SELECT * " +
                "FROM recipe " +
                "WHERE recipe.recipe_id = ?";
        SqlRowSet recipe = jdbcTemplate.queryForRowSet(sql, recipe_id);
        Recipe thisRecipe = new Recipe();
        while(recipe.next()) {
            thisRecipe = mapResultstoRecipe(recipe);
        }
        thisRecipe.setIngredientList(getAllIngredientsByRecipeId(thisRecipe.getRecipeId()));
        return thisRecipe;
    }

    @Transactional
    public void addIngredientToRecipe(Recipe recipe, Ingredient ingredient) {
        String sql = "INSERT INTO ingredient_recipe(recipe_id, ingredient_id, measurementamount, measurementtype_id) " +
                " VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, recipe.getRecipeId(), ingredient.getIngredientId(), ingredient.getMeasurementAmount(), ingredient.getMeasurement().getMeasurementId());
    }

    @Transactional
    public Recipe addIngredientListToRecipe(Recipe recipe, List<Ingredient> ingredients) {
        Recipe newRecipe = saveRecipe(recipe);
        for (Ingredient ingredient : ingredients) {
            addIngredientToRecipe(recipe, ingredient);
        }
        return newRecipe;
    }

    public void updateRecipe(Recipe recipe){
        String sqlUpdateRecipe = "UPDATE recipe " +
                " SET recipename = ?," +
                " cooktime = ?," +
                " servingsize = ?," +
                " calories = ?," +
                " cookinginstruction = ?," +
                " visible = ?" +
                " WHERE recipe_id = ?";
        jdbcTemplate.update(sqlUpdateRecipe, recipe.getRecipeName(), recipe.getCookTime(), recipe.getServingSize(),
                recipe.getCalories(), recipe.getCookingInstruction(), recipe.isVisible(), recipe.getRecipeId());
        updateRecipeCategories(recipe);
    }

    @Transactional
    public Recipe updateRecipeCategories(Recipe recipe){

        String sqlRemoveExistingCategories = "DELETE FROM recipe_category " +
                "WHERE recipe_id = ?";
        jdbcTemplate.update(sqlRemoveExistingCategories, recipe.getRecipeId());
        String sqlInsertCategories = "INSERT INTO recipe_category(recipe_id, category_id)" +
                " VALUES (?, ?)";
        for (Category category : recipe.getCategoryList()) {
            jdbcTemplate.update(sqlInsertCategories, recipe.getRecipeId(), category.getCategoryId());
        }
        return recipe;
    }




    @Override
    @Transactional
    public void updateRecipeByRecipeId(Recipe recipe, List<Ingredient> ingredients) {
        String sqlUpdateRecipe = "UPDATE recipe " +
                " SET recipename = ?," +
                " cooktime = ?," +
                " servingsize = ?," +
                " calories = ?," +
                " cookinginstruction = ?," +
                " visible = ?" +
                " WHERE recipe_id = ?";
        jdbcTemplate.update(sqlUpdateRecipe, recipe.getRecipeName(), recipe.getCookTime(), recipe.getServingSize(),
                recipe.getCalories(), recipe.getCookingInstruction(), recipe.isVisible(), recipe.getRecipeId());
        for (Ingredient ingredient : ingredients) {
            String sql = "INSERT INTO ingredient_recipe(recipe_id, ingredient_id, measurementamount, measurementtype_id) " +
                    " VALUES (?, ?, ?, ?)";
            jdbcTemplate.update(sql, recipe.getRecipeId(), ingredient.getIngredientId(), ingredient.getMeasurementAmount(), ingredient.getMeasurement().getMeasurementId());
        }
    }

    @Override
    @Transactional
    public void updateRecipeByRecipeId(Recipe recipe, Ingredient ingredient) {
        String sqlUpdateRecipe = "UPDATE recipe " +
                " SET recipename = ?," +
                " cooktime = ?," +
                " servingsize = ?," +
                " calories = ?," +
                " cookinginstruction = ?," +
                " visible = ?" +
                " WHERE recipe_id = ?";
        jdbcTemplate.update(sqlUpdateRecipe, recipe.getRecipeName(), recipe.getCookTime(), recipe.getServingSize(),
                recipe.getCalories(), recipe.getCookingInstruction(), recipe.isVisible(), recipe.getRecipeId());
        String sql = "INSERT INTO ingredient_recipe(recipe_id, ingredient_id, measurementamount, measurementtype_id) " +
                " VALUES (?, ?, ?, ?)";
        jdbcTemplate.update(sql, recipe.getRecipeId(), ingredient.getIngredientId(), ingredient.getMeasurementAmount(), ingredient.getMeasurement().getMeasurementId());
    }

    public Recipe mapResultstoRecipe(SqlRowSet results){
        Recipe recipe = new Recipe();
        recipe.setRecipeId(results.getLong("recipe_id"));
        recipe.setRecipeName(results.getString("recipename"));
        recipe.setAuthorID(results.getLong("author_id"));
        recipe.setCookTime(results.getInt("cooktime"));
        recipe.setServingSize(results.getInt("servingsize"));
        recipe.setCalories(results.getInt("calories"));
        recipe.setPictureUrl(results.getString("pictureurl"));
        recipe.setCookingInstruction(results.getString("cookingInstruction"));
        recipe.setVisible(results.getBoolean("visible"));
        mapCategoryToRecipe(recipe);
        return recipe;
    }

    public Recipe mapCategoryToRecipe(Recipe recipe){
        String sqlSearchForRecipeCategory = "SELECT * FROM recipe_category " +
                "JOIN category c on c.category_id = recipe_category.category_id " +
                "WHERE recipe_id = ?";
        SqlRowSet results = jdbcTemplate.queryForRowSet(sqlSearchForRecipeCategory, recipe.getRecipeId());
        List<Category> categories = Category.getAllCategories();
        List<Category> categoryList = new ArrayList<>();
        while (results.next()) {
            for (Category category : categories) {
                if (category.getAbbreviation().equalsIgnoreCase(results.getString("categoryname"))) {
                    categoryList.add(category);
                }
            }
        }
        recipe.setCategoryList(categoryList);
        return recipe;
    }

    @Transactional
    public void deleteRecipeByRecipeID(Long recipe_id) {
        deleteRecipeFromIngredientRecipe(recipe_id);
        String sql = "DELETE FROM recipe where recipe_id = ?";
        jdbcTemplate.update(sql, recipe_id);
    }

    @Transactional
    public void deleteRecipeFromIngredientRecipe(Long recipe_id) {
        String sql = "DELETE FROM ingredient_recipe WHERE recipe_id = ?";
        jdbcTemplate.update(sql, recipe_id);
    }

    @Transactional
    public void deleteSingleIngredientFromRecipe(Long recipe_id, Long ingredient_id) {
        String sql = "DELETE FROM ingredient_recipe WHERE recipe_id = ? AND ingredient_id = ?";
        jdbcTemplate.update(sql, recipe_id, ingredient_id);
    }

    @Transactional
    public void deleteSingleIngredientFromRecipe(Long recipe_id, Long ingredient_id, Long measurementId) {
        String sql = "DELETE FROM ingredient_recipe WHERE recipe_id = ? AND ingredient_id = ? AND ingredient_recipe.measurementamount = ? AND ingredient_recipe.measurementtype_id = ?";
        jdbcTemplate.update(sql, recipe_id, ingredient_id, measurementId);
    }

    @Override
    public List<Recipe> searchForRecipeByFilter(String searchText, String filterBy){
        List<Recipe> recipeList = new ArrayList<>();
        searchText = "%" + searchText + "%";
        SqlRowSet recipe;
        String sqlSearchForRecipe;
        if(filterBy.equalsIgnoreCase("ingredient")) {

            sqlSearchForRecipe = "SELECT DISTINCT * " +
                    "FROM ingredient_recipe " +
                    "JOIN ingredient i on ingredient_recipe.ingredient_id = i.ingredient_id " +
                    "JOIN recipe r on ingredient_recipe.recipe_id = r.recipe_id " +
                    "JOIN recipe_category rc on r.recipe_id = rc.recipe_id " +
                    "JOIN category c on rc.category_id = c.category_id " +
                    "WHERE ingredientname ILIKE ? AND visible=true";
            recipe = jdbcTemplate.queryForRowSet(sqlSearchForRecipe, searchText);
            while (recipe.next()) {
                Recipe thisRecipe = mapResultstoRecipe(recipe);
                recipeList.add(thisRecipe);
            }
        }
        else if(filterBy.equalsIgnoreCase("category")){
            sqlSearchForRecipe = "SELECT DISTINCT * " +
                    "FROM recipe_category " +
                    "JOIN category c on c.category_id = recipe_category.category_id " +
                    "JOIN recipe r on recipe_category.recipe_id = r.recipe_id " +
                    "WHERE categoryname ILIKE ? AND visible=true";
            recipe = jdbcTemplate.queryForRowSet(sqlSearchForRecipe, searchText);
            while (recipe.next()) {
                Recipe thisRecipe = mapResultstoRecipe(recipe);
                recipeList.add(thisRecipe);
            }

        }
        return recipeList;
    }

}