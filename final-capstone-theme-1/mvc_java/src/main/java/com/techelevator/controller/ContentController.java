package com.techelevator.controller;

import com.techelevator.dao.IngredientDAO;
import com.techelevator.dao.MealPlanDao;
import com.techelevator.dao.RecipeDao;
import com.techelevator.entity.TimeOfDay;
import com.techelevator.entity.*;
import com.techelevator.security.AuthorizationFilter;
import com.techelevator.util.EmployeeDataTable;
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
        User user = (User)session.getAttribute(AuthorizationFilter.LOGGED_USER);
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
        if(! modelHolder.containsKey("newRecipe")) {
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
            currentRecipe= (Recipe) modelHolder.getAttribute("currentRecipe");
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
    public String submitRecipe( @Valid @ModelAttribute("newRecipe") Recipe recipe,
                               BindingResult result,
                               ModelMap modelMap,
                               RedirectAttributes redirectAttributes,
                               HttpSession session) {
        if (result.hasErrors()) {
            System.out.println("error in form");
            redirectAttributes.addFlashAttribute(BindingResult.MODEL_KEY_PREFIX + "newRecipe", result);
            redirectAttributes.addFlashAttribute("newRecipe", recipe);
            return "redirect:/user/addrecipe";
        }
        User user = (User) session.getAttribute(AuthorizationFilter.LOGGED_USER);
        recipe.setAuthorID(user.getId());
        List<Ingredient> ingredientList = (List<Ingredient>) modelMap.getAttribute("newIngredientList");
        recipeDao.addIngredientListToRecipe(recipe, ingredientList);
        ingredientList = new ArrayList<>();
        modelMap.put("newIngredientList", ingredientList);
        modelMap.put("newRecipe", new Recipe());
        return "dashboard";
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


    @RequestMapping(path = "/addrecipetomealplan", method = RequestMethod.GET)
    public String displayAddRecipeToMealPlan(@Valid @ModelAttribute("newRecipe") Recipe recipe,
                                             BindingResult result,
                                             HttpSession session,
                                             ModelMap modelMap) {
        User user = (User) session.getAttribute("LOGGED_USER");
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
        User user = (User) session.getAttribute("LOGGED_USER");
        return "redirect:/user/viewmealplans";
    }


    @RequestMapping(path = "/viewmealplans", method = RequestMethod.GET)
    public String displayViewMealPlans(HttpSession session,
                                       ModelMap modelMap) {
        User user = (User) session.getAttribute("LOGGED_USER");
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
    public String displayModifyMealPlan(@RequestParam (required = false) Long id,
                                        ModelMap modelMap,
                                        RedirectAttributes redirectAttributes) {
        MealPlan mealPlan;
        if(id != null) {
            mealPlan = mealPlanDao.getMealPlanByMealPlanId(id);
            redirectAttributes.addFlashAttribute("mealPlan", mealPlan);
            modelMap.addAttribute("mealPlan", mealPlan);
        }
        return "modifymealplan";
    }

    @RequestMapping(path = "/submitDeleteRecipeFromMealPlan", method = RequestMethod.POST)
    public String submitEditRecipe(
            @RequestParam(required = false) Long delete,
            @RequestParam Long mealPlanId,
            RedirectAttributes redirectAttributes) {
        if (delete != null) {
            mealPlanDao.deleteSingleRecipeFromMealPlan(mealPlanId, delete);
//                    deleteSingleIngredientFromRecipe(recipe.getRecipeId(), delete);
            MealPlan mealPlan = mealPlanDao.getMealPlanByMealPlanId(mealPlanId);
            redirectAttributes.addFlashAttribute("mealPlan", mealPlan);
            return "redirect:/user/modifymealplan";
        }
        return "error";
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
        User user = (User) session.getAttribute("LOGGED_USER");
        MealPlan mealPlan = new MealPlan();
        mealPlan.setMealPlanName(mealPlanName);
        mealPlan = mealPlanDao.saveMealPlan(mealPlan);
        mealPlanDao.addAuthorToMealPlan(mealPlan, user.getId());

        return "redirect:/user/viewmealplans";
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


    @RequestMapping(path = "/viewallrecipes", method = RequestMethod.GET)
    public String displayAllRecipes(ModelMap modelMap) {
        List<Recipe> recipeList = recipeDao.getAllPublicRecipes();
        modelMap.put("recipeList", recipeList);
        return "viewpublicrecipes";

    }

    @RequestMapping(path = "/randomrecipe", method = RequestMethod.GET)
    public String showRandomPublicRecipe(HttpServletRequest request,
                                         RedirectAttributes redirectAttributes) {
        List<Recipe> recipeList = recipeDao.getAllPublicRecipes();
        Random rand = new Random();
        Recipe recipe = recipeList.get(rand.nextInt(recipeList.size()));
        System.out.println(recipe.getRecipeId());
        redirectAttributes.addFlashAttribute("id", recipe.getRecipeId());
        return "forward:recipedetails";
    }





    @ExceptionHandler(NullPointerException.class)
    public String catchNull() {
        return "error";
    }


}