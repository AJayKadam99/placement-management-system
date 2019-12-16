<%-- 
    Document   : apply
    Created on : Oct 10, 2019, 8:38:49 AM
    Author     : DEEPAK
--%>

<%@include file="sessionCheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="db.DBconn" %>


<%
    String compid = request.getParameter("id");
    String uname = session.getAttribute("uname").toString();
    Statement stmt = null;
    ResultSet rst = null;
    
    try{
        DBconn db = new DBconn();
        Connection con = db.connect();
        stmt = con.createStatement();
        stmt.executeUpdate("insert into applied(stud_id, comp_id, status) values('"+uname+"', '"+compid+"', 'In progress')");
        session.setAttribute("applied", "success");
        response.sendRedirect("companyView.jsp?id="+compid+"");
        return;
    }catch(Exception ex){
    System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at apply.jsp");
    }
    
%>