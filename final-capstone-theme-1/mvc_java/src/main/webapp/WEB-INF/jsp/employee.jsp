<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>


<c:import url="/WEB-INF/jsp/header.jsp" />

  <!-- Begin Page Content -->
  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-gray-900 mb-4">Edit Employee</h1>
              </div>
              <form:form class="user" method="POST" action="/employee" modelAttribute="employee">
                <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                <input type="hidden" name="id" value="${id}"/>
                <input type="hidden" name="returnPath" value="${returnPath}"/>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <form:input type="text" class="form-control form-control-user"
                                path="firstName" name="firstName" id="firstName" placeholder="First Name"/>
                    <form:errors path="firstName" cssClass="error"/>
                  </div>
                  <div class="col-sm-6">
                    <form:input type="select" class="form-control form-control-user" required="true"
                                path="lastName" name="lastName" id="lastName" placeholder="Last Name"/>
                    <form:errors path="lastName" cssClass="error"/>
                  </div>
                </div>
                <div class="form-group">
                  <form:input type="text" class="form-control form-control-user" required="true"
                              path="office" name="office" id="office" placeholder="Office"/>
                  <form:errors path="office" cssClass="error"/>
                </div>

                <div class="form-group">
                  <form:input type="text" class="form-control form-control-user" required="true"
                              path="salary" name="salary" id="salary" placeholder="Salary"/>
                  <form:errors path="salary" cssClass="error"/>
                </div>

                <div class="form-group">
                  <form:input type="text" class="form-control form-control-user" required="true"
                              path="position" name="position" id="position" placeholder="Position"/>
                  <form:errors path="position" cssClass="error"/>
                </div>

                <div class="form-group">
                  <form:input type="text" class="form-control form-control-user" required="true"
                              path="startDate" name="startDate" id="startDate" placeholder="startDate"/>
                  <form:errors path="startDate" cssClass="error"/>
                </div>

                <button type="submit" class="btn btn-primary btn-user btn-block">
                  Save Employee
                </button>
              </form:form>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
  <!-- End of Page Content -->

<c:import url="/WEB-INF/jsp/footer.jsp" />