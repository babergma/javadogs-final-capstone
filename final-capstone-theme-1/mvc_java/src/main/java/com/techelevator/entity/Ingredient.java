package com.techelevator.entity;

import java.util.Map;

public class Ingredient {
    private int ingredientID;
    private String ingredientName;
    private Measurement measurement;
    private int measurementAmount;

    public void setMeasurementAmount(int measurementAmount) {
        this.measurementAmount = measurementAmount;
    }

    public int getMeasurementAmount() {
        return measurementAmount;
    }

    public int getIngredientID() {
        return ingredientID;
    }

    public String getIngredientName() {
        return ingredientName;
    }


    public void setIngredientID(int ingredientID) {
        this.ingredientID = ingredientID;
    }

    public void setIngredientName(String ingredientName) {
        this.ingredientName = ingredientName;
    }

    public Measurement getMeasurement() {
        return measurement;
    }

    public void setMeasurement(Measurement measurement) {
        this.measurement = measurement;
    }
}


