<%-- 
    Document   : insumos-brindados
    Created on : 25 set. 2025, 4:31:23 p. m.
    Author     : pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Insumos del Proveedor</title>
        <style>
            :root {
                --bembos-blue: #0033a0;
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
                font-size:22px;
                color:var(--bembos-blue);
            }
            .back-btn {
                background:#888;
                color:#fff;
                padding:8px 16px;
                border:none;
                border-radius:5px;
                cursor:pointer;
                font-weight:bold;
            }
            .back-btn a {
                color:#fff;
                text-decoration:none;
            }

            /* Table */
            .table-container {
                background:#fff;
                border-radius:8px;
                box-shadow:0 2px 10px rgba(0,0,0,0.05);
                padding:20px;
            }
            table {
                width:100%;
                border-collapse:collapse;
                margin-top:15px;
            }
            thead th {
                text-align:left;
                padding:12px;
                background-color:#f8f9fa;
                border-bottom:1px solid #ddd;
            }
            tbody td {
                padding:12px;
                border-bottom:1px solid #eee;
            }
            tbody tr:last-child td {
                border-bottom:none;
            }

            /* Controls */
            .controls {
                display:flex;
                justify-content:space-between;
                align-items:center;
                margin-bottom:15px;
            }
            .controls span {
                font-size:14px;
                color:#555;
            }
            .controls input {
                padding:6px;
                border:1px solid #ccc;
                border-radius:4px;
            }

            /* Pagination */
            .pagination {
                margin-top:10px;
                font-size:13px;
                color:#666;
                display:flex;
                justify-content:flex-end;
                align-items:center;
                gap:10px;
            }
            .pagination span {
                cursor:pointer;
            }
            .pagination span:hover {
                color:var(--bembos-blue);
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

        <!-- Layout -->
        <div class="layout">
            <!-- Sidebar -->
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

            <!-- Main Content -->
            <div class="main-content">
                <div class="header">
                    <h2>Insumos del Proveedor</h2>
                    <button class="back-btn"><a href="info-proveedor.jsp">← Atrás</a></button>
                </div>

                <div class="table-container">
                    <!-- Controles -->
                    <div class="controls">
                        <span>Mostrar 5 filas por página</span>
                        <div>Buscar: <input type="text" /></div>
                    </div>

                    <!-- Tabla -->
                    <table>
                        <thead>
                            <tr>
                                <th>Entrega</th>
                                <th>Insumo</th>
                                <th>Código Lote</th>
                                <th>Vencimiento</th>
                                <th>Cantidad</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>12/09/2025</td>
                                <td>Papa</td>
                                <td>YYLETRA0005</td>
                                <td>28/09/2025</td>
                                <td>37 Kg</td>
                            </tr>
                            <tr>
                                <td>10/09/2025</td>
                                <td>Tomate</td>
                                <td>YYLETRA0004</td>
                                <td>21/09/2025</td>
                                <td>30 Kg</td>
                            </tr>
                            <tr>
                                <td>29/08/2025</td>
                                <td>Carne de pollo</td>
                                <td>YYLETRA0003</td>
                                <td>15/09/2025</td>
                                <td>35 Kg</td>
                            </tr>
                            <tr>
                                <td>20/08/2025</td>
                                <td>Carne de cerdo</td>
                                <td>YYLETRA0002</td>
                                <td>08/09/2025</td>
                                <td>48 Kg</td>
                            </tr>
                            <tr>
                                <td>11/08/2025</td>
                                <td>Carne de cordero</td>
                                <td>YYLETRA0001</td>
                                <td>25/08/2025</td>
                                <td>20 Kg</td>
                            </tr>

                            <!-- Ejemplo dinámico (si tienes lista de entregas) -->
                            <c:forEach var="entrega" items="${listaEntregas}">
                                <tr>
                                    <td>${entrega.fechaEntrega}</td>
                                    <td>${entrega.insumo}</td>
                                    <td>${entrega.codigoLote}</td>
                                    <td>${entrega.fechaVencimiento}</td>
                                    <td>${entrega.cantidad}</td>
                                </tr>
                            </c:forEach>
                        </tbody>
                    </table>

                    <!-- Paginación -->
                    <div class="pagination">
                        <span>1-5 of 1240</span>
                        <span>◀</span>
                        <span>▶</span>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
