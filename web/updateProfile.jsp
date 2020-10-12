<%@page import="dao.StudentDao"%>
<%@page import="dao.CompanyDao"%>
<%@page import="dao.AdminDao"%>
<% if(request.getParameter("admin") != null ){  %>
<jsp:useBean id="aDto" class="dto.AdminDto"></jsp:useBean>
<jsp:setProperty name="aDto" property="*"></jsp:setProperty>
<%
  AdminDao aDao = new AdminDao();
  String message = aDao.updateAdmin(aDto);
%>
  <script>
      alert("<%=message%>");
      location='<%="admin/admin-home.jsp"%>'
  </script>
<%  } %>

<% if(request.getParameter("changePassAdmin") != null ){
  %>
<%
    String adminId = (String)session.getAttribute("adminId");
    String oldPass = request.getParameter("oldPass");
    String newPass = request.getParameter("newPass");
  AdminDao aDao = new AdminDao();
  String message = aDao.updateAdminPass(adminId, oldPass, newPass);
%>
  <script>
      alert("<%=message%>");
      location='<%="admin/admin-home.jsp"%>'
  </script>
<%  }
%>

<% if(request.getParameter("company") != null ){  %>
<jsp:useBean id="cDto" class="dto.CompanyDto"></jsp:useBean>
<jsp:setProperty name="cDto" property="*"></jsp:setProperty>
<%
  CompanyDao cDao = new CompanyDao();
  String message = cDao.updateCompany(cDto);
%>
  <script>
      alert("<%=message%>");
      location='<%="company/company-home.jsp"%>'
  </script>
<%  } %>


<% if(request.getParameter("changePassCompany") != null ){
  %>
<%
    String userId = (String)session.getAttribute("userId");
    String oldPass = request.getParameter("oldPass");
    String newPass = request.getParameter("newPass");
  CompanyDao cDao = new CompanyDao();
  String message = cDao.updateCompanyPass(userId, oldPass, newPass);
%>
  <script>
      alert("<%=message%>");
      location='<%="company/company-home.jsp"%>'
  </script>
<%  }
%>

<% if(request.getParameter("changePassStudent") != null ){
  %>
<%
    String enrollment = (String)session.getAttribute("enrollment");
    String oldPass = request.getParameter("oldPass");
    String newPass = request.getParameter("newPass");
    StudentDao sDao = new StudentDao();
  String message = sDao.updateStudentPass(enrollment, oldPass, newPass);
%>
  <script>
      alert("<%=message%>");
      location='<%="student/student-home.jsp"%>'
  </script>
<%  }
%>
