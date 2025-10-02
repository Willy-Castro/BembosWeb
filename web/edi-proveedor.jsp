<%-- 
    Document   : add-proveeor
    Created on : 25 set. 2025, 4:36:07 p. m.
    Author     : Pedro
--%>

<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Gestión de Proveedor</title>
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
                font-family:Arial,sans-serif;
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
            .form-container {
                background:#fff;
                padding:25px;
                border-radius:8px;
                border:1px solid #ddd;
                max-width:700px;
                margin:auto;
                box-shadow:0 2px 10px rgba(0,0,0,0.05);
            }
            h2 {
                color:#2a5ac7;
                margin-bottom:20px;
                text-align:center;
            }

            .form-group {
                display:flex;
                align-items:center;
                margin-bottom:15px;
            }
            .form-group label {
                width:200px;
                font-size:14px;
                color:#333;
                font-weight:bold;
            }
            .form-group input {
                flex:1;
                padding:8px;
                border:1px solid #ccc;
                border-radius:5px;
            }

            /* Checklist */
            .checklist {
                display:grid;
                grid-template-columns:1fr 1fr;
                gap:8px;
                margin-left:200px;
                margin-bottom:15px;
            }
            .checklist label {
                font-size:14px;
                color:#333;
                cursor:pointer;
            }

            .acciones {
                text-align:right;
                margin-top:25px;
            }
            .btn {
                padding:10px 20px;
                border:none;
                border-radius:5px;
                cursor:pointer;
                margin-left:10px;
                font-weight:bold;
            }
            .btn.guardar {
                background:#5a8dee;
                color:#fff;
            }
            .btn.cancelar {
                background:#888;
                color:#fff;
            }
            .btn:hover {
                opacity:0.9;
            }
            .acciones a {
                color:#fff;
                text-decoration:none;
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

            <!-- Contenido principal -->
            <div class="main">
                <div class="form-container">
                    <h2>Editar Proveedor</h2>

                    <div class="form-group">
                        <label for="ruc">RUC:</label>
                        <input type="text" id="ruc" value="20123456789">
                    </div>

                    <div class="form-group">
                        <label for="descripcion">Descripción:</label>
                        <input type="text" id="descripcion" value="Proveedor de carnes premium">
                    </div>

                    <div class="form-group">
                        <label for="email">E-mail:</label>
                        <input type="email" id="email" value="pedro@proveedor.com">
                    </div>

                    <div class="form-group">
                        <label for="direccion">Dirección:</label>
                        <input type="text" id="direccion" value="Av. Los Proveedores 123, Lima">
                    </div>

                    <div class="form-group">
                        <label for="telefono">Teléfono:</label>
                        <input type="text" id="telefono" value="987654321">
                    </div>

                    <div class="form-group">
                        <label for="nombre-contacto">Nombre de contacto:</label>
                        <input type="text" id="nombre-contacto" value="Pedro Mosquera">
                    </div>

                    <!-- Nuevo campo: checklist de insumos -->
                    <div class="form-group" style="align-items:flex-start;">
                        <label>Insumos:</label>
                        <div class="checklist">
                            <label><input type="checkbox" checked> Carne de res</label>
                            <label><input type="checkbox" checked> Pollo</label>
                            <label><input type="checkbox" checked> Tocino</label>
                            <label><input type="checkbox"> Jamón</label>
                            <label><input type="checkbox"> Salchichas</label>
                            <label><input type="checkbox"> Pan clásico</label>
                            <label><input type="checkbox"> Pan con semillas</label>
                            <label><input type="checkbox"> Queso cheddar</label>
                            <label><input type="checkbox"> Queso americano</label>
                            <label><input type="checkbox"> Queso mozzarella</label>
                            <label><input type="checkbox"> Lechuga</label>
                            <label><input type="checkbox"> Tomate</label>
                            <label><input type="checkbox"> Cebolla</label>
                            <label><input type="checkbox"> Papas</label>
                            <label><input type="checkbox"> Nuggets</label>
                            <label><input type="checkbox"> Mayonesa</label>
                            <label><input type="checkbox"> Mostaza</label>
                            <label><input type="checkbox"> Ketchup</label>
                            <label><input type="checkbox"> Aceite</label>
                            <label><input type="checkbox"> Harina</label>
                            <label><input type="checkbox"> Sal</label>
                        </div>
                    </div>

                    <div class="acciones">
                        <button class="btn guardar"><a href="proveedores.jsp">Guardar</a></button>
                        <button class="btn cancelar"><a href="proveedores.jsp">Cancelar</a></button>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>
