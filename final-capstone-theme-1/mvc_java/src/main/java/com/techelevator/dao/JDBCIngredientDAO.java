package com.techelevator.dao;

import com.techelevator.entity.Ingredient;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.jdbc.core.JdbcTemplate;
import org.springframework.jdbc.support.rowset.SqlRowSet;
import org.springframework.stereotype.Component;

import javax.sql.DataSource;
import java.util.ArrayList;
import java.util.List;

@Component
public class JDBCIngredientDAO implements IngredientDAO {

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCIngredientDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    /**
     * @param ingredient <i>The ingredient  to be inserted into the database.</i>
     * @throws ClassCastException if the list contains elements that are not
     *                            <i>mutually comparable</i> (for example, strings and integers).
     */

    @Override
    public void saveIngredient(Ingredient ingredient) {
        jdbcTemplate.update("INSERT INTO ingredient(ingredientname) " +
                        "VALUES (?)",
                ingredient.getIngredientName());

    }

    @Override
    public List<Ingredient> getAllIngredients() {
        String sqlSearchForIngredient = "SELECT * " +
                "FROM ingredient ";
        List<Ingredient> ingredientList = new ArrayList<>();
        SqlRowSet ingredient = jdbcTemplate.queryForRowSet(sqlSearchForIngredient);
        while (ingredient.next()) {
            Ingredient thisIngredient = new Ingredient();
            thisIngredient.setIngredientId(ingredient.getInt("ingredient_id"));
            thisIngredient.setIngredientName(ingredient.getString("ingredientname"));
            ingredientList.add(thisIngredient);
        }
        return ingredientList;
    }


    @Override
    public Ingredient searchForIngredient(String ingredientName) {
        String sql = "SELECT * " +
                "FROM ingredient " +
                "WHERE ingredientname ILIKE ? ";
        SqlRowSet ingredient = jdbcTemplate.queryForRowSet(sql, ingredientName);
        Ingredient thisIngredient = new Ingredient();
        if (ingredient.next()) {

            thisIngredient.setIngredientId(ingredient.getInt("ingredient_id"));
            thisIngredient.setIngredientName(ingredient.getString("ingredientname"));
        }

        return thisIngredient;
    }

    public List<Ingredient> searchForIngredientByUserID(int user_id) {
        String sqlSearchForIngredient = "SELECT * " +
                "FROM grocerylist " +
                " JOIN ingredient ON grocerylist.ingredient_id = ingredient.ingredient_id " +
                " WHERE user_id = ? ";
        List<Ingredient> ingredientList = new ArrayList<>();
        SqlRowSet ingredient = jdbcTemplate.queryForRowSet(sqlSearchForIngredient, user_id);
        if (ingredient.next()) {
            Ingredient thisIngredient = new Ingredient();
            thisIngredient.setIngredientId(ingredient.getInt("ingredient_id"));
            thisIngredient.setIngredientName(ingredient.getString("ingredientname"));
            ingredientList.add(thisIngredient);
        }
        return ingredientList;
    }

    @Override
    public void updateIngredientByIngredientId(Ingredient ingredient) {
        String sqlUpdateIngredient = "UPDATE ingredient " +
                " SET ingredientname = ?" +
                " WHERE ingredient_id = ?";
        jdbcTemplate.update(sqlUpdateIngredient, ingredient.getIngredientName());
    }

    public boolean searchForIngredientByID(int ingredientID) {
        return false;
    }

    public void removeIngredient(Ingredient ingredient) {

    }

}
