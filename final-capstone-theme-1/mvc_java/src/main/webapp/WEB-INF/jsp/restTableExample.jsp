<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

        <!-- Begin Page Content -->
        <div class="container-fluid">

          <table id="employees" class="display" style="width:100%">
            <thead>
            <tr>
              <th></th>
              <th>First name</th>
              <th>Last name</th>
              <th>Position</th>
              <th>Office</th>
              <th>Start date</th>
              <th>Salary</th>
            </tr>
            </thead>
            <tfoot>
            <tr>
              <th></th>
              <th>First name</th>
              <th>Last name</th>
              <th>Position</th>
              <th>Office</th>
              <th>Start date</th>
              <th>Salary</th>
            </tr>
            </tfoot>
          </table>

        </div>
        <!-- /.container-fluid -->
        <!-- End of Page Content -->

<!-- Page level plugins -->

<!-- Core plugin JavaScript-->

<script src="https://code.jquery.com/jquery-3.5.1.js"></script>
<script src="https://cdn.datatables.net/1.10.20/js/jquery.dataTables.min.js"></script>


<script src="/js/resttable.js"></script>


<c:import url="/WEB-INF/jsp/footer.jsp" />