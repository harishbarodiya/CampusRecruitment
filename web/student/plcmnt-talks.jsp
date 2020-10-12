<%@page import="dto.PlcmntTalkDto"%>
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

  <title>CRS - Placement Talks</title>
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
      <section id="plcmnt-talks">
    <div class="approve">
        
        <% 
           StudentDao sDao = new StudentDao();
           ArrayList<PlcmntTalkDto> plcmntTalks = sDao.getPlcmntTalks(enrollment);
           if(plcmntTalks.isEmpty()){
        %>
        <h4>There is no Placement Talks related to You</h4>
        <%
        }else{
        %>
        
        <h4>Placement Talks Related to Your Course </h4>
        <table class="table table-striped table-hover">
            <tr>
                <th>Job Profile</th>
                <th>Company</th>
                <th>Date</th>
                <th>Time</th>
                <th>Venue</th>
                <th>Address/Link</th>
            </tr>
            <%
              for(PlcmntTalkDto plcmntTalk : plcmntTalks){
                  String comName = StudentDao.getComNameByVId(plcmntTalk.getVacancy_id());
                  String jobProfile = StudentDao.getJobProfile(plcmntTalk.getVacancy_id());
            %>
            <tr>
             <td><%=jobProfile%> </td>
             <td><%=comName%> </td>
             <td><%=plcmntTalk.getDate()%> </td>
             <td><%=plcmntTalk.getTime()%> </td>
             <td><%=plcmntTalk.getVenue()%> </td>
             <td>
                 <%
                    if(plcmntTalk.getVenue().equalsIgnoreCase("online")) out.print(plcmntTalk.getLink());
                    else out.print(plcmntTalk.getAddress());
                 %>
             </td>
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