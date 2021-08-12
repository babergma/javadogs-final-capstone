package com.techelevator.controller;

import com.techelevator.dao.IngredientDAO;
import com.techelevator.dao.RecipeDao;
import com.techelevator.dao.UserDAO;
import com.techelevator.entity.*;
import com.techelevator.util.EmployeeDataTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.util.ArrayList;
import java.util.List;


@Controller
@SessionAttributes({"ingredientList", "recipe", "ingredient"})
@RequestMapping(path = "/user")
public class ContentController {

    private IngredientDAO ingredientDAO;
    private RecipeDao recipeDao;

    @Autowired
    public ContentController(IngredientDAO ingredientDAO, RecipeDao recipeDao) {
        this.recipeDao = recipeDao;
        this.ingredientDAO = ingredientDAO;
    }


    public ContentController() {
    }


    @RequestMapping(path = "/viewrecipe", method = RequestMethod.GET)
    public String displayViewRecipe(HttpSession session,
                                    ModelMap modelMap) {
        User user = (User) session.getAttribute("LOGGED_USER");
        List<Recipe> recipeList = recipeDao.getAllRecipesByUserId(user.getId());
        modelMap.put("recipeList", recipeList);
        return "viewrecipe";
    }


    @RequestMapping(path = "/grocerylist", method = RequestMethod.GET)
    public String displayGroceryList(HttpSession session) {
////		List<Ingredient> ingredientList = ingredientDAO.searchForIngredientByUserID();
//		session.setAttribute("ingredients", ingredientList);
        return "grocerylist";
    }

    @RequestMapping(path = "/addgrocerylist", method = RequestMethod.GET)
    public String displayAddGroceryList(HttpSession session) {
        List<Ingredient> ingredientList = ingredientDAO.getAllIngredients();
        session.setAttribute("ingredients", ingredientList);
        return "addgrocerylist";
    }


    @RequestMapping(path = "/addgrocerylist", method = RequestMethod.POST)
    public String processAddGroceryList(@RequestParam String input) {

        Ingredient ingredient = new Ingredient();
        ingredient.setIngredientName(input);
        ingredientDAO.saveIngredient(ingredient);

        return "redirect:addgrocerylist";
    }

    @RequestMapping(path = "/addrecipe", method = RequestMethod.GET)
    public String displayAddRecipe(ModelMap modelHolder,
                                   HttpSession session) {
        if (!modelHolder.containsKey("recipe")) {
            modelHolder.put("recipe", new Recipe());
        }
        modelHolder.put("ingredient", new Ingredient());

        if (!modelHolder.containsKey("ingredientList")) {
            List<Ingredient> ingredientList = new ArrayList<>();
            modelHolder.addAttribute("ingredientList", ingredientList);
        }
        modelHolder.put("measurements", Measurement.getAllMeasurements());
        modelHolder.put("displayIngredients", ingredientDAO.getAllIngredients());
        return "addrecipe";
    }

    @RequestMapping(path = "/editrecipe", method = RequestMethod.GET)
    public String displayEditRecipeDetails(ModelMap modelHolder,
                                           @RequestParam(required = false) Long id) {
        Recipe recipe = null;
        if (id != null) {
            recipe = recipeDao.getRecipeByRecipeId(id);
            modelHolder.put("recipe", recipe);
        } else {
            recipe = (Recipe) modelHolder.getAttribute("recipe");
        }
        modelHolder.put("ingredient", new Ingredient());


        List<Ingredient> ingredientList = recipeDao.getAllIngredientsByRecipeId(recipe.getRecipeId());
        modelHolder.addAttribute("ingredientList", ingredientList);

        modelHolder.put("measurements", Measurement.getAllMeasurements());
        modelHolder.put("displayIngredients", ingredientDAO.getAllIngredients());
        return "editrecipe";
    }


    @RequestMapping(path = "/addrecipe", method = RequestMethod.POST)
    public String addIngredientToIngredientList(@Valid @ModelAttribute("ingredient") Ingredient ingredient,
                                                BindingResult result,
                                                ModelMap modelHolder,
                                                HttpSession session
    ) {
        if (result.hasErrors()) {
            return "addrecipe";
        }
        List<Ingredient> ingredientList = (List<Ingredient>) modelHolder.getAttribute("ingredientList");
        modelHolder.put("measurements", Measurement.getAllMeasurements());
        modelHolder.put("displayIngredients", ingredientDAO.getAllIngredients());
        User user = (User) session.getAttribute("LOGGED_USER");
        ingredient.setIngredientID(ingredientDAO.searchForIngredient(ingredient.getIngredientName()).getIngredientID());

        ingredientList.add(ingredient);
        return "redirect:addrecipe";
    }

    @RequestMapping(path = "/editRecipeIngredients", method = RequestMethod.POST)
    public String editRecipeIngredients(ModelMap modelHolder,
                                        @ModelAttribute("ingredient") Ingredient ingredient,
                                        BindingResult result,
                                        HttpSession session) {
        if (result.hasErrors()) {
            return "editrecipe";
        }
        List<Ingredient> ingredientList = (List<Ingredient>) modelHolder.getAttribute("ingredientList");
        modelHolder.put("measurements", Measurement.getAllMeasurements());
        modelHolder.put("displayIngredients", ingredientDAO.getAllIngredients());
        ingredient.setIngredientID(ingredientDAO.searchForIngredient(ingredient.getIngredientName()).getIngredientID());
        ingredientList.add(ingredient);
        Recipe recipe = (Recipe) modelHolder.getAttribute("recipe");
        recipe.setIngredientList(ingredientList);
        recipeDao.updateRecipeByRecipeId(recipe,ingredient);


        return "redirect:editrecipe";
    }

    @RequestMapping(path = "/submitEditRecipe", method = RequestMethod.POST)
    public String submitEditRecipe(@Valid @ModelAttribute("recipe") Recipe recipe,
                                   BindingResult result,
                                   ModelMap modelHolder,
                                   HttpSession session, SessionStatus status) {
        if (result.hasErrors()) {
            return "testRecipes";
        }
        User user = (User) session.getAttribute("LOGGED_USER");
        recipe.setAuthorID(user.getId());
        List<Ingredient> ingredientList = (List<Ingredient>) modelHolder.getAttribute("ingredientList");
        recipe.setIngredientList(ingredientList);
        recipeDao.updateRecipe(recipe);
        return "viewrecipe";
    }


    @RequestMapping(path = "/submitRecipe", method = RequestMethod.POST)
    public String submitRecipe(@Valid @ModelAttribute("recipe") Recipe recipe,
                               BindingResult result,
                               ModelMap modelHolder,
                               HttpSession session, SessionStatus status) {
        if (result.hasErrors()) {
            return "addrecipe";
        }
        User user = (User) session.getAttribute("LOGGED_USER");
        recipe.setAuthorID(user.getId());
        List<Ingredient> ingredientList = (List<Ingredient>) modelHolder.getAttribute("ingredientList");
        recipeDao.addIngredientListToRecipe(recipe, ingredientList);
        return "dashboard";
    }

    @RequestMapping(path = "/recipedetails", method = RequestMethod.GET)
    public String displayRecipeDetails(@RequestParam Long id,
                                       ModelMap modelMap) {
        System.out.println(id);
        Recipe recipe = recipeDao.getRecipeByRecipeId(id);
        modelMap.addAttribute("recipe", recipe);
        return "recipedetails";
    }


    @RequestMapping(path = "/dashboard", method = RequestMethod.GET)
    public String displayDashboard() {
        return "dashboard";
    }

    @RequestMapping(path = "/search", method = RequestMethod.GET)
    public String displaySearchResults() {
        return "searchResults";
    }

    @RequestMapping(path = "/blank", method = RequestMethod.GET)
    public String displayBlankPage() {

        return "blank";
    }

    @RequestMapping(path = "/404", method = RequestMethod.GET)
    public String displayBadPage() {

        return "404";
    }

    @RequestMapping(path = "/basic/table", method = RequestMethod.GET)
    public String displayBasicTable() {

        return "basicTableExample";
    }

    @RequestMapping(path = "/rest/table", method = RequestMethod.GET)
    public String displayRestTable() {

        return "restTableExample";
    }

    @RequestMapping(path = "/buttons", method = RequestMethod.GET)
    public String displayButtons() {

        return "buttons";
    }

    @RequestMapping(path = "/cards", method = RequestMethod.GET)
    public String displayCards() {

        return "cards";
    }

    @RequestMapping(path = "/charts", method = RequestMethod.GET)
    public String displayCharts() {

        return "charts";
    }

    @RequestMapping(path = "/accordion", method = RequestMethod.GET)
    public String displayAccordion(ModelMap modelMap) {
        modelMap.put("employees", EmployeeDataTable.getInstance().getData());
        return "accordionExample";
    }

}