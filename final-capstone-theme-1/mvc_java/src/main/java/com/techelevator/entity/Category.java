
package com.techelevator.entity;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public enum Category {
    VEGETARIAN("Vegetarian",1),
    HIGH_PROTEIN("High Protein", 2),
    LOW_CARB("Low Carb", 3),
    DAIRY_FREE("Dairy Free",4),
    GLUTEN_FREE("Gluten Free", 5),
    VEGAN("Vegan", 6),
    KOSHER("Kosher", 7),
    PESCRETARIAN("Pescretarian", 8);
    private final String abbreviation;
    private final int categoryId;

    Category(String abbreviation, int categoryId) {
        this.abbreviation = abbreviation;
        this.categoryId = categoryId;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public int getCategoryId() {
        return categoryId;
    }

    // An immutable list of the Measure names for display-purposes
    public static List<Category> getAllCategories() {
        return Collections.unmodifiableList(Arrays.asList(Category.values()));
    }

    public String getName() {
        return name();
    }

}
