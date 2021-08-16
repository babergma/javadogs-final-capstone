<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

<!doctype html>
<html lang="en">
<head>
    <!-- Required meta tags -->
    <meta charset="utf-8">
    <meta name="viewport" content="width=device-width, initial-scale=1">

    <!-- Bootstrap CSS -->
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-KyZXEAg3QhqLMpG8r+8fhAXLRk2vvoC2f3B09zVXn8CA5QIVfZOJ3BCsw2P0p/We" crossorigin="anonymous">
</head>
<body>


<!-- Begin Page Content -->
<div class="container-fluid">
    <div class="col-lg-12">
        <div class="container">
            <div class="row">
                <section class="panel panel-default">
                    <div class="panel-body">
                        <div class="row">
                            <div class="col-lg-9">
                                <h1>Grocery List  <a href="#" class="btn btn-info btn-circle btn-sm">
                                    <a href="javascript:print()">    <button type="submit" class="btn btn-warning ">Print<i class="fas fa-edit" style="color: white;"></i></button></a>
                                </a></h1>
                            </div>


                            <div class="col-lg-9">
                                <div class="input-group">
                        <span class="input-group-btn">
                          <button class="btn btn-default" type="button">
                            <i class="fa fa-search" aria-hidden="true"></i>
                          </button>
                        </span>
                                </div>
                                <!-- /input-group -->
                            </div>
                            <!-- /.col-lg-6 -->
                        </div>
                        <!-- row -->

                        <div class="row">
                            <div class="col-lg-12 col-xs-12">
                                <div class="panel-group" id="accordion" role="tablist" aria-multiselectable="true">

                                    <c:set var="counter" value="0"/>
                                    <c:forEach var="employee" items="${employees}">
                                        <c:set var="counter" value="${counter + 1}"/>
                                        <div class="panel panel-default" id="collapse${counter}_container">
                                            <div class="panel-heading" role="tab" id="heading${counter}">
                                                <h4 class="panel-title">
                                                    <a role="button"
                                                       data-toggle="collapse"
                                                       data-parent="#accordion"
                                                       href="#collapse${counter}"
                                                       aria-expanded="true"
                                                       aria-controls="collapse${counter}">
                                                        <i class="fa fa-paw fa-fw" aria-hidden="true"></i>${employee.firstName} ${employee.lastName}
                                                    </a>
                                                </h4>
                                            </div>
                                            <div id="collapse${counter}" class="panel-collapse collapse in" role="tabpanel"
                                                 aria-labelledby="heading${counter}">
                                                <div class="panel-body">
                                                    <ul>
                                                        <li>${employee.position}</li>
                                                        <li>${employee.office}</li>
                                                        <li>${employee.startDate}</li>
                                                        <li>${employee.salary}</li>
                                                    </ul>
                                                </div>
                                            </div>
                                        </div>
                                    </c:forEach>
                                </div>
                            </div>
                        </div>
                        <!-- row -->

                    </div>
                    <!-- panel-body -->
                </section>
            </div>
            <!-- row -->
        </div>
        <!-- Container -->
    </div>




    <div class="container">

        <!-- Columns start at 50% wide on mobile and bump up to 33.3% wide on desktop -->
        <table class="table caption-top">
            <thead>
            <tr>
                <th scope="col">Delete</th>
                <th scope="col">Item Name</th>
                <th scope="col">Quantity</th>

            </tr>
            </thead>
            <tbody>
            <tbody>
        <c:forEach items="${ingredientList}" var="ingredient">
            <tr>
                <td >
                    <a href="#" class="btn btn-danger btn-circle btn-sm">
                        <i class="fas fa-trash"></i>
                    </a>
                </td>
                <td>${ingredient.ingredientName}</td>
<%--                <td>${ingredient.measurementAmount}</td>--%>
<%--                <td>${ingredient.measurement.abbreviation}</td>--%>
                <td>
                    <div class="dropdown">
                        <button class="btn btn-secondary dropdown-toggle" type="button" id="dropdownMenuButton" data-toggle="dropdown" aria-haspopup="true" aria-expanded="false">
                            Dropdown button
                        </button>
                        <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                            <a class="dropdown-item" href="#">Action</a>
                            <a class="dropdown-item" href="#">Another action</a>
                            <a class="dropdown-item" href="#">Something else here</a>
                        </div>
                    </div>
                </td>
            </tr>
        </c:forEach>
            </tbody>
        </table>

    </div>










</div>
<!-- col-lg-12 -->
</div>
<!-- /.container-fluid -->
<!-- End of Page Content -->

<!-- Page level plugins -->
<script src="https://code.jquery.com/jquery-3.3.1.js"></script>
<script src="/js/accordion.js"></script>

<!-- Optional JavaScript; choose one of the two! -->

<!-- Option 1: Bootstrap Bundle with Popper -->
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.bundle.min.js" integrity="sha384-U1DAWAznBHeqEIlVSCgzq+c9gqGAJn5c/t99JyeKa9xxaYpSvHU5awsuZVVFIhvj" crossorigin="anonymous"></script>

<!-- Option 2: Separate Popper and Bootstrap JS -->
<!--
<script src="https://cdn.jsdelivr.net/npm/@popperjs/core@2.9.3/dist/umd/popper.min.js" integrity="sha384-eMNCOe7tC1doHpGoWe/6oMVemdAVTMs2xqW4mwXrXsW0L84Iytr2wi5v2QjrP/xp" crossorigin="anonymous"></script>
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.0/dist/js/bootstrap.min.js" integrity="sha384-cn7l7gDp0eyniUwwAZgrzD06kc/tftFf19TOAs2zVinnD/C7E91j9yyk5//jjpt/" crossorigin="anonymous"></script>
-->
</body>
</html>
<c:import url="/WEB-INF/jsp/footer.jsp" />