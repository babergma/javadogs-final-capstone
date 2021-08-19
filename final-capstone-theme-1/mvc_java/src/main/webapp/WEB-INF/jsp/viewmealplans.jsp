
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="../css/viewrecipe.css" rel="stylesheet" type="text/css">
<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/album/">
<c:import url="/WEB-INF/jsp/header.jsp" />
<header>

</header>
<main role="main">
  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">My Meal Plans</h1>
      <p class="lead text-muted">Look at all of your saved meal plans</p>
      <p>
        <c:url var="addMealPlanName" value="/user/addmealplanname"/>
        <a href="${addMealPlanName}" class="btn btn-primary my-2">Add new meal plan</a>
      </p>
    </div>
  </section>

  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row">
        <c:forEach items="${mealPlanList}" var="mealPlan">
          <div class="col-md-4">
            <div class="card border-success mb-3" style="max-width: 30rem;">
            <div class="card mb-4 shadow-sm">
              <div class="card-body">
                <p class="card-text" style = "font-size: 18px; color:#EE964B;"><b>${mealPlan.mealPlanName}</b></p>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <c:url var="viewMealPlanDetail" value="/user/mealplandetails">
                      <c:param name="id" value="${mealPlan.mealPlanId}"/>
                    </c:url>
                    <a href="${viewMealPlanDetail}" class="btn btn-sm btn-outline-secondary">View</a>
                    <c:url var="editMealPlanDetail" value="/user/modifymealplan">
                      <c:param name="id" value="${mealPlan.mealPlanId}"/>
                    </c:url>
                    <button type="button" class="btn btn-sm btn-outline-secondary"><a href="${editMealPlanDetail}">Edit</a></button>
                  </div>
                  <p class="card-text"><small class="text-muted">12 Recipes</small></p>
                </div>
              </div>
            </div>
          </div>
          </div>
        </c:forEach>
      </div>
    </div>
  </div>
</main>
<footer class="text-muted">
  <div class="container">
    <p class="float-right">
      <a href="#">Back to top</a>
    </p>
  </div>
</footer>