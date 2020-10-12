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

  <title>CRS - Post Internship</title>
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

        function workFrom() {
            if (document.getElementById('office').checked) {
                document.getElementById('location').removeAttribute("hidden");
                document.getElementById('loc').required = "true";
            }
            else{
                document.getElementById('location').hidden = "true";
                document.getElementById('loc').removeAttribute("required");
            }
        }

    </script>
  <main id="main">
 <!-- Post Internship section  -->
 <section id="post-internship">
    <div class="container">
      <div class="row">
        <div class="col-lg-5 col-md-8 col-sm-12 form">
          <h3>Post Internship</h3>
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
                  <select class="form-control" multiple name="courses" required>
              <% for(CourseDto course : courses){ %>
              <option value="<%=course.getCourseId()%>"><%=course.getCourseName()+"-"+course.getSpecialization()%></option>
              <% } %>
            </select>
              </td>
            </tr>
            <tr><td colspan="2"><span>Type of Internship<span class="required">*</span></span></td></tr>
            <tr>
                <td>
                    <div class="form-check form-check-inline">
                        <span  style="white-space: nowrap" onclick="workFrom()"><input class="form-check-input" type="radio" name="type" id="office" value="office" required>
                        <label class="form-check-label" for="office">Work in Office</label></span>
                    </div>
                </td>
                <td>
                    <div class="form-check form-check-inline">
                        <span  style="white-space: nowrap" onclick="workFrom()"><input class="form-check-input" type="radio" name="type" id="home" value="home">
                        <label class="form-check-label" for="home">Work from Home</label></span>
                    </div>            
                </td>
            </tr>
            <tr id="location" hidden>
                <td><span> Location<span class="required">*</span> </span></td>
                <td><input type="text" class="form-control" name="location" id="loc" placeholder="Locations"></td>
            </tr>
            
            <tr>
              <td><span> Stipend<span class="required">*</span>  </span></td>
              <td><input type="text" class="form-control" name="stipend" placeholder="Stipend" required></td>
            </tr>
            <tr>
              <td><span> Last Date<span class="required">*</span></span></td>
              <td><input type="date" class="form-control" name="lastDate" placeholder="Last Date to Apply" required></td>
            </tr>
            <tr>
              <td><span> Duration<span class="required">*</span>  </span></td>
              <td><input type="number" class="form-control" name="duration" placeholder="Duration in Months" min="0" required></td>
            </tr>
            <tr>
              <td><span> No. of Openings<span class="required">*</span>  </span></td>
              <td><input type="number" class="form-control" name="openings" placeholder="Number of Openings" min="0" required></td>
            </tr>
            <tr>
              <td><span> Requirements<span class="required">*</span>  </span></td>
              <td><textarea class="form-control" name="requirements" placeholder="Requirements" rows="3" required></textarea></td>
            </tr>
            <tr>
              <td><span> Responsibilities<span class="required">*</span>  </span></td>
              <td><textarea class="form-control" name="responsibilities" placeholder="Responsibilities" rows="3" required></textarea></td>
            </tr> 
            <tr>
              <td><span> Link to Apply <span class="required">*</span> </span></td>
              <td><input type="text" class="form-control" name="link" placeholder="Put Link here" required></td>
            </tr>
            <tr>
              <td></td><td><input type="submit" class="form-control btn" name="addInternship" value="Post Internship" size="100"></td>
            </tr>
            </table>
           </form>
          </div>
        </div>
      </div>

    </div>
  </section>
<!-- End Post Internship section  -->

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