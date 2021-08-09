
BEGIN TRANSACTION;
DROP TABLE IF EXISTS person, measurementType, goal, category, ingredient, person_goal, recipe, mealPlan, person_mealPlan, recipe_mealPlan, recipe_category, groceryList, ingredient_recipe CASCADE;

CREATE TABLE person
(
        user_id serial,
        goal_id int,
        firstName varchar(64),
        lastName varchar(64),
        username varchar(256),
        UNIQUE(username),
        pword varchar(64),
        salt varchar(256),
        birthday varchar(10),
        --gender_id int, 
        height varchar(10),
        weight varchar(10),
       
        
        constraint pk_user_id primary key (user_id)
        
        --constraint fk_gender_id foreign key (gender_id)
);

CREATE TABLE measurementType
(
        measurementType_id serial, 
        measurementName varchar(256), 
        
        constraint pk_measurementType_id primary key (measurementType_id)
);

CREATE TABLE goal
(
        goal_id serial, 
        goalName varchar(64),
        
        constraint pk_goal_id primary key (goal_id)
);

CREATE TABLE category
(
        category_id serial, 
        categoryName varchar(256),
        
        constraint pk_category_id primary key (category_id)
);
CREATE TABLE ingredient
(
        ingredient_id serial, 
        ingredientName varchar(256), 
        
        constraint pk_ingredient_id primary key (ingredient_id)
);

CREATE TABLE person_goal
(
        person_goal serial,
        goal_id int,
        user_id int,
        
        constraint pk_person_goal primary key (person_goal),
        constraint fk_goal_id foreign key (goal_id) references goal (goal_id),
        constraint fk_user_id foreign key (user_id) references person (user_id)
);

CREATE TABLE recipe
(
        recipe_id serial, 
        author_id int, 
        recipeName varchar(256),
        cookTime int, 
        servingSize int, 
        calories int, 
        pictureUrl varchar(256), 
        cookingInstruction varchar(1000),
        visible boolean, 
        
        constraint pk_recipe_id primary key (recipe_id), 
        constraint fk_author_id foreign key (author_id) references person (user_id)
);

CREATE TABLE mealPlan
(
        mealPlan_id serial, 
        mealPlanName varchar(256),
        mainDish_id int, 
        
        constraint pk_mealPlan_id primary key (mealPlan_id), 
        constraint fk_mainDish_id foreign key (mainDish_id) references recipe (recipe_id)
);

CREATE TABLE person_mealPlan
(
        person_mealPlan serial, 
        user_id int, 
        mealPlan_id int, 
        
        constraint pk_person_mealPlan primary key (person_mealPlan),
        constraint fk_user_id foreign key (user_id) references person (user_id),
        constraint fk_mealPlan_id foreign key (mealPlan_id) references mealPlan (mealPlan_id)
);

CREATE TABLE recipe_mealPlan
(
        recipe_mealPlan serial,
        mealPlan_id int,
        recipe_id int, 
        
        constraint pk_recipe_mealPlan primary key (recipe_mealPlan),
        constraint fk_mealPlan_id foreign key (mealPlan_id) references mealPlan (mealPlan_id), 
        constraint fk_recipe_id foreign key (recipe_id) references recipe (recipe_id)
);

CREATE TABLE recipe_category
(
        recipe_category serial, 
        recipe_id int, 
        category_id int, 
        
        constraint pk_recipe_category primary key (recipe_category),
        constraint fk_recipe_id foreign key (recipe_id) references recipe (recipe_id),
        constraint fk_category_id foreign key (category_id)references category (category_id)
);

CREATE TABLE groceryList
(
        groceryList serial, 
        user_id int, 
        ingredient_id int, 
        
        constraint pk_groceryList primary key (groceryList),
        constraint fk_user_id foreign key (user_id) references person (user_id),
        constraint fk_ingredient_id foreign key (ingredient_id) references ingredient (ingredient_id)
);

CREATE TABLE ingredient_recipe
(
        ingredient_recipe serial, 
        ingredient_id int, 
        recipe_id int, 
        measurementAmount int,
        measurementType_id int, 
        
        constraint pk_ingredient_recipe primary key (ingredient_recipe),
        constraint fk_ingredient_id foreign key (ingredient_id) references ingredient (ingredient_id), 
        constraint fk_recipe_id foreign key (recipe_id) references recipe (recipe_id), 
        constraint fk_measurementType_id foreign key (measurementType_id) references measurementType (measurementType_id)
);

END TRANSACTION;