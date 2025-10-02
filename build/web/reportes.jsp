<%-- 
    Document   : reportes
    Created on : 23 set. 2025, 9:46:18 a. m.
    Author     : Pedro
--%>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Reporte de transacciones</title>
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


            .main-content h2 {
                font-size: 20px;
                color: var(--bembos-blue);
                margin-bottom: 20px;
            }

            /* Botones de filtro */
            .filters {
                display: flex;
                gap: 10px;
                margin-bottom: 20px;
            }
            .filters button {
                padding: 10px 20px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                background: #e6f0ff;
                color: var(--bembos-blue);
                font-weight: bold;
            }
            .filters button.active {
                background: var(--bembos-blue);
                color: #fff;
            }

            /* Tabla */
            .table-container {
                background: #fff;
                border-radius: 8px;
                padding: 15px;
                box-shadow: 0 2px 10px rgba(0,0,0,0.05);
            }
            .table-header {
                display: flex;
                justify-content: space-between;
                margin-bottom: 10px;
                align-items: center;
            }
            .table-header input {
                padding: 6px 10px;
                border: 1px solid #ddd;
                border-radius: 4px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
            }
            thead th {
                text-align: left;
                padding: 10px;
                background: #f1f1f1;
                border-bottom: 2px solid #ddd;
                font-size: 14px;
                color: #333;
            }
            tbody td {
                padding: 12px;
                border-bottom: 1px solid #eee;
                font-size: 14px;
                color: #555;
            }

            /* Botones de acción */
            .actions {
                display: flex;
                justify-content: flex-start;
                gap: 10px;
                margin-top: 20px;
            }
            .actions button {
                padding: 10px 20px;
                border: none;
                border-radius: 6px;
                cursor: pointer;
                font-weight: bold;
            }
            .export {
                background: #2a5ac7;
                color: var(--bembos-blue);
            }
            .add {
                background: #555;
                color: #fff;
            }

            /* Footer paginación */
            .pagination {
                margin-top: 10px;
                text-align: right;
                font-size: 14px;
                color: #777;
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

        <!-- Contenido -->
        <div class="main-content">
            <h2>Reporte de transacciones por insumos</h2>

            <!-- Botones filtro -->
            <div class="filters">
                <button class="active">Transacciones de salida</button>
                <button>Transacciones de ingreso</button>
            </div>

            <!-- Tabla -->
            <div class="table-container">
                <div class="table-header">
                    <span>Mostrar 5 filas por página</span>
                    <input type="text" placeholder="Buscar...">
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>FECHA</th>
                            <th>TIPO TRANSACCION</th>
                            <th>ID INSUMO</th>
                            <th>INSUMO</th>
                            <th>Detalle</th>
                            <th>Stock</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>20/08/2021</td>
                            <td>INGRESO INSUMO</td>
                            <td>147852</td>
                            <td>Tomate</td>
                            <td>-----</td>
                            <td>120</td>
                        </tr>
                        <tr>
                            <td>20/08/2021</td>
                            <td>INGRESO INSUMO</td>
                            <td>147852</td>
                            <td>Papa</td>
                            <td>-----</td>
                            <td>140</td>
                        </tr>
                        <tr>
                            <td>21/08/2021</td>
                            <td>SALIDA INSUMO</td>
                            <td>147852</td>
                            <td>Carne de pollo</td>
                            <td>-----</td>
                            <td>145</td>
                        </tr>
                        <tr>
                            <td>22/08/2021</td>
                            <td>INGRESO INSUMO</td>
                            <td>123456</td>
                            <td>Carne de cerdo</td>
                            <td>-----</td>
                            <td>240</td>
                        </tr>
                        <tr>
                            <td>25/08/2021</td>
                            <td>SALIDA INSUMO</td>
                            <td>147852</td>
                            <td>Pan</td>
                            <td>-----</td>
                            <td>200</td>
                        </tr>
                    </tbody>
                </table>

                <!-- Botones acción -->
                <div class="actions">
                    <button class="export"><a href="export-reporte.jsp" >Exportar</a></button>
                    <button class="add"><a href="add-tr.jsp" >Agregar transacción</a></button>
                </div>

                <!-- Paginación -->
                <div class="pagination">
                    1-8 de 1240
                </div>
            </div>
        </div>

    </body>
</html>
