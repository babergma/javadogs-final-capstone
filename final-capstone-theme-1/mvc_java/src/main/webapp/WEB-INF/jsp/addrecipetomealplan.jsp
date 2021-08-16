<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:import url="/WEB-INF/jsp/header.jsp"/>


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Add New Meal to Meal Plan</h1>
    </div>

    <form method="post" action="addrecipetomealplan">
        <div class="form-group">
            <label for="mealPlanId">Meal Plan Name</label>
            <select class="form-control" id="mealPlanId" name="mealPlanId">
                <c:forEach items="${mealPlanList}" var="mealPlan">
                    <option value="${mealPlan.mealPlanId}">${mealPlan.mealPlanName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="dayOfWeek">Day of the week:</label>
            <select class="form-control" id="dayOfWeek" name="dayOfWeekId">
                <c:forEach items="${daysOfWeek}" var="dayOfWeek">
                <option value="${dayOfWeek.value}">${dayOfWeek.name()}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="recipeName">Recipe Name</label>
            <select class="form-control" id="recipeName" name="recipeId">
                <c:forEach items="${recipeList}" var="recipe">
                    <option value="${recipe.recipeId}">${recipe.recipeName}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group">
            <label for="timeOfDay">Meal Time</label>
            <select class="form-control" id="timeOfDay" name="timeOfDay">
                <c:forEach items="${timeOfdays}" var="timeOfDay">
                <option value="${timeOfDay}">${timeOfDay.abbreviation}</option>
                </c:forEach>
            </select>
        </div>
        <div class="form-group col-md-12">
            <button type="submit" class="btn btn-success btn-lg">Add Meal</button>
            <%--            <script>meal confirmedmeal()--%>
            <%--            {alert("Your meal was added!")}</script>--%>
        </div>




    </form>
    <!-- /.container-fluid -->
    <!-- End of Page Content -->

<c:import url="/WEB-INF/jsp/footer.jsp"/>