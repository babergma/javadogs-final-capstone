<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib prefix="form" uri="http://www.springframework.org/tags/form"%>
<c:url var="baseUrl" value="/" />

<c:import url="/WEB-INF/jsp/header.jsp" />

  <!-- Begin Page Content -->
  <div class="container">

    <div class="card o-hidden border-0 shadow-lg my-5">
      <div class="card-body bg-dark p-0">
        <!-- Nested Row within Card Body -->
        <div class="row">
          <div class="col-lg-5 d-none d-lg-block bg-register-image"></div>
          <div class="col-lg-7">
            <div class="p-5">
              <div class="text-center">
                <h1 class="h4 text-lightGreen mb-4" style="color: #a5cfab" >Create an Account!</h1>
              </div>
              <form:form class="user" method="POST" action="${baseUrl}register" modelAttribute="user">
                <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
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
                  <form:input type="email" class="form-control form-control-user" required="true"
                              path="userName" name="userName" id="userName" placeholder="Email Address"/>
                  <form:errors path="userName" cssClass="error"/>
                </div>
                <div class="form-group row">
                  <div class="col-sm-6 mb-3 mb-sm-0">
                    <form:input type="password" class="form-control form-control-user" required="true"
                                path="password" name="password" id="password" placeholder="Password"/>
                    <form:errors path="password" cssClass="error"/>
                  </div>
                  <div class="col-sm-6">
                    <form:input type="password" class="form-control form-control-user" required="true"
                                path="confirmPassword" name="confirmPassword" id="confirmPassword" placeholder="Repeat Password"/>
                    <form:errors path="confirmPassword" cssClass="error"/>
                  </div>
                  <div class="col-sm-6">
                    <form:input type="date" class="form-control form-control-user" required="true"
                                path="birthday" name="birthday" id="birthday" placeholder="birthday"/>
                    <form:errors path="birthday" cssClass="error"/>
                  </div>
                  <div class="col-sm-6">
                    <form:input type="text" class="form-control form-control-user" required="true"
                                path="height" name="height" id="height" placeholder="height"/>
                    <form:errors path="height" cssClass="error"/>
                  </div>
                  <div class="col-sm-6">
                    <form:input type="text" class="form-control form-control-user" required="true"
                                path="weight" name="weight" id="weight" placeholder="weight"/>
                    <form:errors path="weight" cssClass="error"/>
                  </div>
                </div>
                <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: #5386e4">
                  Register Account
                </button>
                <hr>
                <a href="#" class="btn btn-google btn-user btn-block">
                  <c:url var="googleImageUrl" value="/img/googleRed.png" />
                  <img src="${googleImageUrl}" /> &nbsp;Register with Google
                </a>
                <a href="#" class="btn btn-facebook btn-user btn-block">
                  <c:url var="fbImageUrl" value="/img/facebook.png" />
                  <img src="${fbImageUrl}" /> &nbsp;Register with Facebook
                </a>
              </form:form>
              <hr>
              <div class="text-center">
                <a class="small" href="${baseUrl}forgot-password" style="color: #a5cfab">Forgot Password?</a>
              </div>
              <div class="text-center">
                <a class="small" href="${baseUrl}login" style="color: #a5cfab">Already have an account? Login!</a>
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>

  </div>
  <!-- End of Page Content -->

<c:import url="/WEB-INF/jsp/footer.jsp" />