
package com.techelevator.entity;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public enum TimeOfDay {
    BREAKFAST("Breakfast",1), LUNCH("Lunch", 2), DINNER("Dinner", 3);
    private final String abbreviation;
    private final int TimeOfDayId;

    TimeOfDay(String abbreviation, int timeOfDayId) {
        this.abbreviation = abbreviation;
        TimeOfDayId = timeOfDayId;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public int getTimeOfDayId() {
        return TimeOfDayId;
    }

    // An immutable list of the Measure names for display-purposes
    public static List<TimeOfDay> getAllTimeOfDay() {
        return Collections.unmodifiableList(Arrays.asList(TimeOfDay.values()));
    }

    public String getName() {
        return name();
    }

}
