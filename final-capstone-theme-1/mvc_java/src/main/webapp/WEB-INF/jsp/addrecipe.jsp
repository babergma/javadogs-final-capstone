<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form" %>

<c:import url="/WEB-INF/jsp/header.jsp"/>


<!-- Begin Page Content -->
<div class="container-fluid">

    <!-- Page Heading -->
    <div class="d-sm-flex align-items-center justify-content-between mb-4">
        <h1 class="h3 mb-0 text-gray-800">Add New Recipe to Library</h1>
    </div>


    <div class="row">

        <div class="col-lg-12">

            <div class="card shadow mb-4">
                <div class="card-header py-3">
                    <h3 class="m-0 font-weight-bold text-primary "> New Recipe</h3>
                </div>
                <div class="card-body">
                    <c:url var="formActionUrl" value="/user/addrecipe"/>
                    <form:form modelAttribute="ingredient" action="${formActionUrl}" method="POST">
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
                                                            value="${displayIngredient.ingredientName}" cssStyle="background-color: #858796"><td> <button class="btn btn-danger me-md-2" type="button"><i class="fas fa-trash-alt"></i></button></td>${displayIngredient.ingredientName}</form:option>
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

                            <div class="form-group col-lg">
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

                            <div class="form-group col-lg-12">
                                Ingredient not there?
                                <button type="button" class="btn btn-outline-danger" id="newIngredient">Add new
                                    ingredient
                                </button>
                            </div>

                            <div class="form-group col-md-12 alert alert-info" role="alert">
                                <div class="container">

                                    <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
                                    <table class="table caption-top">

                                        <thead>
                                        <tr>
                                            <th scope="col">Ingredient Name</th>
                                            <th scope="col">Quantity</th>
                                            <th scope="col">Measurement Type</th>
                                        </tr>
                                        </thead>
                                        <tbody>
                                            <%--                                            <c:forEach items="${ingredients}" var="ingredient">--%>
                                        <c:forEach items="${ingredientList}" var="currentIngredient">
                                            <tr>
                                                <td>${currentIngredient.ingredientName}</td>
                                                <td>${currentIngredient.measurementAmount}</td>
                                                <td>${currentIngredient.measurement.abbreviation}</td>
                                            </tr>
                                        </c:forEach>
                                            <%--                                            </c:forEach>--%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </form:form>
                    <c:url var="submitFormActionUrl" value="/user/submitRecipe"/>
                    <form:form modelAttribute="recipe" action="${submitFormActionUrl}" method="POST">
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
                                <%--                                <form:radiobutton path="visible"  type="radio" name="visibility"--%>
                                <%--                                       value="false" />--%>

                        </div>
                    </div>

                    <div class="form-group col-md-12">
                        <button type="submit" class="btn btn-success btn-lg">Add Recipe</button>
                    </div>
                </div>

                </form:form>
            </div>
        </div>

    </div>

</div>

</div>
<!-- /.container-fluid -->
<!-- End of Page Content -->

<c:import url="/WEB-INF/jsp/footer.jsp"/>