package com.techelevator.controller;

import com.techelevator.dao.IngredientDAO;
import com.techelevator.dao.MealPlanDao;
import com.techelevator.dao.RecipeDao;
import com.techelevator.entity.*;
import com.techelevator.util.EmployeeDataTable;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.time.DayOfWeek;
import java.util.ArrayList;
import java.util.List;
import java.util.Random;


@Controller
@SessionAttributes({"ingredientList", "recipe", "ingredient", "newIngredientList"})
@RequestMapping(path = "/user")
public class ContentController {

    private IngredientDAO ingredientDAO;
    private RecipeDao recipeDao;
    private MealPlanDao mealPlanDao;

    @Autowired
    public ContentController(IngredientDAO ingredientDAO, RecipeDao recipeDao, MealPlanDao mealPlanDao) {
        this.recipeDao = recipeDao;
        this.ingredientDAO = ingredientDAO;
        this.mealPlanDao = mealPlanDao;
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
        modelHolder.put("recipe", new Recipe());
        modelHolder.put("ingredient", new Ingredient());
        if (!modelHolder.containsKey("newIngredientList")) {
            List<Ingredient> ingredientList = new ArrayList<>();
            modelHolder.addAttribute("newIngredientList", ingredientList);
        }
        modelHolder.put("measurements", Measurement.getAllMeasurements());
        modelHolder.put("displayIngredients", ingredientDAO.getAllIngredients());
        return "addrecipe";
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
        List<Ingredient> ingredientList = (List<Ingredient>) modelHolder.getAttribute("newIngredientList");
        modelHolder.put("measurements", Measurement.getAllMeasurements());
        modelHolder.put("displayIngredients", ingredientDAO.getAllIngredients());
        User user = (User) session.getAttribute("LOGGED_USER");
        ingredient.setIngredientId(ingredientDAO.searchForIngredient(ingredient.getIngredientName()).getIngredientId());
        ingredientList.add(ingredient);
        return "redirect:addrecipe";
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
        ingredient.setIngredientId(ingredientDAO.searchForIngredient(ingredient.getIngredientName()).getIngredientId());
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
                                   HttpSession session, SessionStatus status,
                                   @RequestParam(required = false) Long delete) {
        if (result.hasErrors()) {
            return "error";
        }
        if(delete != null){
            recipeDao.deleteSingleIngredientFromRecipe(recipe.getRecipeId(),delete);
            return "dashboard";
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
        List<Ingredient> ingredientList = (List<Ingredient>) modelHolder.getAttribute("newIngredientList");
        recipeDao.addIngredientListToRecipe(recipe, ingredientList);
        ingredientList = new ArrayList<>();
        modelHolder.put("newIngredientList", ingredientList);
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

    @RequestMapping(path = "/mealplandetails", method = RequestMethod.GET)
    public String displayMealPLanDetails(@RequestParam Long id,
                                         ModelMap modelMap) {
        MealPlan mealPlan = mealPlanDao.getMealPlanByMealPlanId(id);
        modelMap.addAttribute("mealPlan", mealPlan);
        for (Recipe recipe : mealPlan.getRecipeList()) {
            if(recipe.getDayOfWeek()== DayOfWeek.MONDAY) {
                System.out.println(recipe.getRecipeName());
                System.out.println(recipe.getDayOfWeek());
                System.out.println(recipe.getTimeOfDay());
            }
        }
        return "mealplandetails";
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


    @RequestMapping(path="/viewallrecipes", method=RequestMethod.GET)
    public String displayAllRecipes(ModelMap modelMap) {

        List<Recipe> recipeList = recipeDao.getAllPublicRecipes();
        modelMap.put("recipeList", recipeList);
        return "viewpublicrecipes";

    }

    @RequestMapping(path="/randomrecipe", method=RequestMethod.GET)
    public String showRandomPublicRecipe(HttpServletRequest request){
        List<Recipe> recipeList = recipeDao.getAllPublicRecipes();
        Random rand = new Random();
        Recipe recipe = recipeList.get(rand.nextInt(recipeList.size()));
        request.setAttribute("id",recipe.getRecipeId());
        return "forward:recipedetails";
    }

    @ExceptionHandler(NullPointerException.class)
    public String catchNull(){
        return "error";
    }





}