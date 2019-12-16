<%-- 
    Document   : checkProfile
    Created on : Oct 13, 2019, 5:25:42 PM
    Author     : DEEPAK
--%>

<%@include file="sessionCheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="db.DBconn" %>

<% 
String uname = (String) session.getAttribute("uname");
 Statement stmt = null, stmt2 = null;
    ResultSet rst = null, rst2 = null;
    try{
        DBconn db = new DBconn();
        Connection con = db.connect();
        stmt = con.createStatement();
        rst = stmt.executeQuery("Select dob from student where stud_id ='"+uname+"'"); 
        rst.next();
//        rst.next();
        out.print(rst.getString("dob"));
        out.print(rst.wasNull());
        if(rst.wasNull()){
            response.sendRedirect("createProfile.jsp");
        }
        else{
        response.sendRedirect("studentProfile.jsp");
            
        }con.close();
    }catch(Exception ex){
    System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at studentProfile.jsp");
    }

%>