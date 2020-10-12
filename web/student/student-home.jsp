<%@page import="dao.StudentDao"%>
<%@page import="dao.CompanyDao"%>
<%
    String enrollment = (String)session.getAttribute("enrollment");
    if(enrollment != null){
%>

<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>CRS - Student Home</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">
  
  <jsp:include page="header.jsp"></jsp:include>
  
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center justify-content-center">
    <div class="container position-relative">
      <h3><i>Hi <%=StudentDao.getName(enrollment)+","%></i> Welcome to</h3>
      <h1> Campus Recruitment System</h1>
      <h2>We are hiring talent...</h2>
      
    </div>
  </section>
  <!-- End Hero Section -->

    <!-- ======= Counts Section ======= -->
    <jsp:include page="../counters.jsp"></jsp:include>
    <!-- End Counts Section -->
    
    <!-- Start main -->
  <main id="main">
    <section>
    <div class="main-content">
        <a href="vacancies.jsp"><div class="content"><p style="margin: auto; color: #414c64">See Vacancies</p></div></a>
        <a href="plcmnt-talks.jsp"><div class="content"><p style="margin: auto; color: #414c64">See Placement Talk</p></div></a>
      <a href="internships.jsp"><div class="content"><p style="margin: auto; color: #414c64">See Internships</p></div></a>
      <!--<a href=""><div class="content"><p style="margin: auto; color: #414c64">Profile</p></div></a>-->
    </div>
  </section>
    <br>
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