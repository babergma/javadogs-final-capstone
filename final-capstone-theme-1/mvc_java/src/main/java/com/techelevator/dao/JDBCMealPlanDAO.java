package com.techelevator.dao;

import com.techelevator.entity.Ingredient;
import com.techelevator.entity.MealPlan;
import com.techelevator.entity.Measurement;
import com.techelevator.entity.Recipe;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;
import org.springframework.transaction.annotation.Transactional;

import javax.sql.DataSource;
import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.List;

/*
Ensure all of the JDBCS and Controllers follow Single Responsibility Principle
 */
@Component
public class JDBCMealPlanDAO implements MealPlanDao {

    private final JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCMealPlanDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }


    @Transactional
    @Override
    public MealPlan saveMealPlan(MealPlan mealPlan) {
        String sql = "INSERT INTO mealplan(mealplanname)" +
                " VALUES (?) RETURNING mealplan_id";
        Long newId = jdbcTemplate.queryForObject(sql, Long.class,
                mealPlan.getMealPlanName());
        mealPlan.setMealPlanId(newId);
        return mealPlan;
    }

    public MealPlan addAuthorToMealPlan(MealPlan mealPlan, Long user_id) {
        String sql = "INSERT INTO person_mealplan(mealplan_id, user_id)" +
                " VALUES (?, ?)";
        jdbcTemplate.update(sql, mealPlan.getMealPlanId(), user_id);
        return mealPlan;
    }

    @Override
    public List<MealPlan> getAllMealPlansByUserId(Long user_id) {
        String sql = "SELECT * " +
                " FROM mealplan " +
                " JOIN person_mealplan pm on mealplan.mealplan_id = pm.mealplan_id" +
                " WHERE user_id = ?";
        List<MealPlan> mealPlans = new ArrayList<>();
        SqlRowSet plan = jdbcTemplate.queryForRowSet(sql, user_id);
        while (plan.next()) {
            MealPlan thisMealPlan = mapResultsToMealPlan(plan);
            mealPlans.add(thisMealPlan);
        }
        return mealPlans;
    }




    @Override
    public List<Ingredient> getAllIngredientsByMealPlan(MealPlan mealPlan) {
        String sql = "SELECT * " +
                " FROM ingredient i" +
                " JOIN ingredient_recipe ir on i.ingredient_id = ir.ingredient_id" +
                " JOIN recipe_mealplan rm on ir.recipe_id = rm.recipe_id" +
                " JOIN measurementtype m on ir.measurementtype_id = m.measurementtype_id " +
                " JOIN mealplan m2 on rm.mealplan_id = m2.mealplan_id " +
                " WHERE m2.mealplan_id = ?";
        List<Ingredient> ingredients = new ArrayList<>();
        SqlRowSet planIngredients = jdbcTemplate.queryForRowSet(sql, mealPlan.getMealPlanId());
        while (planIngredients.next()) {
            Ingredient thisIngredient = new Ingredient();
            thisIngredient.setIngredientId(planIngredients.getInt("ingredient_id"));
            thisIngredient.setIngredientName(planIngredients.getString("ingredientname"));
            thisIngredient.setMeasurementAmount(planIngredients.getInt("measurementamount"));
            List<Measurement> measurementList = Measurement.getAllMeasurements();
            for (Measurement measurement : measurementList) {
                if (measurement.name().equalsIgnoreCase(planIngredients.getString("measurementname"))) {
                    thisIngredient.setMeasurement(measurement);
                    break;
                }
            }

            ingredients.add(thisIngredient);
        }
        return ingredients;
    }

    //addRecipeToMealPlan
    @Transactional
    @Override
    public void addRecipeToMealPlan(MealPlan mealPlan, Recipe recipe) {

        String sql = "INSERT INTO recipe_mealplan(mealplan_id, recipe_id, dayofweek, timeofday) " +
                " VALUES (?,?,?,?)";
        jdbcTemplate.update(sql, mealPlan.getMealPlanId(), recipe.getRecipeId(), recipe.getDayOfWeek().getValue(), recipe.getTimeOfDay().getTimeOfDayId());
    }

    @Transactional
    public MealPlan addRecipeListToMealPlan(MealPlan mealPlan, List<Recipe> recipeList) {
        MealPlan newMealPlan = saveMealPlan(mealPlan);
        for (Recipe recipe : recipeList) {
            addRecipeToMealPlan(mealPlan, recipe);
        }
        return newMealPlan;
    }

    @Override
    public void updateMealPlan(MealPlan mealPlan) {
        String sql = "UPDATE mealplan " +
                " SET mealplanname = ?";
        jdbcTemplate.update(sql, mealPlan.getMealPlanName());
    }

    @Override
    public void deleteSingleRecipeFromMealPlan(Long mealPlan_id, Long recipe_id) {
        String sql = "DELETE FROM recipe_mealplan " +
                " WHERE mealplan_id = ? AND recipe_id = ?";
        jdbcTemplate.update(sql, mealPlan_id, recipe_id);
    }

    @Override
    public void updateMealPlanByRecipe(MealPlan mealPlan, Recipe recipe) {

    }

    @Override
    public MealPlan getMealPlanByMealPlanId(Long id) {
        String sqlSearchForMealPlan = "SELECT * " +
                "FROM person_mealplan " +
                "JOIN person p on person_mealplan.user_id = p.user_id " +
                "JOIN mealplan m on person_mealplan.mealplan_id = m.mealplan_id " +
                "WHERE m.mealplan_id = ?";
        MealPlan thisMealPlan = new MealPlan();
        SqlRowSet mealPlanResults = jdbcTemplate.queryForRowSet(sqlSearchForMealPlan, id);
        while (mealPlanResults.next()) {
            thisMealPlan = mapResultsToMealPlan(mealPlanResults);
        }
        thisMealPlan.setRecipeList(getAllRecipesByMealPlanId(id));
        return thisMealPlan;
    }

    private List<Recipe> getAllRecipesByMealPlanId(Long id) {
        String sql = "SELECT * " +
                "FROM recipe_mealplan " +
                "JOIN recipe r on recipe_mealplan.recipe_id = r.recipe_id " +
                "JOIN mealplan m on recipe_mealplan.mealplan_id = m.mealplan_id " +
                "JOIN dayofweek d on d.dayofweek = recipe_mealplan.dayofweek " +
                "JOIN timeofday t on t.timeofday = recipe_mealplan.timeofday " +
                "WHERE m.mealplan_id = ?";

        List<Recipe> recipes = new ArrayList<>();
        SqlRowSet results = jdbcTemplate.queryForRowSet(sql, id);
        while (results.next()) {
            /*
            This method already exists in mapResultsToRecipe in the
            JDBCRecipeDao
            Figure out how to refactor this such that we can call
            this method and not repeat work
             */
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
            recipe.setDayOfWeek(DayOfWeek.of(results.getInt("dayofweek")));
            List<TimeOfDay> timeOfDayList = TimeOfDay.getAllTimeOfDay();
            for (TimeOfDay timeOfDay : timeOfDayList) {
                if (timeOfDay.name().equalsIgnoreCase(results.getString("timename"))) {
                    recipe.setTimeOfDay(timeOfDay);
                    break;
                }
            }
            recipes.add(recipe);
        }

        return recipes;
    }

    @Override
    public void addRecipeListToMealPLan(MealPlan mealPlan, List<Recipe> recipeList) {

    }

    public MealPlan mapResultsToMealPlan(SqlRowSet results) {
        MealPlan mealPlan = new MealPlan();
        mealPlan.setMealPlanId(results.getLong("mealplan_id"));
        mealPlan.setMealPlanName(results.getString("mealplanname"));
        return mealPlan;
    }


}