<%-- 
    Document   : studentProfile
    Created on : Oct 10, 2019, 7:30:04 PM
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
    <link href="css/profile.css" rel="stylesheet" />

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
        rst = stmt.executeQuery("select * from student inner join cgpa on student.stud_id = cgpa.stud_id where student.stud_id ='"+uname+"'");
        rst.next();
        
    
    }catch(Exception ex){
    System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at studentProfile.jsp");
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
       <div class="profile-head text-center">
           My Profile
       </div>
          
       <form action="updateProfile.jsp" method="POST" id="profile-form">
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
                           <div class="info-value-long " id="first-name-value">
                               <%=rst.getString("first_name")%>
                           </div>
                           <div class="info-input-long" id="first-name-input-div" >
                               <input type="text" class="info-input-block" id="first-name-input" name="first-name" value="<%=rst.getString("first_name")%>" onchange="handleChange('first-name')">
                           </div>
                           <div class="info-edit-icon" value="first-name-edit" onclick="handleEdit('first-name')">
                               <i class="fa fa-edit" id="first-name-edit-icon"></i>
                           </div>
                       </div>
                   </div>
                   <div class="info-block">
                        <div class="row">
                            <div class="info-label-long">
                                Last Name
                            </div>
                            <div class="info-value-long " id="last-name-value" >
                                 <%=rst.getString("last_name")%>
                            </div>
                            <div class="info-input-long" id="last-name-input-div" >
                                <input type="text" class="info-input-block" id="last-name-input" name="last-name" value="<%=rst.getString("last_name")%>" onchange="handleChange('last-name')">
                            </div>
                            <div class="info-edit-icon" value="last-name-edit" onclick="handleEdit('last-name')">
                                <i class="fa fa-edit" id="last-name-edit-icon" ></i>
                            </div>
                        </div>
                    </div>
                    <div class="info-block">
                            <div class="row">
                                <div class="info-label-long">
                                    Date of Birth
                                </div>
                                <div class="info-value-long " id="dob-value">
                                    <%=rst.getString("dob")%>
                                </div>
                                <div class="info-input-long" id="dob-input-div" >
                                    <input type="date" class="info-input-block" id="dob-input" name="dob" value="<%=rst.getString("dob")%>" onchange="handleChange('dob')">
                                </div>
                                <div class="info-edit-icon" value="dob-edit" onclick="handleEdit('dob')">
                                    <i class="fa fa-edit" id="dob-edit-icon"></i>
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
                                            <div class="info-value " id="reg-value">
                                                <%=uname%>
                                            </div>
                                            
                                        </div>
                                    </div>
                                    <div class="info-block-small">
                                         <div class="row">
                                             <div class="info-label">
                                                 Branch
                                                </div>
                                             <div class="info-value " id="branch-value" >
                                                <%=rst.getString("branch")%>
                                             </div>
                                             
                                            </div>
                                     </div>
                                     <div class="info-block-small">
                                             <div class="row">
                                                 <div class="info-label">
                                                     Class
                                                 </div>
                                                 <div class="info-value " id="class-value" value="Ajay Kadam">
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
                                                    <div class="info-value " id="roll-value" value="Ajay Kadam">
                                                         <%=rst.getString("roll_no")%>
                                                    </div>
                                                    
                                                </div>
                                            </div>
                                            <div class="info-block-small">
                                                    <div class="row">
                                                        <div class="info-label">
                                                            Backlog record 
                                                        </div>
                                                        <div class="info-value " id="backlog-value" value="Ajay Kadam">
                                                            <%=rst.getString("backlog").equals("0")?"None" :rst.getString("backlog")%>
                                                        </div>
                                                        
                                                    </div>
                                                </div> 
                                                <div class="info-block-small">
                                                        <div class="row">
                                                            <div class="info-label">
                                                                Diploma Student
                                                            </div>
                                                            <div class="info-value " id="diploma-value" value="Ajay Kadam">
                                                                <%=rst.getString("diploma").equals("0")?"No" :rst.getString("diploma")%>
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
                                                                <div class="info-value " id="overall-value">
                                                                    <%=rst.getString("overall")%>
                                                                </div>
                                                                
                                                            </div>
                                                        </div>
                                                        <div class="info-block-small">
                                                                <div class="row">
                                                                    <div class="info-label">
                                                                        Sem 1
                                                                    </div>
                                                                    <div class="info-value " id="sem1-value">
                                                                        <%=rst.getString("sem1")%>
                                                                    </div>
                                                                    
                                                                </div>
                                                            </div>
                                                            <div class="info-block-small">
                                                                    <div class="row">
                                                                        <div class="info-label">
                                                                            Sem 2
                                                                        </div>
                                                                        <div class="info-value " id="sem2-value">
                                                                            <%=rst.getString("sem2")%>
                                                                        </div>
                                                                        
                                                            
                                                                    </div>
                                                                </div>
                                                                <div class="info-block-small">
                                                                        <div class="row">
                                                                            <div class="info-label">
                                                                                Sem 3
                                                                            </div>
                                                                            <div class="info-value " id="sem3-value">
                                                                                <%=rst.getString("sem3")%>
                                                                            </div>
                                                                            
                                                                        </div>
                                                                    </div>
                                                                    <div class="info-block-small">
                                                                            <div class="row">
                                                                                <div class="info-label">
                                                                                    Sem 4
                                                                                </div>
                                                                                <div class="info-value " id="sem4-value">
                                                                                    <%=rst.getString("sem4")%>
                                                                                </div>
                                                                               
                                                                            </div>
                                                                        </div>
                                                                        <div class="info-block-small">
                                                                                <div class="row">
                                                                                    <div class="info-label">
                                                                                        Sem 5
                                                                                    </div>
                                                                                    <div class="info-value " id="sem5-value">
                                                                                        <%=rst.getString("sem5")%>
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
                                        <div class="info-value-long " id="skill-value">
                                                <%=rst.getString("technical_skills")%>
                                        </div>
                                        <div class="info-input-long" id="skill-input-div" >
                                            <input type="text" class="info-input-block" id="skill-input" name="technical" value="<%=rst.getString("technical_skills")%>" onchange="handleChange('skill')">
                                        </div>
                                        <div class="info-edit-icon" value="skill-edit" onclick="handleEdit('skill')">
                                            <i class="fa fa-edit" id="skill-edit-icon"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-block-long">
                                     <div class="row">
                                         <div class="info-label-long">
                                             Other Skills
                                         </div>
                                         <div class="info-value-long" id="other-skills-value" >
                                               <%=rst.getString("other_tech_skills")%>
                                         </div>
                                         <div class="info-input-long" id="other-skills-input-div" >
                                             <input type="text" class="info-input-block" id="other-skills-input" name="other" value="<%=rst.getString("other_tech_skills")%>" onchange="handleChange('other-skills')">
                                         </div>
                                         <div class="info-edit-icon" value="other-skills-edit" onclick="handleEdit('other-skills')">
                                             <i class="fa fa-edit" id="other-skills-edit-icon"></i>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="info-block-long">
                                         <div class="row">
                                             <div class="info-label-long">
                                                 Non-Technical Skills 
                                             </div>
                                             <div class="info-value-long " id="non-technical-value" value="Ajay Kadam">
                                                  <%=rst.getString("non_technical_skills")%>
                                             </div>
                                             <div class="info-input-long" id="non-technical-input-div" >
                                                 <input type="text" class="info-input-block" id="non-technical-input" name="non-technical" value="<%=rst.getString("non_technical_skills")%>" onchange="handleChange('non-technical')">
                                             </div>
                                             <div class="info-edit-icon" value="non-technical-edit" onclick="handleEdit('non-technical')">
                                                 <i class="fa fa-edit" id="non-technical-edit-icon"></i>
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
                                        <div class="info-value-long " id="email-value">
                                             <%=rst.getString("email")%>
                                        </div>
                                        <div class="info-input-long" id="email-input-div" >
                                            <input type="text" class="info-input-block" id="email-input" value="<%=rst.getString("email")%>" name="email" onchange="handleChange('email')">
                                        </div>
                                        <div class="info-edit-icon" value="email-edit" onclick="handleEdit('email')">
                                            <i class="fa fa-edit" id="email-edit-icon"></i>
                                        </div>
                                    </div>
                                </div>
                                <div class="info-block-long">
                                     <div class="row">
                                         <div class="info-label-long">
                                             LinkedIn profile
                                         </div>
                                         <div class="info-value-long" id="linkedin-value" >
                                                 <%=rst.getString("linkedin")%>
                                         </div>
                                         <div class="info-input-long" id="linkedin-input-div" >
                                             <input type="text" class="info-input-block" id="linkedin-input" value="<%=rst.getString("linkedin")%>" name="linkedin" onchange="handleChange('linkedin')">
                                         </div>
                                         <div class="info-edit-icon" value="linkedin-edit" onclick="handleEdit('linkedin')">
                                             <i class="fa fa-edit" id="linkedin-edit-icon"></i>
                                         </div>
                                     </div>
                                 </div>
                                 <div class="info-block-long">
                                         <div class="row">
                                             <div class="info-label-long">
                                                 Mobile Number
                                             </div>
                                             <div class="info-value-long " id="mobile-value" value="Ajay Kadam">
                                                  <%=rst.getString("mobile")%>
                                             </div>
                                             <div class="info-input-long" id="mobile-input-div" >
                                                 <input type="text" class="info-input-block" id="mobile-input" value="<%=rst.getString("mobile")%>" name="mobile" maxlength="10"onchange="handleChange('mobile')">
                                             </div>
                                             <div class="info-edit-icon" value="mobile-edit" onclick="handleEdit('mobile')">
                                                 <i class="fa fa-edit" id="mobile-edit-icon"></i>
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
    <script src="./js/profile.js"></script>
  </body>
</html>

