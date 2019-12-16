<%-- 
    Document   : sessioncheck
    Created on : Oct 7, 2019, 2:24:22 PM
    Author     : DEEPAK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>

<% 
    String scheck;
    
    try{
    scheck = (String) session.getAttribute("uname");
    if(scheck == null){
        System.out.print("Not logged in");
        response.sendRedirect("login.jsp");
        return;
    }
    }catch(Exception ex){
        System.out.print("Exception in session check"+ ex.toString());
    }   
    
%>
