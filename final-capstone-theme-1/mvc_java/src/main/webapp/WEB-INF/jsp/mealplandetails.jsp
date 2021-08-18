<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="../css/mealplandetails.css" rel="stylesheet" type="text/css">
<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/album/">
<c:import url="/WEB-INF/jsp/header.jsp"/>
<header>

</header>
<main role="main">
    <section class="jumbotron text-center">
        <div class="container">
            <h1 class="jumbotron-heading">${mealPlan.mealPlanName}</h1>
            <p class="lead text-muted">Goal: Health!</p>
            <c:url var="viewMealPlanGroceryList" value="/user/grocerylist">
                <c:param name="id" value="${mealPlan.mealPlanId}"/>
            </c:url>
            <a href="${viewMealPlanGroceryList}" class="btn btn-sm btn-outline-secondary">Grocery List</a>
            <p>
                <c:url var="modifyMealPlan" value="/user/modifymealplan">
                    <c:param name="id" value="${mealPlan.mealPlanId}"/>
                </c:url>
                <a href="${modifyMealPlan}" class="btn btn-primary my-2">Edit Meal Plan</a>
                <a href="javascript:print()">
                    <button type="submit" class="btn btn-warning ">Print<i class="fas fa-edit"
                                                                           style="color: white;"></i></button>
                </a>

            </p>
        </div>
    </section>

    <table class="table table-hover">
        <thead class="thead-dark">
        <tr>
            <th scope="col"></th>
            <th scope="col">Breakfast</th>
            <th scope="col">Lunch</th>
            <th scope="col">Dinner</th>
        </tr>
        </thead>

        <tbody>


        <tr>
            <th scope="row">Monday</th>
            <td id="Monday Breakfast">

                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==1  && recipe.timeOfDay.timeOfDayId==1}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>

            </td>
            <td id="Monday Lunch">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==1  && recipe.timeOfDay.timeOfDayId==2}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td id="Monday Dinner">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==1  && recipe.timeOfDay.timeOfDayId==3}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
        </tr>


        <tr>
            <th scope="row">Tuesday</th>
            <td id="Tuesday Breakfast">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==2  && recipe.timeOfDay.timeOfDayId==1}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td id="Tuesday Lunch">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==2 && recipe.timeOfDay.timeOfDayId==2}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>

            <td id="Tuesday Dinner">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==2  && recipe.timeOfDay.timeOfDayId==3}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
        </tr>

        <tr>
            <th scope="row">Wednesday</th>
            <td id="Wednesday Breakfast">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==3  && recipe.timeOfDay.timeOfDayId==1}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td id="Wednesday Lunch">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==3  && recipe.timeOfDay.timeOfDayId==2}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td id="Wednesday Dinner">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==3  && recipe.timeOfDay.timeOfDayId==3}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
        </tr>

        <tr>
            <th scope="row">Thursday</th>
            <td id="Thursday Breakfast">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==4  && recipe.timeOfDay.timeOfDayId==1}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>

                </ul>
            </td>
            <td id="Thursday Lunch">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==4  && recipe.timeOfDay.timeOfDayId==2}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td id="Thursday Dinner">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==4 && recipe.timeOfDay.timeOfDayId==3}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>

        </tr>

        <tr>
            <th scope="row">Friday</th>
            <td id="Friday Breakfast">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==5  && recipe.timeOfDay.timeOfDayId==1}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td id="Friday Lunch">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==5  && recipe.timeOfDay.timeOfDayId==2}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td id="Friday Dinner">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==5  && recipe.timeOfDay.timeOfDayId==3}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
        </tr>

        <tr>
            <th scope="row">Saturday</th>
            <td id="Saturday Breakfast">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==6  && recipe.timeOfDay.timeOfDayId==1}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td id="Saturday Lunch">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==6 && recipe.timeOfDay.timeOfDayId==2}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td id="Saturday Dinner">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==6  && recipe.timeOfDay.timeOfDayId==3}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
        </tr>

        <tr>
            <th scope="row">Sunday</th>
            <td id="Sunday Breakfast">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==7  && recipe.timeOfDay.timeOfDayId==1}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td id="Sunday Lunch">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==7  && recipe.timeOfDay.timeOfDayId==2}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
            <td id="Sunday Dinner">
                <ul>
                    <c:forEach items="${mealPlan.recipeList}" var="recipe">
                        <c:if test="${recipe.dayOfWeek.getValue()==7 && recipe.timeOfDay.timeOfDayId==3}">
                            <li><c:url var="detailsURL" value="/user/recipedetails">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                                <a href="${detailsURL}">${recipe.recipeName}</a></li>
                        </c:if>
                    </c:forEach>
                </ul>
            </td>
        </tr>
        </tbody>

    </table>


</main>
<footer class="text-muted">
    <div class="container">
        <p class="float-right">
            <a href="#">Back to top</a>
        </p>
    </div>

</footer>
</body>