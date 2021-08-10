package com.techelevator.entity;

public class Ingredient {
    private int ingredientID;
    private String ingredientName;
    private String measurementName;
    private int measurementAmount;
    private int measurementTypeID;


    public int getIngredientID() {
        return ingredientID;
    }

    public String getIngredientName() {
        return ingredientName;
    }

    public String getMeasurementName() {
        return measurementName;
    }

    public int getMeasurementAmount() {
        return measurementAmount;
    }

    public int getMeasurementTypeID() {
        return measurementTypeID;
    }

    public void setIngredientID(int ingredientID) {
        this.ingredientID = ingredientID;
    }

    public void setIngredientName(String ingredientName) {
        this.ingredientName = ingredientName;
    }

    public void setMeasurementName(String measurementName) {
        this.measurementName = measurementName;
    }

    public void setMeasurementAmount(int measurementAmount) {
        this.measurementAmount = measurementAmount;
    }

    public void setMeasurementTypeID(int measurementTypeID) {
        this.measurementTypeID = measurementTypeID;
    }
}