<%-- 
    Document   : myUploads
    Created on : Oct 10, 2019, 7:31:04 PM
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
    <style>
        form{display: none}
    .btn-select{
      background: rgb(255, 136, 0);
      color: white;
    }
    .btn-select:hover{
      background:  rgb(214, 114, 0);
      color: white;
    }
    
  
  </style>
    
  </head>
   <% 
    
      Statement stmt = null, stmt2 = null,stmt3 = null;
      ResultSet rst = null, rst2 = null, rst3 = null;
      String compId = request.getParameter("id");
      String uname = (String) session.getAttribute("uname");
      String applied = null;
      try{
       DBconn db = new DBconn();
       Connection con = db.connect();
       
       stmt = con.createStatement();
       
       rst = stmt.executeQuery("select * from company where comp_id = '"+compId+"'");
       rst.next();
//       rst3.next();
       stmt2 = con.createStatement();
         rst2 = stmt2.executeQuery("select first_name from student where stud_id ='"+uname+"';");
         rst2.next();
   
       
       
        }catch(Exception ex){
      System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at myUploads.jsp");
      } 
  %>
  <body>
    <nav class="nav navbar bg-light">
      <div class="left-part">
        <div class="logo">
          <!-- <img src="./img/Pict-Logo.jpg" class="pict-logo" /> -->
        </div>
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
    <section id="main">
      <div class="side-menu" id="side">
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
              <div class="menu-btn-content" onclick="location.href='checkProfile.jsp'" >
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
                  <div class="menu-btn active">
                  <div class="menu-btn-logo">
                    <i class="fa fa-handshake-o"></i>
                  </div>
                  <div class="menu-btn-content" onclick="location.href='myUploads.jsp'">
                      My Uploads
                  </div>
                  </div>
                </div>
              <div class="menu-item">
                  <div class="menu-btn">
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
</div>
      <section class="content-section">
        <div class="studentListHeading text-center">
          <h2>My Uploads</h2>
        </div>
        <section id="student-table">
          <table class="table table-hover text-center ">
            <thead class="thead-light">
              <tr class="underline">
               <th>Document</th>
               <!--<th>Name</th>-->
               <th></th>
               <th></th>
               <th></th>
               <!--<th></th>-->
              </tr>
            </thead>
            <tbody>
             <tr>
                <td>FE Marksheet</td>
                <!--<td id="FE-file-name">Ajay_Kadam.pdf</td>-->
                <td><button class="btn btn-select" onclick="handleUpload('FE')">Select</button></td>
                <td><button class="btn btn-success" onclick="handleUploadButton('FE')">Upload</button></td>
                <td><button class="btn btn-primary" onclick="handleView('FE')">View</button></td>
                <!--<td><button class="btn btn-danger">Delete</button></td>-->
             </tr>
             <tr>
                    <td>SE Marksheet</td>
                    <!--<td id="SE-file-name">Ajay_Kadam.pdf</td>-->
                    <td><button class="btn btn-select" onclick="handleUpload('SE')">Select</button></td>
                    <td><button class="btn btn-success" onclick="handleUploadButton('SE')">Upload</button></td>
                    <td><button class="btn btn-primary" onclick="handleView('SE')" >View</button></td>
                    <!--<td><button class="btn btn-danger">Delete</button></td>-->
                 </tr>
             <tr>
                    <td>TE Marksheet</td>
                    <!--<td id="TE-file-name">Ajay_Kadam.pdf</td>-->
                    <td><button class="btn btn-select" onclick="handleUpload('TE')">Select</button></td>
                    <td><button class="btn btn-success" onclick="handleUploadButton('TE')">Upload</button></td>
                    <td><button class="btn btn-primary" onclick="handleView('TE')">View</button></td>
                    <!--<td><button class="btn btn-danger">Delete</button></td>-->
                 </tr>
             <tr>
                 <td>Resume</td>
                 <!--<td id="resume-file-name">Ajay_Kadam.pdf</td>-->
                 <td><button class="btn btn-select" onclick="handleUpload('resume')">Select</button></td>
                 <td><button class="btn btn-success" onclick="handleUploadButton('resume')">Upload</button></td>
                 <td><button class="btn btn-primary" onclick="handleView('resume')">View</button></td>
                 <!--<td><button class="btn btn-danger">Delete</button></td>-->
             </tr>
            </tbody>
          </table>
            <!-- upload forms-->
          <form method="POST" action="FileUpload" enctype="multipart/form-data" class="file-upload-form" id="FE-form">
                <input type="text" name="id" id="FE-id" value="<%=uname%>">
                <input type="text" name="name" value="FE"> 
                <input type="file" name="file" id="FE" onchange="handleInputChange()">
          </form>
          <form method="POST" action="FileUpload" enctype="multipart/form-data" class="file-upload-form" id="SE-form">
              <input type="text" name="id" id="SE-id" value="<%=uname%>">
                <input type="text" name="name" value="SE"> 
                <input type="file" name="file" id="SE" onchange="handleInputChange()">
          </form>
          <form method="POST" action="FileUpload" enctype="multipart/form-data" class="file-upload-form" id="TE-form">
              <input type="text" name="id" id="TE-id" value="<%=uname%>">
                <input type="text" name="name" value="TE"> 
                <input type="file" name="file" id="TE" onchange="handleInputChange()">
          </form>
          <form method="POST" action="FileUpload" enctype="multipart/form-data" class="file-upload-form" id="resume-form">
              <input type="text" name="id" id="re-id" value="<%=uname%>">
                <input type="text" name="name" value="resume"> 
                <input type="file" name="file" id="re" onchange="handleInputChange()">
          </form>
              
               <!-- download forms-->  
           
        </section>
      </section>
    </section>
    <!-- <script src="./lib/bootstrap/js/bootstrap.min.js"></script> -->
    <script src="./lib/jquery/jquery.min.js"></script>
    <!--<script src="./js/mystudents.js"></script>-->
    <script>
        
        function handleUpload(e){
            var input =e.substring(0,2);
            console.log(e.substring(0,2));
            
            $("#"+input).click();
        }
        function handleInputChange(e){
//            var user =;
            $(this).change(function(e){
                $("#"+e.target.id+"-file-name").html(e.target.files[0].name);
//                $("#"+e.target.id+"-id").val(user);
                console.log( $("#"+e.target.id+"-id").val());
                console.log(e.target.files[0].name, e.target.name);
                
            });
          }
        function handleUploadButton(e){
              $("#"+e+"-form").submit();
              // console.log(e);
            }
        function handleView(e){
//            $("#"+e).submit();
            location.href="FileReadPdf?id=<%=uname%>&type="+e;
        }
    </script>
  </body>
</html>

