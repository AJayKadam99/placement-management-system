<%-- 
    Document   : addCompany
    Created on : Oct 22, 2019, 4:35:19 PM
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
    <link href="lib/animate/animate.min.css" rel="stylesheet" />
    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
    <link href="css/navigation.css" rel="stylesheet">
    <link rel="stylesheet" type="text/css" href="css/cform.css">
    <link href="css/dashboard.css" rel="stylesheet" />	
    </head>
    <% Statement stmt = null, stmt2=null;
      ResultSet rst = null, rst2=null;
      String uname = (String) session.getAttribute("uname");
      
      try{
       DBconn db = new DBconn();
       Connection con = db.connect();

         stmt = con.createStatement();
         rst = stmt.executeQuery("select name from tnp_coordinator where tnp_id ='"+uname+"'");
         rst.next();
         
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
          Placement Management<br />System
        </div>
      </div>
      <div class="right-part">
        <div class="nav-item">
            <!--<button class="btn btn-success">Validate</button>-->
        </div>
        <button class="btn btn-outline-primary" id="mobile-nav-open-btn" onclick="handleMobileNav()" >&#9776;</span>

      </div>
    </nav>
   
    <section id="main">
         <div class="side-menu" id="side">
        <div class="col-fluid">
          <div class="user">
            <div class="user-logo text-center">
               <%=rst.getString(1).toString().charAt(0)%>
            </div>
          </div>
          <div class="menu">
              <div class="menu-item">
                  <div class="menu-btn">
                    <div class="menu-btn-logo">
                      <i class="fa fa-home"></i>
                    </div>
                    <div class="menu-btn-content">
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
                  <div class="menu-btn active">
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
</div>
      <div class="content-section">
        
       
        <table id="formtitle" class="table table-borderless text-center">
            <thead>
                <th><h2>
                	Add a New Company
                </h2></th>
            </thead>
        </table>
        
        <div class="container-feedback">
        	<div class="container-fluid">
                    <form action="AddCompany" method="POST" enctype="multipart/form-data">
	       			<div class="form-group">
	       				<div class="row">
        					<div class="col">
        						<label class="form-label">Company name: </label>
                                                        <input class="form-control" type="text" name="comp_name" onchange="handleChange()"/>
        					</div>
        					<div class="col">
        						<label class="form-label">Upload company logo: </label>
        						<div class="input-group">
                                                            <div class="custom-file">
                                                                <input type="file" class="custom-file-input"  id="customFile" name="file" onchange="handleFile()">
  								<label class="custom-file-label" for="customFile" style="width: 28vw;">Choose file</label>			
                                                            </div>
							</div>
        					</div>
        				</div>
        			</div>
        			
        			<div class="form-group">
        				<div class="row">
        					<div class="col">
        						<label class="form-label">Minimum SGPA: </label>
                                                        <input class="form-control" type="number" step=".01" onchange="handleChange()" name="criteria"/>
        					</div>
        					<div class="col">
        						<label class="form-label">Package offered: </label>
        						<div class="input-group mb-3">
        							<input class="form-control" type="number" onchange="handleChange()" name="package"/>
        							<div class="input-group-append">
    									<span class="input-group-text">LPA</span>
  									</div>
  								</div>
        					</div>
        					<div class="col">
        						<label class="form-label">Visit date and time of company: </label>
                                                        <div class="row">
                                                            <input class="form-control" type="date" name="date" style="width: 12vw" onchange="handleChange()"/>
                                                        <input class="form-control" type="time" name="time" style="width: 12vw; margin-left: 0.5vw" onchange="handleChange()"/>
                                                        </div>
                                                </div>        
        			</div>
        			<div class="form-group">
        				<label class="form-label">About the company: </label>
        				<textarea class="form-control" name="about" onchange="handleChange()" required/></textarea>
        			</div>
        			<label class="form-label">Students from which branch are eligible:</label>
  					<div class="form-group">
  						<div class="checkbox">
                                                    <label><input type="checkbox" value="Computer" name="check1" >Computer Engineering</label>
						</div>
						<div class="checkbox">
                                                    <label><input type="checkbox" value="IT" name="check2" >Information Technology</label>
						</div>
						<div class="checkbox disabled">
  							<label><input type="checkbox" value="EnTC" name="check3">Electronics and Telecommunication</label>
						</div>
					</div>
  					<div class="form-group">
        				<label class="form-label">Skills required: </label>
        				<textarea class="form-control" name="skills" onchange="handleChange()" required/></textarea>
        			</div>
        			<div class="form-group">
        				<label class="form-label">Activities to be conducted: </label>
        				<textarea class="form-control" name="activity" onchange="handleChange()" required/></textarea>
        			</div>
        			<div class="form-group">
        				<label class="form-label">Instructions and note: </label>
        				<textarea class="form-control" name="instructions" onchange="handleChange()" required/></textarea>
        			</div>
                                <div class="form-group">
                                    <div class="text-center">
                                        <button type="submit" class="btn btn-success" id="submit-btn" disabled>Submit</button>
                                </div>
                                </div>
        		</div>
                    </form>
        	</div>
        </div>   
    </section>
    
    <script src="./lib/jquery/jquery.min.js"></script>
    <script>
       var save1 = false;
       var save2 = false;
      function handleFile(){
        save1 = true;  
        $(".custom-file-label").html($("#customFile").val().split("\\").pop().substring(0, 40));      
      }
      function handleChange(){
          $('input').each(function(i, obj){
              if(obj.value.length===0){
               save2 = true;   
              }
          });
          if(save1 && save2){
                $("#submit-btn").prop("disabled", false);
            }else{
                $("#submit-btn").prop("disabled", true);
            }
      }
</script>
  </body>
</html>



