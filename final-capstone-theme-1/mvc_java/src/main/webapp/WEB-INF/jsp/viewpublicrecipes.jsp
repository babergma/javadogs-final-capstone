
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="../css/viewrecipe.css" rel="stylesheet" type="text/css">
<!-- Bootstrap core CSS -->
<link href="../../dist/css/bootstrap.min.css" rel="stylesheet">
<link rel="canonical" href="https://getbootstrap.com/docs/4.0/examples/album/">
<c:import url="/WEB-INF/jsp/header.jsp" />

<main role="main">
  <section class="jumbotron text-center">
    <div class="container">
      <h1 class="jumbotron-heading">View All Recipes</h1>
      <p class="lead text-muted">A Look at the great recipes provided by our community!</p>
      <c:if test="${LOGGED_USER != null}">
      <p>

        <c:url var="addRecipe" value="/user/addrecipe"/>
        <a href="${addRecipe}" class="btn btn-primary my-2">Add new recipe</a>
        <c:url var="addRecipe" value="/user/randomrecipe"/>
        <a href="${addRecipe}" class="btn btn-primary my-2">Random Recipe</a>
      </p>
      </c:if>
    </div>
  </section>
  <div class="album py-5 bg-light">
    <div class="container">
      <div class="row">
        <c:forEach items="${recipeList}" var="currentRecipe">
          <div class="col-md-4">
            <div class="card mb-4 shadow-sm">
              <c:url var="placeholderImageUrl" value="/img/kibble.jpg" />
              <img src="${placeholderImageUrl}" />
              <div class="card-body">
                <h3 class="card-text">${currentRecipe.recipeName}</h3>
                <div class="d-flex justify-content-between align-items-center">
                  <div class="btn-group">
                    <button type="button" class="btn btn-sm btn-outline-secondary">
                      <c:url var = "detailsURL" value="/user/recipedetails">
                        <c:param name="id" value="${currentRecipe.recipeId}"/>
                      </c:url>
                      <a href="${detailsURL}">View</a></button>
                  </div>
                  <small class="text-muted">${currentRecipe.cookTime}</small>
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
</body>