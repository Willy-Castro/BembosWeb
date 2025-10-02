<%-- 
    Document   : reporte-perdidas
    Created on : 25 set. 2025, 4:03:31 p. m.
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
    <head>
        <meta charset="UTF-8">
        <title>Bembos - Stock Perdidas</title>
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
                font-family: Arial, sans-serif;
                margin: 0;
                background-color: #f4f7f9;
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

            .sidebar {
                width:var(--sidebar-width);
                background:#f9f9f9;
                padding-top:180px;
                border-right:1px solid #ddd;
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
                left:0;
                width:100%;
                height:80px;
                background:#f7f8fc; /* Color base */
                display:flex;
                align-items:center;
                padding-left:20px;
                color:#fff;
                z-index:1;
                overflow:hidden;
            }
            .topbar::after {
                content:"";
                position:absolute;
                right:0;
                top:0;
                width:85.45%;
                height:100%;
                background:#0033a0; /* Segundo color */
            }


            .topbar img {
                height:50px;

            }
            .main-content {
                flex-grow: 1;
                padding: 30px;
            }
            .header {
                margin-bottom: 20px;
            }
            .header h2 {
                font-size: 24px;
                color: var(--bembos-blue);
            }
            .controls {
                display: flex;
                justify-content: flex-end;
                margin-bottom: 10px;
            }
            .controls input[type="text"] {
                padding: 8px;
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
            /* Botones */
            .actions {
                margin-top: 20px;
                display: flex;
                gap: 15px;
            }
            .btn {
                border: none;
                padding: 10px 20px;
                border-radius: 5px;
                cursor: pointer;
                font-size: 14px;
            }
            .btn-export {
                background-color: #6aa9f7;
                color: white;
            }
            .btn-cancel {
                background-color: #666;
                color: white;
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

            /* Contenedor principal */
            .layout {
                display: flex;       /* 🔹 Coloca sidebar y main-content lado a lado */
                align-items: flex-start;
                margin-top: 80px;    /* Espacio para la barra superior */
            }
            
            .actions a
            {
                display: block;
                padding: 12px 5px;
                color: #fff;
                text-decoration: none; /* 🔹 Quita el subrayado */
            }
            .actions a.active {
                background: #bcd3f7;
                color: #2a5ac7;
                text-decoration: none; /* 🔹 Asegura que tampoco aparezca aquí */
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

            <!-- Main content -->
            <div class="main-content">
                <div class="header">
                    <h2>Stock Perdidas</h2>
                </div>

                <div class="pagination-controls">
                    <span>Mostrar 5 filas por página</span>
                    <div class="controls">
                        <input type="text" placeholder="Buscar:">
                    </div>
                </div>

                <div class="table-container">
                    <table>
                        <thead>
                            <tr>
                                <th>Insumo</th>
                                <th>Cantidad</th>
                                <th>Perdida</th>
                                <th>Detalles de Perdida</th>
                                <th>Fecha</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>Tomate</td>
                                <td>50 Kg</td>
                                <td>10 Kg</td>
                                <td>Insumo podrido</td>
                                <td>18/09/2025</td>
                            </tr>
                            <tr>
                                <td>Papa</td>
                                <td>47 Kg</td>
                                <td>5 Kg</td>
                                <td>Gusanos en insumo</td>
                                <td>11/09/2025</td>
                            </tr>
                            <tr>
                                <td>Carne de pollo</td>
                                <td>36 Kg</td>
                                <td>9 Kg</td>
                                <td>Carne Malograda</td>
                                <td>29/08/2025</td>
                            </tr>
                            <tr>
                                <td>Carne de cerdo</td>
                                <td>25 Kg</td>
                                <td>8 Kg</td>
                                <td>Carne Podrida</td>
                                <td>21/08/2025</td>
                            </tr>
                            <tr>
                                <td>Pan</td>
                                <td>32 Kg</td>
                                <td>12 Kg</td>
                                <td>Pan con hongos</td>
                                <td>12/08/2025</td>
                            </tr>
                        </tbody>
                    </table>
                </div>

                <div class="actions">
                    <button class="btn btn-export"><a href="export-reporte.jsp">Exportar</a></button>
                    <button class="btn btn-cancel"><a href="reportes.jsp">Cancelar</a></button>
                </div>
            </div>
        </div>
    </body>
</html>

