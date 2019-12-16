/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package File;

import db.DBconn;
import java.lang.Math;
import java.lang.String;
import java.io.FileNotFoundException;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;
import java.sql.Statement;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;



@WebServlet("/AddCompany")
@MultipartConfig
public class AddCompany extends HttpServlet {
 
    private static final long serialVersionUID = 1L;
 
    protected void doPost(HttpServletRequest request,  HttpServletResponse response)throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
 
        final Part filePart = request.getPart("file");
        
        String compName = request.getParameter("comp_name");
        String criteria = request.getParameter("criteria");
        String ctc = request.getParameter("package");
        String date = request.getParameter("date") + " " + request.getParameter("time");
        String about = request.getParameter("about");
        String comp = request.getParameter("check1");
        String it = request.getParameter("check2");
        String entc = request.getParameter("check3");
        String skills = request.getParameter("skills");
        String activity = request.getParameter("activity");
        String instructions = request.getParameter("instructions");
        
        String branch = "";
        if(comp != null)
             branch = branch + "CE";
        if(it != null )
            if(!branch.equals(""))
                branch  += ", IT";
            else
                branch += "IT";
        if(entc != null)
            if(!branch.equals(""))
                branch  += " and EnTC";
            else
                branch += "EnTC";
        
        int rand =(int)(100000 + Math.round(Math.random()*900000));
        String id = "P2K"+date.substring(2,4)+ rand;
        
        InputStream imageFileBytes = null;
        final PrintWriter writer = response.getWriter();
 
        try {
 
          if (filePart == null)
            {
                       writer.println("<br/> Invalid File");
                       return;
            }
 
           else if (filePart.getSize()>1048576 ) { //2mb
               {
              writer.println("<br/> File size too big");
              return;
               }
           }
 
            imageFileBytes = filePart.getInputStream();  // to get the body of the request as binary data
 
            final byte[] bytes = new byte[imageFileBytes.available()];
             imageFileBytes.read(bytes);  //Storing the binary data in bytes array.
 
            Connection  con=null;
             Statement stmt=null;
 
               try {
                    DBconn db = new DBconn();
                    con = db.connect();
                  } catch (Exception e) {
                        System.out.println(e);
                        System.exit(0);
                              }
                int success=0;
                PreparedStatement pstmt = con.prepareStatement("insert into company values(?,?,?,?,?,?,?,?,?,?,?,?)");
                pstmt.setString(1, id);
                pstmt.setString(2, compName);
                pstmt.setBytes(3,bytes);
                pstmt.setString(4, criteria);
                pstmt.setString(5, ctc);
                pstmt.setString(6, about);
                pstmt.setString(7, branch);
                pstmt.setString(8, date);
                pstmt.setString(9, activity);
                pstmt.setString(10, skills);
                pstmt.setString(11, instructions);
                pstmt.setString(12, "123456");
                //Storing binary data in blob field.
                success = pstmt.executeUpdate();
                if(success>=1)  System.out.println("Data Stored");
                 con.close(); 
                 response.sendRedirect("viewCompanies.jsp");
//                 writer.println("<br/> Book Successfully Stored");
 
        } catch (FileNotFoundException fnf) {
            writer.println("You  did not specify a file to upload");
            writer.println("<br/> ERROR: " + fnf.getMessage());
 
        } catch (SQLException e) {
            // TODO Auto-generated catch block
            e.printStackTrace();
        } finally {
 
            if (imageFileBytes != null) {
                imageFileBytes.close();
            }
            if (writer != null) {
                writer.close();
            }
        }
 
    }
 
}