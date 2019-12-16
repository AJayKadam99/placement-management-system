<%-- 
    Document   : companyView
    Created on : Oct 9, 2019, 6:25:18 PM
    Author     : DEEPAK
--%>

<%@include file="sessionCheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="db.DBconn" %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
   
    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="lib/animate/animate.min.css" rel="stylesheet" />

    <link href="css/navigation.css" rel="stylesheet">

    <link href="css/companyView.css" rel="stylesheet" />
    
  </head>
  <% 
    
      Statement stmt = null, stmt2 = null,stmt3 = null;
      ResultSet rst = null, rst2 = null, rst3 = null;
      String compId = request.getParameter("id");
      String uname = (String) session.getAttribute("uname");
      try{
       DBconn db = new DBconn();
       Connection con = db.connect();
       
       stmt = con.createStatement();
       
       rst = stmt.executeQuery("select * from company where comp_id = '"+compId+"'");
       rst.next();
       
       stmt2 = con.createStatement();
       rst2 = stmt2.executeQuery("select name from tnp_coordinator where tnp_id ='"+uname+"'");
       rst2.next();
       
           
      }catch(Exception ex){
      System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at companyView.jsp");
      }   
  %>
  <body>
    <nav class="nav navbar">
      <div class="left-part">
       
        <div class="college-name text-center">
            Placement Management<br> System
        </div>
      </div>
      <div class="right-part">
        <div class="nav-item">
          <!--<button class="btn btn-danger">Logout</button>-->
        </div>
       
        <button class="btn btn-outline-primary" id="mobile-nav-open-btn" onclick="handleMobileNav()" >&#9776;</span>
      </div>
    </nav>
    <section class="side-menu" id="side">
        <div class="col-fluid">
          <div class="user">
            <div class="user-logo text-center">
              <%=rst2.getString(1).toString().charAt(0)%>
            </div>
          </div>
            <div class="menu">
              <div class="menu-item">
                  <div class="menu-btn">
                    <div class="menu-btn-logo">
                      <i class="fa fa-home"></i>
                    </div>
                    <div class="menu-btn-content" onclick="location.href='tnp-coordinator-dashboard.jsp'">
                      Home
                    </div>
                  </div>
                </div>
            <div class="menu-item">
              <div class="menu-btn">
              <div class="menu-btn-logo">
                <i class="fa fa-user-circle"></i>
              </div>
              <div class="menu-btn-content" onclick="location.href='viewStudents.jsp'">
                  View Students
              </div>
              </div>
            </div>
            <div class="menu-item">
                <div class="menu-btn active">
                <div class="menu-btn-logo ">
                  <i class="fa fa-users"></i>
                </div>
                <div class="menu-btn-content" onclick="location.href='viewCompanies.jsp'">
                    View Companies
                </div>
                </div>
              </div>
              <div class="menu-item">
                  <div class="menu-btn">
                  <div class="menu-btn-logo">
                    <i class="fa fa-handshake-o"></i>
                  </div>
                  <div class="menu-btn-content" onclick="location.href='addCompany.jsp'">
                      Add Company
                  </div>
                  </div>
                </div>
                <div class="menu-item logout">
                  <div class="menu-btn">
                  <div class="menu-btn-logo">
                    <i class="fa fa-sign-out"></i>
                  </div>
                  <div class="menu-btn-content" onclick="location.href='login.jsp'">
                      Log Out
                  </div>
                  </div>
                </div>
        </div>
      </div>
</section>
    <section id="main">
      <div class="content-section"> 
        <div class="row">
              <div class="company-img ">
                  <img src="downloadImage.jsp?id=<%=rst.getString("comp_id")%>" class="companyLogo">
              </div>
              <div class="company-name text-center">
                  <%=rst.getString("comp_name").toString()%>
                  <div>
                      <hr>
                      <h3>Date: <%=rst.getString("date").substring(0,10)%></h3>
                      <h4>Time: <%=rst.getString("date").substring(10,16)%></h4>
                  </div>
              </div>
          </div>
          <div class="about-company">
              <div class="about-company-head">
                  About Us:
              </div>
              <div class="about-company-content">
                  <p>
                      <%=rst.getString("about").toString()%>
                  </p>
              </div>
              <div class="about-company-head">
                
              </div>
              <div class="about-company-head">
                Branch & Criteria: 
              </div>
              <div class="about-company-content">
                <p>
                    <%=rst.getString("branch").toString()%>
                    <%=rst.getString("criteria").toString()%>
                </p>
              </div>
              <div class="about-company-head">
                Skill Requirements: 
              </div>
              <div class="about-company-content">
                <p>
                    <%=rst.getString("skills").toString()%>
                </p>
              </div>
              
              <div class="about-company-head">
                Activity: 
              </div>
              <div class="about-company-content">
                <p>
                    <%=rst.getString("activity").toString()%>
                </p>
              </div>
              <div class="about-company-head">
                Instructions: 
              </div>
              <div class="about-company-content">
                <p>
                      <%=rst.getString("instructions").toString()%>
                 </p>
              </div>
                
          </div>
        </div>
    </section>
    
    
    <script src="./lib/jquery/jquery.min.js"></script>
    <script src="./js/companyView.js"></script>
    
  </body>
</html>


