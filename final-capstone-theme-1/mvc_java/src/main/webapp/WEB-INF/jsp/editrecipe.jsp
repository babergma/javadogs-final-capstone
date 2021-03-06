<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="../css/viewrecipe.css" rel="stylesheet" type="text/css">
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>
<c:import url="/WEB-INF/jsp/header.jsp"/>
<%--<link href="../css/recipedetails.css" rel="stylesheet" type="text/css">--%>

<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Edit Recipe</h1>

    </div>

    <div class="row">

        <div class="col-lg-12">

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <div class="position-relative overflow-hidden p-3 p-xs-5 m-xs-3 text-center bg-light">
                        <div class="col-md-5 p-xs-5 mx-auto my-5">
                            <h3 class="m-0 font-weight-bold text-primary ">${currentRecipe.recipeName}</h3>

                        </div>
                        <div class="product-device shadow-sm d-none d-md-block"></div>
                        <div class="product-device product-device-2 shadow-sm d-none d-md-block"></div>
                    </div>
                </div>
            </div>
        </div>

        <div class="card-body">
            <c:url var="formActionUrl" value="/user/editRecipeIngredients"/>
            <form:form modelAttribute="ingredient" action="${formActionUrl}" method="POST">
            <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
            <h4>Ingredients</h4>
            <div class="form-row">

                <div class="form-group col-lg " >


                    <label for="ingredientName">Ingredient Name</label>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle btn-block" type="button"
                                id="ingredientName"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <form:select path="ingredientName" cssStyle="background-color: transparent;	color: #fff; border-color: #fff">
                                <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                    <c:forEach items="${displayIngredients}" var="displayIngredient">
                                        <form:option
                                                value="${displayIngredient.ingredientName}" cssStyle="background-color: #858796">
                                            <td>
                                                <button class="btn btn-danger me-md-2" type="button"><i class="fas fa-trash-alt"></i></button>
                                            </td>${displayIngredient.ingredientName}</form:option>
                                    </c:forEach>
                                </div>
                            </form:select>
                        </button>
                    </div>
                </div>

                <div class="form-group col-lg">
                    <label for="measurementAmount">Quantity</label>
                    <form:input type="number" class="form-control" path="measurementAmount"
                                placeholder="1"/>
                </div>

                <div class="form-group col-lg" >
                    <label for="measurementType">Measurement Type</label>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle btn-block" type="button"
                                id="measurementType"
                                data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            <form:select path="measurement" cssStyle="background-color: transparent;	color: #fff; border-color: #fff">
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <form:options items="${Measurements.values()}" itemLabel="abbreviation"
                                          itemValue="name" cssStyle="background-color: #858796"/>
                        </div>
                        </form:select>
                    </div>
                </div>

                <div class="form-group col-lg-3">
                    <label for="add"><p> </p></label>
                    <button type="submit" class="btn btn-success btn-block" id="add">Add to Recipe <i
                            class="fas fa-plus"></i></button>
                </div>
                </form:form>
                <div class="form-group col-lg-12">
                    Ingredient not there?
                    <button type="button" class="btn btn-outline" id="newIngredient"><a class="btn btn-danger" href="addingredient">Add new
                        ingredient</a></button>
                </div>
                <c:url var="submitFormActionUrl" value="/user/submitEditRecipe"/>
                <form:form modelAttribute="currentRecipe" action="${submitFormActionUrl}" method="POST">
                                       <form:hidden path="recipeId" value="${currentRecipe.recipeId}"/>
                <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                <div class="form-group col-md-12 alert alert-info" role="alert">
                    <div class="container">

                        <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
                        <table class="table caption-top">

                            <thead>
                            <tr>
                                <th scope="col"><p></p></th>
                                <th scope="col">Ingredient Name</th>
                                <th scope="col">Quantity</th>
                                <th scope="col">Measurement Type</th>
                            </tr>
                            </thead>
                            <tbody>
                            <c:forEach items="${ingredientList}" var="currentIngredient">
                                <tr>
                                    <td>
                                        <a href="" class="btn btn-sm">
                                            <button type="submit" class="btn btn-danger btn-circle" name="delete" value="${currentIngredient.ingredientId}"><i class="fas fa-trash"></i></button>
                                        </a>
                                    </td>
                                    <td>${currentIngredient.ingredientName}</td>
                                    <td>${currentIngredient.measurementAmount}</td>
                                    <td>${currentIngredient.measurement.abbreviation}</td>
                                </tr>
                            </c:forEach>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>

            <div class="form-group">
                <form:label path="recipeName" value="Name"/>
                <form:input path="recipeName" type="text" cssClass="form-control" placeholder="Cajun Shrimp"/>
            </div>
            <div class="form-row ">
                <div class="form-group col-md-4 col-auto">
                    <form:label path="cookTime" value="Cook Time"/>
                    <form:input path="cookTime" type="number" cssClass="form-control" placeholder="60"/>minutes
                </div>
                <div class="form-group col-md-4 col-auto">
                    <form:label path="servingSize" value="Serving Size"/>
                    <form:input path="servingSize" type="number" cssClass="form-control" placeholder="5"/>servings
                </div>
                <div class="form-group col-md-4 col-auto">
                    <form:label path="calories" value="Calories"/>
                    <form:input path="calories" type="number" cssClass="form-control" placeholder="600"/>
                    calories
                </div>

            </div>
            <div class="form-row">
                <div class="form-check">
                    <form:checkbox path="categoryList" value="VEGETARIAN" />Vegetarian
                    <form:checkbox path="categoryList" value="HIGH_PROTEIN" />High Protein
                    <form:checkbox path="categoryList" value="LOW_CARB" />Low Carb
                    <form:checkbox path="categoryList" value="DAIRY_FREE" />Dairy Free
                    <form:checkbox path="categoryList" value="GLUTEN_FREE" />Gluten Free
                    <form:checkbox path="categoryList" value="VEGAN" />Vegan
                    <form:checkbox path="categoryList" value="KOSHER" />Kosher
                    <form:checkbox path="categoryList" value="PESCRETARIAN" />Pescretarian
                </div>
            </div>
                <%--                </form:select>--%>
                <%--                <div class="form-check">--%>
                <%--                    <input class="form-check-input" type="checkbox" value="" id="flexCheckIndeterminate">--%>
                <%--                    <label class="form-check-label" for="flexCheckIndeterminate">--%>
                <%--                        Indeterminate checkbox--%>
                <%--                    </label>--%>
                <%--                </div>--%>
        </div>

        <div class="form-group col-md-12">
            <h4 for="cookingInstruction">Instructions</h4>
            <form:textarea id="cookingInstruction" path="cookingInstruction" cssClass="form-control"
                           rows="5"/>
        </div>
        <div class="form-group col-md-12">
            <div class="form-check">

                <form:radiobutton path="visible" cssClass="form-check-input" value="true"/>
                <label for="false" id="false" class="form-check-label" name="true">Public</label>
            </div>
            <div class="form-check">

                <form:radiobutton path="visible" cssClass="form-check-input" value="false"/>
                <label for="false" id="false" class="form-check-label" name="private">Private</label>
            </div>
        </div>
        <div class="form-group">
            <form:label path="pictureUrl" value="Picture"/>Input a different or new image
            <form:input path="pictureUrl" type="file" cssClass="form-control" />
        </div>
        <div class="form-group col-md-12">
            <button type="submit" class="btn btn-lg" style="background-color: #a5cfab; color:white" value="add" name="add">Update Recipe</button>
        </div>
    </div>

    </form:form>
</div>
</div>


<c:import url="/WEB-INF/jsp/footer.jsp"/>