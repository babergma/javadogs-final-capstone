BEGIN TRANSACTION;

INSERT INTO measurementtype(measurementName)
VALUES ('cups'),
        ('tablespoons'),
        ('teaspoons'),
        ('ounces'),
        ('milliliters'),
        ('piece'),
        ('pound');

INSERT INTO public.person (user_id, goal_id, firstname, lastname, username, pword, salt, birthday, height, weight, role) 
VALUES (1, null, 'Test', 'Testerson', 'testing@gmail.com', 'C6OIBbS7HuNntHAsTHU2nA==', 
'9+9BjPiSm3TboHveZNf4NbpUr2C9eDBCxslmjWNustHQVrsf3GGuQNoNPwl2ce2fMsfOFBs9beK73C2pufoBzUKH3HcMXMzPXdjpmpvIA50JaeMDrBHMeTvA7fty8sP2IwPxsf2wRW12YDvkzakdaoiOhEvXb5LA6Z7p2JA6EVg=', 
'2021-08-13', '5', '120', 'CUSTOMER');

INSERT INTO goal(goalname)
VALUES ('weight loss'),
        ('weight gain'),
        ('maintain weight');

INSERT INTO category(categoryname)
VALUES ('Vegitarian'),
        ('High Protein'),
        ('Low Carb'),
        ('Dairy Free'),
        ('Gluten Free'),
        ('Vegan'),
        ('Kosher'),
        ('Pescatarian');
        
INSERT INTO recipe(recipename, cooktime, servingsize, calories, cookinginstruction, visible, author_id)
VALUES ('Vegitarian Spaghetti', 30, 4, 350, 'Boil lightly salted water. Once water is at a boil place noodles in the pot and apply gentle pressure until all noodles are submerged. 
                Once noodles are tender (you can test this by tossing a noodle at the wall. If the noodle sticks, they are ready) drain the water from the pot and lower the stove 
                 temperature to low. Add the pasta sauce of your choice and stir in. Serve with freshly toasted bread.', true, 1),
        ('Spicy Green Tomato Salsa', 30, 40, 27, 'Combine green tomatoes, onions, jalapeno peppers, serrano peppers, and red bell pepper in a large bowl.
                Mix cilantro, sugar, garlic, oregano, and cayenne pepper together in a small bowl. Fill a blender with about 2 cups tomato mixture, 1 teaspoon lime juice, 
                and 1/4 of the spice mixture; blend to desired consistency and pour into a large bowl. Repeat blending with remaining tomato mixture, lime juice, and spice mixture, 
                working in batches, until all ingredients are blended. Stir vinegar into salsa.', true, 1),
        ('Vanilla Almond Spiced French Toast', 20, 4, 337, 'Mix whole milk and brown sugar in a large bowl. Beat eggs, vanilla extract, almond extract, cinnamon, nutmeg, and allspice 
                together in a separate bowl until the eggs are well beaten; add to the milk mixture and stir to dissolve the brown sugar. Heat a non-stick skillet or griddle over medium-low heat.
                Set one slice of Texas toast into the milk mixture; let soak until moistened, about 10 seconds per side. Cook the dipped toast in the preheated skillet until bottom is golden brown, 
                3 to 5 minutes; flip toast and continue to cook until the other side is browned, 3 to 5 minutes more. Repeat dipping and cooking with remaining bread slices.', true, 1);             


INSERT INTO ingredient(ingredientname)
VALUES ('salt'),
        ('spaghetti noodles'),
        ('jar of pasta sauce'),
        ('sliced bread'),
        ('chopped green tomatoes'),
        ('chopped onions'),
        ('jalapeno peppers'),
        ('serrano peppers'),
        ('red bell pepper'),
        ('cilantro'),
        ('sugar'),
        ('garlic'),
        ('lime juice'),
        ('apple cider vinegar'),
        ('whole milk'),
        ('brown sugar'),
        ('eggs'),
        ('vanilla extract'),
        ('almond extract'),
        ('ground cinnamon'),
        ('ground nutmeg'),
        ('all spice'),
        ('texas toast style bread');
        
       
INSERT INTO ingredient_recipe(ingredient_id, recipe_id, measurementamount, measurementtype_id)
VALUES(1, 1, 1, 3),
        (2, 1, 12, 4),
        (3, 1, 2, 1), 
        (4, 1, 4, 6),
        (5, 2, 12 , 1),
        (6, 2, 2, 1),
        (7, 2, 1, 1),
        (8, 2, 1, 1), 
        (9, 2, 2, 1),
        (10, 2, 1, 1),
        (11, 2, 8, 2),
        (12, 2, 3, 2),
        (13, 2, 6, 4),
        (14, 2, 1, 2),
        (15, 3, 2, 1),
        (16, 3, 2, 2),
        (17, 3, 4, 6),
        (18, 3, 1, 3),
        (19, 3, 1, 3),
        (20, 3, 1, 3),
        (21, 3, 1, 3),
        (22, 3, 1, 3),
        (23, 3, 8, 6);    
        



END TRANSACTION;