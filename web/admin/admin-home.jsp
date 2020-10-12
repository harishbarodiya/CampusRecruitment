<%@page import="dao.AdminDao"%>
<%
    String adminId = (String)session.getAttribute("adminId");
    if(adminId != null){
     
%>
<!DOCTYPE html>
<html lang="en">

<head>
  <meta charset="utf-8">
  <meta content="width=device-width, initial-scale=1.0" name="viewport">

  <title>CRS - Admin Home</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

    <jsp:include page="header.jsp"></jsp:include>
        
  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center justify-content-center">
    <div class="container position-relative">
        <h3><i>Hi <%=AdminDao.getAdminName(adminId)+","%> </i>Welcome to</h3>
      <h1> Campus Recruitment System</h1>
      <h2>We are hiring talent...</h2>
      
    </div>
  </section>
  <!-- End Hero Section -->
<!-- Start main -->


<jsp:include page="../counters.jsp"></jsp:include>
  
<main id="main">
      <!--====Main Contents Section====-->
   
    <div class="main-content">
        <a href="approve-students.jsp"><div class="content"><p style="margin: auto; color: #414c64">Approve Students</p></div></a>
        <a href="approve-companies.jsp"><div class="content"><p style="margin: auto; color: #414c64">Approve Companies</p></div></a>
      <a href="add-admin.jsp"><div class="content"><p style="margin: auto; color: #414c64">Add Admin</p></div></a>
      <a href="edit-counters.jsp"><div class="content"><p style="margin: auto; color: #414c64">Edit Counters</p></div></a>
      <a href="add-recruiter.jsp"><div class="content"><p style="margin: auto; color: #414c64">Add Recruiters</p></div></a>
<!--      <a href=""><div class="content"><p style="margin: auto; color: #414c64">Profile</p></div></a>-->
    </div>
    <!--==== End Main Contents Section====-->
</main>
  
  <!-- End #main -->

<jsp:include page="../recruiters.jsp"></jsp:include>
<jsp:include page="../faqs.jsp"></jsp:include>    
<jsp:include page="../footer.jsp"></jsp:include>
</body>

</html>
<%
  }
  else{   
        session.setAttribute("message", "Please login first");
            response.sendRedirect("admin-login.jsp#signin");
    }
%>