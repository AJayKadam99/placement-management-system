<%-- 
    Document   : validateStudentProfile
    Created on : Oct 22, 2019, 4:07:00 PM
    Author     : DEEPAK
--%>

<%@include file="sessionCheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="db.DBconn" %>

<%
    String id = request.getParameter("id");
    Statement stmt = null;
    try{
        DBconn db = new DBconn();
        Connection con = db.connect();
        stmt = con.createStatement();
        stmt.executeUpdate("update student set profile_validate = 1 where stud_id = '"+id+"'");
        
        response.sendRedirect("tnp-admin-validateStudents.jsp?id="+id+"");
        
    }catch(Exception ex){
        System.out.print("Ex: "+ ex.toString()+" occured while connecting with db at validateStudentProfile.jsp");
    }
%>

