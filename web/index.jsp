<%-- 
    Document   : index
    Created on : 17-08-2023, 17:22:27
    Author     : ateoa
--%>

<%@page import="java.sql.*"%>
<%@page import="org.postgresql.Driver"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.3/dist/css/bootstrap.min.css" integrity="sha384-rbsA2VBKQhggwzxH7pPCaAqO46MgnOM80zW1RWuH61DGLwZJEdK2Kadq2F9CUG65" crossorigin="anonymous">
        <script src="https://kit.fontawesome.com/513bd683e0.js" crossorigin="anonymous"></script>
        <title>Registro Alumnos</title>
    </head>
    <body class="p-3 mb-2 bg-light text-dark">
        <%
        Connection con = null;
        Statement st = null;
        ResultSet rs = null;
        %>
        <div class="container mt-5">
            <div class="row">
                <div class="col-sm">
        <br>
        
        <table style="margin:0 20px; "class="table table-striped">      
          
  <thead>
    <tr>
        <th scope="col" colspan="4" class="text-center">ALUMNO</th>
        <th scope="col">
        <a href="crear.jsp"><i class="fa-solid fa-user-plus""> Nuevo</i></a>
        </th>
    </tr>
    <tr>
      <th scope="col">ID</th>
      <th scope="col">NOMBRE</th>
      <th scope="col">APELLIDO</th>
      <th scope="col">TELEFONO</th>
      <th scope="col">CARRERA</th>
      <th scope="col">CONTRASEÑA</th>
      <th scope="col">ACCIONES</th>
      </tr>
  </thead>
  <tbody>
      <%
      Class.forName("org.postgresql.Driver");
     con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/master_alumnos","postgres","Lira,2320");
     st = con.createStatement();
     rs = st.executeQuery("SELECT * FROM public.tbl_alumnos");
     while (rs.next()){
         %>
         
    <tr>
        <th scope="row"><%= rs.getInt("id") %></th>
        <td><%= rs.getString("nombre") %></td>
        <td><%= rs.getString("apellido") %></td>
        <td><%= rs.getString("telefono") %></td>        
        <td><%= rs.getString("carrera") %></td>
        <td><%= rs.getString("password") %></td>
        <td>
            <a href="editar.jsp?id=<%= rs.getInt("id")%>&nombre=<%= rs.getString("nombre")%>&apellido=<%= rs.getString("apellido")%>&telefono=<%= rs.getString("telefono")%>&carrera=<%= rs.getString("carrera")%>&password=<%= rs.getString("password")%>>"<i class="fa fa-pencil-alt"></i> Editar</a>
            <a href="borrar.jsp?id=<%= rs.getInt("id")%>"><i class="fa fa-trash-alt"></i> Eliminar</a>          
        </td>
      
    </tr>
    <% }
    %>

      
   
   </tbody>
</table>
            </div>
        </div>
      </div>  
        
    </body>
</html>
