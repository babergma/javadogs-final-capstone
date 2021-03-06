package com.techelevator.controller;

import com.techelevator.dao.IngredientDAO;
import com.techelevator.dao.MealPlanDao;
import com.techelevator.dao.RecipeDao;
import com.techelevator.entity.TimeOfDay;
import com.techelevator.entity.*;
import com.techelevator.security.AuthorizationFilter;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.ModelMap;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.*;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;
import java.awt.*;
import java.time.DayOfWeek;
import java.util.*;
import java.util.List;


@Controller
@SessionAttributes({"ingredientList", "recipe", "ingredient", "newIngredientList", "currentRecipe", "newRecipe"})
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
        User user = (User) session.getAttribute(AuthorizationFilter.LOGGED_USER);
        List<Recipe> recipeList = recipeDao.getAllRecipesByUserId(user.getId());
        modelMap.put("recipeList", recipeList);
        return "viewrecipe";
    }


    @RequestMapping(path = "/addingredient", method = RequestMethod.GET)
    public String displayAddIngredient(HttpSession session) {
        List<Ingredient> ingredientList = ingredientDAO.getAllIngredients();
        session.setAttribute("ingredients", ingredientList);
        return "addingredient";
    }


    @RequestMapping(path = "/addingredient", method = RequestMethod.POST)
    public String processAddIngredient(@RequestParam String input) {

        Ingredient ingredient = new Ingredient();
        ingredient.setIngredientName(input);
        ingredientDAO.saveIngredient(ingredient);

        return "redirect:/user/addingredient";
    }

    @RequestMapping(path = "/addrecipe", method = RequestMethod.GET)
    public String displayAddRecipe(ModelMap modelHolder) {
        if (!modelHolder.containsKey("newRecipe")) {
            modelHolder.put("newRecipe", new Recipe());
        }
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
                                                HttpSession session,
                                                RedirectAttributes redirectAttributes
    ) {
        if (result.hasErrors()) {
            return "addrecipe";
        }

        List<Ingredient> ingredientList = (List<Ingredient>) modelHolder.get("newIngredientList");
        User user = (User) session.getAttribute("LOGGED_USER");
        ingredient.setIngredientId(ingredientDAO.searchForIngredient(ingredient.getIngredientName()).getIngredientId());
        ingredientList.add(ingredient);
        redirectAttributes.addFlashAttribute("ingredientList", ingredientList);
        return "redirect:addrecipe";
    }


    @RequestMapping(path = "/editrecipe", method = RequestMethod.GET)
    public String displayEditRecipeDetails(ModelMap modelHolder,
                                           @RequestParam(required = false) Long id) {
        Recipe currentRecipe = null;
        if (id != null) {
            currentRecipe = recipeDao.getRecipeByRecipeId(id);
            modelHolder.put("currentRecipe", currentRecipe);
        } else {
            currentRecipe = (Recipe) modelHolder.getAttribute("currentRecipe");
        }
        modelHolder.put("ingredient", new Ingredient());

        List<Ingredient> ingredientList = recipeDao.getAllIngredientsByRecipeId(currentRecipe.getRecipeId());
        modelHolder.addAttribute("ingredientList", ingredientList);

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
        Recipe currentRecipe = (Recipe) modelHolder.getAttribute("currentRecipe");
        currentRecipe.setIngredientList(ingredientList);
        recipeDao.updateRecipeByRecipeId(currentRecipe, ingredient);


        return "redirect:editrecipe";
    }


    @RequestMapping(path = "/submitEditRecipe", method = RequestMethod.POST)
    public String submitEditRecipe(@Valid @ModelAttribute("currentRecipe") Recipe currentRecipe,
                                   BindingResult result,
                                   ModelMap modelMap,
                                   HttpSession session,
                                   @RequestParam(required = false) Long delete,
                                   RedirectAttributes redirectAttributes){
        if (result.hasErrors()) {
            return "error";
        }
        if (delete != null) {


            recipeDao.deleteSingleIngredientFromRecipe(currentRecipe.getRecipeId(), delete);
            redirectAttributes.addFlashAttribute("recipe", currentRecipe);
            return "redirect:/user/editrecipe";
        }
        User user = (User) session.getAttribute("LOGGED_USER");
        currentRecipe.setAuthorID(user.getId());
        List<Ingredient> ingredientList = (List<Ingredient>) modelMap.getAttribute("ingredientList");
        currentRecipe.setIngredientList(ingredientList);
        recipeDao.updateRecipe(currentRecipe);
        return "redirect:/user/viewrecipe";
    }
    @RequestMapping(path = "/submitRecipe", method = RequestMethod.POST)
    public String submitRecipe(@Valid @ModelAttribute("newRecipe") Recipe recipe,
                               BindingResult result,
                               @RequestParam(required = false, defaultValue = "placeholder.png") String url,
                               ModelMap modelMap,
                               HttpSession session, SessionStatus status, RedirectAttributes flash) {
        if (result.hasErrors()) {
            flash.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "newRecipe", result);
            flash.addFlashAttribute("newRecipe", recipe);
            return "redirect:/user/addrecipe";
        }
        flash.addFlashAttribute("message", "You have successfully added a recipe.");
        User user = (User) session.getAttribute(AuthorizationFilter.LOGGED_USER);
        recipe.setAuthorID(user.getId());
        List<Ingredient> ingredientList = (List<Ingredient>) modelMap.getAttribute("newIngredientList");
        recipeDao.addIngredientListToRecipe(recipe, ingredientList);
        ingredientList = new ArrayList<>();
        modelMap.put("newIngredientList", ingredientList);
        modelMap.put("newRecipe", new Recipe());
        return "redirect:/user/viewrecipe";
    }

    @RequestMapping(path = "/recipedetails", method = RequestMethod.GET)
    public String displayRecipeDetails(@RequestParam Long id,
                                       ModelMap modelMap) {

        Recipe recipe = recipeDao.getRecipeByRecipeId(id);
        modelMap.addAttribute("recipe", recipe);
        return "recipedetails";
    }


    @RequestMapping(path = "/dashboard", method = RequestMethod.GET)
    public String displayDashboard() {
        return "dashboard";
    }


    @RequestMapping(path = "/blank", method = RequestMethod.GET)
    public String displayBlankPage() {

        return "blank";
    }

    @RequestMapping(path = "/addrecipetomealplan", method = RequestMethod.GET)
    public String displayAddRecipeToMealPlan(
                                             HttpSession session,
                                             ModelMap modelMap) {
        User user = (User) session.getAttribute(AuthorizationFilter.LOGGED_USER);
        modelMap.put("recipeList", recipeDao.getAllRecipesByUserId(user.getId()));
        modelMap.put("mealPlanList", mealPlanDao.getAllMealPlansByUserId(user.getId()));
        modelMap.put("timeOfdays", TimeOfDay.getAllTimeOfDay());
        modelMap.put("daysOfWeek", DayOfWeek.values());
        return "addrecipetomealplan";
    }


    @RequestMapping(path = "/addrecipetomealplan", method = RequestMethod.POST)
    public String displayAddRecipeToMealPlan(HttpSession session,
                                             ModelMap modelMap,
                                             @RequestParam Long mealPlanId,
                                             @RequestParam int dayOfWeekId,
                                             @RequestParam Long recipeId,
                                             @RequestParam TimeOfDay timeOfDay) {

        MealPlan mealPlan = mealPlanDao.getMealPlanByMealPlanId(mealPlanId);
        Recipe recipe = recipeDao.getRecipeByRecipeId(recipeId);
        recipe.setDayOfWeek(DayOfWeek.of(dayOfWeekId));
        recipe.setTimeOfDay(timeOfDay);

        mealPlanDao.addRecipeToMealPlan(mealPlan, recipe);
        User user = (User) session.getAttribute(AuthorizationFilter.LOGGED_USER);
        return "redirect:/user/viewmealplans";
    }


    @RequestMapping(path = "/viewmealplans", method = RequestMethod.GET)
    public String displayViewMealPlans(HttpSession session,
                                       ModelMap modelMap) {
        User user = (User) session.getAttribute(AuthorizationFilter.LOGGED_USER);
        List<MealPlan> mealPlanList = mealPlanDao.getAllMealPlansByUserId(user.getId());
        modelMap.put("mealPlanList", mealPlanList);
        return "viewmealplans";
    }

    @RequestMapping(path = "/mealplandetails", method = RequestMethod.GET)
    public String displayMealPlanDetails(@RequestParam Long id,
                                         ModelMap modelMap) {
        MealPlan mealPlan = mealPlanDao.getMealPlanByMealPlanId(id);
        modelMap.addAttribute("mealPlan", mealPlan);
        return "mealplandetails";
    }

    @RequestMapping(path = "/modifymealplan", method = RequestMethod.GET)
    public String displayModifyMealPlan(@RequestParam(required = false) Long id,
                                        ModelMap modelMap,
                                        RedirectAttributes redirectAttributes) {
        MealPlan mealPlan;
        if (id != null) {
            mealPlan = mealPlanDao.getMealPlanByMealPlanId(id);
            redirectAttributes.addFlashAttribute("mealPlan", mealPlan);
            modelMap.addAttribute("mealPlan", mealPlan);
        }
        return "modifymealplan";
    }

    @RequestMapping(path = "/submitDeleteRecipeFromMealPlan", method = RequestMethod.GET)
    public String submitEditRecipe(
            @RequestParam(required = true) Long thisRecipeId,
            @RequestParam(required = true) Long thisDayOfWeekId,
            @RequestParam(required = true) Long thisTimeOfDayId,
            @RequestParam Long mealPlanId,
            RedirectAttributes redirectAttributes) {
        mealPlanDao.deleteSingleRecipeFromMealPlan(mealPlanId, thisRecipeId, thisTimeOfDayId, thisDayOfWeekId);
        MealPlan mealPlan = mealPlanDao.getMealPlanByMealPlanId(mealPlanId);
        redirectAttributes.addFlashAttribute("mealPlan", mealPlan);
        return "redirect:/user/modifymealplan";
    }



    @RequestMapping(path = "/search", method = RequestMethod.GET)
    public String displaySearchResults(@RequestParam(required = false) String searchText,
                                       @RequestParam(required = false) String filterBy,
                                       ModelMap modelMap) {
        List<Recipe> searchedRecipes = new ArrayList(new HashSet(recipeDao.searchForRecipeByFilter(searchText, filterBy)));
        modelMap.put("searchedRecipes", searchedRecipes);
        return "searchResults";
    }



    @RequestMapping(path = "/grocerylist", method = RequestMethod.GET)
    public String displayGroceryList(@RequestParam Long id,
                                     ModelMap modelMap) {
        List<Ingredient> ingredientListTemp = mealPlanDao.getAllIngredientsByMealPlan(mealPlanDao.getMealPlanByMealPlanId(id));
        List<Ingredient> ingredientList = new ArrayList(new HashSet(ingredientListTemp));
        modelMap.addAttribute("ingredientList", ingredientList);
        return "grocerylist";
    }

    @RequestMapping(path = "/addmealplanname", method = RequestMethod.GET)
    public String displayAddMealPlanNAme() {

        return "addmealplanname";
    }

    @RequestMapping(path = "/addmealplanname", method = RequestMethod.POST)
    public String submitAddMealPlanNAme(HttpSession session,
                                        @RequestParam String mealPlanName) {
        User user = (User) session.getAttribute(AuthorizationFilter.LOGGED_USER);
        MealPlan mealPlan = new MealPlan();
        mealPlan.setMealPlanName(mealPlanName);
        mealPlan = mealPlanDao.saveMealPlan(mealPlan);
        mealPlanDao.addAuthorToMealPlan(mealPlan, user.getId());

        return "redirect:/user/viewmealplans";
    }

    @RequestMapping(path = "/viewallrecipes", method = RequestMethod.GET)
    public String displayAllRecipes(ModelMap modelMap) {
        List<Recipe> recipeList = recipeDao.getAllPublicRecipes();
        modelMap.put("recipeList", recipeList);
        return "viewpublicrecipes";

    }



    @ExceptionHandler(NullPointerException.class)
    public String catchNull() {
        return "error";
    }


}