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
VALUES (1, 1, 'Test', 'Testerson', 'testing@gmail.com', 'C6OIBbS7HuNntHAsTHU2nA==', 
'9+9BjPiSm3TboHveZNf4NbpUr2C9eDBCxslmjWNustHQVrsf3GGuQNoNPwl2ce2fMsfOFBs9beK73C2pufoBzUKH3HcMXMzPXdjpmpvIA50JaeMDrBHMeTvA7fty8sP2IwPxsf2wRW12YDvkzakdaoiOhEvXb5LA6Z7p2JA6EVg=', 
'2021-08-13', '5', '120', 'CUSTOMER');

--testing@gmail.com TestingDogs1
INSERT INTO public.person (user_id, goal_id, firstname, lastname, username, pword, salt, birthday, height, weight, role) 
VALUES (2, 3, 'Wilson', 'Thompson', 'wilsonSnugs@gmail.com', 'voYR91tJp4wKqJMpOqqaJw==',
'm0o6YFRzs2ehvT5fXr0GIMobbkB947b1npYrED7utAwTCwZBjS/Pu9NU9nXh/vvrm0n4Xe99b4JDQNCfECAYrlSiphK30FRAqebErh0cErTNyshvsHYxpwDbpFG7CAsgOTgLHD+nxtFBjC2LdBERsNp2NsK3VuDCR1gtULGgy78=', 
'2021-08-03', '2', '53', 'CUSTOMER');
--wilsonSnugs@gmail.com CatHater200

INSERT INTO public.person (user_id, goal_id, firstname, lastname, username, pword, salt, birthday, height, weight, role) 
VALUES (3, 2, 'Addie', 'Admin', 'admin@gmail.com', 'BR1IvR6fvpJ/KCo+tp6aGw==', 
'wAWdcxPnS6CWJC691V8hr9V5u9cy9VGCc8VxaDWGfcw4HWv2F/YZl0Gdh42Rt4iJPVr/hEKTK6SkxtqaK433U2yKXrA6RY1K4AAke6OGVrtzniHlOp4aVT+GYRUkhmnLp940CY1prLjdYaibEdibrzjI1XMN7GedVIGNPJvdr0g=', 
'2021-08-17', '7', '200', 'ADMIN');
--admin@gmail.com AdminPerson2

INSERT INTO goal(goalname)
VALUES ('weight loss'),
        ('weight gain'),
        ('maintain weight');

INSERT INTO category(categoryname)
VALUES ('Vegetarian'),
        ('High Protein'),
        ('Low Carb'),
        ('Dairy Free'),
        ('Gluten Free'),
        ('Vegan'),
        ('Kosher'),
        ('Pescatarian');
        
INSERT INTO recipe(recipename, cooktime, servingsize, calories, cookinginstruction, visible, author_id, pictureurl)
VALUES ('Vegetarian Spaghetti', 30, 4, 350, 'Boil lightly salted water. Once water is at a boil place noodles in the pot and apply gentle pressure until all noodles are submerged. 
                Once noodles are tender (you can test this by tossing a noodle at the wall. If the noodle sticks, they are ready) drain the water from the pot and lower the stove 
                 temperature to low. Add the pasta sauce of your choice and stir in. Serve with freshly toasted bread.', true, 1, 'spaghetti.jpg'),
        ('Spicy Green Tomato Salsa', 30, 40, 27, 'Combine green tomatoes, onions, jalapeno peppers, serrano peppers, and red bell pepper in a large bowl.
                Mix cilantro, sugar, garlic, oregano, and cayenne pepper together in a small bowl. Fill a blender with about 2 cups tomato mixture, 1 teaspoon lime juice, 
                and 1/4 of the spice mixture; blend to desired consistency and pour into a large bowl. Repeat blending with remaining tomato mixture, lime juice, and spice mixture, 
                working in batches, until all ingredients are blended. Stir vinegar into salsa.', true, 1, 'greentomatosalsa.jpg'),
        ('Vanilla Almond Spiced French Toast', 20, 4, 337, 'Mix whole milk and brown sugar in a large bowl. Beat eggs, vanilla extract, almond extract, cinnamon, nutmeg, and allspice 
                together in a separate bowl until the eggs are well beaten; add to the milk mixture and stir to dissolve the brown sugar. Heat a non-stick skillet or griddle over medium-low heat.
                Set one slice of Texas toast into the milk mixture; let soak until moistened, about 10 seconds per side. Cook the dipped toast in the preheated skillet until bottom is golden brown, 
                3 to 5 minutes; flip toast and continue to cook until the other side is browned, 3 to 5 minutes more. Repeat dipping and cooking with remaining bread slices.', true, 1, 'frenchtoast.jpg'), 
        ('Carrot Mango Bread', 50, 10, 287, 'Preheat oven to 350 degrees and grease a loaf pan with baking spray. Combine the flour, baking powder, baking soda, salt and spices in a large bowl.
                Whisk together the sugar, eggs, coconut oil, V8 vegetable & fruit blend and vanilla in a medium bowl. Add the wet ingredients to the dry and stir until combined.
                Fold in the carrots, mango and pecans until well combined. Transfer batter to the loaf pan and bake for about 40 minutes until toothpick inserted in the middle comes out clean.
                Remove from oven and let rest until cool enough to touch. Gently remove bread from the pan and let cool on a rack.', true, 1, 'mango-bread.jpg'),
        ('Kibble', 2, 1, 1000, 'Fill dinner bowl to the brim with kibble. Patiently wait until human sets it on the ground and says: EAT!', false, 2, 'kibble.jpg'),
        ('PB&J Roll up', 5, 1, 450, 'Spread peanut butter across one side of a tortilla. Once evenly spread, add the grape jelly and spread evenly. Now roll the tortilla like you would a yoga mat. Enjoy!', true, 1, 'pbjroll.jpg'),
        ('Mirowave-dilla', 2, 1, 670, 'Take one tortilla and sprinkly generously shreded cheese (can substitute for cheese slices). Place second tortilla ontop of the cheese and microwave on highh for 45 seconds. Let stant for 2 minutes, then enjoy!', true, 1, 'mirowavedilla.jpg');

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
        ('texas toast style bread'),
        ('flour'),
        ('baking powder'),
        ('baking soda'),
        ('ground ginger'),
        ('ground cloves'),       
        ('coconut sugar'),
        ('tablespoons melted coconut oil'),
        ('cup V8 Carrot Mango Vegetable & Fruit Blend'),      
        ('shredded carrots'),
        ('diced mango'),
        ('chopped pecans'),
        ('Hills Science Diet Chicken Flavor (Small Bites)'), 
        ('tortilla'),
        ('peanut butter'),
        ('grape jelly'),
        ('shreded cheese');
       
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
        (23, 3, 8, 6), 
        (24, 4, 1, 1),
        (25, 4, 1, 3),
        (26, 4, 1, 3),
        (27, 4, 1, 3),
        (28, 4, 1, 3),
        (29, 4, 1, 3),
        (30, 4, 3, 2),
        (31, 4, 1, 1),
        (32, 4, 1, 1),
        (33, 4, 1, 1),
        (34, 4, 1, 1),
        (1, 4, 1, 3),
        (17, 4, 2, 3),
        (18, 4, 1, 3),
        (20, 4, 1, 3),
        (22, 4, 1, 3),
        (35, 5, 2, 1),
        (36, 6, 1, 6),
        (37, 6, 2, 2),
        (38, 6, 2, 2),
        (36, 7, 2, 6), 
        (39, 7, 1, 1);
     
INSERT INTO dayofweek(dayname)
VALUES ('Monday'),   
        ('Tuesday'),  
        ('Wednesday'),
        ('Thursday'),
        ('Friday'),
        ('Saturday'),
        ('Sunday');
        
INSERT INTO timeofday(timename)
VALUES ('Breakfast'),
        ('Lunch'),
        ('Dinner');

INSERT INTO mealplan (mealplanname, maindish_id) 
VALUES ('Hungry Dogs Meal Plan', 1),
        ('Veggie Lovers ', 1),
        ('Wilsons Good Eats', 5);

INSERT INTO recipe_mealplan ( mealplan_id, recipe_id, dayofweek, timeofday) 
VALUES (1, 1, 1, 1),
        (1, 2, 1, 2),
        (1, 4, 1, 2), 
        (1, 3, 1, 3),       
        (1, 1, 2, 1),
        (1, 2, 2, 2),
        (1, 4, 2, 2), 
        (1, 3, 2, 3),        
        (1, 1, 3, 1),
        (1, 2, 3, 2),
        (1, 4, 3, 2), 
        (1, 3, 3, 3),        
        (1, 1, 4, 1),
        (1, 2, 4, 2),
        (1, 4, 4, 2), 
        (1, 3, 4, 3),       
        (1, 1, 5, 1),
        (1, 2, 5, 2),
        (1, 4, 5, 2), 
        (1, 3, 5, 3),        
        (1, 1, 6, 1),
        (1, 2, 6, 2),
        (1, 4, 6, 2), 
        (1, 3, 6, 3),        
        (1, 1, 7, 1),
        (1, 2, 7, 2),
        (1, 4, 7, 2), 
        (1, 3, 7, 3),        
        (2, 1, 1, 1),
        (2, 2, 1, 2),
        (2, 4, 1, 2), 
        (2, 3, 1, 3),        
        (2, 1, 2, 1),
        (2, 2, 2, 2),
        (2, 4, 2, 2), 
        (2, 3, 2, 3),        
        (2, 1, 3, 1),
        (2, 2, 3, 2),
        (2, 4, 3, 2), 
        (2, 3, 3, 3),
        (2, 1, 4, 1),
        (2, 2, 4, 2),
        (2, 4, 4, 2), 
        (2, 3, 4, 3),        
        (2, 1, 5, 1),
        (2, 2, 5, 2),
        (2, 4, 5, 2), 
        (2, 3, 5, 3),       
        (2, 1, 6, 1),
        (2, 2, 6, 2),
        (2, 4, 6, 2), 
        (2, 3, 6, 3),       
        (2, 1, 7, 1),
        (2, 2, 7, 2),
        (2, 4, 7, 2), 
        (2, 3, 7, 3),
        (3, 5, 1, 3),
        (3, 5, 2, 3),
        (3, 5, 3, 3),
        (3, 5, 4, 3),
        (3, 5, 5, 3),
        (3, 5, 6, 3),
        (3, 5, 7, 3);
        
INSERT INTO person_mealplan (user_id, mealplan_id) 
VALUES (1, 1),
        (1, 2),
        (2, 3);
        
INSERT INTO recipe_category(recipe_id, category_id)
VALUES (1, 1),
        (1, 6),
        (1, 8),
        (2, 1),
        (2, 3),
        (2, 4),
        (2, 5),
        (2, 6),
        (2, 8),
        (3, 1),
        (3, 8),
        (4, 1),
        (4, 8),
        (5, 2),
        (5, 4),
        (5, 8),
        (6, 1),
        (6, 2),
        (6, 4),
        (6, 6), 
        (6, 8),
        (7, 1), 
        (7, 8);
        
END TRANSACTION;















