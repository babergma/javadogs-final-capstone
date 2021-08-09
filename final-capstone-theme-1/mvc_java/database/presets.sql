BEGIN TRANSACTION;
INSERT INTO measurementtype(measurementName)
VALUES ('cups'),
        ('tablespoons'),
        ('teaspoons'),
        ('ounces'),
        ('milliliters');


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

END TRANSACTION;