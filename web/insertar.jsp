<%-- 
    Document   : insertar
    Created on : 04/06/2013, 12:11:47 PM
    Author     : Sistemas
--%>

<%@page import="honorio.jairo.Pedido"%>
<%@page import="honorio.jairo.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean error = false;
    String stackTrace = "";
    String nombreTitular = request.getParameter("nombre");
    String pedido = request.getParameter("pedido");
    String fechaCompra = request.getParameter("fecha");
    Pedido nuevo = new Pedido(nombreTitular, pedido, fechaCompra);
    try {
        Conexion.getPedidoDao().insertar(nuevo);
    } catch (Exception e) {
        stackTrace = e.getMessage();
        error = true;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Insertar Pedido</title>
    </head>
    <body>
         <h1><%=(error?"No se pudo insertar pedido":"¡Pedido insertado con exito!")%></h1>
         <%=(error?stackTrace:"")%>
         <div>
         <a href="/Lab008Tra3/insertarForm.jsp">Volver</a>
         </div>
    </body>
</html>
