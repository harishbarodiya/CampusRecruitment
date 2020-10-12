
<%@page import="dao.AdminDao"%>
<%@page import="dao.CompanyDao"%>
<%@page import="dao.StudentDao"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="dto.StudentDto"%>
<%@page import="dto.CompanyDto"%>
<%
   if(request.getParameter("student") != null){  %>
<jsp:useBean id="sDto" class="dto.StudentDto"></jsp:useBean>
<jsp:setProperty name="sDto" property="*"></jsp:setProperty>
<%
  StudentDao sDao = new StudentDao();
  String message = sDao.registerStudent(sDto);
%>
  <script>alert("<%=message%>");</script>
  <jsp:include page="index.jsp"></jsp:include>
  <%  }


else if(request.getParameter("company") != null ){
  %>
<jsp:useBean id="cDto" class="dto.CompanyDto"></jsp:useBean>
<jsp:setProperty name="cDto" property="*"></jsp:setProperty>
<%
  CompanyDao cDao = new CompanyDao();
  String message = cDao.registerCompany(cDto);
%>
  <script>alert("<%=message%>");</script>
  <jsp:include page="index.jsp"></jsp:include>
  <%  }


else if(request.getParameter("admin") != null ){
  %>
<jsp:useBean id="aDto" class="dto.AdminDto"></jsp:useBean>
<jsp:setProperty name="aDto" property="*"></jsp:setProperty>
<%
  AdminDao aDao = new AdminDao();
  String message = aDao.registerAdmin(aDto);
  out.print("<script>alert('"+message+"');");
  out.println("location='admin/add-admin.jsp';");
  out.println("</script>"); 
  }
%>


<%
if(request.getParameter("counter") != null ){
%>
<jsp:useBean id="ctrDto" class="dto.CounterDto"></jsp:useBean>
<jsp:setProperty name="ctrDto" property="*"></jsp:setProperty>
<%
  AdminDao aDao = new AdminDao();
  String message = aDao.editCounter(ctrDto);
  out.print("<script>alert('"+message+"');");
  out.println("location='admin/edit-counters.jsp';");
  out.println("</script>"); 
 }
%>

  