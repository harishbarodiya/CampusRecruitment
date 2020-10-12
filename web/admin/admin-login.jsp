<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>CRS - Admin Login</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- Favicons -->
  <link href="../assets/img/CRS-icon.jpg" rel="icon">
  <link href="../assets/img/CRS-icon.jpg.png" rel="apple-touch-icon">

  <!-- Google Fonts -->
  <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,300i,400,400i,600,600i,700,700i|Raleway:300,300i,400,400i,500,500i,600,600i,700,700i|Poppins:300,300i,400,400i,500,500i,600,600i,700,700i" rel="stylesheet">

  <!-- Vendor CSS Files -->
  <link href="../assets/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">
  <link href="../assets/vendor/icofont/icofont.min.css" rel="stylesheet">
  <link href="../assets/vendor/boxicons/css/boxicons.min.css" rel="stylesheet">
  <link href="../assets/vendor/owl.carousel/assets/owl.carousel.min.css" rel="stylesheet">
  <link href="../assets/vendor/venobox/venobox.css" rel="stylesheet">

  <link href="../assets/css/style.css" rel="stylesheet">

</head>

<body>

  <!-- ======= Header ======= -->
  <header id="header" class="fixed-top header-transparent">
    <div class="container d-flex align-items-center">

      <!-- <h1 class="logo mr-auto"><a href="index.html">Baker</a></h1> -->
      <!-- Uncomment below if you prefer to use an image logo -->
      <a href="" class="logo mr-auto"><img src="../assets/img/CRS-logo.jpg" alt="" class="img-fluid"></a>

      <nav class="nav-menu d-none d-lg-block">
        <ul>
          <li class="active"><a href="index.html">Home</a></li>
          <li><a href="#signin">Sign In</a></li>
          <li><a href="#services">Placements</a></li>
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
      <a href="#signin" class="btn-get-started scrollto">Log In</a>
    </div>
  </section><!-- End Hero -->

  <main id="main">

    
    <!-- ======= Counts Section ======= -->
    <jsp:include page="../counters.jsp"></jsp:include>
    <!-- End Counts Section -->

    <!-- ======= Sign In Section ======= -->
    <section id="signin">
      <div class="container">
        <div class="row">
          <div class="col-lg-5 col-md-8 col-sm-12 form">
            
            <h3>Login as Admin</h3>
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
                <form action="../UserVerify.jsp" method="post">
              <table>
               <tr>
                <td><span> AdminId </span></td>
                <td><input type="text" class="form-control" name="adminId" placeholder="Enter UserId" required></td>
            </tr>
            <tr>
              <td><span>Password</span></td>
              <td><input type="password" class="form-control" name="password" placeholder="Enter Password" required></td>
            </tr>  
              <tr>
                <td></td><td><input type="submit" class="form-control btn" name="admin" value="Login" size="100"></td>
              </tr>
              <tr>
                  <td colspan="2"><a href="#" >Forget Password</a></td>
              </tr>
              </table>
             </form>
             </div>
          </div>
        </div>

      </div>
    </section>
    
    <!-- End Sign In Section -->

<!-- ======= Recruiters Section ======= -->
<jsp:include page="../recruiters.jsp"></jsp:include>
<!-- End Recruiters Section -->
  </main><!-- End #main -->

  <!-- ======= Footer ======= -->
  <footer id="footer">

    

    <div class="container d-md-flex py-4">

      <div class="mr-md-auto text-center text-md-left">
        <div class="copyright">
          &copy; Copyright <strong><span>CSR</span></strong>. All Rights Reserved
        </div>
        <div class="credits">
          Designed & Developed by Harish Barodiya
        </div>
      </div>
      <div class="social-links text-center text-md-right pt-3 pt-md-0">
        <a href="#" class="twitter"><i class="bx bxl-twitter"></i></a>
        <a href="#" class="facebook"><i class="bx bxl-facebook"></i></a>
        <a href="#" class="instagram"><i class="bx bxl-instagram"></i></a>
        <a href="#" class="google-plus"><i class="bx bxl-skype"></i></a>
        <a href="#" class="linkedin"><i class="bx bxl-linkedin"></i></a>
      </div>
    </div>
  </footer><!-- End Footer -->

  <a href="#" class="back-to-top"><i class="bx bx-up-arrow-alt"></i></a>

  <!-- Vendor JS Files -->
  <script src="../assets/vendor/jquery/jquery.min.js"></script>
  <script src="../assets/vendor/bootstrap/js/bootstrap.bundle.min.js"></script>
  <script src="../assets/vendor/jquery.easing/jquery.easing.min.js"></script>
  <script src="../assets/vendor/php-email-form/validate.js"></script>
  <script src="../assets/vendor/waypoints/jquery.waypoints.min.js"></script>
  <script src="../assets/vendor/counterup/counterup.min.js"></script>
  <script src="../assets/vendor/owl.carousel/owl.carousel.min.js"></script>
  <script src="../assets/vendor/isotope-layout/isotope.pkgd.min.js"></script>
  <script src="../assets/vendor/venobox/venobox.min.js"></script>

  <!-- Template Main JS File -->
  <script src="../assets/js/main.js"></script>

</body>

</html>