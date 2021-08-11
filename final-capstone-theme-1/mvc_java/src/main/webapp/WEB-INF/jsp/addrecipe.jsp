<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

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
                    <h3 class="m-0 font-weight-bold text-primary ">New Recipe</h3>
                </div>
                <div class="card-body">
                    <form>
                        <h4>Ingredients</h4>
                        <div class="form-row">

                            <div class="form-group col-lg " >

                                <label for="ingredientName">Ingredient Name</label>
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle btn-block" type="button" id="ingredientName"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Thyme
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="#">Action</a>
                                        <a class="dropdown-item" href="#">Another action</a>
                                        <a class="dropdown-item" href="#">Something else here</a>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-lg">
                                <label for="measurementAmount">Quantity</label>
                                <input type="number" class="form-control" id="measurementAmount" placeholder="1">
                            </div>

                            <div class="form-group col-lg" >
                                <label for="measurementType">Measurement Type</label>
                                <div class="dropdown">
                                    <button class="btn btn-secondary dropdown-toggle btn-block" type="button" id="measurementType"
                                            data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                                        Tsp
                                    </button>
                                    <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                                        <a class="dropdown-item" href="#">Cup</a>
                                        <a class="dropdown-item" href="#">Tbs</a>
                                    </div>
                                </div>
                            </div>

                            <div class="form-group col-lg-4">
                                <label for="add"><p> </p></label>
                                <button type="submit" class="btn btn-success btn-block" id="add">Add to Recipe <i
                                        class="fas fa-plus"></i></button>
                            </div>

                            <div class="form-group col-lg-12">
                                Ingredient not there?
                                <button type="button" class="btn btn-outline-danger" id="newIngredient">Add new
                                    ingredient</button>
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
                                        <tr>
                                            <td>Thyme</td>
                                            <td>1</td>
                                            <td>Tsp</td>
                                        </tr>
                                        <%--                                            </c:forEach>--%>
                                        </tbody>
                                    </table>
                                </div>
                            </div>
                        </div>
                    </form>
                    <form>
                        <div class="form-group">
                            <label for="recipeName">Name</label>
                            <input type="text" class="form-control" id="recipeName" placeholder="Cajun Shrimp">
                        </div>
                        <div class="form-row ">
                            <div class="form-group col-md-4 col-auto">
                                <label for="cookTime">Cook Time</label>
                                <input type="number" class="form-control" id="cookTime" placeholder="60">minutes
                            </div>
                            <div class="form-group col-md-4 col-auto">
                                <label for="servingSize">Serving Size</label>
                                <input type="number" class="form-control" id="servingSize" placeholder="5">servings
                            </div>
                            <div class="form-group col-md-4 col-auto">
                                <label for="calories">Calories</label>
                                <input type="number" class="form-control" id="calories" placeholder="600">
                                calories
                            </div>
                        </div>

                            <div class="form-group col-md-12">
                                <h4 for="cookingInstructions">Instructions</h4>
                                <textarea class="form-control" id="cookingInstructions" rows="5"></textarea>
                            </div>
                            <div class="form-group col-md-12">
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="visibility" id="public"
                                           value="option1" checked>
                                    <label class="form-check-label" for="public">Public</label>
                                </div>
                                <div class="form-check">
                                    <input class="form-check-input" type="radio" name="visibility" id="private"
                                           value="option2">
                                    <label class="form-check-label" for="private">Private</label>
                                </div>
                            </div>

                            <div class="form-group col-md-12">
                                <button type="submit" class="btn btn-success btn-lg">Add Recipe</button>
                            </div>
                        </div>

                    </form>
                </div>
            </div>

        </div>

    </div>

</div>
<!-- /.container-fluid -->
<!-- End of Page Content -->

<c:import url="/WEB-INF/jsp/footer.jsp"/>