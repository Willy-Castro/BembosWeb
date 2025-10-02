<%-- 
    Document   : inventario
    Created on : 23 set. 2025, 10:10:36 a. m.
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bembos - Inventario</title>
        <link rel="stylesheet" href="css/style.css">
        <style>
            :root {
                --bembos-blue: #0033a0;
                --bembos-yellow: #ffb400;
                --bembos-red: #e30613;
                --sidebar-width: 200px;
            }
            * {
                margin: 0;
                padding: 0;
                box-sizing: border-box;
                font-family: Arial, sans-serif;
            }
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                background-color: #f4f7f9;
            }
            /* Contenedor principal */
            .layout {
                margin-top: 80px; /* solo asegura el espacio de la topbar */
            }

            /* Sidebar */
            .sidebar a {
                display: block;
                padding: 12px 5px;
                color: #555;
                text-decoration: none; /* 🔹 Quita el subrayado */
            }
            .sidebar a.active {
                background: #bcd3f7;
                color: #2a5ac7;
                text-decoration: none; /* 🔹 Asegura que tampoco aparezca aquí */
            }

            /* Sidebar fijo */
            .sidebar {
                position: fixed;
                top: 160px; /* debajo de la topbar */
                left: 0;
                width: var(--sidebar-width);
                height: calc(100% - 80px); /* ocupa toda la altura menos la topbar */
                background: #f9f9f9;
                border-right: 1px solid #ddd;
                padding-top: 20px;
                overflow-y: auto; /* si hay muchos ítems, se desplaza dentro */
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
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 80px;
                background: #f7f8fc;
                display: flex;
                align-items: center;
                padding: 0 20px;
                z-index: 1;
                overflow: hidden;

            }

            .topbar::after {
                content: "";
                position: absolute;
                right: 0;
                top: 0;
                width: 85.45%;
                height: 100%;
                background: var(--bembos-blue);
                z-index: -1;
            }

            .topbar img {
                height: 50px;
                z-index: 2; /* Para que el logo esté por encima del pseudo-elemento */
            }
            /* Logout */
            .logout {
                position:absolute;
                bottom:20px;
                left:20px;
                font-size:14px;
                color:#666;
                top:525px;
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

            /* Contenido principal con margen */
            .main-content {
                margin-left: var(--sidebar-width); /* deja espacio para el sidebar */
                padding: 20px;
                padding-top: 110px; /* espacio por la topbar */
                flex-grow: 1;
            }
            .header {
                display: flex;
                justify-content: space-between;
                align-items: center;
                margin-bottom: 20px;
            }
            .header h2 {
                font-size: 28px;
                color: #333;
            }
            .controls button {
                background-color: #007bff;
                color: white;
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
            }
            .controls input[type="text"] {
                padding: 10px;
                border: 1px solid #ddd;
                border-radius: 5px;
            }
            .pagination-controls {
                margin-bottom: 10px;
                color: #555;
                font-size: 14px;
            }
            .table-container {
                background-color: white;
                border-radius: 8px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.05);
                overflow: hidden;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            thead th {
                text-align: left;
                padding: 15px;
                background-color: #f8f9fa;
                border-bottom: 1px solid #ddd;
            }
            tbody td {
                padding: 15px;
                border-bottom: 1px solid #eee;
            }
            tbody tr:last-child td {
                border-bottom: none;
            }
            .delivery-date {
                background-color: #e9f5e9;
                color: #1e8749;
                border-radius: 4px;
                padding: 5px 10px;
                display: inline-block;
            }


        </style>
    </head>
    <body>
        <!-- Barra superior -->
        <div class="topbar">
            <a href="dashboard.jsp">
                <img src="img/logo-bembos.png" alt="Bembos Logo">
            </a>
        </div>

        <!-- Contenedor flex para sidebar y contenido -->
        <div class="layout">
            <!-- Sidebar -->
            <div class="sidebar">
                <ul>
                    <li><i>📦</i><a href="insumos.jsp">Insumos</a></li>
                    <li><i>🚚</i><a href="proveedores.jsp">Proveedores</a></li>
                    <li><i>📋</i><a href="inventario.jsp">Inventario</a></li>
                    <li><i>📊</i><a href="reportes.jsp">Reportes</a></li>
                </ul>
                <div class="logout" style="padding:20px;">
                    <form action="logout.jsp" method="post">
                        <button type="submit">Cerrar Sesión</button>
                    </form>
                </div>
            </div>

            <!-- Contenido principal -->
            <div class="main-content">
                <div class="header">
                    <h2>Inventario en existencia</h2>
                    <div class="controls">
                        <input type="text" placeholder="Buscar:">
                    </div>
                </div>

                <div class="pagination-controls">
                    <span>Mostrar 5 filas por página</span>
                </div>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Insumo</th>
                                <th>Cantidad</th>
                                <th>Fecha de recepcion</th>
                                <th>Fecha de vencimiento</th>
                                <th>Codigo Lote</th>
                            </tr>
                        </thead>
                        <tbody>
                            <c:forEach var="item" items="${listaInventario}">
                                <tr>
                                    <td>${item.insumo}</td>
                                    <td>${item.cantidad}</td>
                                    <td>${item.fechaRecepcion}</td>
                                    <td>${item.fechaVencimiento}</td>
                                    <td>${item.codigoLote}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </body>
</html>
