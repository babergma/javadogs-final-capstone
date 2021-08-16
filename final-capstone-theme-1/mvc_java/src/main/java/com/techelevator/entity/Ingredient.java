package com.techelevator.entity;

public class Ingredient {
    private int ingredientId;
    private String ingredientName;
    private Measurement measurement;
    private int measurementAmount;

    public void setMeasurementAmount(int measurementAmount) {
        this.measurementAmount = measurementAmount;
    }

    public int getMeasurementAmount() {
        return measurementAmount;
    }

    public int getIngredientId() {
        return ingredientId;
    }

    public String getIngredientName() {
        return ingredientName;
    }


    public void setIngredientId(int ingredientId) {
        this.ingredientId = ingredientId;
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


