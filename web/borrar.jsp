<%-- 
    Document   : borrar
    Created on : 20-08-2023, 18:58:51
    Author     : ateoa
--%>

<%@page import="java.sql.*"%>
<%@page import="org.postgresql.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
 
  String id = request.getParameter("id");
  
try {
                Connection con = null;
                Statement st = null;
                
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/master_alumnos","postgres","Lira,2320");
                st = con.createStatement();
                st.executeUpdate("DELETE FROM public.tbl_alumnos WHERE id = '" + id + "'");
               
                st.close();
                con.close();
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e){                
            }
  
  %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>
