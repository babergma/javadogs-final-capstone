<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<link href="${baseUrl}css/site.css" rel="stylesheet" type="text/css">


<c:import url="/WEB-INF/jsp/header.jsp" />


<header>

    <h1 class="p-3" style="text-align:center; color:#a5cfab; background-color: #5a5c69;"> Welcome to Prep Thyme!</h1>
    <br>
    <br>
    <h3 style="text-align:center">Your one stop shop for all things meal planning. Prep Thyme makes meal planning,
        prepping, cooking and grocery shopping a breeze.</h3>

    <br>
</header>
<div class="form-row">
    <body>

    <div class="form-group col-md-8">
        <div id="carouselRecipes" class="carousel slide" data-ride="carousel">
            <div class="carousel-inner">
                <div class="carousel-item active">
                    <img class="d-block w-50 mx-auto" src="img/asiansalmon.jpg" alt="First slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-50 mx-auto" src="img/mango-bread.jpg" alt="Second slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-50 mx-auto" src="img/greentomatosalsa.jpg" alt="Third slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-50 mx-auto" src="img/frenchtoast.jpg" alt="Fourth slide">
                </div>
                <div class="carousel-item">
                    <img class="d-block w-50 mx-auto" src="img/spaghetti.jpg" alt="Fifth slide">
                </div>

            </div>
        </div>
    </div>

    <c:if test="${LOGGED_USER == null}">
        <div class="form-group col-md-4">
            <br>
            <br>
            <tbody>
            <tr>


                <td>
                    <ul style="list-style: none;">
                        <li><p>
                            <i style="color:#a5cfab" class="fab fa-pagelines fa-3x"></i>&nbsp;
                            <a class="btn  btn-lg" style="background-color:#EE964B; color: white;"
                               href="${baseUrl}login" role="button">Login</a>
                        </p></li>
                        <br>
                        <li><p>
                            <i style="color:#a5cfab" class="fab fa-pagelines fa-3x"></i>&nbsp;
                            <a class="btn btn-lg" style="background-color:#EE964B; color: white;"
                               href="${baseUrl}register" role="button">Create Account</a>
                        </p></li>
                        <br>
                        <li><p>
                            <i style="color:#a5cfab" class="fab fa-pagelines fa-3x"></i>&nbsp;
                            <a class="btn  btn-lg" style="background-color:#EE964B; color: white;"
                               href="${baseUrl}user/viewallrecipes" role="button">Start Browsing All Recipes</a>
                        </p></li>
                    </ul>
                </td>
            </tr>

            </tbody>

        </div>
    </c:if>

    <c:if test="${LOGGED_USER != null}">
        <div class="form-group col-md-4">
            <br>
            <br>
            <tbody>
            <tr>


                <td>
                    <ul style="list-style: none;">
                        <li><p>
                            <i style="color:#a5cfab" class="fab fa-pagelines fa-3x"></i>&nbsp;
                            <a class="btn btn-primary btn-lg" style="background-color:#EE964B"
                               href="${baseUrl}user/viewmealplans" role="button">My Meal Plans</a>
                        </p></li>
                        <br>
                        <li><p>
                            <i style="color:#a5cfab" class="fab fa-pagelines fa-3x"></i>&nbsp;
                            <a class="btn btn-primary btn-lg" style="background-color:#EE964B"
                               href="${baseUrl}user/viewrecipe" role="button">My Recipes</a>
                        </p></li>
                        <br>
                        <li><p>
                            <i style="color:#a5cfab" class="fab fa-pagelines fa-3x"></i>&nbsp;
                            <a class="btn btn-primary btn-lg" style="background-color:#EE964B" href="#" data-toggle="modal" data-target="#logoutModal">
                                Logout
                            </a>
                        </p></li>

                    </ul>
                </td>
            </tr>

            </tbody>

        </div>
    </c:if>

    </body>
</div>
<c:import url="/WEB-INF/jsp/footer.jsp" />