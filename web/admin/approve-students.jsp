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

  <title>CRS - Approve Students</title>
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

    <!-- =====Approve Students Section===== -->
    <script>
        function changeBtn(button){
            if(button.innerHTML === "Approve")
                button.innerHTML = "Unapprove";
            else if(button.innerHTML === "Unapprove")
                button.innerHTML = "Approve";
        }
        function approve(enrollment , button){
            var xhttp = new XMLHttpRequest();
            var url = "apr-student.jsp?enrollment="+enrollment+"&status="+button.innerHTML+"";
            xhttp.open("GET",url,true);
            xhttp.send();
            xhttp.onreadystatechange=function(){
                if(xhttp.readyState == 4 && xhttp.status == 200)
                {
                    if(xhttp.responseText){
                        changeBtn(button);
                    }
                }
            };
        }
    </script>
    <section id="approve-students">
    <div class="approve">
        <h4>Student's Requests for approve </h4>
        <% 
           AdminDao aDao = new AdminDao();
           ArrayList<StudentDto> unapprovedStd = aDao.getUnapprovedStd();
        %>
        <table class="table table-striped table-hover">
            <tr>
                <th>Enrollment</th>
                <th>First Name</th>
                <th>Last Name</th>
                <th>Course</th>
                <th>Specialization</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Approve/Reject</th>
            </tr>
            <%
              for(StudentDto student : unapprovedStd){
                  CourseDto course = CourseDao.getCourse(student.getCourseId());
            %>
            <tr>
             <td><%=student.getEnrollment()%> </td>
             <td><%=student.getfName()%> </td>
             <td><%=student.getlName()%> </td>
             <td><%=course.getCourseName()%> </td>
             <td><%=course.getSpecialization()%> </td>
             <td><%=student.getEmail()%> </td>
             <td><%=student.getMobile()%> </td>
             <td><a class="approve-btn scrollto" onclick="approve('<%=student.getEnrollment()%>' , this)">Approve</a></td>
           </tr>
           <% } %>
           
           </table>
    </div>
    </section>
    <!-- =====End Approve Students Section===== -->
  
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