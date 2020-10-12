<%@page import="dto.CounterDto"%>
<%@page import="dto.CompanyDto"%>
<%@page import="dao.CourseDao"%>
<%@page import="dto.CourseDto"%>
<%@page import="java.util.ArrayList"%>
<%@page import="dto.StudentDto"%>
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

  <title>CRS - Edit Counters</title>
  <meta content="" name="descriptison">
  <meta content="" name="keywords">

  <!-- ======= Header ======= -->
  <jsp:include page="header.jsp"></jsp:include>
  <!-- End Header -->

  <!-- ======= Hero Section ======= -->
  <section id="hero" class="d-flex align-items-center justify-content-center">
    <div class="container position-relative">
      <h3><i>Hi <%=AdminDao.getAdminName((String)session.getAttribute("adminId"))+","%> </i>Welcome to</h3>
      <h1> Campus Recruitment System</h1>
      <h2>We are hiring talent...</h2>
      
    </div>
  </section>
  <!-- End Hero Section -->
  
  <main id="main">
    <!---=== Edit Counter section  ===-->
    <section id="edit-counters">
      <div class="container">
        <div class="row">
          <div class="col-lg-5 col-md-8 col-sm-12 form">
            <h3>Edit Counters</h3>
            <div class="form">
                <% 
                    AdminDao aDao = new AdminDao();
                    CounterDto cDto = aDao.getCounter();
                %>
                <form action="../registerUser.jsp" method="post">
              <table>
               <tr>
                <td><span> No. of Recruiters </span></td>
                <td><input type="number" min="0" class="form-control" name="recruiter" placeholder="No. of Recruiters" value="<%=cDto.getRecruiter()%>" required></td>
              </tr>
              <tr>
                <td><span> Vacancies </span></td>
                <td><input type="number" min="0" class="form-control" name="vacancy" placeholder="No. of vacancies" value="<%=cDto.getVacancy()%>" required></td>
              </tr>
              <tr>
                <td><span> Placed Students </span></td>
                <td><input type="number" min="0" class="form-control" name="placed" placeholder="Placed Students" value="<%=cDto.getPlaced()%>" required></td>
              </tr>
              <tr>
                <td><span> Faculty </span></td>
                <td><input type="number" min="0" class="form-control" name="faculty" placeholder="No. faculty" value="<%=cDto.getFaculty()%>" required></td>
              </tr>
                <tr>
                <td></td><td><input type="submit" class="form-control btn" name="counter" value="Save" size="100"></td>
              </tr>
              </table>
             </form>
            </div>
          </div>
        </div>
      </div>
    </section>
<!-- End Edit Counter section  -->

</main>
  
  <!-- End #main -->

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