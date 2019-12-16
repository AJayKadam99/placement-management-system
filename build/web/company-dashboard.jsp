<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*"%>    
<%@ page import="java.math.*"%>
<%@ page import="java.text.*"%>
<%@page import="db.DBconn"%>
<% %>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>

	<link rel="stylesheet" href="css/circle.css">  
	<link rel="stylesheet" href="css/content.css">   

    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="lib/animate/animate.min.css" rel="stylesheet" />

    <link href="css/navigation.css" rel="stylesheet">

    <link href="css/dashboard.css" rel="stylesheet" />
    
  </head>
     <%                  
          String uname=session.getAttribute("uname").toString();
                            ResultSet rst =null;
			    ResultSet rst2 = null, rst3 = null, rst4 = null;
                            Statement st = null, st2 = null, st3 = null, st4 = null;
                        try{
                          DBconn db = new DBconn();  
			  Connection con = db.connect();
                          System.out.println("Connected!");
			    
		         st = con.createStatement();
                         rst= st.executeQuery("select count(stud_id) as totalcount from student");
                         rst.next();
                         
                         st2 = con.createStatement();
                         rst2 = st2.executeQuery("select count(student.stud_id) as eligible from student inner join cgpa on student.stud_id = cgpa.stud_id where overall >= (select criteria from company where comp_id = '"+uname+"')");
                         rst2.next();
                         
                         st3 = con.createStatement();
                         rst3= st3.executeQuery("select count(stud_id) as applyCount from applied where comp_id = '"+uname+"'");
                         rst3.next();
                         
                         st4 = con.createStatement();
                         rst4= st4.executeQuery("select comp_name from company where comp_id = '"+uname+"'");
                         rst4.next();
                         
                         
                        }catch(Exception ex){
                             System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at company-dashboard.jsp");
                        }
                          
                        int total = Integer.parseInt(rst.getString(1));
                        int totalPercent = (total*100)/650;
                        
                        int eligible = Integer.parseInt(rst2.getString(1));
                        int eligiblePercent = (eligible*100)/total;
                           
                        int applied= Integer.parseInt(rst3.getString(1));
                        int appliedPercent = (applied*100)/total; 
%> 
  <body>
    <nav class="nav navbar">
      <div class="left-part">
        <div class="logo">
          <!--<img src="./img/Pict-Logo.jpg" class="pict-logo" />-->
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
               <%=rst4.getString(1).toString().charAt(0)%>
            </div>
          </div>
          
          <div class="menu">
              <div class="menu-item">
                  <div class="menu-btn active">
                    <div class="menu-btn-logo">
                      <i class="fa fa-home"></i>
                    </div>
                      <div class="menu-btn-content" onclick="location. href='company-dashboard.jsp'">
                      Home
                    </div>
                  </div>
                </div>
                </a>
               
            <div class="menu-item">
              <div class="menu-btn">
              <div class="menu-btn-logo">
                <i class="fa fa-user-circle"></i>
              </div>
                  <div class="menu-btn-content" onclick="location.href='company-profile.jsp'">
                  My Profile
              </div>
              </div>
            </div>
           
             <div class="menu-item">
                <div class="menu-btn">
                <div class="menu-btn-logo">
                  <i class="fa fa-users"></i>
                </div>
                    <div class="menu-btn-content" onclick="location.href='company-edit.jsp'">
                   	Edit Profile
                </div>
                </div>
              </div>           
              <div class="menu-item">
                  <div class="menu-btn">
                  <div class="menu-btn-logo">
                    <i class="fa fa-handshake-o"></i>
                  </div>
                  
                      <div class="menu-btn-content"  onclick="location.href='company-studlist.jsp'">
                      Students list
                  </div>
                  
                  </div>
                </div>
                </a>
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
          <h4>Hire The Best!</h4>
        </div>
        
       
        <table id="upcoming" class="table table-borderless text-center">
            <thead>
                <th><h2>Stats</h2></th>
            </thead>
        </table>
        
                          
        <div class="row">
  <div class="column">
    <div class="card">
      <h3>Total Students</h3>
      <div class="clearfix" style="padding-left: 30px; padding-top: 10px;">
            <div class="c100 p<%=totalPercent%> big">
            	<span>
                    <%=rst.getString(1)%></span>
            	<div class="slice">
                   	<div class="bar"></div>
                   	<div class="fill"></div>
                </div>
            </div>
       	</div>
    </div>
  </div>
  <div class="column">
    <div class="card">
      <h3>Eligible Students</h3>
      <div class="clearfix" style="padding-left: 30px; padding-top: 10px;">
            <div class="c100 p<%=eligiblePercent%> big">
            	<span><%=eligible%></span>
            	<div class="slice">
                   	<div class="bar"></div>
                   	<div class="fill"></div>
                </div>
            </div>
       	</div>
    </div>
  </div>
  
  <div class="column">
    <div class="card">
      <h3>Applied Students</h3>
      <div class="clearfix" style="padding-left: 30px; padding-top: 10px;">
            <div class="c100 p<%=appliedPercent%> big">
            	<span><%=applied%></span>
            	<div class="slice">
                   	<div class="bar"></div>
                   	<div class="fill"></div>
                </div>
            </div>
       	</div>
    </div>
  </div>
  
  
</div>     
        
      </div>
    </section>
     
    <script src="./lib/jquery/jquery.min.js"></script>
    <script src="./js/nav.js"></script>
  </body>
</html>


