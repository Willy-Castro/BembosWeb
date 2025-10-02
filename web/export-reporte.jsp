<%-- 
    Document   : export-reporte
    Created on : 24 set. 2025, 11:20:18 a. m.
    Author     : pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bembos - Reportes</title>
        <link rel="stylesheet" href="styles_success.css"> 

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
            /* Estilos Base y Layout (Mismo que el anterior, ajustando el activo) */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                background-color: #f4f7f9;
                display: flex;
                min-height: 100vh;
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
            .nav-item {
                display: block;
                padding: 10px 15px;
                color: #333;
                text-decoration: none;
                transition: background-color 0.2s;
            }

            .nav-item.active {
                background-color: #b3cde0; /* Color azul claro similar al de la imagen */
                color: #333;
            }


            /* 💡 Estilos del Modal de Éxito */

            /* Fondo que oscurece la pantalla detrás del modal */
            #modal-backdrop {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.2);
                display: none;
                align-items: center;
                justify-content: center;
                z-index: 1000;
            }

            #modal-backdrop.visible {
                display: flex;
            }

            #success-modal {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
                width: 350px;
                text-align: center;
            }

            /* Estilos del icono de éxito (El círculo verde y el checkmark) */
            .success-icon {
                display: inline-flex;
                justify-content: center;
                align-items: center;
                width: 60px;
                height: 60px;
                border-radius: 50%;
                background-color: #4CAF50; /* Verde brillante */
                color: white;
                font-size: 36px;
                font-weight: bold;
                margin-bottom: 20px;
            }

            .modal-message {
                color: #333;
                font-size: 1.4em;
                margin-bottom: 5px;
            }

            .modal-filename {
                font-size: 1.0em;
                color: #555;
                margin-bottom: 25px;
            }

            /* Estilos del botón 'OK' */
            .btn.success {
                padding: 10px 30px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
                background-color: #66cdaa; /* Tono de verde/azul claro similar al de la imagen */
                color: white;
                font-size: 1em;
                transition: background-color 0.2s;
            }

            .btn.success:hover {
                background-color: #5ab196;
            }

            .modal-actions a
            {
                display: block;
                padding: 12px 5px;
                color: #fff;
                text-decoration: none; /* 🔹 Quita el subrayado */
            }
            .modal-actions a.active {
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

            <div id="modal-backdrop" class="visible">
                <div id="success-modal">
                    <div class="success-icon">
                        &#10003; </div>

                    <h3 class="modal-message">¡Descarga Exitosa!</h3>
                    <p class="modal-filename">consulta_detalle_insumos.csv</p>

                    <div class="modal-actions">
                        <button id="ok-btn" class="btn success"><a href="reportes.jsp">OK</a></button>
                    </div>
                </div>
            </div>
        </div>
    </body>
</html>
