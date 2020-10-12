<%@page import="dao.AdminDao"%>
<%@page import="dao.StudentDao" %>
<%@page import="dao.CompanyDao" %>
<%
String userId = request.getParameter("userid");
String password = request.getParameter("password");
//out.print(userId+"\n"+password);
//out.print(request.getParameter("student") != null);
//out.print(request.getParameter("company")!= null);
//
if(request.getParameter("student") != null){
    StudentDao objSD = new StudentDao();
    String errorMsg = objSD.verifyStudent(userId,password);
    if(errorMsg == null){
        session.setAttribute("enrollment",userId);
        response.sendRedirect("student/student-home.jsp");
    }
    else{   
        session.setAttribute("message", errorMsg);
            response.sendRedirect("index.jsp#signin");
    }
}

if(request.getParameter("company")!= null){
    CompanyDao objCD = new CompanyDao();
    String errorMsg = objCD.verifyCompany(userId,password);
    if(errorMsg == null ){
        session.setAttribute("userId",userId);
        response.sendRedirect("company/company-home.jsp");
    }
    else{   
        session.setAttribute("message", errorMsg);
            response.sendRedirect("index.jsp#signin");
    }
}

if(request.getParameter("admin") != null){
    AdminDao objAD = new AdminDao();
    String adminId = request.getParameter("adminId");
    String errorMsg = objAD.verifyAdmin(adminId,password);
    if(errorMsg == null){
        session.setAttribute("adminId",adminId);
        response.sendRedirect("admin/admin-home.jsp");
    }
    else{   
        session.setAttribute("message", errorMsg);
            response.sendRedirect("admin/admin-login.jsp#signin");
    }
}

%>