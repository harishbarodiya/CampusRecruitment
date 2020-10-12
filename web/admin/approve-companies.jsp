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

  <title>CRS - Approve Companies</title>
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
        function approve(userId , button){
            var xhttp = new XMLHttpRequest();
            var url = "apr-company.jsp?userId="+userId+"&status="+button.innerHTML+"";
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
    <section id="approve-companies">
    <div class="approve">
        <h4>Company's Requests for approve </h4>
        <% 
           AdminDao aDao = new AdminDao();
           ArrayList<CompanyDto> unapprovedCmp = aDao.getUnapprovedCmp();
        %>
        <table class="table table-striped table-hover">
            <tr>
                <th>Company Name</th>
                <th>Branch/Location</th>
                <th>HR Name</th>
                <th>Email</th>
                <th>Mobile</th>
                <th>Approve/Reject</th>
            </tr>
            <%
              for(CompanyDto company : unapprovedCmp){
            %>
            <tr>
             <td><%=company.getComName()%> </td>
             <td><%=company.getBranch()%> </td>
             <td><%=company.getHrName()%> </td>
             <td><%=company.getEmail()%> </td>
             <td><%=company.getMobile()%> </td>
             <td><a class="approve-btn scrollto" onclick="approve('<%=company.getUserId()%>' , this)">Approve</a></td>
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