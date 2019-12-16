<%-- 
    Document   : downloadImage
    Created on : Oct 15, 2019, 12:38:16 PM
    Author     : DEEPAK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@page import="java.util.*" %>
<%@page import="java.sql.*"%>
<%@page import="db.DBconn" %>
<%@page import="java.io.*" %>

<!DOCTYPE html>

<%

    Blob image = null;
Connection con = null;
byte[ ] imgData = null ;
Statement stmt = null;
ResultSet rs = null; 
OutputStream o = null;
String id = request.getParameter("id");
try {
    DBconn db = new DBconn();
    con = db.connect();
    stmt = con.createStatement();
rs = stmt.executeQuery("select comp_photo from company where comp_id = '"+id+"'");
if (rs.next()) {
image = rs.getBlob(1);
imgData = image.getBytes(1,(int)image.length());
}
else {
out.println("Display Blob Example");
out.println("image not found for given id>");
return;
}
// ?display the image
    response.setContentType("image/jpg");
     o = response.getOutputStream();
o.write(imgData);
o.flush();
o.close();
} catch (Exception e) {
out.println("Unable To Display image");
out.println("Image Display Error=" + e.getMessage());
return;
}finally {
try {
rs.close();
stmt.close();
con.close();
} catch (SQLException e) {
e.printStackTrace();
}
}
%>


