<%-- 
    Document   : student-dashboard
    Created on : Oct 2, 2019, 8:01:12 PM
    Author     : DEEPAK
--%>
<%@include file="sessionCheck.jsp" %>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.util.*"%>
<%@page import="java.text.ParseException"%>
<%@page import="java.text.SimpleDateFormat"%>
<%@page import="db.DBconn"%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
   

    <link href="lib/bootstrap/css/bootstrap.css" rel="stylesheet" />

    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="lib/animate/animate.min.css" rel="stylesheet" />

    <link href="css/navigation.css" rel="stylesheet">

    <link href="css/dashboard.css" rel="stylesheet" />
    
  </head>

  <body>
    <%
    
     String uname = (String) session.getAttribute("uname");
     Statement stmt = null, stmt2 = null;
     ResultSet rst = null, rst2 = null;
     try{
     DBconn db = new DBconn();
     Connection con = db.connect();
     stmt = con.createStatement();
     rst = stmt.executeQuery("select * from company");
     rst.next();
     
     stmt2 = con.createStatement();
     rst2 = stmt2.executeQuery("select first_name, overall from student inner join cgpa on student.stud_id=cgpa.stud_id where student.stud_id ='"+uname+"'");
     rst2.next();
     }
     catch(Exception ex){
     System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at login.jsp");
     } 
  %>
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
          <!--<button class="btn btn-danger">Logout</button>-->
        </div>
       
        <button class="btn btn-outline-primary" id="mobile-nav-open-btn" onclick="handleMobileNav()"b  >&#9776;</span>
      </div>
    </nav>
    <section class="side-menu" id="side">
        <div class="col-fluid">
          <div class="user">
            <div class="user-logo text-center">
              <%=rst2.getString(1).toString().charAt(0)%>
            </div>
          </div>
          <div class="menu">
              <div class="menu-item">
                  <div class="menu-btn active">
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
</section>
    <section id="main">
      <div class="content-section">
        <div class="welcome text-center">
            <div class="welcome-head">Welcome to Placement Portal!</div>
            Apply, Face and Get Placed!
        </div>
        
       
        <table id="upcoming" class="table table-borderless text-center">
            <thead>
                <th>Upcoming Companies</th>
            </thead>
        </table>
        
            <table class="table table-borderless">
                <tbody>
                    <% do{%>
                    <tr>
                        <td>
                            <div class="company-block">
                                <div class="col">
                                    <div class="row upper-block">
                                        <div class="company-img ">
                                            <img src="downloadImage.jsp?id=<%=rst.getString("comp_id")%>" class="company-logo">
                                        </div>
                                        <div class="company-name text-center">
                                            <%=rst.getString("comp_name")%>
                                        </div>
                                    </div>
                                    <div class="row lower-block">
                                        <div class="info-block text-center">
                                            <div class="info-block-head">
                                                Date
                                            </div>
                                            <div class="info-block-content">
                                            <% String dateString = rst.getString("date");
                                                Date date = new SimpleDateFormat("yyyy-M-d").parse(dateString);

                                                // Then get the day of week from the Date based on specific locale.
                                                String dayOfWeek = new SimpleDateFormat("EEEE", Locale.ENGLISH).format(date);
                                                
                                                out.print(dayOfWeek);
                                            %> 
                                            
                                            <%=dateString.substring(0, 10)%>
                                            <br>
                                            <%=dateString.substring(10,16)%> AM
                                            </div>
                                        </div>
                                        <div class="info-block text-center">
                                             <div class="info-block-head">CTC</div>
                                           <div class="info-block-content">
                                               <%=rst.getString("package")%> LPA
                                           </div>
                                           </div>
                                        <div class="info-block text-center">
                                            <div class="info-block-head">Branch</div>
                                          <div class="info-block-content">
                                              <%=rst.getString("branch")%> 
                                          </div>
                                          </div>
                                        <div class="info-block text-center">
                                            <div class="info-block-head">Criteria</div>
                                          <div class="info-block-content"> 
                                              <%=rst.getString("criteria")%> CGPA
                                          </div>
                                          </div>
                                        <div class="info-block text-center">
                                            <button class="btn btn-primary view-btn" onclick="location.href='companyView.jsp?id=<%=rst.getString("comp_id")%>'">View</button>
                                            <div>
                                                <small class="help-text text-muted view-btn-text"></small>
                                            </div>
                                        </div>
                                    </div>
    
                                </div>
                            </div>
                        </td>
                    </tr>
                    <% }while(rst.next());%>
                </tbody>
            </table>
      </div>
    </section>
    <script src="./lib/jquery/jquery.min.js"></script>
   
    <script>
         $(document).ready(function(){
            

           var profileCompleted = <%=rst2.getString("overall")%>;
           
            console.log(profileCompleted);    
            if(profileCompleted === null){
                console.log(profileCompleted); 
                $(".view-btn").prop('disabled',true);
                $(".view-btn-text").html("Please complete your profile before applying for any company");
            }
//    if(grade-criteria>=0){
//          if(applied){
//            $("#apply").prop("disabled", true);
//            $("#applied").html("You have already applied for this company!");
//          }else{
//              $("#apply").prop("disabled", false);
//          }
//        } else{
//             $("#apply").prop("disabled", true);
//             $("#applied").html("Your criteria doesn't match for this company.<br> Please try for other companies");
//        }   
            });
    </script>
  </body>
</html>



