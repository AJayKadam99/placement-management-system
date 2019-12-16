<%-- 
    Document   : updateProfile
    Created on : Oct 13, 2019, 4:17:58 PM
    Author     : DEEPAK
--%>
<%@include file="sessionCheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="db.DBconn" %>

<% 
    String uname = (String) session.getAttribute("uname");
    String fname = request.getParameter("first-name");
    String lname = request.getParameter("last-name");
    String dob = request.getParameter("dob");
    String technical = request.getParameter("technical");
    String other = request.getParameter("other");
    String non_technical = request.getParameter("non-technical");
    String email = request.getParameter("email");
    String linkedin = request.getParameter("linkedin");
    String mobile = request.getParameter("mobile");
    Statement stmt = null, stmt2 = null;
    ResultSet rst = null, rst2 = null;
    try{
        DBconn db = new DBconn();
        Connection con = db.connect();
        stmt = con.createStatement();
        stmt.executeUpdate("update student set first_name = '"+fname+"', last_name = '"+lname+"',dob = '"+dob+"',technical_skills = '"+technical+"', other_tech_skills = '"+other+"', non_technical_skills = '"+non_technical+"',email = '"+email+"', linkedin = '"+linkedin+"', mobile = '"+mobile+"' where stud_id = '"+uname+"'");         
        response.sendRedirect("studentProfile.jsp");
    
    }catch(Exception ex){
    System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at studentProfile.jsp");
    }
  

%>
