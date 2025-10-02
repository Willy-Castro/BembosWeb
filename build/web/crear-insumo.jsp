<%-- 
    Document   : crear-insumo
    Created on : 24 set. 2025, 10:29:48 a. m.
    Author     : Pedro
--%>

<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Creación de Insumo</title>
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
                background: #f9f9fb;
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

            /* Contenido */
            .main {
                margin-left: 300px;
                padding: 70px;
            }
            .form-container {
                background: #fff;
                padding: 20px;
                border-radius: 6px;
                border: 1px solid #ddd;
                max-width: 600px;
            }
            h2 {
                color: #5a8dee;
                margin-bottom: 20px;
            }
            .form-group {
                display: flex;
                align-items: center;
                margin-bottom: 15px;
            }
            .form-group label {
                width: 180px;
                font-size: 14px;
                color: #333;
            }
            .form-group input,
            .form-group select {
                flex: 1;
                padding: 6px;
                border: 1px solid #ccc;
                border-radius: 4px;
            }
            .acciones {
                text-align: right;
                margin-top: 20px;
            }
            .btn {
                padding: 8px 16px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                margin-left: 10px;
            }
            .btn.guardar {
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

            .acciones a {
                display: block;
                padding: 12px 5px;
                color: #fff;
                text-decoration: none; /* 🔹 Quita el subrayado */
            }
            .acciones a.active {
                background: #bcd3f7;
                color: #2a5ac7;
                text-decoration: none; /* 🔹 Asegura que tampoco aparezca aquí */
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
                <div class="form-container">
                    <h2>Creación de Insumo</h2>

                    <div class="form-group">
                        <label for="insumo">Insumo:</label>
                        <input type="text" id="insumo" placeholder="Ej. papa">
                    </div>

                    <div class="form-group">
                        <label for="cantidad">Cantidad:</label>
                        <input type="text" id="cantidad" placeholder="Ej. 20kg">
                    </div>

                    <div class="form-group">
                        <label for="fecha-recepcion">Fecha de recepción:</label>
                        <input type="date" id="fecha-recepcion">
                    </div>

                    <div class="form-group">
                        <label for="fecha-vencimiento">Fecha de vencimiento:</label>
                        <input type="date" id="fecha-vencimiento">
                    </div>

                    <div class="form-group">
                        <label for="proveedor">Proveedor:</label>
                        <select id="proveedor">
                            <option>---Ver todos los proveedores---</option>
                            <option>Proveedor A</option>
                            <option>Proveedor B</option>
                        </select>
                    </div>

                    <div class="form-group">
                        <label for="lote">Código Lote:</label>
                        <input type="text" id="lote" placeholder="YYLETRA0001">
                    </div>

                    

                    <div class="acciones">
                        <button class="btn guardar"><a href="insumos.jsp">Guardar</a></button>
                        <button class="btn cancelar"><a href="insumos.jsp">Cancelar</a></button>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
