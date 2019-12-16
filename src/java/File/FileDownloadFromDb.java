/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package File;

import java.io.IOException;
import java.sql.Connection;
//import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
 
import javax.servlet.ServletException;
import javax.servlet.ServletOutputStream;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import db.DBconn;
 
/**
 * Servlet implementation class GetDetails
 */
@WebServlet("/FileReadPdf")
public class FileDownloadFromDb extends HttpServlet {
    private static final long serialVersionUID = 1L;
        
      protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
         
        String id = request.getParameter("id")!=null?request.getParameter("id"):"NA";
        String type = request.getParameter("type")!=null?request.getParameter("type"):"NA";
         
        ServletOutputStream sos;
        Connection  con=null;
        PreparedStatement pstmt=null;
         
        response.setContentType("application/pdf");
 
        response.setHeader("Content-disposition","inline; filename="+id+".pdf" );
 
 
         sos = response.getOutputStream();
         
 
           try {
//               Class.forName("com.mysql.jdbc.Driver");
//               con = DriverManager.getConnection("jdbc:mysql://localhost:3306/test","root","");
               DBconn db = new DBconn();
               con = db.connect();
          } catch (Exception e) {
                     System.out.println(e);
                     System.exit(0); 
                          }
            
          ResultSet rset=null;
            try {
                pstmt = con.prepareStatement("Select "+type+" from student_uploads where stud_id=?");
                pstmt.setString(1, id.trim());
                rset = pstmt.executeQuery();
                if (rset.next())
                    sos.write(rset.getBytes(""+type+""));
                else
                    return;
                 
            } catch (SQLException e) {
                // TODO Auto-generated catch block
                e.printStackTrace();
            }
     
        sos.flush();
        sos.close();
         
    }
 
    /**
     * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse response)
     */
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        // TODO Auto-generated method stub
    }
 
}