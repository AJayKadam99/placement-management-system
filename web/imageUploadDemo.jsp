<%-- 
    Document   : imageUploadDemo
    Created on : Oct 15, 2019, 12:20:42 PM
    Author     : DEEPAK
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <form action="ImageUpload" method="POST" enctype="multipart/form-data">
            <input type="text" name="id">
            <input type="file" name="file">
            <button type="submit">Upload</button> 
        </form>
    </body>
</html>
