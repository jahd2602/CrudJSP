<%-- 
    Document   : CrearTabla
    Created on : 28/05/2013, 01:45:49 PM
    Author     : Sistemas
--%>

<%@page import="honorio.jairo.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
boolean error = false;
String stackTrace = "";
try {
Conexion.getPedidoDao().crearTabla();
} catch (Exception e){
   stackTrace = e.getMessage();
    error = true;
}
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Crear Tabla</title>
    </head>
    <body>
        <h1><%=(error?"No se pudo crear la tabla":"¡Tabla creada con exito!")%></h1>
         <%=(error?stackTrace:"")%>
    </body>
</html>
