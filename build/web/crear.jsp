<%-- 
    Document   : crear.jsp
    Created on : 19-08-2023, 17:57:21
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
        <title>Nuevo Ingreso</title>
    </head>
    <body>
        <h1>Alumno Nuevo</h1>
        <div class="container mt-5">
            <div class="col-sm">
                <form action="crear.jsp" method="post">
                    <div class="form-group">
                        <label>NOMBRE</label>
                        <input name="nombre" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese su Nombre" required="">
                    </div>
                    <div class="form-group">
                        <label>APELLIDO</label>
                        <input name="apellido" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese su Apellido" required="">
                    </div>
                    <div class="form-group">
                        <label>TELEFONO</label>
                        <input name="telefono" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese su Teléfono" required="">
                    </div>
                    <div class="form-group">
                        <label>CARRERA</label>
                        <input name="carrera" type="text" class="form-control" id="exampleInputEmail1" aria-describedby="emailHelp" placeholder="Ingrese su Carrera" required="">
                    </div>
                    <div class="form-group">
                        <label>CONTRASEÑA</label>
                        <input name="password" type="password" class="form-control" id="exampleInputPassword1" aria-describedby="emailHelp" placeholder="Cree su Contraseña" required="">
                    </div><br>
                        <input type="hidden" name="enviar" value="enviar">
                        <button type="submit" class="btn btn-success">REGISTRAR</button>
                </form>
            </div>            
        </div>
        
        <%
            if (request.getParameter("enviar") !=null){
            String strNombre = request.getParameter("nombre");
            String strApellido = request.getParameter("apellido");
            String strTelefono = request.getParameter("telefono");
            String strCarrera = request.getParameter("carrera");
            String strPassword = request.getParameter("password");
            
            try {
                Connection con = null;
                Statement st = null;
                
                Class.forName("org.postgresql.Driver");
                con = DriverManager.getConnection("jdbc:postgresql://localhost:5432/master_alumnos","postgres","Lira,2320");
                st = con.createStatement();
                st.execute("INSERT INTO public.tbl_alumnos (nombre,apellido,telefono,carrera,password) VALUES ('" + strNombre + "','" + strApellido + "','" + strTelefono + "','" + strCarrera + "','" + strPassword + "')");
                request.getRequestDispatcher("index.jsp").forward(request, response);
            } catch (Exception e){                
            }
            
        }
        %>
    </body>
</html>
