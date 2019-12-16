<%@ page language="java" contentType="text/html; charset=ISO-8859-1" pageEncoding="ISO-8859-1"%>
<%@ page import="java.sql.*" %>
<%@ page import="java.util.*"%>
<%@page import="db.DBconn" %>

<%
    String uname = (String) session.getAttribute("uname");
    ResultSet rs1 = null, rs2 = null, rs3 = null, rs4 = null, rs5 = null, rs6 = null, rs7 = null, rs8 = null;
    Statement st2 = null, st3 = null, st4 = null, st5 = null, st6 = null, st7 = null, st8 = null;
    String dept_name = null;
    String data_pie[] ={null,null,null};
    String company_names[]=new String[20];
    String data_comp[]=new String[20];
    int data2[] = {0,0,0,0,0,0,0,0,0,0,0,0};

    try{
    DBconn db = new DBconn();
    Connection con = db.connect();
    Statement st = con.createStatement();
    rs1 = st.executeQuery("SELECT branch,count(applied.stud_id) as selected from applied inner join student on applied.stud_id = student.stud_id where status='selected' GROUP by branch");
    rs1.next();
    data_pie[0] = rs1.getString("selected");
    
     st3 = con.createStatement();
    rs3 = st3.executeQuery("SELECT COUNT(stud_id) as placed, Extract(MONTH FROM date) as mon from applied INNER JOIN company on applied.comp_id = company.comp_id where STATUS = 'selected' GROUP by mon");
  
    
    st2 = con.createStatement();
    rs2 = st2.executeQuery("select name from tnp_admin where tnp_id ='"+uname+"'");
    rs2.next();
    
    st4 = con.createStatement();
    rs4 = st4.executeQuery("select distinct count(stud_id) from applied where status = 'selected' ");
    rs4.next();
    
    st5 = con.createStatement();
    rs5 = st5.executeQuery("select count(stud_id) from student");
    rs5.next();
    
    st6 = con.createStatement();
    rs6 = st6.executeQuery("select count(comp_id) from company where date > NOW()");
    rs6.next();
    
    st7 = con.createStatement();
    rs7 = st7.executeQuery("select count(comp_id) from company where date < NOW()");
    rs7.next();
    
    
    st8 = con.createStatement();
    rs8 = st8.executeQuery("SELECT COUNT(stud_id) as placed, comp_name from applied INNER join company on applied.comp_id=company.comp_id where STATUS = 'selected' GROUP by applied.comp_id");
    rs8.next();
    company_names[0] = rs8.getString("comp_name");
    data_comp[0] = rs8.getString("placed");
    
    }catch(Exception ex){
    System.out.print("Ex: "+ ex.toString()+"occured while connecting with db at tnp-dashboard.jsp");
    }
    
    int j=1;
    while(rs1.next()){
        data_pie[j++] = rs1.getString("selected");
    }
    
    while(rs3.next()){
        data2[Integer.parseInt(rs3.getString("mon"))] = Integer.parseInt(rs3.getString("placed")); 
    }
    
    int total = Integer.parseInt(rs5.getString(1));
    int placed = Integer.parseInt(rs4.getString(1));
    
    j=0;
    while(rs8.next()){   
        company_names[++j] = rs8.getString("comp_name");
        data_comp[j] = rs8.getString("placed");  
    }
    
%>
<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <script>
        var data_pie = [0,0,0];
        var data_line = [0,0,0,0,0,0,0,0,0,0,0,0];
        var data_comp = [];
        var comp_name = [];
        <% for(int i=0;i<3;i++){%>
            data_pie[<%=i%>] = <%=data_pie[i]%>;
        <%}%>
            
            
        <% for(int i=0;i<12;i++){%>
            data_line[<%=i%>] = <%=data2[i]%>;
            <%}%>
         
         <% for(int i=0;i<company_names.length;i++){%>
            comp_name[<%=i%>] = "<%=company_names[i]%>";
                data_comp[<%=i%>] = <%=data_comp[i]%>;
         <%}%>
         
            console.log(data_pie, data_line, data_comp, comp_name);
    window.onload = function() {
     new Chart(document.getElementById("pie-chart"), {
    type: 'pie',
    data: {
       
      labels: ["Computer Dept", "IT Dept", "EnTC Dept"],
      datasets: [{
        label: "Population (millions)",
        backgroundColor: ["#3e95cd","#3cba9f","#c45850"],
        data: data_pie
      }]
            
    },
    options: {
      title: {
        display: true,
        text: 'Branch wise placement',
        fontFamily: 'Times New Roman',
        fontSize: 30
      }
    }
});

new Chart(document.getElementById("line-chart"), {
    type: 'line',
    data: {
      labels: ["January", "February", "March", "April", "May", "June", "July", "August", "September", "October", "November", "December"],
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850"],
          data: data_line
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: 'Month wise placement',
        fontFamily: 'Times New Roman',
        fontSize: 30
      }
    }
});
   

   new Chart(document.getElementById("bar-chart"), {
    type: 'bar',
    data: {
      labels: comp_name,
      datasets: [
        {
          label: "Population (millions)",
          backgroundColor: ["#3e95cd", "#8e5ea2","#3cba9f","#e8c3b9","#c45850","#3e54a0"],
          data: data_comp
        }
      ]
    },
    options: {
      legend: { display: false },
      title: {
        display: true,
        text: 'Company wise placements',
        fontFamily: 'Times New Roman',
        fontSize: 30
      }
    }
}); 
};
</script>
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Document</title>
   

    <link href="lib/bootstrap/css/bootstrap.min.css" rel="stylesheet" />

    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />

    <link href="lib/animate/animate.min.css" rel="stylesheet" />

    <link href="css/navigation.css" rel="stylesheet">
    <script src="https://cdnjs.cloudflare.com/ajax/libs/Chart.js/2.5.0/Chart.min.js"></script>
    <link href="css/dashboard.css" rel="stylesheet" />
    <link href="css/tnp.css" rel="stylesheet" />
    <!--<script src="./canvas/canvasjs.min.js"></script>-->
    <script src="./lib/jquery/jquery.min.js"></script>
    <!--<script src="./js/nav.js"></script>-->
  </head>
  <body>
    <nav class="nav navbar">
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
          <!--<button class="btn btn-danger">Logout</button>-->
        </div>
       
        <button class="btn btn-outline-primary" id="mobile-nav-open-btn" onclick="handleMobileNav()" >&#9776;</span>
      </div>
    </nav>
    <section class="side-menu" id="side">
        <div class="col-fluid">
          <div class="user">
            <div class="user-logo text-center">
             <%=rs2.getString("name").toString().charAt(0)%>
            </div>
          </div>
          <div class="menu">
              <div class="menu-item">
                  <div class="menu-btn active">
                    <div class="menu-btn-logo">
                      <i class="fa fa-home"></i>
                    </div>
                    <div class="menu-btn-content" onclick="location.href='tnp-admin-dashboard.jsp?'">
                      Home
                    </div>
                  </div>
                </div>
            <div class="menu-item">
              <div class="menu-btn">
              <div class="menu-btn-logo">
                <i class="fa fa-user-circle"></i>
              </div>
                  <div class="menu-btn-content" onclick="location.href='tnp-viewAllStudents.jsp?'">
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
</section>
    <section id="main">
      <div class="content-section">
        <div class="welcome text-center">
          <h2>Welcome to Placement Portal!</h2>
          <h4>Apply, Face and Get Placed!</h4>
        </div>
        


          <!-- Stats -->
       <section id="stats">
        
        <div class="content-box-md">
  
            <div class="container">
  
                <div class="row">
  
                    <div class="col-md-3 col-sm-3 col-xs-6">
  
                        <!-- Stats Item 01 -->
                        <div class="stats-item profiles text-center" >
                            <i class="fa fa-address-card"></i>
                            <h3 class="counter"><%=rs4.getString(1)%></h3>
                            <p>Placed Students</p>
                        </div>
  
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6">
  
                        <!-- Stats Item 02 -->
                        <div class="stats-item attendance text-center" >
                            <i class="fa fa-bar-chart"></i>
                            <h3 class="counter"><%=total-placed%></h3>
                            <p>Unplaced Students</p>
                        </div>
  
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6">
  
                        <!-- Stats Item 03 -->
                        <div class="stats-item achievements text-center" >
                            <i class="fa fa-trophy"></i>
                            <h3 class="counter"><%=rs6.getString(1)%></h3>
                            <p>Upcoming Companies</p>
                        </div>
  
                    </div>
                    <div class="col-md-3 col-sm-3 col-xs-6">
  
                        <!-- Stats Item 04 -->
                        <div class="stats-item meets text-center" >
                            <i class="fa fa-users"></i>
                            <h3 class="counter"><%=rs7.getString(1)%></h3>
                            <p>Companies Done</p>
                        </div>
  
                    </div>
  
                </div>
  
            </div>
  
        </div>
        
    </section> 
    <div class="container-chart">
        <div class="container">
    <!-- PIE CHART -->
        <div class="row">
          <div class="chart-section"><canvas id="pie-chart" width="350" height="250"></canvas></div>
          <div class="chart-section"><canvas id="line-chart" width="350" height="250"></canvas></div>
        </div>
        <div class="row">
          <div class="chart-section1"><canvas id="bar-chart" width="850" height="250"></canvas></div>
        </div>
        </div>
  </div>
    </section>
  </body>
</html>