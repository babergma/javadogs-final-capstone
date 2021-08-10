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
public class JDBCIngredientDAO implements IngredientDAO{

    private JdbcTemplate jdbcTemplate;

    @Autowired
    public JDBCIngredientDAO(DataSource dataSource) {
        this.jdbcTemplate = new JdbcTemplate(dataSource);
    }

    /**
     * @param ingredient <i>The ingredient  to be inserted into the database.</i>
     * @throws ClassCastException if the list contains elements that are not
     *         <i>mutually comparable</i> (for example, strings and integers).
     */

    @Override
    public void saveIngredient(Ingredient ingredient) {
        jdbcTemplate.update("INSERT INTO ingredient(ingredientname) " +
                "VALUES (?)",
                ingredient.getIngredientName());

    }


    @Override
    public List<Ingredient> searchForIngredient(String ingredientName) {
        String sqlSearchForIngredient = "SELECT * " +
                "FROM ingredient " +
                "WHERE UPPER(ingredientname) = ? ";
        List<Ingredient> ingredientList = new ArrayList<>();
        SqlRowSet ingredient = jdbcTemplate.queryForRowSet(sqlSearchForIngredient, ingredientName.toUpperCase());
        if (ingredient.next()) {
            Ingredient thisIngredient = new Ingredient();
            thisIngredient.setIngredientID(ingredient.getInt("ingredient_id"));
            thisIngredient.setIngredientName(ingredient.getString("ingredientname"));
            ingredientList.add(thisIngredient);
        }
        return ingredientList;
    }

    /*
    Still need to connect this to the ingredient table so we can create ingredient object
     */
    public List<Ingredient> searchForIngredientByUserID(int user_id) {
        String sqlSearchForIngredient = "SELECT * " +
                "FROM grocerylist " +
                "WHERE user_id = ? ";
        List<Ingredient> ingredientList = new ArrayList<>();
        SqlRowSet ingredient = jdbcTemplate.queryForRowSet(sqlSearchForIngredient, user_id);
        if (ingredient.next()) {
            Ingredient thisIngredient = new Ingredient();
            thisIngredient.setIngredientID(ingredient.getInt("ingredient_id"));
            thisIngredient.setIngredientName(ingredient.getString("ingredientname"));
            ingredientList.add(thisIngredient);
        }
        return ingredientList;
    }




    public boolean searchForIngredientByID(int ingredientID) {
        return false;
    }

    public void removeIngredient(Ingredient ingredient) {

    }

//    @Override
//    public User getUserByUserName(String userName) {
//        String sqlSearchForUsername ="SELECT * "+
//                "FROM person "+
//                "WHERE UPPER(username) = ? ";
//
//        SqlRowSet user = jdbcTemplate.queryForRowSet(sqlSearchForUsername, userName.toUpperCase());
//        User thisUser = null;
//        if(user.next()) {
//            thisUser = new User();
//            thisUser.setId(user.getLong("user_id"));
//            thisUser.setUserName(user.getString("username"));
//            thisUser.setPassword(user.getString("pword"));
//            thisUser.setFirstName(user.getString("firstname"));
//            thisUser.setLastName(user.getString("lastname"));
//            thisUser.setRole(user.getString("role"));
//        }
//
//        return thisUser;
//    }
}
