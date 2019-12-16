<%--
    Document   : createStudentProfile
    Created on : Oct 13, 2019, 6:30:29 PM
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
    int backlog = Integer.parseInt(request.getParameter("backlog"));
    int diploma = Integer.parseInt(request.getParameter("diploma"));
    float overall = Float.parseFloat(request.getParameter("overall"));
    float sem1 = Float.parseFloat(request.getParameter("sem1"));
    float sem2 = Float.parseFloat(request.getParameter("sem2"));
    float sem3 = Float.parseFloat(request.getParameter("sem3"));
    float sem4 = Float.parseFloat(request.getParameter("sem4"));
    float sem5 = Float.parseFloat(request.getParameter("sem5"));
    String technical = request.getParameter("technical");
    String other = request.getParameter("other");
    String non_technical = request.getParameter("non-technical");
    String email = request.getParameter("email");
    String linkedin = request.getParameter("linkedin");
    String mobile = request.getParameter("mobile");
    String branch = (String)session.getAttribute("branch");


    Statement stmt = null, stmt2 = null;
    ResultSet rst = null, rst2 = null;
    try{
        DBconn db = new DBconn();
        Connection con = db.connect();
        stmt = con.createStatement();
        stmt2 = con.createStatement();
      
//        out.print(fname+lname+dob+branch+);
        stmt.executeUpdate("update student set first_name = '"+fname+"', last_name = '"+lname+"',dob = '"+dob+"',branch = '"+branch+"', technical_skills = '"+technical+"', other_tech_skills = '"+other+"', non_technical_skills = '"+non_technical+"',email = '"+email+"', linkedin = '"+linkedin+"', mobile = '"+mobile+"' where stud_id = '"+uname+"'");
        out.print("done");
       stmt2.executeUpdate("update cgpa set diploma = '"+diploma+"',overall = '"+overall+"',sem1 = '"+sem1+"', sem2 = '"+sem2+"', sem3 = '"+sem3+"', sem4 = '"+sem4+"', sem5 = '"+sem5+"', backlog = '"+backlog+"' where stud_id = '"+uname+"'");

       response.sendRedirect("studentProfile.jsp");


    }catch(Exception ex){
    System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at creatProfile.jsp");
    }
%>
