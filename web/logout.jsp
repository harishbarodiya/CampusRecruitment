<%-- 
    Document   : logout
    Created on : 10 Sep, 2020, 7:44:56 PM
    Author     : harish
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
session.invalidate();
 response.sendRedirect("index.jsp");
%>