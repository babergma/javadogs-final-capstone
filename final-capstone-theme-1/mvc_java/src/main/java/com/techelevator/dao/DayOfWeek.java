package com.techelevator.entity;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;

public enum DayOfWeek {
    MONDAY("Mon", 1L), TUESDAY("Tues", 2L), WEDNESDAY("Weds", 3L), THURSDAY("Thurs", 4L), Friday("Fri", 5L), SATURDAY("Sat",6L), SUNDAY("Sun", 7L);
    private final String abbreviation;
    private final Long DAY_OF_WEEK_ID;

    DayOfWeek(String abbreviation, Long DAY_OF_WEEK_ID) {
        this.abbreviation = abbreviation;
        this.DAY_OF_WEEK_ID = DAY_OF_WEEK_ID;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public Long getDAY_OF_WEEK_ID() {
        return DAY_OF_WEEK_ID;
    }

    // An immutable list of the Measure names for display-purposes
    public static List<DayOfWeek> getAllMeasurements() {
        return Collections.unmodifiableList(Arrays.asList(DayOfWeek.values()));
    }

    public String getName() {
        return name();
    }

}
