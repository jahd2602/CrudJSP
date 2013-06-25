<%-- 
    Document   : insertar
    Created on : 04/06/2013, 11:48:00 AM
    Author     : Sistemas
--%>

<%@page import="honorio.jairo.Conexion"%>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%
    boolean error = false;
    String stackTrace = "";
    int idActual = 0;
    try {
        idActual = Conexion.getPedidoDao().cantidad();
        idActual++;
    } catch (Exception e) {
        stackTrace = e.getMessage();
        error = true;
    }
%>
<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml">
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8"/>
        <title>Insertar</title>
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
            <h1><a>Insertar Registro</a></h1>
            <form id="form_643631" class="appnitro"  method="get" action="insertar.jsp">
                <div class="form_description">
                    <h2>Insertar Registro</h2>
                    <p>ALUMNO: Jairo Honorio</p>
                </div>						
                <ul >

                    <li id="li_1" >
                        <label class="description" for="element_1">Id </label>
                        <div>
                            <input id="element_1" disabled class="element text medium" type="text" maxlength="255" value="<%=idActual%>"/> 
                        </div> 
                    </li>		<li id="li_2" >
                        <label class="description" for="element_2">Nombre del Titular </label>
                        <div>
                            <input id="element_2" name="nombre" class="element text medium" type="text" maxlength="255" value=""/> 
                        </div> 
                    </li>		<li id="li_3" >
                        <label class="description" for="element_3">Pedido </label>
                        <div>
                            <input id="element_3" name="pedido" class="element text medium" type="text" maxlength="255" value=""/> 
                        </div> 
                    </li>		<li id="li_4" >
                        <label class="description" for="element_4">Fecha </label>
                        <div>
                            <input id="element_4" name="fecha" class="element text medium" type="text" maxlength="255" value=""/> 
                        </div> 
                    </li>

                    <li class="buttons">
                        <input type="hidden" name="form_id" value="643631" />

                        <input id="saveForm" class="button_text" type="submit" name="submit" value="Insertar" />
                        <a href="/Lab008Tra3/">Volver</a>
                    </li>
                </ul>
            </form>	
                        
            <%}%>
            <div id="footer">
                Alumno: <a href="http://www.jahdes.blogspot.com">Jairo Honorio</a>
            </div>
        </div>
        <img id="bottom" src="form/bottom.png" alt=""/>
    </body>
</html>