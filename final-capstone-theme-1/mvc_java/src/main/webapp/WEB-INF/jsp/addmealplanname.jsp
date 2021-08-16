<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:import url="/WEB-INF/jsp/header.jsp"/>

<div class="container-fluid">

  <!-- Page Heading -->
  <div class="d-sm-flex align-items-center justify-content-between mb-4">
    <h1 class="h3 mb-0 text-gray-800">Add New Meal Plan</h1>
  </div>
  <c:url var="addmealplanURL" value="/user/addmealplanname"/>
  <form action="${addmealplanURL}" method="POST">
    <div class="form-group">
      <label for="mealPlanName" >Name</label>
      <input type="text" class="form-control" id="mealPlanName" placeholder="Keto Friendly Week" name="mealPlanName">
    </div>

    <div class="form-group col-md-12">
      <button type="submit" class="btn btn-success btn-lg">Create Meal Plan</button>
    </div>
  </form>
</div>