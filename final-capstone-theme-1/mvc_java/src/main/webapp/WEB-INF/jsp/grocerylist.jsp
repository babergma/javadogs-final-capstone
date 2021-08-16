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
                                <h1>Grocery List
                                    <a href="javascript:print()">    <button type="submit" class="btn btn-warning ">Print<i class="fas fa-edit" style="color: white;"></i></button></a>
                                </a></h1>
                            </div>



                            <!-- /.col-lg-6 -->
                        </div>
                        <!-- row -->


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
                <th scope="col">Item Name</th>
            </tr>
            </thead>
            <tbody>
            <tbody>
        <c:forEach items="${ingredientList}" var="ingredient">
            <tr>
                <td>${ingredient.ingredientName}</td>
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