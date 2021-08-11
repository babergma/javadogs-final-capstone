package com.techelevator.entity;

import java.util.Arrays;
import java.util.Collections;
import java.util.List;
import java.util.Map;

import static java.util.stream.Collectors.toMap;

public enum Measurement {
    CUPS("Cups", 1), TABLESPOONS("tbsp", 2), TEASPOONS("tsp", 3), OUNCES("oz", 4), MILLILITERS("ml", 5);
    private final String abbreviation;
    private final int measurementid;

    Measurement(String abbreviation, int measurementid) {
        this.abbreviation = abbreviation;
        this.measurementid = measurementid;
    }

    public String getAbbreviation() {
        return abbreviation;
    }

    public int getMeasurementid() {
        return measurementid;
    }

    // An immutable list of the Measure names for display-purposes
    public static List<Measurement> getAllMeasurements() {
        return Collections.unmodifiableList(Arrays.asList(Measurement.values()));
    }

    public String getName() {
        return name();
    }

}
