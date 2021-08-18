<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Here are all the recipes matching ${param.searchText}</h1>
    </div>

    <div class="row">

        <!-- Earnings (Monthly) Card Example -->



        <div class="col-lg-6">
            <c:if test="${empty searchedRecipes}">
                <p>No results found...</p>
            </c:if>
            <c:forEach items="${searchedRecipes}" var="searchedRecipe">
                <!-- Collapsable Card Example -->
                <div class="card shadow mb-4">
                    <!-- Card Header - Accordion -->
                    <a href="#collapseCard${searchedRecipe.recipeId}" class="d-block card-header py-3" data-toggle="collapse" role="button" aria-expanded="true" aria-controls="collapseCard${searchedRecipe.recipeId}">
                        <h6 class="m-0 font-weight-bold text-primary">${searchedRecipe.recipeName} <span class="badge badge-pill badge-info">${searchedRecipe.category}</span></h6>
                    </a>
                    <!-- Card Content - Collapse -->
                    <div class="collapse" id="collapseCard${searchedRecipe.recipeId}">
                        <div class="card-body">
                            <c:url var="placeholderImageUrl" value="/img/${searchedRecipe.pictureUrl}" />
                            <div class="form-group col-md-12">
                                <img class="mx-auto margin img-thumbnail searchImage" src="${placeholderImageUrl}" />
                            </div>
                            <div class="form-group col-md-12">
                                <div class="form-group col-md-3">
                                    <span><strong class="searchSubHeading">Serving size:</strong> ${searchedRecipe.servingSize}</span>
                                </div>
                                <div class="form-group col-md-3">
                                    <span><strong class="searchSubHeading">Calories:</strong> ${searchedRecipe.calories}</span>
                                </div>
                                <div class="form-group col-md-3">

                                    <span><strong class="searchSubHeading">Cook Time:</strong> ${searchedRecipe.cookTime} minutes</span>
                                </div>
                                <div class="form-group col-md-3">
                                    <a href="recipedetails?id=${searchedRecipe.recipeId}">Ingredients & Instructions</a>
                                </div>
                            </div>

                        </div>
                    </div>

                </div>
            </c:forEach>
        </div>
    </div>
</div>
<!-- /.container-fluid -->
<!-- End of Page Content -->



<c:import url="/WEB-INF/jsp/footer.jsp" />