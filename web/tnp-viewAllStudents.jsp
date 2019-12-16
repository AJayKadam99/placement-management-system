<%-- 
    Document   : viewStudents
    Created on : Oct 16, 2019, 12:25:27 PM
    Author     : DEEPAK
--%>

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
    <script src="./lib/jquery/jquery.min.js"></script>
    <script src="./js/mystudents.js"></script>
  </head>
  <% Statement stmt = null, stmt2=null, stmt3 = null;
      ResultSet rst = null, rst2=null, rst3 = null;
      String compId = request.getParameter("id");
      String uname = (String)session.getAttribute("uname");
      
      try{
       DBconn db = new DBconn();
       Connection con = db.connect();
       
        stmt2 = con.createStatement();
         rst2 = stmt2.executeQuery("select name from tnp_admin where tnp_id ='"+uname+"'");
         rst2.next();
       
           
      
           stmt = con.createStatement();
           rst = stmt.executeQuery("select stud_id, first_name, last_name, roll_no, branch, profile_validate from student");
       
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
      <div class="side-menu" id="side">
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
                    <div class="menu-btn-content" onclick="location.href='tnp-admin-dashboard.jsp'">
                      Home
                    </div>
                  </div>
                </div>
            <div class="menu-item">
              <div class="menu-btn active">
              <div class="menu-btn-logo">
                <i class="fa fa-user-circle"></i>
              </div>
              <div class="menu-btn-content" onclick="location.href='tnp-viewAllStudents.jsp'">
                  View Students
              </div>
              </div>
            </div>
            <div class="menu-item">
                <div class="menu-btn">
                <div class="menu-btn-logo">
                  <i class="fa fa-users"></i>
                </div>
                <div class="menu-btn-content" onclick="location.href='tnp-admin-viewCompanies.jsp'">
                    View Companies
                </div>
                </div>
              </div>
              <div class="menu-item">
                  <div class="menu-btn">
                  <div class="menu-btn-logo">
                    <i class="fa fa-handshake-o"></i>
                  </div>
                  <div class="menu-btn-content" onclick="location.href='selectedStudents.jsp'">
                      Selected Students
                  </div>
                  </div>
                </div>
              <div class="menu-item">
                  <div class="menu-btn">
                  <div class="menu-btn-logo">
                    <i class="fa fa-handshake-o"></i>
                  </div>
                  <div class="menu-btn-content" onclick="location.href='tnp-overallReport.jsp'">
                      Overall Report
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
</div>
      <section class="content-section">
        <div class="studentListHeading text-center">
          <h2>All Students</h2>
        </div>
        <section id="student-table">
          <table class="table table-hover text-center ">
            <thead class="thead-light">
              <tr class="underline">
                <th>Sr.No.</th>
                <th>Reg. Id</th>
                <th>Student Name</th>
                <th>Roll No.</th>
                <th>Branch</th>
                <th></th>
                
              </tr>
            </thead>
            <tbody>
                <%  int c = 0; 
                try{
                while(rst.next()){  
                    c++;
                %>
              <tr>
                <td><%=c%></td>
                <td><%=rst.getString("stud_id").toString()%></td>
                <td><%=rst.getString("first_name").toString()+" "+rst.getString("last_name").toString()%></td>
                <td><%=rst.getString("roll_no").toString()%></td>
                <td><%=rst.getString("Branch").toString()%></td>
                <td><button class="btn btn-primary validate-btn" id="validate-<%=c%>" onclick="location.href='tnp-admin-validateStudents.jsp?id=<%=rst.getString("stud_id").toString()%>'" >View Details</button></td>
              </tr>
              
                <%
                }
               
                }  
                catch(Exception ex){
                    System.out.print(ex+" occured during while\n");
                }
%>
                
            </tbody>
          </table>
        </section>
      </section>
    </section>
    
  </body>
</html>


