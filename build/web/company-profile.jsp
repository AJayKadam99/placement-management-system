<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
 <%@page import="java.sql.*" %>
 <%@page import="db.DBconn"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
  <link rel="stylesheet" href="https://www.w3schools.com/w3css/4/w3.css">
	 
	<link rel="stylesheet" href="css/company-profile.css">   

    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="lib/animate/animate.min.css" rel="stylesheet" />

    <link href="css/navigation.css" rel="stylesheet">

    <link href="css/dashboard.css" rel="stylesheet" />
  </head>
    <%
                  
                            ResultSet rst4 = null;
                            Statement  st4 = null;
                            String uname=session.getAttribute("uname").toString();
                        try{
                          DBconn db = new DBconn();  
			  Connection con = db.connect();
                          System.out.println("Connected!");
                         
                         st4 = con.createStatement();
                         rst4= st4.executeQuery("select * from company where comp_id = '"+uname+"'");
                         rst4.next();
                         
                         
                        }catch(Exception ex){
                             System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at company-dashboard.jsp");
                        }
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
                  <div class="menu-btn">
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
              <div class="menu-btn active">
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
        
        
       
        <table id="upcoming" class="table table-borderless text-center">
            <thead>
                <th><h1>Profile</h1></th>
            </thead>
        </table>
 
						
      	<div class="container-profile">
      	
      		<img class="company-logo" src="downloadImage.jsp?id=<%=uname%>"/>
      	
			<div class="container-fluid ">
  				<div class="companyName">
					<div class="col-8">
					<h1><%=rst4.getString("comp_name") %></h1>  
      					<h3><%=rst4.getDate("Date") %></h3>
      					<p>
   	 				</div>
    			</div>
    		</div>
      	</div>
	<% 
%>


      	<div class="container-cards">
            <div class="column">
    			<div class="card">
      				<h4>About Us</h4>
     				<div class="card-row">
     					<%=rst4.getString("about") %>
     				</div>
       			</div>
    		</div>
                <div class="column">
    			<div class="card">
      				<h4>Branch, Criteria and Offering Package</h4>
     				<div class="card-row">
                                    Branches: <%=rst4.getString("about")%><br>
                                    Criteria: <%=rst4.getString("criteria")%><br>
                                Offering Package: <%=rst4.getString("package")%>
     				</div>
       			</div>
    		</div>
      		<div class="column">
    			<div class="card">
      				<h4>Activity</h4>
     				<div class="card-row">
     					<%=rst4.getString("activity") %>
     				</div>
       			</div>
    		</div>
    		<div class="column">
    			<div class="card">
      				<h4>Skills</h4>
     				<div class="card-row">
     					<%=rst4.getString("skills") %>
     				</div>
       			</div>
    		</div>
    		<div class="column">
    			<div class="card">
      				<h4>Instructions</h4>
     				<div class="card-row">
					<%=rst4.getString("instructions") %>
     				</div>
       			</div>
    		</div>
  		</div>
      <!-- PROFILE CODE ENDS -->
      </div>
    </section>
     
    <script src="./lib/jquery/jquery.min.js"></script>
    <script src="./js/nav.js"></script>
  </body>
</html>


