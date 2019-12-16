<%@ page language="java" contentType="text/html; charset=ISO-8859-1"
    pageEncoding="ISO-8859-1"%>
     <%@page import="java.sql.*" %>
     <%@page import="db.DBconn"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>Insert title here</title>
</head>
<body>
	<%
	String uname= session.getAttribute("uname").toString();
	String type=request.getParameter("EditOption");%>
	<input type="text" value="<%=type%>">
	<%
	
	try{
            DBconn db = new DBconn();  
            Connection con = db.connect();
	 System.out.println("Connected!");
	    Statement st = con.createStatement();
	    ResultSet rs;
	    rs = st.executeQuery("select * from company where comp_id = '"+uname+"'");
		if(rs.next()){
			if(type.equals("Package")){
                                String uvalue=request.getParameter("package"); 
				int rs1=st.executeUpdate("update company set Package='"+uvalue+"' where comp_id='"+uname+"' ");
				response.sendRedirect("company-profile.jsp");
			}
			else if(type.equals("Criteria")){
                            String uvalue=request.getParameter("criteria"); 
				int rs1=st.executeUpdate("update company set criteria='"+uvalue+"' where comp_id='"+uname+"' ");
				response.sendRedirect("company-profile.jsp");
			}
			else if(type.equals("Activity")){
                            String uvalue=request.getParameter("activity"); 
				int rs1=st.executeUpdate("update company set activity='"+uvalue+"' where comp_id='"+uname+"' ");
				response.sendRedirect("company-profile.jsp");
			}
			else if(type.equals("Skills")){
                            String uvalue=request.getParameter("skills"); 
				int rs1=st.executeUpdate("update company set Skills='"+uvalue+"' where comp_id='"+uname+"' ");
				response.sendRedirect("company-profile.jsp");
			}
			else if(type.equals("Instructions")){
                            String uvalue=request.getParameter("instructions"); 
				int rs1=st.executeUpdate("update company set Instructions='"+uvalue+"' where comp_id='"+uname+"' ");
				response.sendRedirect("company-profile.jsp");
			}
			else{
				session.setAttribute("msg","PLEASE SELECT VALID OPTION TO UPDATE");
	 		}
		}con.close();
	} catch (Exception e) {
e.printStackTrace();
} %>
</body>
</html>