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
	 
	<link rel="stylesheet" href="css/editprofile.css"> 

    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="lib/animate/animate.min.css" rel="stylesheet" />

    <link href="css/navigation.css" rel="stylesheet">

    <link href="css/dashboard.css" rel="stylesheet" />
  </head>
   <%
                  
                            ResultSet rst = null;
                            Statement  st = null;
                            String uname=session.getAttribute("uname").toString();
                        try{
                          DBconn db = new DBconn();  
			  Connection con = db.connect();
                          System.out.println("Connected!");
                         
                         st = con.createStatement();
                         rst= st.executeQuery("select * from company where comp_id = '"+uname+"'");
                         rst.next();
                         
                         
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
               <%=rst.getString("comp_name").toString().charAt(0)%>
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
                <div class="menu-btn active">
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
      <!-- SHOW AND HIDE DIV USING DROP DOWN VALUE -->
      	<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.8.3/jquery.min.js"></script>
		<script type="text/javascript">
    	$(function () {
        	$("#EditOption").change(function () {
            	if ($(this).val() == "Package") {
                	$("#dvpackage").show();
                        $("#submit").show();
            	} else {
                	$("#dvpackage").hide();
                        
            	}
            	if ($(this).val() == "Criteria") {
                	$("#dvcriteria").show();
                        $("#submit").show();
            	} else {
                	$("#dvcriteria").hide();
                        
            	}
            	if ($(this).val() == "Skills") {
                	$("#dvskills").show();
                        $("#submit").show();
            	} else {
                	$("#dvskills").hide();
                        
            	}
            	if ($(this).val() == "Activity") {
                	$("#dvactivity").show();
                        $("#submit").show();
            	} else {
                	$("#dvactivity").hide();
                        
            	}
            	if ($(this).val() == "Instructions") {
                	$("#dvinstructions").show();
                        
            	} else {
                	$("#dvinstructions").hide();
                        
            	}
        	});
    	});
</script>
      <!-- PROFILE EDIT STARTS -->
      <form action="edit-process.jsp">
      	<div class="card card-info card-outline elevation-2">
            <div class="card-header elevation-1" style="text-align: center">
            	<small style="font-size: larger; font-weight: 600">Edit Company Information</small>
            </div>
            <div class="card-body">
		 <div class="col-md-12">
                    <div class="row">
                        <div class="col-2"></div>
                        <div class="col-md-8">
                            <div class="form-group">
                                <label class="form-label">Select field that you want edit in below dropdown list <span style="color: red">*</span></label>
                                <select class="form-control" id="EditOption" name="EditOption">
                                	<option value="">-- Select --</option>
                                	<option value="Package">Package</option>
                                	<option value="Criteria">Criteria</option>
                                	<option value="Activity">Activity</option>
                                	<option value="Skills">Skills</option>
                                	<option value="Instructions">Instructions</option>
                                </select>
                            </div>    
                        </div>
                    </div>
                      <div class="col-md-12">
                    <div class="row" id="dvpackage" style="display: none;">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">Current package</label>
                                <div class="input-group mb-3">
                                <input class="form-control" type="text" value="<%=rst.getString("package")%>" disabled="true">
                                <div class="input-group-append">
          				<span class="input-group-text">LPA</span>
  				</div>
                            </div>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">New package</label>
                                <div class="input-group mb-3">
                                <input class="form-control" type="text" name="package" value="<%=rst.getString("package")%>"> 
                                <div class="input-group-append">
                                    <span class="input-group-text">LPA</span>
 				</div>
                            </div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="row" id="dvcriteria" style="display: none;">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">Current criteria</label>
                                <input class="form-control" type="text" value="<%=rst.getString("criteria")%>" disabled="true">
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">New criteria</label>
                                <input class="form-control" type="text" name="criteria" value="<%=rst.getString("criteria")%>">              
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="row" id="dvactivity" style="display: none;">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">Current Activity</label>
                                <textarea class="form-control" type="text" name="" disabled="true"><%=rst.getString("activity")%></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">New Activity</label>
                                <textarea class="form-control" type="text" name="activity" ><%=rst.getString("activity")%></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="row" id="dvskills" style="display: none;">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">Current Skills</label>
                                <textarea class="form-control" type="text" name="" disabled="true" ><%=rst.getString("skills")%></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">New Skills</label>
                                <textarea class="form-control" type="text" name="skills" ><%=rst.getString("skills")%></textarea>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="col-md-12">
                    <div class="row" id="dvinstructions" style="display: none;">
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">Current Instructions</label>
                                <textarea class="form-control" type="text" name="" disabled="true" ><%=rst.getString("instructions")%></textarea>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="form-group">
                                <label class="form-label">New Instructions</label>
                                <textarea class="form-control" type="text" name="instructions" ><%=rst.getString("instructions")%></textarea>
                            </div>
                        </div>
                    </div>
                </div>
                 <div class="col-md-12">
                     <div class="form-group text-center">
                         <button type="submit" class="btn btn-success" id="submit" style="display: none;">Submit</button>
                     </div>
                        </div>
                    </div>            
            </div>
                </div>
                
            </div>
        </div>
                                
      <!-- PROFILE EDIT ENDS -->
      </form>
      </div>
    </section>
     
    <script src="./lib/jquery/jquery.min.js"></script>
    <script src="./js/nav.js"></script>
  </body>
</html>


