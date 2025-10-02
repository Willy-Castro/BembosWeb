<%-- 
    Document   : insumos
    Created on : 23 set. 2025, 10:14:25 a. m.
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>

<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Bembos - Insumos</title>
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
                background: #f7f8fc;
                min-height: 100vh;
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
            .header .controls {
                display:flex;
                gap:10px;
            }
            .header input[type="text"] {
                padding:8px;
                border:1px solid #ddd;
                border-radius:5px;
            }
            .header button {
                background:#007bff;
                color:#fff;
                border:none;
                padding:8px 16px;
                border-radius:5px;
                cursor:pointer;
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

            .sanitary-cert {
                background:#e9f5e9;
                color:#1e8749;
                text-align:center;
                border-radius:4px;
            }

            /* Botones de acción */
            .actions a {
                padding:6px 12px;
                border-radius:5px;
                text-decoration:none;
                font-size:14px;
            }
            .edit {
                background:#e6f7ff;
                color:#007bff;
            }
            .delete {
                background:#f7e6e6;
                color:#dc3545;
            }
            .add-btn {
                display:inline-block;
                margin-top:15px;
                background:#e6f7ff;
                color:#007bff;
                padding:10px 20px;
                border-radius:5px;
                text-decoration:none;
                font-weight:bold;
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
                    <h2>Gestión de Insumos</h2>
                    <div class="controls">
                        <input type="text" placeholder="Buscar insumo...">
                        <button>Buscar</button>
                    </div>
                </div>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Insumo</th>
                                <th>Proveedor</th>
                                <th>Botones de acción</th>
                            </tr>
                        </thead>
                        <tbody>
                            <!-- Insumos importantes -->
                            <tr>
                                <td>Carne de res</td>
                                <td>Proveedor A</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L001" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L001" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Pollo</td>
                                <td>Proveedor B</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L002" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L002" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Tocino</td>
                                <td>Proveedor C</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L003" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L003" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Jamón</td>
                                <td>Proveedor C</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L004" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L004" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Salchichas</td>
                                <td>Proveedor D</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L005" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L005" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Pan de hamburguesa clásico</td>
                                <td>Proveedor E</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L006" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L006" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Pan con semillas</td>
                                <td>Proveedor E</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L007" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L007" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Pan para hot dogs</td>
                                <td>Proveedor E</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L008" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L008" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Queso cheddar</td>
                                <td>Proveedor F</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L009" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L009" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Queso americano</td>
                                <td>Proveedor F</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L010" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L010" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Queso mozzarella</td>
                                <td>Proveedor F</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L011" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L011" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Lechuga</td>
                                <td>Proveedor G</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L012" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L012" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Tomate</td>
                                <td>Proveedor G</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L013" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L013" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Cebolla</td>
                                <td>Proveedor G</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L014" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L014" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Papas</td>
                                <td>Proveedor H</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L015" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L015" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Nuggets de pollo</td>
                                <td>Proveedor I</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L016" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L016" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Mayonesa</td>
                                <td>Proveedor J</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L017" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L017" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Mostaza</td>
                                <td>Proveedor J</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L018" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L018" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Ketchup</td>
                                <td>Proveedor J</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L019" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L019" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Aceite</td>
                                <td>Proveedor K</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L020" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L020" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Harina</td>
                                <td>Proveedor K</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L021" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L021" class="delete">Desactivar</a>
                                </td>
                            </tr>
                            <tr>
                                <td>Sal</td>
                                <td>Proveedor K</td>
                                <td class="actions">
                                    <a href="editar-insumo.jsp?codigo=L022" class="edit">Editar</a>
                                    <a href="confir-insumo.jsp?codigo=L022" class="delete">Desactivar</a>
                                </td>
                            </tr>

                            <!-- Render dinámico si hay datos en listaInsumos -->
                            <c:forEach var="insumo" items="${listaInsumos}">
                                <tr>
                                    <td>${insumo.nombre}</td>
                                    <td>${insumo.proveedor}</td>
                                    <td class="actions">
                                        <a href="editar-insumo.jsp?codigo=${insumo.codigoLote}" class="edit">Editar</a>
                                        <a href="confir-insumo.jsp?codigo=${insumo.codigoLote}" class="delete">Desactivar</a>
                                    </td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <a href="crear-insumo.jsp" class="add-btn">➕ Agregar Insumo</a>
                </div>
            </div>

    </body>
</html>
