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

  <title>CRS - Post Placement Talk</title>
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

        function changeVenue() {
            if (document.getElementById('offline').checked) {
                document.getElementById('address').removeAttribute("hidden");
                document.getElementById('add').required = "true";
                document.getElementById('link').hidden = "true";
                document.getElementById('url').removeAttribute("required");
            }
            else{
                document.getElementById('address').hidden = "true";
                document.getElementById('add').removeAttribute("required");
                document.getElementById('link').removeAttribute("hidden");
                document.getElementById('url').required = "true";
            }
        }

    </script>
    
  <main id="main">
 <!-- Post Placement Talk section  -->
 <section id="post-plcmnt-talk">
    <div class="container">
      <div class="row">
        <div class="col-lg-5 col-md-8 col-sm-12 form">
            <% 
              CompanyDao cDao = new CompanyDao();
              ArrayList<VacancyDto> vacancies = cDao.getVacancy(userId);
              if(vacancies == null){ %>
                  <h3>No vacancy found... </br> Please post a vacancy first...!!! </h3>
              <% } else{
                  
            %>
          <h3>Post an Placement Talk</h3>
          <div class="form">
          <form action="addVac.jsp" method="post">
            <table>
            <tr>
              <td><span> Job Profile<span class="required">*</span> </span></td>
              <td>
                  <select class="form-control" name="vacancy_id" required>
                      <option value="0" selected disabled>Select a Posted Profile</option>
              <% for(VacancyDto vacancy : vacancies){ %>
              <option value="<%=vacancy.getVacancyId()%>"><%=vacancy.getProfile()%></option>
              <% } %>
            </select>
              </td>
            </tr>
            <tr>
              <td><span> Date<span class="required">*</span> </span></td>
              <td><input type="date" class="form-control" name="date"></td>
            </tr>
            <tr>
              <td><span> Time<span class="required">*</span></span></td>
              <td><input type="time" class="form-control" name="time" placeholder="Last Date to Apply" required></td>
            </tr>
            <tr><td colspan="2"><span>Venue<span class="required">*</span></span></td></tr>
            <tr>
                <td>
                    <div class="form-check form-check-inline">
                        <span  style="white-space: nowrap" onclick="changeVenue()"><input class="form-check-input" type="radio" name="venue" id="offline" value="offline" required>
                        <label class="form-check-label" for="offline">Offline</label></span>
                    </div>
                </td>
                <td>
                    <div class="form-check form-check-inline">
                        <span  style="white-space: nowrap" onclick="changeVenue()"><input class="form-check-input" type="radio" name="venue" id="online" value="online">
                        <label class="form-check-label" for="online">Online</label></span>
                    </div>            
                </td>
            </tr>
            <tr id="address" hidden>
                <td><span> Address<span class="required">*</span> </span></td>
                <td><input type="text" class="form-control" name="address" id="add" placeholder="Put Address here"></td>
            </tr>
            <tr id="link" hidden>
                <td><span> Link<span class="required">*</span> </span></td>
                <td><input type="text" class="form-control" name="location" id="url" placeholder="Put URL here"></td>
            </tr>
            <tr>
              <td></td><td><input type="submit" class="form-control btn" name="addPlcmntTalk" value="Post" size="100"></td>
            </tr>
            </table>
           </form>
          </div>
            <%
            }
            %>
        </div>
      </div>

    </div>
  </section>
<!-- End Post placement Talk section  -->

    
    
    
  
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