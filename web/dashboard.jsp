<%-- 
    Document   : dashboard
    Created on : 23 set. 2025, 8:41:47 a. m.
    Author     : Pedro
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<%
    String user = (String) session.getAttribute("user");
    if (user == null) {
        response.sendRedirect("index.jsp");
        return;
    }
%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Gestión de Almacén - Bembos</title>
        <style>
            :root {
                --bembos-blue: #0033a0;
                --bembos-yellow: #ffb400;
                --bembos-red: #e30613;
                --sidebar-width: 200px;
            }
            * {
                margin:0;
                padding:0;
                box-sizing:border-box;
                font-family:Arial,sans-serif;
            }
            body {
                display:flex;
                min-height:100vh;
                background:#fff;
            }
            /* Sidebar */
            .sidebar {
                width:var(--sidebar-width);
                background:#f9f9f9;
                padding-top:180px;
                border-right:1px solid #ddd;
            }
            .sidebar a {
                display: block;
                padding: 12px 5px;
                color: #555;
                text-decoration: none;
            }
            .sidebar a.active {
                background: #bcd3f7;
                color: #2a5ac7;
                text-decoration: none;
            }
            .sidebar ul {
                list-style:none;
            }
            .sidebar li {
                padding:12px 20px;
                cursor:pointer;
                color:#333;
                display:flex;
                align-items:center;
                transition:background 0.3s;
            }
            .sidebar li:hover {
                background:#eee;
            }
            .sidebar i {
                margin-right:10px;
            }

            /* Topbar */
            .topbar {
                position:fixed;
                top:0;
                left:0;                /* 👈 Empieza desde el borde izquierdo */
                width:100%;            /* 👈 Ocupa todo el ancho */
                height:70px;
                background:#f7f8fc;    /* Color base */
                display:flex;
                align-items:center;
                justify-content:space-between; /* Logo izq, usuario der */
                padding:0 20px;
                z-index:1000;
            }
            .topbar::after {
                content:"";
                position:absolute;
                right:0;
                top:0;
                width:85%;
                height:100%;
                background:var(--bembos-blue); /* Azul en el lado derecho */
                z-index:-1;
            }
            .topbar .logo {
                height:50px;
            }
            .topbar .user-img {
                height:65px;
                width:65px;
                border-radius:50%;
                object-fit:cover;
                border:2px solid white;
            }

            /* Ajuste del contenido para no quedar debajo del topbar */
            .content {
                flex:1;
                padding:90px 200px 20px calc(var(--sidebar-width) + 20px);
                text-align:center;
            }

            .content img {
                max-width:380px;
                margin-top:20px;
            }
            h1 {
                color:var(--bembos-blue);
                margin-bottom:10px;
            }
            p {
                color:#555;
                font-size:16px;
            }

            /* Logout */
            .logout {
                position:absolute;
                bottom:20px;
                left:20px;
                font-size:14px;
                color:#666;
            }
            .logout form {
                display:inline;
            }
            .logout button {
                background:none;
                border:none;
                color:#666;
                cursor:pointer;
                text-decoration:underline;
            }
        </style>
    </head>
    <body>
        <!-- Barra superior -->
        <div class="topbar">
            <!-- Logo a la izquierda -->
            <img src="img/logo-bembos.png" alt="Bembos Logo" class="logo">

            <!-- Imagen de usuario a la derecha -->
            <a href="info-usuario.jsp"><img src="img/usuario.jpeg" alt="Usuario" class="user-img"></a>
        </div>

        <!-- Menú lateral -->
        <div class="sidebar">
            <ul>
                <li><i>📦</i><a href="insumos.jsp">Insumos</a></li>
                <li><i>🚚</i><a href="proveedores.jsp">Proveedores</a></li>
                <li><i>📋</i><a href="inventario.jsp">Inventario</a></li>
                <li><i>📊</i><a href="reportes.jsp">Reportes</a></li>
            </ul>
            <div class="logout">
                <form action="logout.jsp" method="post">
                    <button type="submit">Cerrar Sesión</button>
                </form>
            </div>
        </div>

        <!-- Contenido principal -->
        <div class="content">
            <h1><img src="img/logo-bembos.png" alt="Bembos Logo"></h1>
            <p>Sistema de gestión de almacén de Bembos</p>
            <img src="img/bemboos.jpg" alt="Producto Bembos">
        </div>
    </body>
</html>

