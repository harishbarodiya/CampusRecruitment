<%@page import="dao.AdminDao"%>
<%
String userId = request.getParameter("userId");
String status = request.getParameter("status").toLowerCase()+"d";
AdminDao aDao = new AdminDao();
out.print(aDao.changeCmpStatus(userId, status));
   
%>