<%-- 
    Document   : validateStudent
    Created on : Oct 22, 2019, 3:13:29 PM
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
    <style>
    .btn-select{
      background: rgb(4, 186, 192);
      color: white;
    }
    .btn-select:hover{
      background:  rgb(214, 114, 0);
      color: white;
    }
    .content-section{
      background: white;
    }
    .div-button{
      width: 25%;
      /*border: 2px solid red;*/
      padding-left: 5vw;
    }
  
  </style>
  </head>
  <%
    String uname = (String) session.getAttribute("uname");
    String id = request.getParameter("id");
    Statement stmt = null, stmt2 = null;
    ResultSet rst = null, rst2 = null;
    int tnp = -1;
    try{
        DBconn db = new DBconn();
        Connection con = db.connect();
        stmt = con.createStatement();
        rst = stmt.executeQuery("select * from student inner join cgpa on student.stud_id = cgpa.stud_id where student.stud_id ='"+id+"'");
        rst.next();
        
        stmt2 = con.createStatement();
        rst2 = stmt2.executeQuery("select name from tnp_admin where tnp_id ='"+uname+"'");
        rst2.next();
        
    }catch(Exception ex){
    System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at validateStudent.jsp");
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
            <button class="btn btn-success" id="validate-profile" onclick="location.href='tnp-admin-validateStudentProfile.jsp?id=<%=id%>'">Validate</button>
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
                <div class="menu-btn ">
                <div class="menu-btn-logo ">
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
</section>
      <section class="content-section">
       <div class="profile-head text-center">
           My Profile
       </div>
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
                               <input type="text" class="info-input-block" id="first-name-input" name="first-name" value="Ajay">
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
                                <input type="text" class="info-input-block" id="last-name-input"name="last-name" value="Kadam">
                            </div>
                            
                        </div>
                    </div>
                    <div class="info-block">
                            <div class="row">
                                <div class="info-label-long">
                                    Date of Birth
                                </div>
                                <div class="info-value-long " id="dob-value" value="Ajay Kadam">
                                    <%=rst.getString("dob")%>
                                </div>
                                <div class="info-input-long" id="dob-input-div" >
                                    <input type="date" class="info-input-block" id="dob-input" name="dob" value="1999-10-25">
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
                                                <%=id%>
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
                                            <input type="text" class="info-input-block" id="skill-input" name="technical" value="Ajay">
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
                                             <input type="text" class="info-input-block" id="other-skills-input" name="other" value="Kadam" >
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
                                                 <input type="text" class="info-input-block" id="non-technical-input" name="non-technical" value="1999-10-25">
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
                                            <input type="text" class="info-input-block" id="email-input" value="Ajay" name="email">
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
                                             <input type="text" class="info-input-block" id="linkedin-input" value="Kadam" name="linkedin" >
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
                                                 <input type="text" class="info-input-block" id="mobile-input" value="1999-10-25" name="mobile" maxlength="10">
                                             </div>
                                            
                                         </div>
                                     </div>
                                     
                                    </div>
                                </div>
                                 </div>
                                 
                                <div class="profile-info-block-long">
                                <div class="profile-info-head">
                                  Uploads
                                </div>
                                <div class="container">
                                    <table class="table table-hover text-center">
                                        <thead class="thead-light underline">
                                            <th>Sr.No.</th>
                                            <th>Document</th>
                                            <th></th>
                                        </thead>
                                        <tbody>
                                            <tr>
                                                <td>1.</td>
                                                <td>FE Marksheet</td>
                                                <td><button class="btn btn-success" onclick="location.href='FileReadPdf?id=<%=id%>&type=FE'">View</button></td>
                                            </tr>
                                             <tr>
                                                <td>2.</td>
                                                <td>SE Marksheet</td>
                                                <td><button class="btn btn-success" onclick="location.href='FileReadPdf?id=<%=id%>&type=SE'">View</button></td>
                                            </tr>
                                             <tr>
                                                <td>3.</td>
                                                <td>TE Marksheet</td>
                                                <td><button class="btn btn-success" onclick="location.href='FileReadPdf?id=<%=id%>&type=TE'">View</button></td>
                                            </tr>
                                             <tr>
                                                <td>4.</td>
                                                <td>Resume</td>
                                                <td><button class="btn btn-success" onclick="location.href='FileReadPdf?id=<%=id%>&type=resume'">View</button></td>
                                            </tr>
                                        </tbody>
                                    </table>
                              </div>
                                </div>
                                 
                        
                    </div>
      </section>
    </section>
   
    <script src="./lib/jquery/jquery.min.js"></script>
    <script src="./js/profile.js"></script>
    <script>
        $(window).ready(function(){
            var val = <%=rst.getString("profile_validate")%>;
            
            if(val === 0)
                $("#validate-profile").prop('disabled',false);
            else if(val === 1)
                $("#validate-profile").prop('disabled',true);
                
        });
    function handleSave() {
        $("#profile-form").submit();
    }
</script>

</body>

</html>

