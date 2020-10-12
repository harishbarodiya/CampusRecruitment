<%@page import="dto.InternshipDto"%>
<%@page import="dto.VacancyDto"%>
<%@page import="java.util.ArrayList"%>
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

  <title>CRS - Internships</title>
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
      <section id="internships">
    <div class="approve">
        
        <% 
           StudentDao sDao = new StudentDao();
           ArrayList<InternshipDto> internships = sDao.getInternships(enrollment);
           if(internships.isEmpty()){
        %>
        <h4>There is no Internship Related to You</h4>
        <%
        }else{
        %>
        
        <h4>Internship Related to Your Course </h4>
        <table class="table table-striped table-hover">
            <tr>
                <th>Job Profile</th>
                <th>Company</th>
                <th>Work from</th>
                <th>Location</th>
                <th>Stipend</th>
                <th>Last Date</th>
                <th>Duration</th>
                <th>No. of Openings</th>
                <th>Apply</th>
            </tr>
            <%
              for(InternshipDto internship : internships){
                  String company = StudentDao.getComName(internship.getCompanyId());
            %>
            <tr>
             <td><%=internship.getProfile()%> </td>
             <td><%=company%> </td>
             <td><%=internship.getType()%> </td>
             <td>
                 <% if(internship.getType().equalsIgnoreCase("office"))
                       internship.getLocation();
                    else out.print("-");
                 %> 
             </td>
             <td><%=internship.getStipend()%> </td>
             <td><%=internship.getLastDate()%> </td>
             <td><%=internship.getDuration()%> </td>
             <td><%=internship.getOpenings()%> </td>
             <td></td>
             </tr>
        <tr>
            <td colspan="4"><b>Requirements-</b><%=internship.getRequirements()%> </td>
            <td colspan="4"><b>More Details-</b><%=internship.getResponsibilities()%> </td>
            <td><a class="approve-btn scrollto" href="<%=internship.getLink()%> " target="_blank">Apply</a></td>
        </tr>
           <% } %>
           
        </table>
        <%
        }
        %>
    </div>
      </section>
    <!-- =====End Internship Section===== -->
  
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