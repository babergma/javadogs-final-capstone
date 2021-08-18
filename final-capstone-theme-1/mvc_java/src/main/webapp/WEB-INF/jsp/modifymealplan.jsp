<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="/WEB-INF/jsp/header.jsp"/>

<head>
  <link href="../css/modifymealplan.css" rel="stylesheet" type="text/css">
</head>
<body>
<div class="col-lg-12">

  <div class="card shadow mb-4">
    <div class="card-header py-3">
      <div class="position-relative overflow-hidden p-3 p-xs-5 m-xs-3 text-center bg-light">
        <div class="col-md-5 p-xs-5 mx-auto my-5">
          <%--                        <h3 class="m-0 font-weight-bold text-primary ">${mealplan.mealplanname}</h3>--%>
          <h3 class="m-0 font-weight-bold text-primary ">${mealPlan.mealPlanName}</h3>
          <p>
            <c:url var="addRecipetoMealPlan" value="/user/addrecipetomealplan"/>
            <a href="${addRecipetoMealPlan}" class="btn btn-primary my-2">Add recipe to meal plan</a>
          </p>
        </div>
        <div class="product-device shadow-sm d-none d-md-block"></div>
        <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
      </div>
    </div>
  </div>
</div>
<div class="form-group col-md-12">
  <div class="container">
    <hr>
    <h1 style="font-weight: bold">Monday</h1>
    <hr>
    <h2>Breakfast</h2>
    <%--            get recipes associated with time of day and the day--%>
    <%--            <c:forEach items="${recipeList}" var="recipe">--%>
    <table>
      <thead></thead>
      <tbody>
<c:url var="formActionUrl" value="/user/submitDeleteRecipeFromMealPlan"/>
<form action="${formActionUrl}" method="GET">

      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==1  && recipe.timeOfDay.timeOfDayId==1}">
          <td>



              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a>
          </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>



      </tbody>
    </table>
    <h2>Lunch</h2>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==1  && recipe.timeOfDay.timeOfDayId==2}">
          <td>





              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>
    <h2>Dinner</h2>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==1  && recipe.timeOfDay.timeOfDayId==3}">
          <td>





              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>
    <hr>
    <h1 style="font-weight: bold">Tuesday</h1>
    <hr>
    <h2>Breakfast</h2>
    <%--            get recipes associated with time of day and the day--%>
    <%--            <c:forEach items="${recipeList}" var="recipe">--%>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==2  && recipe.timeOfDay.timeOfDayId==1}">
          <td>





              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>
    <h2>Lunch</h2>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==2  && recipe.timeOfDay.timeOfDayId==2}">
          <td>




              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a></td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>
    <h2>Dinner</h2>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==2  && recipe.timeOfDay.timeOfDayId==3}">
          <td>





              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>

    <hr>
    <h1 style="font-weight: bold">Wednesday</h1>
    <hr>
    <h2>Breakfast</h2>
    <%--            get recipes associated with time of day and the day--%>
    <%--            <c:forEach items="${recipeList}" var="recipe">--%>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==3  && recipe.timeOfDay.timeOfDayId==1}">
          <td>




              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a></td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>
    <h2>Lunch</h2>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==3  && recipe.timeOfDay.timeOfDayId==2}">
          <td>





              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a></td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>
    <h2>Dinner</h2>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==3 && recipe.timeOfDay.timeOfDayId==3}">
          <td>




              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>

    <hr>
    <h1 style="font-weight: bold">Thursday</h1>
    <hr>
    <h2>Breakfast</h2>
    <%--            get recipes associated with time of day and the day--%>
    <%--            <c:forEach items="${recipeList}" var="recipe">--%>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==4  && recipe.timeOfDay.timeOfDayId==1}">
          <td>





              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a></td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>

    <h2>Lunch</h2>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==4 && recipe.timeOfDay.timeOfDayId==2}">
          <td>

              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>



            <button class="btn btn-danger btn-sm" type="submit" name="delete" value="${recipe.recipeId}"><i class="fas fa-trash"></i></button>
          </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>

    <h2>Dinner</h2>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==4  && recipe.timeOfDay.timeOfDayId==3}">
          <td>





              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>

    <hr>
    <h1 style="font-weight: bold">Friday</h1>
    <hr>
    <h2>Breakfast</h2>
    <%--            get recipes associated with time of day and the day--%>
    <%--            <c:forEach items="${recipeList}" var="recipe">--%>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==5  && recipe.timeOfDay.timeOfDayId==1}">
          <td>


              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>


            <button class="btn btn-danger btn-sm" type="submit" name="delete" value="${recipe.recipeId}"><i class="fas fa-trash"></i></button>
          </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>
    <h2>Lunch</h2>
      <table>
          <thead></thead>
          <tbody>
          <c:forEach items="${mealPlan.recipeList}" var="recipe">
              <tr>
              <c:if test="${recipe.dayOfWeek.getValue()==5  && recipe.timeOfDay.timeOfDayId==2}">
                  <td>





                      <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                          <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                          <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                          <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                          <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
                      </c:url>
                      <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
                  <td><h4>${recipe.recipeName}</h4></td>
                  </tr>

              </c:if>
          </c:forEach>
          </tbody>
    <h2>Dinner</h2>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==5  && recipe.timeOfDay.timeOfDayId==3}">
          <td>





              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>

    <hr>
    <h1 style="font-weight: bold">Saturday</h1>
    <hr>
    <h2>Breakfast</h2>
    <%--            get recipes associated with time of day and the day--%>
    <%--            <c:forEach items="${recipeList}" var="recipe">--%>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==6  && recipe.timeOfDay.timeOfDayId==1}">
          <td>





              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>
    </table>
    <h2>Lunch</h2>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==6  && recipe.timeOfDay.timeOfDayId==2}">
          <td>




              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>
    <h2>Dinner</h2>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==6  && recipe.timeOfDay.timeOfDayId==3}">
          <td>




              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>

    <hr>
    <h1 style="font-weight: bold">Sunday</h1>
    <hr>
    <h2>Breakfast</h2>
    <%--            get recipes associated with time of day and the day--%>
    <%--            <c:forEach items="${recipeList}" var="recipe">--%>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==7 && recipe.timeOfDay.timeOfDayId==1}">
          <td>




              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>
    </table>
    <h2>Lunch</h2>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==7  && recipe.timeOfDay.timeOfDayId==2}">
          <td>




              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>
    <h2>Dinner</h2>
    <table>
      <thead></thead>
      <tbody>
      <c:forEach items="${mealPlan.recipeList}" var="recipe">
        <tr>
        <c:if test="${recipe.dayOfWeek.getValue()==7  && recipe.timeOfDay.timeOfDayId==3}">
          <td>



              <c:url var = "priceRangeURL" value="/user/submitDeleteRecipeFromMealPlan">
                  <c:param name="thisRecipeId" value="${recipe.recipeId}"/>
                  <c:param name="thisDayOfWeekId" value="${recipe.dayOfWeek.getValue()}"/>
                  <c:param name="thisTimeOfDayId" value="${recipe.timeOfDay.timeOfDayId}"/>
                  <c:param name="mealPlanId" value="${mealPlan.mealPlanId}" />
              </c:url>
              <a href="${priceRangeURL}"><i class="fas fa-trash"></i></a> </td>
          <td><h4>${recipe.recipeName}</h4></td>
          </tr>

        </c:if>
      </c:forEach>
      </tbody>
    </table>
      <input hidden name="mealPlanId" value="${mealPlan.mealPlanId}">
    </form>
  </div>
</div>
</div>
</body>

<c:import url="/WEB-INF/jsp/footer.jsp"/>