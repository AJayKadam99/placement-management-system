<%@include file="sessionCheck.jsp"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@page import="db.DBconn" %>

<%
    String uname = (String) session.getAttribute("uname");
    ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null, rs7 = null, rs8 = null;
    Statement st2 = null, st3 = null, st4 = null, st5 = null, st6 = null, st7 = null, st8 = null;
    String dept_name = null;
    String data_pie[] ={null,null,null};
    String company_names[]=new String[3];
    String data_comp[]=new String[3];
    int data2[] = {0,0,0,0,0,0,0,0,0,0,0,0};

    try{
    DBconn db = new DBconn();
    Connection con = db.connect();
    Statement st = con.createStatement();
    
    
    st2 = con.createStatement();
    rs2 = st2.executeQuery("select name from tnp_coordinator where tnp_id ='"+uname+"'");
    rs2.next();
    
    st4 = con.createStatement();
    rs4 = st4.executeQuery("select distinct count(stud_id) from applied where status = 'selected' ");
    rs4.next();
    
    st5 = con.createStatement();
    rs5 = st5.executeQuery("select count(stud_id) from student");
    rs5.next();
    
    st6 = con.createStatement();
    rs6 = st6.executeQuery("select count(comp_id) from company where date > NOW()");
    rs6.next();
    
    st7 = con.createStatement();
    rs7 = st7.executeQuery("select count(comp_id) from company where date < NOW()");
    rs7.next();
    
    }catch(Exception ex){
    System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at tnp-dashboard.jsp");
    }
    
    
    int total = Integer.parseInt(rs5.getString(1));
    int placed = Integer.parseInt(rs4.getString(1));
    
   
    
%>
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
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <link href="css/dashboard.css" rel="stylesheet" />
    <link href="css/tnp.css" rel="stylesheet" />
   
    <script src="./lib/jquery/jquery.min.js"></script>
  </head>
  <body>
    <nav class="nav navbar">
      <div class="left-part">
        <div class="logo">
          <!-- <img src="./img/Pict-Logo.jpg" class="pict-logo" /> -->
        </div>
        <div class="college-name text-center">
          Placement Management<br />System
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
             <%=rs2.getString("name").toString().charAt(0)%>
            </div>
          </div>
          <div class="menu">
              <div class="menu-item">
                  <div class="menu-btn active">
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
                <div class="menu-btn">
                <div class="menu-btn-logo">
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
        <div class="welcome text-center">
          <h2>Welcome to Placement Portal!</h2>
          <h4>Apply, Face and Get Placed!</h4>
        </div>
        


          <!-- Stats -->
       <section id="stats" style="margin-top: 10vh;">
        
        <div class="content-box-md">
  
            <div class="container">
  
                <div class="row">
  
                    <div class="col-md-3 col-sm-3 col-xs-6">
  
                        <!-- Stats Item 01 -->
                        <div class="stats-item profiles text-center" >
                            <i class="fa fa-address-card"></i>
                            <h3 class="counter"><%=rs4.getString(1)%></h3>
                            <p>Placed Students</p>
                        </div>
  
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6">
  
                        <!-- Stats Item 02 -->
                        <div class="stats-item attendance text-center" >
                            <i class="fa fa-bar-chart"></i>
                            <h3 class="counter"><%=total-placed%></h3>
                            <p>Unplaced Students</p>
                        </div>
  
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6">
  
                        <!-- Stats Item 03 -->
                        <div class="stats-item achievements text-center" >
                            <i class="fa fa-trophy"></i>
                            <h3 class="counter"><%=rs6.getString(1)%></h3>
                            <p>Upcoming Companies</p>
                        </div>
  
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6">
  
                        <!-- Stats Item 04 -->
                        <div class="stats-item meets text-center" >
                            <i class="fa fa-users"></i>
                            <h3 class="counter"><%=rs7.getString(1)%></h3>
                            <p>Companies Done</p>
                        </div>
  
                    </div>
  
                </div>
  
            </div>
  
        </div>
        
    </section> 
    </section>
  </body>
</html>