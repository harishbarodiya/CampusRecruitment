<%@page import="dao.CompanyDao"%>
<%
  if(request.getParameter("addVacancy") != null){  %>
<jsp:useBean id="vDto" class="dto.VacancyDto"></jsp:useBean>
<jsp:setProperty name="vDto" property="*"></jsp:setProperty>
<%
  String companyId = (String)session.getAttribute("userId");
  vDto.setCompanyId(companyId);
  CompanyDao cDao = new CompanyDao();
  String message = cDao.addVacancy(vDto);
%>
  <script>
      alert("<%=message%>");
      location = 'post-vacancy.jsp';
  </script>
  <%  }   %>
  
 <%
  if(request.getParameter("addInternship") != null){  %>
<jsp:useBean id="iDto" class="dto.InternshipDto"></jsp:useBean>
<jsp:setProperty name="iDto" property="*"></jsp:setProperty>
<%
  String companyId = (String)session.getAttribute("userId");
  iDto.setCompanyId(companyId);
  CompanyDao cDao = new CompanyDao();
  String message = cDao.addInternship(iDto);
%>
  <script>
      alert("<%=message%>");
      location = 'post-internship.jsp';
  </script>
  <%  }   %>
   
  <%
  if(request.getParameter("addPlcmntTalk") != null){  %>
<jsp:useBean id="pDto" class="dto.PlcmntTalkDto"></jsp:useBean>
<jsp:setProperty name="pDto" property="*"></jsp:setProperty>
<%
  CompanyDao cDao = new CompanyDao();
  String message = cDao.addPlcmntTalk(pDto);
%>
  <script>
      alert("<%=message%>");
      location = 'post-plcmnt-talk.jsp';
  </script>
  <%  }   %>
   
  