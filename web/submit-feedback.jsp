<%-- 
    Document   : submit-feedback
    Created on : Oct 15, 2019, 8:49:09 PM
    Author     : DEEPAK
--%>

<%@include file="sessionCheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="db.DBconn"%>

  <%
    
     String uname = (String) session.getAttribute("uname");
     String comp_id = request.getParameter("comp_id");
     String aptitude = request.getParameter("fdaptitude");
     String technical = request.getParameter("fdtechnical");
     String coding = request.getParameter("fdcoding");
     String hr = request.getParameter("fdhr");
     String suggestions = request.getParameter("fdsuggestions");
     Statement stmt = null, stmt2 = null;
     ResultSet rst = null, rst2 = null;
     try{
     DBconn db = new DBconn();
     Connection con = db.connect();
     stmt = con.createStatement();
     stmt.executeUpdate("insert into feedback values('"+uname+"', '"+comp_id+"', '"+technical+"', '"+aptitude+"', '"+hr+"', '"+coding+"', '"+suggestions+"')");
//     rst.next();
     response.sendRedirect("student-dashboard.jsp");
     con.close();
     }
     catch(Exception ex){
     System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at login.jsp");
     } 
  %>