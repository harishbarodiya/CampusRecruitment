<%@page import="dto.AdminDto"%>
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

  <title>CRS - Update Profile</title>
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
  <script>
    function aFormValidate(){
          var aPass = document.getElementById("aPass").value;
          var aConPass = document.getElementById("aConPass").value;
          if(aPass === aConPass)
            return true;
          else
            return false;
      }
      function aPassValidate(field){
          if(!aFormValidate())
            field.style = "border:2px solid red";
          else
            field.style = "border:2px solid #ffc107";
      }
  </script>
  
  
  <main id="main">

    <!--=== Add admin section ===-->
    <section id="edit-profile">
      <div class="container">
        <div class="row">
          <div class="col-lg-5 col-md-8 col-sm-12 form">
            <%
                AdminDao aDao = new AdminDao();
                AdminDto aDto = aDao.getAdmin(adminId);
            %>
            <h3>Update Administrator</h3>
            <div class="form">
                <form action="../updateProfile.jsp" method="post">
              <table>
               <tr>
                <td><span> First Name<span class="required">*</span> </span></td>
                <td><input type="text" class="form-control" name="fName" placeholder="Enter First Name" required value="<%=aDto.getfName()%>"></td>
              </tr>
              <tr>
                <td><span> Last Name<span class="required">*</span> </span></td>
                <td><input type="text" class="form-control" name="lName" placeholder="Enter Last Name" required value="<%=aDto.getlName()%>"></td>
              </tr>
              <tr>
                <td><span> Admin Id<span class="required">*</span> </span></td>
                <td><input type="text" class="form-control" readonly name="adminId" placeholder="Enter Id" required value="<%=aDto.getAdminId()%>"></td>
              </tr>
              <tr>
                <td><span> Designation<span class="required">*</span> </span></td>
                <td><input type="text" class="form-control" name="designation" placeholder="Enter designation" required value="<%=aDto.getDesignation()%>"></td>
              </tr>
              <tr>
                <td><span> Mobile<span class="required">*</span> </span></td>
                <td><input type="text" class="form-control" name="mobile" placeholder="Enter Mobile" required value="<%=aDto.getMobile()%>"></td>
              </tr>
              <tr>
                <td><span> Email<span class="required">*</span> </span></td>
                <td><input type="text" class="form-control" name="email" placeholder="Enter Email" required value="<%=aDto.getEmail()%>"></td>
              </tr>
              <tr>
                  <td></td><td><input type="submit" class="form-control btn" name="admin" value="Update Profile" size="100"></td>
              </tr>
              </table>
             </form>
            </div>
          </div>
        </div>

      </div>
    </section>
<!--=== End Add Admin section ===-->

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