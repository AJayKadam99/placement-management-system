<%-- 
    Document   : createProfile
    Created on : Oct 13, 2019, 1:59:57 PM
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
    <link href="css/createProfile.css" rel="stylesheet" />

    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
   
    <link href="lib/animate/animate.min.css" rel="stylesheet" />

    <link href="css/navigation.css" rel="stylesheet">
  </head>
    <% 
    String uname = (String) session.getAttribute("uname");
    Statement stmt = null, stmt2 = null;
    ResultSet rst = null, rst2 = null;
    try{
        DBconn db = new DBconn();
        Connection con = db.connect();
        stmt = con.createStatement();
        rst = stmt.executeQuery("select first_name, last_name, roll_no from student where stud_id ='"+uname+"'");
        rst.next();
        
        
    
    }catch(Exception ex){
    System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at creatProfile.jsp");
    }
  
  %>
  
  <body>
    <nav class="nav navbar bg-light">
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
            <button class="btn btn-success" id="save-profile" disabled onclick="handleSave()">Save</button>
        </div>
        <button class="btn btn-outline-primary" id="mobile-nav-open-btn" onclick="handleMobileNav()" >&#9776;</span>

      </div>
    </nav>
    <section id="main">
      <div class="side-menu" id="side">
        <div class="col-fluid">
          <div class="user">
            <div class="user-logo text-center">
              <%=rst.getString("first_name").toString().charAt(0)%>
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
              <div class="menu-btn active">
              <div class="menu-btn-logo">
                <i class="fa fa-user-circle"></i>
              </div>
              <div class="menu-btn-content" onclick="location.href='studentProfile.jsp'">
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
          <div class="profile-head text-center">
              Create Profile
            </div>
            <form action="createStudentProfile.jsp" method="POST" id="profile-form">
       <div class="personal">
           <div class="profile-icon text-center">
               <i class="fa fa-user-circle"></i>
           </div>
           <div class="profile-info-block">
               <div class="profile-info-head">
                   Personal Info
               </div>
                   <div class="info-block">
                       <div class="row">
                           <div class="info-label-long">
                               First Name
                           </div>
                          
                           <div class="info-input-long" id="first-name-input-div" >
                               <input type="text" class="info-input-block" name="first-name" value="<%=rst.getString("first_name")%>" onchange="handleChange()">
                           </div>
                          
                       </div>
                   </div>
                   <div class="info-block">
                        <div class="row">
                            <div class="info-label-long">
                                Last Name
                            </div>
                            
                            <div class="info-input-long" id="last-name-input-div" >
                                <input type="text" class="info-input-block" id="last-name-input" value="<%=rst.getString("last_name")%>" name="last-name" onchange="handleChange()">
                            </div>
                            
                        </div>
                    </div>
                    <div class="info-block">
                            <div class="row">
                                <div class="info-label-long">
                                    Date of Birth*
                                </div>
                               
                                <div class="info-input-long" id="dob-input-div" >
                                    <input type="date" class="info-input-block" id="dob-input" name="dob" onchange="handleChange()">
                                </div>
                                
                            </div>
                        </div>
                    </div>
                    <div class="row">
                        <div class="profile-info-block-small">
                            <div class="profile-info-head">
                                College Info
                                </div>
                                    <div class="info-block-small">
                                        <div class="row">
                                            <div class="info-label">
                                                Registration Id
                                            </div>
                                            <div class="info-value " id="roll-value">
                                                        <%=uname%>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="info-block-small">
                                         <div class="row">
                                             <div class="info-label">
                                                 Branch
                                                </div>
                                            <div class="info-value " id="roll-value">
                                                        <% String r = rst.getString("roll_no");
                                                              int b = Integer.parseInt(Character.toString(r.charAt(1)));
                                                              String Branch = null;
                                                               if(b==1)
                                                               Branch = "Computer Engineering";
                                                               else if(b==2)
                                                                Branch = "Electronics & telecomunication";
                                                                 else if(b==3)
                                                                Branch = "Information Technology";
                                                                 session.setAttribute("branch", Branch);
                                                                 out.print(Branch);
                                                        %>
                                            </div>
                                             
                                            </div>
                                     </div>
                                     <div class="info-block-small">
                                             <div class="row">
                                                 <div class="info-label">
                                                     Class
                                                 </div>
                                                 <div class="info-value " id="class-value">
                                                    <%
                                                        String Class = null;
                                                        String roll = rst.getString("roll_no");
                                                        switch(roll.charAt(0)){
                                                            case '4':{
                                                                Class = "BE ";
                                                                break;
                                                            }
                                                            case '3':{
                                                                Class = "TE ";
                                                                break;
                                                            }
                                                            case '2':{
                                                                Class = "SE ";
                                                                break;
                                                            }
                                                            case '1':{
                                                                Class = "FE ";
                                                                break;
                                                            } 
                                                        }
                                                        int branch = Integer.parseInt(Character.toString(roll.charAt(1)));
                                                                int div = Integer.parseInt(Character.toString(roll.charAt(2)));
                                                                if(branch == 1)
                                                                Class = Class + Integer.toString(div);
                                                                else if(branch == 2)
                                                                Class = Class + Integer.toString(div+4);
                                                                else if(branch == 3)
                                                                Class = Class + Integer.toString(div+8);
                                                    
                                                     out.print(Class);           
                                                     %>
                                                 </div>
                                                 
                                             </div>
                                         </div>
                                         <div class="info-block-small">
                                                <div class="row">
                                                    <div class="info-label">
                                                        Roll No.
                                                    </div>
                                                    <div class="info-value " id="roll-value">
                                                        <%=rst.getString("roll_no")%>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="info-block-small">
                                                    <div class="row">
                                                        <div class="info-label">
                                                            Backlog record
                                                        </div>
                                                        <div class="info-input " id="backlog-value">

                                                        <select name="backlog" class="form-control">
                                                            <option value="0">No</option>
                                                            <option value="1">Yes</option>
                                                        </select>
                                                                    
                                                        </div>
                                                        
                                                    </div>
                                                </div> 
                                                <div class="info-block-small">
                                                        <div class="row">
                                                            <div class="info-label">
                                                                Diploma Student
                                                            </div>
                                                            <div class="info-input text-center " id="diploma-value">
                                                          <select name="diploma" class="form-control ">
                                                            <option value="0" >No</option>
                                                            <option value="1">Yes</option>
                                                        </select>
                                                            </div>
                                                            
                                                        </div>
                                                    </div> 
                                        </div>
                                        <div class="profile-info-block-small">
                                                <div class="profile-info-head">
                                                    Academic Info
                                                    </div>
                                                        <div class="info-block-small">
                                                            <div class="row">
                                                                <div class="info-label">
                                                                    Overall CGPA
                                                                </div>
                                                                <div class="info-input " id="overall-value">
                                                                    <input type="number" step=".01" value="0" min="0" max="10" name="overall" class="info-input-block" onchange="handleChange()">
                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="info-block-small">
                                                                <div class="row">
                                                                    <div class="info-label">
                                                                        Sem 1
                                                                    </div>
                                                                    <div class="info-input " id="sem1-value">
                                                                            <input type="number" step=".01" value="0" min="0" max="10" name="sem1" class="info-input-block" onchange="handleChange()">
                                                                    </div>
                                                                    
                                                                </div>
                                                            </div>
                                                            <div class="info-block-small">
                                                                    <div class="row">
                                                                        <div class="info-label">
                                                                                Sem 2
                                                                            </div>
                                                                            <div class="info-input " id="sem2-value">
                                                                                    <input type="number" step=".01" value="0" min="0" max="10" name="sem2" class="info-input-block" onchange="handleChange()">
                                                                            </div>
                                                            
                                                                    </div>
                                                                </div>
                                                                <div class="info-block-small">
                                                                        <div class="row">
                                                                            <div class="info-label">
                                                                                Sem 3
                                                                            </div>
                                                                            <div class="info-input " id="sem3-value">
                                                                                    <input type="number" step=".01" value="0" min="0" max="10" name="sem3" class="info-input-block" onchange="handleChange()">
                                                                            </div>
                                                                            
                                                                        </div>
                                                                    </div>
                                                                    <div class="info-block-small">
                                                                            <div class="row">
                                                                                <div class="info-label">
                                                                                    Sem 4
                                                                                </div>
                                                                                <div class="info-input " id="sem4-value">
                                                                                    <input type="number" step=".01" value="0" min="0" max="10" name="sem4" class="info-input-block" onchange="handleChange()">
                                                                                </div>
                                                                               
                                                                            </div>
                                                                        </div>
                                                                        <div class="info-block-small">
                                                                                <div class="row">
                                                                                    <div class="info-label">
                                                                                        Sem 5
                                                                                    </div>
                                                                                    <div class="info-input " id="sem5-value">
                                                                                            <input type="number" step=".01" value="0" min="0" max="10" name="sem5" class="info-input-block" onchange="handleChange()">
                                                                                    </div>
                                                                                   
                                                                                </div>
                                                                            </div>
                                                            </div>
                    </div>
                    <div class="profile-info-block-long">
                            <div class="profile-info-head">
                                Skill-Set
                            </div>
                                <div class="info-block-long">
                                    <div class="row">
                                        <div class="info-label-long">
                                            Top 4 technical skills
                                        </div>
                                       
                                        <div class="info-input-long" id="skill-input-div" >
                                            <input type="text" name="technical" class="info-input-block" id="skill-input"  onchange="handleChange()">
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="info-block-long">
                                     <div class="row">
                                         <div class="info-label-long">
                                             Other Skills
                                         </div>
                                         
                                         <div class="info-input-long" id="other-skills-input-div" >
                                             <input type="text" name="other" class="info-input-block" id="other-skills-input" onchange="handleChange()">
                                         </div>
                                         
                                     </div>
                                 </div>
                                 <div class="info-block-long">
                                         <div class="row">
                                             <div class="info-label-long">
                                                 Non-Technical Skills 
                                             </div>
                                            
                                             <div class="info-input-long" id="non-technical-input-div" >
                                                 <input type="text" name="non-technical" class="info-input-block" id="non-technical-input" onchange="handleChange()">
                                             </div>
                                             
                                         </div>
                                     </div>
                                 </div>
                    <div class="profile-info-block-long">
                            <div class="profile-info-head">
                                Contact Info
                            </div>
                                <div class="info-block-long">
                                    <div class="row">
                                        <div class="info-label-long">
                                            E-mail
                                        </div>
                                        
                                        <div class="info-input-long" id="email-input-div" >
                                            <input type="text" name="email" class="info-input-block" id="email-input" onchange="handleChange()">
                                        </div>
                                        
                                    </div>
                                </div>
                                <div class="info-block-long">
                                     <div class="row">
                                         <div class="info-label-long">
                                             LinkedIn profile
                                         </div>
                                        
                                         <div class="info-input-long" id="linkedin-input-div" >
                                             <input type="text" name="linkedin" class="info-input-block" id="linkedin-input" onchange="handleChange()">
                                         </div>
                                        
                                     </div>
                                 </div>
                                 <div class="info-block-long">
                                         <div class="row">
                                             <div class="info-label-long">
                                                 Mobile Number
                                             </div>
                                            
                                             <div class="info-input-long" id="mobile-input-div" >
                                                 <input type="text" name="mobile" class="info-input-block" maxlength="10" id="mobile-input" onchange="handleChange()">
                                             </div>
                                            
                                         </div>
                                     </div>
                                     
                                    </div>
                                </div>
                                 </div>
                                 <div class="profile-info-block-long text-center">
                                 <div class="profile-info-head">
                                     Please Upload & Check Your Uploaded Documents in My Uploads Section.
                                 </div>
                                </div>
                            </form>
                    </div>
      </section>
    </section>
   
    <script src="./lib/jquery/jquery.min.js"></script>
    <script src="./js/createProfile.js"></script>
    <script>
    function handleSave(){
        $("#profile-form").submit();
    }
    function handleChange() {
    var save = false;
    $("input").each(function(i, obj) {
    if (obj.value.length === 0) {
      save = true;
    }
    });
    $("#save-profile").prop("disabled", save);
    }
    </script>
  </body>
</html>

