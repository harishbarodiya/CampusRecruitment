<%@page import="java.util.ArrayList"%>
<%@page import="dao.CourseDao"%>
<%@page import="dto.CourseDto"%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
    <meta content="width=device-width, initial-scale=1.0" name="viewport">

    <title>Campus Recruitment System</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="assets/img/CRS-icon.jpg" rel="icon">
  <link href="assets/img/apple-touch-icon.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="assets/vendor/venobox/venobox.css" rel="stylesheet">

  <link href="assets/css/style.css" rel="stylesheet">

</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top header-transparent">
    <div class="container d-flex align-items-center">

      <!-- <h1 class="logo mr-auto"><a href="index.html">Baker</a></h1> -->
      <!-- Uncomment below if you prefer to use an image logo -->
      <a href="index.html" class="logo mr-auto"><img src="assets/img/CRS-logo.jpg" alt="" class="img-fluid"></a>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="index.html">Home</a></li>
          <li class="drop-down"><a>Sign In</a>
            <ul>
              <li><a href="#signin" onclick="switchToSignIn(),studentLogin()">Student</a></li>
              <li><a href="#signin" onclick="switchToSignIn(),companyLogin()">Company</a></li>
            </ul>
          </li>
          <li class="drop-down"><a>Sign Up</a>
            <ul>
              <li><a href="#signup" onclick="switchToSignUp(),studentSignup()">Student</a></li>
              <li><a href="#signup" onclick="switchToSignUp(),companySignup()">Company</a></li>
            </ul>
          </li>
          <li><a>Placements</a></li>
          <li><a href="#recruiters">Recruiters</a></li>
        </ul>
      </nav>
      <!-- .nav-menu -->

    </div>
  </header>
  <!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center justify-content-center">
    <div class="container position-relative">
      <h3>Welcome to</h3>
      <h1> Campus Recruitment System</h1>
      <h2>We are hiring tallent...</h2>
      <a href="#signin" class="btn-get-started scrollto">Join Now</a>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    
      <jsp:include page="counters.jsp"></jsp:include>
    <!-- ======= Sign In Section ======= -->
    
    <!--JavaScript-->
    <script>
      function companyLogin(){
         document.getElementById("companyLogin").className = "company change-user";
         document.getElementById("studentLogin").className = "student";
         document.getElementById("login").name = "company";
         document.getElementById("loginUs").innerHTML = "Login as Company";
      }
      function studentLogin(){
         document.getElementById("studentLogin").className = "student change-user";
         document.getElementById("companyLogin").className = "company";
         document.getElementById("login").name = "student";
         document.getElementById("loginUs").innerHTML = "Login as Student";
      }

      function companySignup(){
         document.getElementById("companySignup").className = "company change-user";
         document.getElementById("studentSignup").className = "student";
         document.getElementById("signup").name = "company";
         document.getElementById("signupUs").innerHTML = "Register as Company";
         document.getElementById("studentForm").hidden = "true";
        document.getElementById("companyForm").removeAttribute("hidden");
        }
      function studentSignup(){
         document.getElementById("studentSignup").className = "student change-user";
         document.getElementById("companySignup").className = "company";
         document.getElementById("signup").name = "student";
         document.getElementById("signupUs").innerHTML = "Register as Student";
         document.getElementById("companyForm").hidden = "true";
         document.getElementById("studentForm").removeAttribute("hidden");
      }
      function sFormValidate(){
          var sPass = document.getElementById("sPass").value;
          var sConPass = document.getElementById("sConPass").value;
          if(sPass === sConPass)
            return true;
          else
            return false;
      }
      function cFormValidate(){
          var cPass = document.getElementById("cPass").value;
          var cConPass = document.getElementById("cConPass").value;
          if(cPass === cConPass)
            return true;
          else
            return false;
      }
      function sPassValidate(field){
          if(!sFormValidate())
            field.style = "border:2px solid red";
          else
            field.style = "border:2px solid #ffc107";
      }
      function cPassValidate(field){
          if(!cFormValidate())
            field.style = "border:2px solid red";
          else
            field.style = "border:2px solid #ffc107";
      }
      function switchToSignUp(){
        document.getElementById("signin").hidden = "true";  
        document.getElementById("signup").removeAttribute("hidden");
      }
      function switchToSignIn(){
        document.getElementById("signin").removeAttribute("hidden");
        document.getElementById("signup").hidden = "true";
      }
    </script>

    <section id="signin">
      <div class="container">
        <div class="row">
          <div class="col-lg-5 col-md-8 col-sm-12 form">
            <div class="user">
              <div class="student change-user" id="studentLogin" onclick="studentLogin()" >Student</div>
              <div class="company" id="companyLogin" onclick="companyLogin()">Company</div>
            </div>
            <h3 id="loginUs">Login as Student</h3>
            
            <!--Login Error message-->
            <p style="color: red; text-align: center; font-size: large; margin-top: 20px;">
                <%
                    String message = (String)session.getAttribute("message");
                    if(message != null){
                      out.print(message);
                      session.removeAttribute("message");
                    }
                %>
            </p>
            <div class="form">
            <form action="UserVerify.jsp" method="post">
              <table>
               <tr>
                <td><span> User Id <span class="required">*</span>  </span></td>
                <td><input type="text" class="form-control" name="userid" placeholder="Enter User Id" required></td>
            </tr>
            <tr>
              <td><span>Password <span class="required">*</span> </span></td>
              <td><input type="password" class="form-control" name="password" placeholder="Enter Password" required></td>
            </tr>  
              <tr>
                <td></td><td><input type="submit" class="form-control btn" name="student" id="login" value="Login" size="100"></td>
              </tr>
              <tr>
                  <td colspan="2"><a href="#" >Forget Password</a></td>
              </tr>
              <tr>
                <td colspan="2"><p onclick="switchToSignUp()" class="switch-form">Don't have an account ? Create account</p></td>
              </tr>
              </table>
             </form>
             </div>
          </div>
        </div>
      </div>
    </section>
    
    <!-- End Sign In Section -->
<!-- ======= Sign Up Section ======= -->
    <section id="signup" hidden>
      <div class="container">
        <div class="row">
          <div class="col-lg-5 col-md-8 col-sm-12 form">
            <div class="user">
              <div class="student change-user" id="studentSignup" onclick="studentSignup()">Student</div>
              <div class="company" id="companySignup" onclick="companySignup()">Company</div>
            </div>
            <h3 id="signupUs">Register as Student</h3>
            <div class="form">

              <!-- Student's Sign up form -->
            <form action="registerUser.jsp" method="post" id="studentForm">
              <table>
               <tr>
                <td><span> First Name<span class="required">*</span> </span></td>
                <td><input type="text" class="form-control" name="fName" placeholder="Enter First Name" required></td>
              </tr>
              <tr>
                <td><span> Last Name<span class="required">*</span></span></td>
                <td><input type="text" class="form-control" name="lName" placeholder="Enter Last Name" required></td>
              </tr>
              <tr>
                <td><span> Enrollment<span class="required">*</span></span></td>
                <td><input type="text" class="form-control" name="enrollment" placeholder="Enter Enrollment" required></td>
              </tr>
              <tr>
                <td><span> Course<span class="required">*</span></span></td>
                <td>
                    <div class="form-group" >
                        <% ArrayList<CourseDto> courses = CourseDao.fetchCourses(); %>
                    <select class="form-control" style="margin: 15px;background-color: transparent; border: 2px solid  #ffc107;color: whitesmoke;" name="courseId">
                      <option selected disabled>Course</option>
                      <% for(CourseDto course : courses){%>
                      <option value="<%=course.getCourseId()%>" style="color: #414c64"><%=course.getCourseName()+"-"+course.getSpecialization()%></option>
                      <%}%>
                    </select>
                  </div>
                </td>
              </tr>
              <tr>
                <td><span> Mobile<span class="required">*</span></span></td>
                <td><input type="text" class="form-control" name="mobile" placeholder="Enter Mobile" required></td>
              </tr>
              <tr>
                <td><span> Email<span class="required">*</span></span></td>
                <td><input type="text" class="form-control" name="email" placeholder="Enter Email" required></td>
              </tr>
              <tr>
                <td><span>Password<span class="required">*</span></span></td>
                <td><input type="password" class="form-control" name="password" id="sPass" placeholder="Enter Password" required></td>
              </tr> 
              <tr>
                <td><span>Confirm Pass<span class="required">*</span></span></td>
                <td><input type="text" class="form-control" onkeyup="sPassValidate(this)" name="conPass" id="sConPass" placeholder="Enter Confirm Password" required></td>
              </tr> 
              <tr>
                  <td></td><td><input type="submit" onclick="return sFormValidate()" class="form-control btn" name="student" id="signup" value="Request to Approve" size="100"></td>
              </tr>
              <tr>
                <td colspan="2"><p onclick="switchToSignIn()" class="switch-form">Already have an account ? Sign In</p></td>
              </tr>
              </table>
             </form>

             <!-- Company's Sign up form -->
             <form action="registerUser.jsp" method="post" id="companyForm" hidden="true"> 
              <table>
               <tr>
                <td><span> Company Name<span class="required">*</span>  </span></td>
                <td><input type="text" class="form-control" name="comName" placeholder="Enter Company Name" required></td>
              </tr>
              <tr>
                <td><span> UserId<span class="required">*</span>  </span></td>
                <td><input type="text" class="form-control" name="userId" placeholder="UserId" required></td>
              </tr>
              <tr>
                <td><span> Branch/Location<span class="required">*</span>  </span></td>
                <td><input type="text" class="form-control" name="branch" placeholder="Enter Branch/Location" required></td>
              </tr>
              <tr>
                <td><span> HR Name<span class="required">*</span>  </span></td>
                <td><input type="text" class="form-control" name="hrName" placeholder="Enter HR's Name" required></td>
              </tr>
              <tr>
                <td><span> Mobile<span class="required">*</span>  </span></td>
                <td><input type="text" class="form-control" name="mobile" placeholder="Enter Mobile" required></td>
              </tr>
              <tr>
                <td><span> Email<span class="required">*</span>  </span></td>
                <td><input type="text" class="form-control" name="email" placeholder="Enter Email" required></td>
              </tr>
              <tr>
                <td><span>Password<span class="required">*</span> </span></td>
                <td><input type="password" class="form-control" id="cPass" name="password" placeholder="Enter Password" required></td>
              </tr> 
              <tr>
                <td><span>Confirm Pass<span class="required">*</span> </span></td>
                <td><input type="text" class="form-control" id="cConPass" onkeyup="cPassValidate(this)" name="password"  placeholder="Enter Confirm Password" required></td>
              </tr> 
              <tr>
                  <td></td><td><input type="submit" onclick="return cFormValidate()" class="form-control btn" name="company" id="signup" value="Request to Approve" size="100"></td>
              </tr>
              <tr>
                <td colspan="2"><p onclick="switchToSignIn()" class="switch-form">Already have an account ? Sign In</p></td>
              </tr>
              </table>
             </form>
             </div>
          </div>
        </div>
      </div>
    </section>
    <!-- ===== Sign Up section End Here ===== -->
    <jsp:include page="recruiters.jsp"></jsp:include>
    <jsp:include page="faqs.jsp"></jsp:include>

  </main><!-- End #main -->
  <jsp:include page="footer.jsp"></jsp:include>

</body>

</html>