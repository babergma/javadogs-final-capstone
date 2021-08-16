<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp"/>
<link href="../css/recipedetails.css" rel="stylesheet" type="text/css">

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Recipe Details</h1>
    </div>


    <div class="row">

        <div class="col-lg-12">

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="position-relative overflow-hidden p-3 p-xs-5 m-xs-3 text-center bg-light">
                        <c:url var="placeholderImageUrl" value="/img/kibble.jpg" />
                        <img src="${placeholderImageUrl}" />
                        <div class="col-md-5 p-xs-5 mx-auto my-5">
                            <h3 class="m-0 font-weight-bold text-primary ">${recipe.recipeName}</h3>
                            <p class="lead fw-normal">Summary of recipe story or whatever</p>
                            <a href="javascript:print()">    <button type="submit" class="btn btn-warning ">Print<i class="fas fa-edit" style="color: white;"></i></button></a>
                        </div>
                        <div class="product-device shadow-sm d-none d-md-block"></div>
                        <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
                    </div>

                </div>
                <div class="card-body">
                    <div class="d-grid gap-2 d-md-flex justify-content-md-end">
                        <button type="submit" class="btn btn-warning ">
                            <c:url var = "editURL" value="/user/editrecipe">
                                <c:param name="id" value="${recipe.recipeId}"/>
                            </c:url>
                            <a href="${editURL}" style="color: white;">
                                Edit <i class="fas fa-edit" style="color: white;"></i></a></button>
                    </div>
                    <h4>Ingredients</h4>

                    <div class="form-row">
                        <c:forEach items="${recipe.ingredientList}" var="ingredient">
                            <div class="form-group col-md-12 alert alert-info" role="alert">
                                <div class="container">
                                    <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
                                    <ul id="bullets">
                                        <li>${ingredient.measurementAmount} ${ingredient.measurement.abbreviation} ${ingredient.ingredientName}</li>
                                    </ul>
                                </div>
                            </div>
                        </c:forEach>
                        <div class="form-group col-md-4">
                            Serving size: ${recipe.servingSize}
                        </div>
                        <div class="form-group col-md-4">
                            Calories: ${recipe.calories}
                        </div>
                        <div class="form-group col-md-4">
                            Cook Time: ${recipe.cookTime} minutes
                        </div>
                        <div class="form-group col-md-12">


                            <h4>Instructions</h4>
                            <div class="form-row">

                                <div class="form-group col-md-12 alert alert-info" role="alert">
                                    <div class="container">
                                        <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
                                        <p>
                                            ${recipe.cookingInstruction}
                                        </p>

                                    </div>
                                </div>
                                <button type="button" class="btn btn-success btn-block" id="add" style="background: #a5cfab; color:white;">Add to Meal Plan <i
                                        class="fas fa-plus"></i></button>
                            </div>
                        </div>
                    </div>
                </div>

            </div>

        </div>

    </div>
    <!-- /.container-fluid -->
    <!-- End of Page Content -->
</div>
<c:import url="/WEB-INF/jsp/footer.jsp"/>