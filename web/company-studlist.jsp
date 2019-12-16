<%-- 
    Document   : myApplied
    Created on : Oct 7, 2019, 2:46:28 PM
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
    <link href="css/myApplications.css" rel="stylesheet" />

    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
   
    <link href="lib/animate/animate.min.css" rel="stylesheet" />

    <link href="css/navigation.css" rel="stylesheet">
  </head>
  <% Statement stmt = null, stmt2=null;
      ResultSet rst = null, rst2 = null;
      String uname = (String) session.getAttribute("uname");
      String applied = null;
      try{
       DBconn db = new DBconn();
       Connection con = db.connect();
       
       stmt = con.createStatement();
       
       rst = stmt.executeQuery("select distinct student.stud_id, first_name, last_name, branch, overall, linkedIn from student inner join cgpa on student.stud_id = cgpa.stud_id where student.stud_id in (select stud_id from applied where comp_id = '"+uname+"')");      
      // rst.next(); 
       
         stmt2 = con.createStatement();
         rst2 = stmt2.executeQuery("select comp_name from company where comp_id ='"+uname+"';");
         rst2.next();
         
      }catch(Exception ex){
      System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at companyView.jsp");
      }   
  %>
  
  <body>
    <nav class="nav navbar bg-light">
      <div class="left-part">
        <div class="logo">
        
        </div>
        <div class="college-name text-center">
         Placement Management<br> System
        </div>
      </div>
      <div class="right-part">
        <div class="nav-item">
         
        </div>
        <button class="btn btn-outline-primary" id="mobile-nav-open-btn" onclick="handleMobileNav()" >&#9776;</span>

      </div>
    </nav>
    <section id="main">
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
                      <div class="menu-btn-content" onclick="location.href='company-dashboard.jsp'">
                      Home
                    </div>
                  </div>
                </div>
              
               
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
                  <div class="menu-btn active">
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
      <section class="content-section">
        <div class="studentListHeading text-center">
          <h2>My Students</h2>
        </div>
        <section id="student-table">
          <table class="table table-hover text-center ">
            <thead class="thead-light">
              <tr class="underline">
                <th>Sr.No.</th>
                <th>Student Name</th>
                <th>CGPA</th>
                <th>Branch</th>
                <th>LinkedIn Profile</th>
                <th>Resume</th>
              </tr>
            </thead>
            <tbody>
                <% int c = 0;
                while(rst.next()){
                    c++;
                %>
              <tr>
                <td><%=c%></td>
                <td><%=rst.getString("first_name").toString()+" "+rst.getString("last_name").toString()%></td>
                <td><%=rst.getString("overall").toString()%></td>
                <td><%=rst.getString("branch").toString()%></td>
                <td><button class="btn btn-primary view-btn" onclick="location.href='<%=rst.getString("linkedIn").toString()%>'" >View</button></td>
                <td><button class="btn btn-success view-btn" onclick="location.href='FileReadPdf?id=<%=rst.getString("stud_id")%>&type=resume'">View</button></td>
              </tr>
                <%}%>
                
            </tbody>
          </table>
        </section>
      </section>
    </section>
    <script src="./lib/bootstrap/js/bootstrap.min.js"></script>
    <script src="./lib/jquery/jquery.min.js"></script>
    <script src="./js/mystudents.js"></script>
  </body>
</html>

