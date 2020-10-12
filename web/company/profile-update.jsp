<%@page import="dto.CompanyDto"%>
<%@page import="dto.VacancyDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.CourseDto"%>
<%@page import="dao.CourseDao"%>
<%@page import="dao.CompanyDao"%>
<%
    String userId = (String)session.getAttribute("userId");
    if(userId != null){
%><!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>CRS - Update Company Profile</title>
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
    </script>
    
  <main id="main">
 <!-- Profile Update section  -->
 <section id="profile-update">
    <div class="container">
      <div class="row">
        <div class="col-lg-5 col-md-8 col-sm-12 form">
            <%
                CompanyDao cDao = new CompanyDao();
                CompanyDto company = cDao.getCompany(userId);
            %>
          <h3>Update Profile</h3>
          <div class="form">
              <form action="../updateProfile.jsp" method="post"> 
              <table>
               <tr>
                <td><span> Company Name<span class="required">*</span>  </span></td>
                <td><input type="text" class="form-control" name="comName" placeholder="Enter Company Name" required value="<%=company.getComName()%>"></td>
              </tr>
              <tr>
                <td><span> UserId<span class="required">*</span>  </span></td>
                <td><input type="text" class="form-control" name="userId" placeholder="UserId" required readonly value="<%=company.getUserId()%>"></td>
              </tr>
              <tr>
                <td><span> Branch/Location<span class="required">*</span>  </span></td>
                <td><input type="text" class="form-control" name="branch" placeholder="Enter Branch/Location" required value="<%=company.getBranch()%>"></td>
              </tr>
              <tr>
                <td><span> HR Name<span class="required">*</span>  </span></td>
                <td><input type="text" class="form-control" name="hrName" placeholder="Enter HR's Name" required value="<%=company.getHrName()%>"></td>
              </tr>
              <tr>
                <td><span> Mobile<span class="required">*</span>  </span></td>
                <td><input type="text" class="form-control" name="mobile" placeholder="Enter Mobile" required value="<%=company.getMobile()%>"></td>
              </tr>
              <tr>
                <td><span> Email<span class="required">*</span>  </span></td>
                <td><input type="text" class="form-control" name="email" placeholder="Enter Email" required value="<%=company.getEmail()%>"></td>
              </tr>
              <tr>
                  <td></td><td><input type="submit" class="form-control btn" name="company" id="signup" value="Save" size="100"></td>
              </tr>
              </table>
             </form>
          </div>
        </div>
      </div>

    </div>
  </section>
<!-- End profile update section  -->

    
    
    
  
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