<%@page import="dao.AdminDao"%>
<%
String enrollment = request.getParameter("enrollment");
String status = request.getParameter("status").toLowerCase()+"d";
AdminDao aDao = new AdminDao();
out.print(aDao.changeStdStatus(enrollment, status));
   
%>