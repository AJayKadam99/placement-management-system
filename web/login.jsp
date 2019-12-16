
<%--<%@include file="sessionCheck.jsp" %>--%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*" %>
<%@page import="db.DBconn"%>
<%
	
//        System.out.println(session.getAttribute("uname").toString());
    try{
//    if(session.getAttribute("uname").toString() != null){
        
    String type=request.getParameter("type");
    String uname=request.getParameter("regId");
    String pass=request.getParameter("pass");
	
    session.setAttribute("userType", type);
    
//    System.out.println("session not set");
   
    DBconn db = new DBconn();
    Connection con = db.connect();
    Statement st = con.createStatement();
    ResultSet rs;
	if(type.equals("student"))
	{
		rs = st.executeQuery("select * from student where stud_id='" + uname + "' and password='" + pass + "'");
	    if (rs.next()) {
	        session.setAttribute("uname", uname);
	        response.sendRedirect("student-dashboard.jsp");
	    }
	    else
    	{
            
    		response.sendRedirect("login.html");
    	}
	}
        else if(type.equals("company"))
	   	{
	   	rs = st.executeQuery("select * from company where comp_id='" + uname + "' and password='" + pass + "'");
	   	
	    	if (rs.next())
	    	{
	    	        session.setAttribute("uname", uname); 
	    	        response.sendRedirect("company-dashboard.jsp");
	    	}
	    	else
	    	{
	    		response.sendRedirect("login.html");
	    	}
	    }
        else if(type.equals("tnp"))
	    	{
		    	rs = st.executeQuery("select * from tnp_admin where tnp_id='"+uname+"'and password='" + pass + "'");
		    	if (rs.next())
		    	{
		    	        session.setAttribute("uname", uname);
		    	        response.sendRedirect("tnp-admin-dashboard.jsp");
		    	}
		    	else
		    	{
		    		response.sendRedirect("login.html");
		    	}
		    	    
	    	}
        else if(type.equals("coordinator"))
	    	{
		    	rs = st.executeQuery("select * from tnp_coordinator where tnp_id='"+uname+"' and password='" + pass + "'");
		    	if (rs.next())
		    	{
		    	        session.setAttribute("uname", uname);
		    	        response.sendRedirect("tnp-coordinator-dashboard.jsp");
		    	}
		    	else
		    	{
		    		response.sendRedirect("login.html");
		    	}
		    	    
	    	}
	    	
	    }
//    else{
//        System.out.println("session already set");
//        response.sendRedirect(session.getAttribute("userType").toString()+"-dashboard.jsp");
//    }
//    }
    catch(Exception ex){
        System.out.println("Exception : "+ex.toString()+"occured");
    }
%>

<!DOCTYPE html>
<html lang="en">
  <head>
    <meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Login</title>

    <link href="css/login.css" rel="stylesheet" />

    <link href="lib/bootstrap/css/bootstrap.css" rel="stylesheet" />

    <link href="lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
  </head>
  <body>
    <div class="container-fluid">
      <section id="mainBody">
        <div class="main row col-lg-6 col-sm-10">
          <section id="signup">
            <div class="logo text-center">
              <i id="user-logo" class="fa fa-user-circle"></i>
            </div>
            <div class="head-text text-center">
              <h3>Sign In</h3>
              Continue to Placements
            </div>
            <div class="login-form">
              <form action="login.jsp" method="get">
                <div class="form-group text-center">
                  <select id="department" class="form-control text-center" name="type">
                    <option>Select Account Type</option>
                    <option value="student">Student</option>
                    <option value="company">Organization</option>
                    <option value="coordinator">TnP Co-ordinator</option>
                    <option value="tnp">TnP Cell</option>
                  </select>
                </div>

                <div class="form-group text-center ">
                  <div class="email">
                    <input
                      type="text"
                      placeholder="Enter Username" name="regId"
                      required
                    />
                  </div>
                </div>
                <div class="form-group text-center">
                  <input type="password" placeholder="Password" name="pass" required />
                  <div class="help">
                    <!--<small class="help-text text-muted"><a href="#">Forgot Password?</a></small>-->
                  </div>
                </div>

                <div class="form-group text-center">
                  <div class="submit">
                    <button type="submit" class="btn btn-primary create1 ">
                      Login
                    </button>
                  </div>
                </div>
              </form>
            </div>
          </section>
        </div>
      </section>
    </div>
  </body>
</html>
