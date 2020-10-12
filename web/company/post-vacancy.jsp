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

  <title>CRS - Post Vacancy</title>
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
    
  <main id="main">
 <!-- Post Vacancy section  -->
 <section id="post-vacancy">
    <div class="container">
      <div class="row">
        <div class="col-lg-5 col-md-8 col-sm-12 form">
          <h3>Add Vacancy</h3>
          <div class="form">
          <form action="addVac.jsp" method="post">
          <% 
              CourseDao cDao = new CourseDao();
              ArrayList<CourseDto> courses = cDao.fetchCourses();
          %>
            <table>
             <tr>
              <td><span> Job Profile<span class="required">*</span> </span></td>
              <td><input type="text" class="form-control" name="profile" placeholder="Enter Job Profile" required></td>
            </tr>
            <tr>
              <td><span> Courses<span class="required">*</span> </span></td>
              <td>
                  <select class="form-control" multiple name="courses">
              <% for(CourseDto course : courses){ %>
              <option value="<%=course.getCourseId()%>"><%=course.getCourseName()+"-"+course.getSpecialization()%></option>
              <% } %>
            </select>
              </td>
            </tr>
            <tr>
              <td><span> Salary </span></td>
              <td><input type="text" class="form-control" name="salary" placeholder="Salary" ></td>
            </tr>
            <tr>
              <td><span> Last Date<span class="required">*</span></span></td>
              <td><input type="date" class="form-control" name="lastDate" placeholder="Last Date to Apply" required></td>
            </tr>
            <tr>
                <td><span> Location(s) </span></td>
                <td><input type="text" class="form-control" name="location" placeholder="Locations" ></td>
              </tr>
            <tr>
              <td><span> Placement Talk </span></td>
              <td><input type="text" class="form-control" name="plcmntTalk" placeholder="Pre Placement Talk Date"></td>
            </tr>
            <tr>
              <td><span> Online Test </span></td>
              <td><input type="text" class="form-control" name="test" placeholder="Online Test Date" ></td>
            </tr>
            <tr>
              <td><span> About </span></td>
              <td><textarea class="form-control" name="about" placeholder="About" rows="3"></textarea></td>
            </tr>
            <tr>
              <td><span> More Details</span></td>
              <td><textarea class="form-control" name="details" placeholder="More Details" rows="3"></textarea></td>
            </tr> 
            <tr>
              <td><span> Register Link <span class="required">*</span> </span></td>
              <td><input type="text" class="form-control" name="link" placeholder="Put Register Link " required></td>
            </tr>
            <tr>
              <td></td><td><input type="submit" class="form-control btn" name="addVacancy" value="Post Vacancy" size="100"></td>
            </tr>
            </table>
           </form>
          </div>
        </div>
      </div>

    </div>
  </section>
<!-- End Post Vacancy section  -->

    
    
    
  
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