<%-- 
    Document   : student-feedback
    Created on : Oct 15, 2019, 8:26:24 PM
    Author     : DEEPAK
--%>
<%@include file="sessionCheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.*"%>
<%@page import="db.DBconn"%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>	 

    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />
    <link href="lib/animate/animate.min.css" rel="stylesheet" />

    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="css/navigation.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/feedback.css">
    <link href="css/dashboard.css" rel="stylesheet" />
  </head>
     <%
    
     String uname = (String) session.getAttribute("uname");
     Statement stmt = null, stmt2 = null;
     ResultSet rst = null, rst2 = null;
     try{
     DBconn db = new DBconn();
     Connection con = db.connect();
     stmt = con.createStatement();
     rst = stmt.executeQuery("select comp_id, comp_name from company where comp_id in (select comp_id from applied where stud_id = '"+uname+"')");
//     rst.next();
     
     stmt2 = con.createStatement();
     rst2 = stmt2.executeQuery("select first_name from student where stud_id ='"+uname+"'");
     rst2.next();
     }
     catch(Exception ex){
     System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at login.jsp");
     } 
  %>
  <body>
    <nav class="nav navbar">
      <div class="left-part">
        <div class="logo">
          <!--<img src="./img/Pict-Logo.jpg" class="pict-logo" />-->
        </div>
        <div class="college-name text-center">
         Placement Management<br> System
        </div>
      </div>
      <div class="right-part">
        <div class="nav-item">
            <button class="btn btn-success" onclick="handleClick()">Save</button>
        </div>
       
        <button class="btn btn-outline-primary" id="mobile-nav-open-btn" onclick="handleMobileNav()" >&#9776;</span>
      </div>
    </nav>
    <section class="side-menu" id="side">
        <div class="col-fluid">
          <div class="user">
            <div class="user-logo text-center">
             <%=rst2.getString("first_name").toString().charAt(0)%>
            </div>
          </div>
          <div class="menu">
              <div class="menu-item">
                  <div class="menu-btn">
                    <div class="menu-btn-logo">
                      <i class="fa fa-home"></i>
                    </div>
                      <div class="menu-btn-content" onclick="location.href='student-dashboard.jsp'">
                      Home
                    </div>
                  </div>
                </div>
           <div class="menu-item">
              <div class="menu-btn">
              <div class="menu-btn-logo">
                <i class="fa fa-user-circle"></i>
              </div>
                  <div class="menu-btn-content" onclick="location.href='checkProfile.jsp'">
                  My Profile
              </div>
              </div>
            </div>
            <div class="menu-item">
                
                <div class="menu-btn">
                <div class="menu-btn-logo">
                  <i class="fa fa-users"></i>
                </div>
                    <div class="menu-btn-content" onclick="location.href='myApplied.jsp'">
                    My Applications
                        </div>
                </div>
              </div>
              <div class="menu-item">
                  <div class="menu-btn">
                  <div class="menu-btn-logo">
                    <i class="fa fa-handshake-o"></i>
                  </div>
                      <div class="menu-btn-content" onclick="location.href='myUploads.jsp'">
                      My Uploads
                  </div>
                  </div>
                </div>
              <div class="menu-item">
                  <div class="menu-btn active">
                  <div class="menu-btn-logo">
                    <i class="fa fa-handshake-o"></i>
                  </div>
                      <div class="menu-btn-content" onclick="location.href='student-feedback.jsp'">
                      My Feedbacks
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
        
       
        <table id="feedback" class="table table-borderless text-center">
            <thead>
                <th><h2>
                	FEEDBACK
                </h2></th>
            </thead>
        </table>
          <form action="submit-feedback.jsp" id="feedback-form">
        <div class="container-feedback">
        	<div class="container-fluid">
                    <div class="form-group">
                       <label class="form-label">Company Name: </label>
                       <select class="form-control" name="comp_id">
                           <% while(rst.next()){%>
                           <option value="<%=rst.getString("comp_id")%>"><%=rst.getString("comp_name")%></option>
                       <%}%>
                        </select>
                    </div>
        		<div class="form-group">
        			<label class="form-label">Aptitude test: </label>
        			<textarea name="fdaptitude" class="form-control" style="height:12vw; margin-bottom: 2vw;" placeholder="Tell us your aptitude test experience. How is the difficulty level? What types of questions are asked?"></textarea>

        			<label class="form-label">Technical round: </label>
        			<textarea name="fdtechnical" class="form-control" style="height:12vw; margin-bottom: 2vw;" placeholder="What kind of questions were asked in technical round? What were the most focused concepts?"></textarea>

        			<label class="form-label">Coding round: </label>
        			<textarea name="fdcoding" class="form-control" style="height:12vw; margin-bottom: 2vw;" placeholder="Share your feedback about coding round. Tell us what kind of problem statements were asked and which were the most crucial concepts needed? "></textarea>

        			<label class="form-label">HR round: </label>
        			<textarea name="fdhr" class="form-control" style="height:12vw; margin-bottom: 2vw;" placeholder="Share some tacts used in HR round to impress the interviewers. What should be our body language or how to answer questions appropriately"></textarea>

        			<label class="form-label">Other suggestions: </label>
        			<textarea name="fdsuggestions" class="form-control" style="height:12vw; margin-bottom: 2vw;" placeholder="Please feel free to give any kind of suggestion for interview preparation like what kind of study material to use or which website to refer for various rounds"></textarea>
        		</div>
        	</div>
        </div>
          </form>


        
       
    </section>
     
    <script src="./lib/jquery/jquery.min.js"></script>
    <script src="./js/nav.js"></script>
    <script>
      function handleClick(){
          $("#feedback-form").submit();
      }
    </script>
  </body>
</html>



