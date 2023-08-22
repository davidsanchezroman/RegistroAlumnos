<%-- 
    Document   : editar
    Created on : 19-08-2023, 17:04:05
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
        <title>Editar Registro</title>
    </head>
    <body>
        <h1>Modificar Registro!</h1><br><!-- comment -->
        <%
            String strID = request.getParameter("id");
            String strNombre = request.getParameter("nombre");
            String strApellido = request.getParameter("apellido");
            String strTelefono = request.getParameter("telefono");
            String strCarrera = request.getParameter("carrera");
            String strPassword = request.getParameter("password");
        %>
        <div class="container mt-5">
            <div class="col-sm">
                <form action="editar.jsp" method="post">
                    <div class="form-group">
                        <label>NOMBRE</label>
                        <input value="<%= strNombre%>" name="nombre" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese su Nombre" required="">
                    </div>
                    <div class="form-group">
                        <label>APELLIDO</label>
                        <input value="<%= strApellido%> " name="apellido" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese su Apellido" required="">
                    </div>
                    <div class="form-group">
                        <label>TELEFONO</label>
                        <input value="<%= strTelefono%> "name="telefono" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese su Teléfono" required="">
                    </div>
                    <div class="form-group">
                        <label>CARRERA</label>
                        <input value="<%= strCarrera%> "name="carrera" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese su Carrera" required="">
                    </div>
                    <div class="form-group">
                        <label>CONTRASEÑA</label>
                        <input value="<%= strPassword%>" name="password" type="text" class="form-control" id="exampleInputPassword1" aria-describedby="emailHelp" placeholder="Cree su Contraseña" required="">
                    </div><br> 
                    <input type="hidden" name="enviar" value="enviar">
                        <button type="submit" class="btn btn-success">ACTUALIZAR</button>
                        <a href="index.jsp" class="btn btn-danger">CANCELAR</a>
                        <input type="hidden" name="id" value="<%= strID%>">
                   
                </form>
            </div>
            
        </div>
        <%
            if (request.getParameter("enviar") != null) {
                try {
                    Connection con = null;
                    Statement st = null;

                    Class.forName("org.postgresql.Driver");
                    con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/master_alumnos","postgres","Lira,2320");
                    st = con.createStatement();
                    st.executeUpdate("UPDATE public.tbl_alumnos SET nombre = '" + strNombre + "', apellido = '" + strApellido + "', telefono = '" + strTelefono + "', carrera = '" + strCarrera + "', password = '" + strPassword + "' WHERE id = '" + strID + "'");
                    request.getRequestDispatcher("index.jsp").forward(request, response);
                } catch (Exception e) {
                    out.print(e);
                }
            }
        %>
                        
        
    </body>
</html>
