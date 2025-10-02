<%-- 
    Document   : reportesconsulta
    Created on : 24 set. 2025, 10:17:17?a. m.
    Author     : Pedro
--%>

<!DOCTYPE html>
<%@page contentType="text/html" pageEncoding="UTF-8"%>
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
                font-family: Arial, sans-serif;
                background-color: #f9f9fb;
                margin: 0;
                padding: 0;
            }
            /* Barra superior */
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
                z-index: 2;
            }
            /* Contenedor principal */
            .layout {
                display: flex;       /* 🔹 Coloca sidebar y main-content lado a lado */
                align-items: flex-start;
                margin-top: 80px;    /* Espacio para la barra superior */
            }
            /* Sidebar */
            .sidebar {
                width: var(--sidebar-width);
                background: #f9f9f9;
                padding-top: 100px;
                padding-right: 20px;
                border-right: 1px solid #ddd;
                flex-shrink: 0;
            }
            .sidebar ul {
                list-style: none;

            }
            .sidebar li {
                padding: 12px 20px;
                cursor: pointer;
                color: #333;
                display: flex;
                align-items: center;
                transition: background 0.3s;
            }
            .sidebar li:hover {
                background: #eee;
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
            .sidebar i {
                margin-right: 10px;
            }
            .menu a {
                display: block;
                padding: 10px 20px;
                color: #555;
                text-decoration: none;
            }
            .menu a.active {
                background: #cfe2ff;
                border-left: 4px solid #007bff;
            }
            .menu a:hover {
                background: #e8f0ff;
            }

            /* Contenido principal */
            .main {
                margin-left: 200px;
                padding: 20px;
            }
            h2 {
                color: #5a8dee;
                margin-bottom: 10px;
            }
            .filtros {
                margin-bottom: 20px;
            }
            label {
                margin-right: 10px;
                font-size: 14px;
            }
            input[type="date"] {
                padding: 5px;
                margin-right: 15px;
            }
            input[type="text"] {
                padding: 5px;
                margin-left: 10px;
            }
            table {
                width: 100%;
                border-collapse: collapse;
                background: white;
                margin-bottom: 20px;
            }
            th, td {
                text-align: left;
                padding: 8px;
                border-bottom: 1px solid #ddd;
                font-size: 14px;
            }
            th {
                background: #f0f3f8;
                color: #333;
            }
            .acciones {
                text-align: right;
            }
            .btn {
                padding: 8px 16px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-left: 10px;
            }
            .btn.exportar {
                background: #5a8dee;
                color: white;
            }
            .btn.cancelar {
                background: #666;
                color: white;
            }
            .btn:hover {
                opacity: 0.9;
            }

            .acciones a
            {
                display: block;
                padding: 12px 5px;
                color: #fff;
                text-decoration: none; /* ? Quita el subrayado */
            }
            .acciones a.active {
                background: #bcd3f7;
                color: #2a5ac7;
                text-decoration: none; /* ? Asegura que tampoco aparezca aquí */
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
            <div class="main">
                <h2>Reporte de transacciones por insumos</h2>

                <div class="filtros">
                    <label for="fecha-inicio">Fecha Inicial:</label>
                    <input type="date" id="fecha-inicio">
                    <label for="fecha-final">Fecha Final:</label>
                    <input type="date" id="fecha-final">

                    <label for="buscar">Buscar:</label>
                    <input type="text" id="buscar" placeholder="Buscar...">
                </div>

                <table>
                    <thead>
                        <tr>
                            <th>FECHA</th>
                            <th>TIPO TRANSACCIÓN</th>
                            <th>ID INSUMO</th>
                            <th>INSUMO</th>
                            <th>Transacciones</th>
                            <th>Stock</th>
                            <th>Comentarios</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td>20/08/2021</td>
                            <td>INGRESO INSUMO</td>
                            <td>147852</td>
                            <td>Tomate</td>
                            <td>####</td>
                            <td>120</td>
                            <td>rico</td>
                        </tr>
                        <tr>
                            <td>20/08/2021</td>
                            <td>INGRESO INSUMO</td>
                            <td>147852</td>
                            <td>Papa</td>
                            <td>####</td>
                            <td>140</td>
                            <td>feo</td>
                        </tr>
                        <tr>
                            <td>21/08/2021</td>
                            <td>SALIDA INSUMO</td>
                            <td>147852</td>
                            <td>Carne de pollo</td>
                            <td>####</td>
                            <td>145</td>
                            <td>agrio</td>
                        </tr>
                        <tr>
                            <td>22/08/2021</td>
                            <td>INGRESO INSUMO</td>
                            <td>123456</td>
                            <td>Carne de cerdo</td>
                            <td>####</td>
                            <td>240</td>
                            <td>masomenos</td>
                        </tr>
                        <tr>
                            <td>25/08/2021</td>
                            <td>SALIDA INSUMO</td>
                            <td>147852</td>
                            <td>Pan</td>
                            <td>####</td>
                            <td>200</td>
                            <td>Si</td>
                        </tr>
                    </tbody>
                </table>

                <div class="acciones">
                    <button class="btn exportar"><a href="export-reporte.jsp">Exportar</a></button>
                    <button class="btn cancelar"><a href="reportes.jsp">Cancelar</a></button>
                </div>
            </div>
        </div>
    </body>
</html>

