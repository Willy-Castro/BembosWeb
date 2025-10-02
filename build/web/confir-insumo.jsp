<%-- 
    Document   : confir-insumo
    Created on : 24 set. 2025, 10:49:25 a. m.
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Bembos - Sistema</title>
        <link rel="stylesheet" href="styles.css"> 

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

            /* Estilos Base y Layout */
            body {
                font-family: Arial, sans-serif;
                margin: 0;
                background-color: #f4f7f9; /* Fondo claro */
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

            /* Estilo para los botones en el menú de la izquierda */
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
                border-right: 5px solid #2a6196; /* Posible detalle de color */
            }


            /* 💡 Estilos del Modal/Diálogo (Énfasis en el contenido de la imagen) */

            /* Fondo que oscurece la pantalla detrás del modal */
            #modal-backdrop {
                position: fixed;
                top: 0;
                left: 0;
                width: 100%;
                height: 100%;
                background-color: rgba(0, 0, 0, 0.2); /* Sutil oscurecimiento */
                display: none; /* Oculto por defecto, solo visible si tiene la clase .visible */
                align-items: center; /* Centrar verticalmente */
                justify-content: center; /* Centrar horizontalmente */
                z-index: 1000; /* Asegura que esté por encima de todo */
            }

            #modal-backdrop.visible {
                display: flex;
            }

            #confirmation-modal {
                background-color: #ffffff;
                padding: 30px;
                border-radius: 8px;
                box-shadow: 0 4px 12px rgba(0, 0, 0, 0.15);
                width: 350px; /* Ancho fijo para el modal */
                text-align: center;
            }

            .modal-title {
                color: #2a6196; /* Un color azul más oscuro para el título */
                font-size: 1.5em;
                margin-bottom: 20px;
            }

            .modal-question {
                font-size: 1.1em;
                color: #555;
                margin-bottom: 30px;
            }

            .modal-actions {
                display: flex;
                justify-content: center;
                gap: 15px; /* Espacio entre los botones */
            }

            /* Estilos de Botones */
            .btn {
                padding: 10px 20px;
                border: none;
                border-radius: 4px;
                cursor: pointer;
                font-weight: bold;
                transition: background-color 0.2s;
            }

            .btn.primary { /* Botón 'Confirmar' */
                background-color: #b3cde0; /* Azul claro similar al de la imagen */
                color: #333;
            }

            .btn.secondary { /* Botón 'Cancelar' */
                background-color: #888; /* Gris oscuro similar al de la imagen */
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
            
             .modal-actions a {
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
            <div id="confirmation-modal">
                <h3 class="modal-title">Desactivar Insumo</h3>
                <p class="modal-question">¿Confirma que desea desactivar insumo?</p>
                <div class="modal-actions">
                    <button id="confirm-btn" class="btn primary"><a href="insumos.jsp">Confirmar</a></button>
                    <button id="cancel-btn" class="btn secondary"><a href="insumos.jsp">Cancelar</a></button>
                </div>
            </div>
        </div>

    </body>
</html>
