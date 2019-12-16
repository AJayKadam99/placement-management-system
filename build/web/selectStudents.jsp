<%-- 
    Document   : selectStudents
    Created on : Oct 23, 2019, 11:29:28 AM
    Author     : DEEPAK
--%>

<%@include file="sessionCheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="db.DBconn" %>

<% Statement stmt = null, stmt2=null, stmt3 = null;
      ResultSet rst = null, rst2=null, rst3 = null;
      String compId = request.getParameter("id");
      String uname = (String)session.getAttribute("uname");
      String[] selected = request.getParameterValues("selected");
      String Select = "";
      try{
       DBconn db = new DBconn();
       Connection con = db.connect();
       Select = "'"+selected[0]+"'";
       for(int i=1;i<selected.length;i++){
          Select += ", '" + selected[i]+"'";
       }
      out.print(compId);
       stmt = con.createStatement();
       stmt.executeUpdate("update applied set status = 'selected' where stud_id in ("+Select+") and comp_id = '"+compId+"'");
      
        
       response.sendRedirect("tnp-admin-dashboard.jsp");
       
      }catch(Exception ex){
      System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at companyView.jsp");
      }   
  %>