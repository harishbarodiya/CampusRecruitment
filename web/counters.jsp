<%@page import="dto.CounterDto"%>
<%@page import="dao.AdminDao"%>
<!-- ======= Counts Section ======= -->
    <section id="counts" class="counts section-bg">
        <% 
            AdminDao aDao = new AdminDao();
            CounterDto cDto = aDao.getCounter();
        %>
      <div class="container">

        <div class="row counters">

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up"><%=cDto.getRecruiter()%></span>
            <p>Recruiters</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up"><%=cDto.getVacancy()%></span>
            <p>Vacancies</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
            <span data-toggle="counter-up"><%=cDto.getPlaced()%></span>
            <p>Placed Students</p>
          </div>

          <div class="col-lg-3 col-6 text-center">
              <span data-toggle="counter-up"><%=cDto.getFaculty()%></span>
            <p>Faculties</p>
          </div>

        </div>

      </div>
    </section><!-- End Counts Section -->
    