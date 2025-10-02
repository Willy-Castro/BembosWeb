<%-- 
    Document   : proveedores
    Created on : 23 set. 2025, 10:03:48 a. m.
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Bembos - Proveedores</title>
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
                background:#f7f8fc;
                min-height:100vh;
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
                display:flex;
                justify-content:space-between;
                align-items:center;
                margin-bottom:20px;
            }
            .header h2 {
                font-size:28px;
                color:#333;
            }
            .controls {
                display:flex;
                gap:10px;
            }
            .controls input {
                padding:8px;
                border:1px solid #ddd;
                border-radius:5px;
            }
            .controls button {
                background:#007bff;
                color:#fff;
                border:none;
                padding:8px 16px;
                border-radius:5px;
                cursor:pointer;
                font-weight:bold;
            }
            .controls button a {
                color:#fff;
                text-decoration:none;
            }

            /* Tabla */
            .table-container {
                background:#fff;
                border-radius:8px;
                box-shadow:0 2px 10px rgba(0,0,0,0.05);
                padding:15px;
            }
            table {
                width:100%;
                border-collapse:collapse;
            }
            thead th {
                text-align:left;
                padding:12px;
                background:#f1f1f1;
                border-bottom:2px solid #ddd;
            }
            tbody td {
                padding:12px;
                border-bottom:1px solid #eee;
            }
            tbody tr:last-child td {
                border-bottom:none;
            }

            /* Botones de acción */
            .actions {
                display:flex;
                gap:5px;
            }
            .actions a, .actions button {
                padding:6px 12px;
                border-radius:5px;
                text-decoration:none;
                font-size:14px;
                border:none;
                cursor:pointer;
            }
            .info {
                background:#f0f0f0;
                color:#333;
            }
            .edit {
                background:#e6f7ff;
                color:#007bff;
            }
            .delete {
                background:#f7e6e6;
                color:#dc3545;
            }
        </style>
    </head>
    <body>

        <!-- Topbar -->
        <div class="topbar">
            <a href="dashboard.jsp">
                <img src="img/logo-bembos.png" alt="Bembos Logo">
            </a>
        </div>

        <!-- Layout -->
        <div class="layout">
            <!-- Sidebar -->
            <div class="sidebar">
                <div>
                    <ul>
                        <li><i>📦</i><a href="insumos.jsp">Insumos</a></li>
                        <li><i>🚚</i><a href="proveedores.jsp">Proveedores</a></li>
                        <li><i>📋</i><a href="inventario.jsp">Inventario</a></li>
                        <li><i>📊</i><a href="reportes.jsp">Reportes</a></li>
                    </ul>
                </div>
                <div class="logout">
                    <form action="logout.jsp" method="post">
                        <button type="submit">Cerrar Sesión</button>
                    </form>
                </div>
            </div>

            <!-- Main Content -->
            <div class="main-content">
                <div class="header">
                    <h2>Gestión de Proveedores</h2>
                    <div class="controls">
                        <button><a href="add-proveeor.jsp">➕ Nuevo Proveedor</a></button>
                        <input type="text" placeholder="Buscar proveedor...">
                    </div>
                </div>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Nombre</th>
                                <th>RUC</th>
                                <th>Acciones</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Ejemplos fijos -->
                            <tr>
                                <td>Pedro Mosquera</td>
                                <td>20123456789</td>
                                <td class="actions">
                                    <a href="info-proveedor.jsp?id=1" class="info">Info</a>
                                    <a href="edi-proveedor.jsp?id=1" class="edit">Editar</a>
                                    <button class="delete">Eliminar</button>
                                </td>
                            </tr>
                            <tr>
                                <td>Distribuidora López</td>
                                <td>20123456789</td>
                                <td class="actions">
                                    <a href="info-proveedor.jsp?id=2" class="info">Info</a>
                                    <a href="edi-proveedor.jsp?id=2" class="edit">Editar</a>
                                    <button class="delete">Eliminar</button>
                                </td>
                            </tr>

                            <!-- Render dinámico -->
                            <c:forEach var="proveedor" items="${listaProveedores}">
                                <tr>
                                    <td>${proveedor.nombre}</td>
                                    <td>${proveedor.ruc}</td>
                                    <td class="actions">
                                        <a href="info-proveedor.jsp?id=${proveedor.id}" class="info">Info</a>
                                        <a href="editar-proveedor.jsp?id=${proveedor.id}" class="edit">Editar</a>
                                        <button class="delete">Eliminar</button>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>

    </body>
</html>

