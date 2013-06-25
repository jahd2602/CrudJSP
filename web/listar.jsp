<%-- 
    Document   : listar
    Created on : 04/06/2013, 12:46:13 PM
    Author     : Sistemas
--%>

<%@page import="java.util.ArrayList"%>
<%@page import="honorio.jairo.Pedido"%>
<%@page import="honorio.jairo.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean error = false;
    String stackTrace = "";
    ArrayList<Pedido> pedidos = null;
    try {
        pedidos = Conexion.getPedidoDao().listarTodos();
    } catch (Exception e) {
        stackTrace = e.getMessage();
        error = true;
    }
%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Listar</title>
        <link rel="stylesheet" type="text/css" href="form/view.css" media="all"/>
        <script type="text/javascript" src="form/view.js"></script>

    </head>
    <body id="main_body" >

        <img id="top" src="form/top.png" alt=""/>
        <div id="form_container">
            <%if (error) {%>
            <div class="form_description">
                <h2>No se pudo conectar a la base de datos</h2>
            </div>
            <%=(stackTrace)%>
            <%} else {%>
            <div class="form_description">
                <h2>Lista de Datos</h2>
            </div>
            <center>
                <table border="1">
                    <thead>
                        <tr>
                            <td><b>Nombre del Titular</b></td>
                            <td><b>Pedido</b></td>
                            <td><b>Fecha</b></td>
                        </tr>
                    </thead>
                    <tbody>
                        <%if (pedidos!=null){
                        for (Pedido p : pedidos) {%>
<tr>
                            <td><%=p.getNombreTitular()%></td>
                            <td><%=p.getPedido()%></td>
                            <td><%=p.getFechaCompra()%></td>
                        </tr>
                        <%}}%>
                    </tbody>
                </table>
            </center>
            <%}%>
        </div>
    </body>
</html>
