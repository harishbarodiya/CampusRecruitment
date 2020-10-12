<%@page import="dao.CompanyDao"%>
<%@page import="java.util.ArrayList"%>
<%
    String userId = (String)session.getAttribute("userId");
    if(userId != null){
%><!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>CRS - Change Password</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">
  <jsp:include page="header.jsp"></jsp:include>
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center justify-content-center">
    <div class="container position-relative">
      <h3><i>Hi <%=CompanyDao.getName(userId)+","%></i> Welcome to</h3>
      <h1> Campus Recruitment System</h1>
      <h2>We are hiring tallent...</h2>
      
    </div>
  </section>
  <!-- End Hero Section -->
<!-- Start main -->


    <!-- ======= Counts Section ======= -->
    <jsp:include page="../counters.jsp"></jsp:include>
    <!-- End Counts Section -->
    <script type="text/javascript">
   function cFormValidate(){
          var cPass = document.getElementById("cPass").value;
          var cConPass = document.getElementById("cConPass").value;
          if(cPass === cConPass)
            return true;
          else
            return false;
      }
      function cPassValidate(field){
          if(!cFormValidate())
            field.style = "border:2px solid red";
          else
            field.style = "border:2px solid #ffc107";
      }
  </script>
  <main id="main">
 <!-- Post Internship section  -->
 <section id="change-pass">
    <div class="container">
      <div class="row">
        <div class="col-lg-5 col-md-8 col-sm-12 form">
          <h3>Change Password</h3>
            <div class="form">
                <form action="../updateProfile.jsp" method="post">
              <table>
               <tr>
                <td><span>Old Password<span class="required">*</span></span></td>
                <td><input type="password" class="form-control" name="oldPass" placeholder="Enter Old Password" required></td>
              </tr> 
              <tr>
                <td><span>New Password<span class="required">*</span></span></td>
                <td><input type="password" class="form-control" name="newPass" id="cPass" placeholder="Enter Password" required></td>
              </tr> 
              <tr>
                <td><span>Confirm Password<span class="required">*</span></span></td>
                <td><input type="text" class="form-control" onkeyup="cPassValidate(this)" name="conPass" id="cConPass" placeholder="Enter Confirm Password" required></td>
              </tr> 
              <tr>
                  <td></td><td><input type="submit" onclick="return cFormValidate()" class="form-control btn" name="changePassCompany" value="Update Password" size="100"></td>
              </tr>
              </table>
             </form>
            </div>
        </div>
      </div>

    </div>
  </section>
<!-- End change password section  -->

    
    
    
  
</main>
  
  <!-- End #main -->


<!-- ======= Recruiters Section ======= -->
    <jsp:include page="../recruiters.jsp"></jsp:include>
<!-- End Recruiters Section -->

    <!-- ======= Frequently Asked Questions Section ======= -->
    <jsp:include page="../faqs.jsp"></jsp:include>
    <!-- End Frequently Asked Questions Section -->


  <!-- ======= Footer ======= -->
    <jsp:include page="../footer.jsp"></jsp:include>    
  
  
</body>

</html>
<%
  }
  else{   
        session.setAttribute("message", "Please login first");
            response.sendRedirect("../index.jsp#signin");
    }
%>