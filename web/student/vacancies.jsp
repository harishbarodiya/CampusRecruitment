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

  <title>CRS - Vacancies</title>
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
      <section id="vacancies">
    <div class="approve">
        
        <% 
           StudentDao sDao = new StudentDao();
           ArrayList<VacancyDto> vacancies = sDao.getVacancies(enrollment);
           if(vacancies.isEmpty()){
        %>
        <h4>There is no Vacancy Related to You</h4>
        <%
        }else{
        %>
        
        <h4>Vacancies Related to Your Course </h4>
        <table class="table table-striped table-hover">
            <tr>
                <th>Job Profile</th>
                <th>Company</th>
                <th>Salary</th>
                <th>Location</th>
                <th>Last Date</th>
                <th>Placement Talk</th>
                <th>Test Date</th>
                <th>Apply</th>
            </tr>
            <%
              for(VacancyDto vacancy : vacancies){
                  String company = StudentDao.getComName(vacancy.getCompanyId());
            %>
            <tr>
             <td><%=vacancy.getProfile()%> </td>
             <td><%=company%> </td>
             <td><%=vacancy.getSalary()%> </td>
             <td><%=vacancy.getLocation()%> </td>
             <td><%=vacancy.getLastDate()%> </td>
             <td>
                 <%
                    if(vacancy.getPlcmntTalk() != null) vacancy.getPlcmntTalk();
                    else out.print("-");
                 %>
             </td>
             <td>
                 <%
                    if(vacancy.getTest()!= null) vacancy.getTest();
                    else out.print("-");
                 %>
             </td>
             <td></td>
        </tr>
        <tr>
             <td colspan="4">
                 <b>About Company-</b>
                 <%
                    if(vacancy.getAbout()!= null) vacancy.getAbout();
                    else out.print("-");
                 %>
             </td>
            <td colspan="3">
                <b>More Details-</b>
                <%
                    if(vacancy.getDetails()!= null) vacancy.getDetails();
                    else out.print("-");
                 %>
                
            </td>
                    <td><a class="approve-btn scrollto" href="<%=vacancy.getLink()%> " target="_blank">Apply</a></td>
           </tr>
           <% } %>
           
        </table>
        <%
        }
        %>
    </div>
      </section>



    <!-- =====End View Vacancy Section===== -->
  
    
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