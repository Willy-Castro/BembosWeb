<%-- 
    Document   : info-usuario
    Created on : 2 oct. 2025, 10:24:31 a. m.
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
        <title>Perfil de Usuario</title>
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
                display: flex; /* Sidebar y contenido uno al lado del otro */
                align-items: flex-start;
                margin-top: 80px; /* espacio para la topbar */
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
                padding-top:100px;
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
            /* Encabezado azul */
            .header {
                position: fixed;
                top: 0;
                left: 200px;
                width: calc(100% - 200px);
                height: 70px;
                background-color: #002f86;
            }

            /* Contenido principal */
            .main {
                margin-left: 200px;
                margin-top: -150px;
                width: calc(100% - 200px);
                display: flex;
                flex-direction: column;
                align-items: center;
            }

            .profile-pic {
                width: 180px;
                height: 180px;
                border-radius: 50%;
                object-fit: cover;
                margin-bottom: 15px;
            }

            .info-card {
                width: 300px;
                margin-bottom: 15px;
            }

            .info-card label {
                font-weight: bold;
                display: block;
                margin-bottom: 5px;
            }

            .info-card input {
                width: 100%;
                padding: 10px;
                border-radius: 6px;
                border: 1px solid #ccc;
            }

            .btn {
                margin-top: 20px;
                padding: 12px 20px;
                width: 200px;
                border: none;
                border-radius: 6px;
                background-color: #111;
                color: #fff;
                font-weight: bold;
                cursor: pointer;
                transition: background 0.3s;
            }

            .btn:hover {
                background-color: #333;
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

        <!-- Menú lateral -->
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

        <!-- Encabezado azul -->
        <div class="header"></div>

        <!-- Contenido principal -->
        <div class="main">
            <img src="img/usuario.jpeg" alt="Foto de perfil" class="profile-pic"> <!-- aquí va la foto -->
            <div class="info-card">
                <label>Nombre:</label>
                <input type="text" value="Nombre">
            </div>
            <div class="info-card">
                <label>Correo electrónico:</label>
                <input type="email" value="nombre@gmail.com">
            </div>
            <button class="btn">Cerrar sesión</button>
        </div>

    </body>
</html>

