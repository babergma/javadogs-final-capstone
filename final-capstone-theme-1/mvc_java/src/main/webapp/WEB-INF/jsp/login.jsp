<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<c:import url="/WEB-INF/jsp/header.jsp" />

  <!-- Begin Page Content -->
  <div class="container">

    <!-- Outer Row -->
    <div class="row justify-content-center">

      <div class="col-xl-10 col-lg-12 col-md-9">

        <div class="card o-hidden border-0 shadow-lg my-5">
          <div class="card-body bg-dark p-0">
            <!-- Nested Row within Card Body -->
            <div class="row">
              <div class="col-lg-6 d-none d-lg-block bg-dark<%-- bg-login-image--%>">
                  <img src="img/logo.png" style="width: 100%"/>
              </div>
              <div class="col-lg-6">
                <div class="p-5">
                  <div class="text-center">
                    <h1 class="h4 text-lightGreen mb-4" style="color: #a5cfab">Welcome Back!</h1>
                  </div>
                  <form class="user" method="POST" action="./login">
                    <input type="hidden" name="destination" value="${param.destination}"/>
                    <input type="hidden" name="CSRF_TOKEN" value="${CSRF_TOKEN}"/>
                    <div class="form-group">
                      <input type="email" class="form-control form-control-user"
                             name="userName" id="userName" aria-describedby="emailHelp" placeholder="Enter Email Address...">
                    </div>
                    <div class="form-group">
                      <input type="password" class="form-control form-control-user"
                             name="password" id="password" placeholder="Password">
                    </div>
                    <div class="form-group">
                      <div class="custom-control custom-checkbox small">
                        <input type="checkbox" class="custom-control-input" id="customCheck">
                        <label class="custom-control-label" for="customCheck" style="color: #a5cfab">Remember Me</label>
                      </div>
                    </div>
                    <button type="submit" class="btn btn-primary btn-user btn-block" style="background-color: #5386e4">
                      Login
                    </button>
                    <hr>
<%--                    <a href="#" class="btn btn-google btn-user btn-block">--%>
<%--                      <c:url var="googleImageUrl" value="/img/googleRed.png" />--%>
<%--                      <img src="${googleImageUrl}" /> &nbsp;Register with Google--%>
<%--                    </a>--%>
<%--                    <a href="#" class="btn btn-facebook btn-user btn-block">--%>
<%--                      <c:url var="fbImageUrl" value="/img/facebook.png" />--%>
<%--                      <img src="${fbImageUrl}" /> &nbsp;Register with Facebook--%>
<%--                    </a>--%>
                  </form>
                  <hr>
<%--                  <div class="text-center">--%>
<%--                    <a class="small" href="./forgot-password">Forgot Password?</a>--%>
<%--                  </div>--%>
                  <div class="text-center">
                    <a class="small" href="./register" style="color: #a5cfab">Create an Account!</a>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>

      </div>

    </div>

  </div>
  <!-- End of Page Content -->

<c:import url="/WEB-INF/jsp/footer.jsp" />
