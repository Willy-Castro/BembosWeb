<%-- 
    Document   : info-proveedor
    Created on : 25 set. 2025, 4:17:16 p. m.
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Información del Proveedor</title>
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

            
            .card {
                background:#fff;
                padding:30px;
                border-radius:8px;
                border:1px solid #ddd;
                box-shadow:0 2px 10px rgba(0,0,0,0.05);
                max-width:800px;
                margin:auto;
            }
            .card h2 {
                font-size:22px;
                color:var(--bembos-blue);
                margin-bottom:20px;
                text-align:center;
            }
            .card p {
                margin:10px 0;
                font-size:15px;
            }
            .card strong {
                display:inline-block;
                width:180px;
                color:#333;
            }

            /* Actions */
            .actions {
                margin-top:30px;
                display:flex;
                justify-content:space-between;
                align-items:center;
            }
            .btn {
                padding:10px 20px;
                border:none;
                border-radius:5px;
                cursor:pointer;
                font-weight:bold;
            }
            .btn a {
                color:white;
                text-decoration:none;
                display:block;
            }
            .btn-info {
                background:#2a5ac7;
            }
            .btn-primary {
                background:#5a8dee;
            }
            .btn-secondary {
                background:#888;
            }
            .btn:hover {
                opacity:0.9;
            }
        </style>
    </head>
    <body>

        <!-- Topbar -->
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
                <div class="card">
                    <h2>Información del proveedor</h2>

                    <p><strong>RUC:</strong> 20123456789</p>
                    <p><strong>Descripción:</strong> Vendedor de carnes</p>
                    <p><strong>Email:</strong> proveedor@correo.com</p>
                    <p><strong>Dirección:</strong> Av. Los Proveedores 123, Lima</p>
                    <p><strong>Teléfono:</strong> 7777-8888</p>
                    <p><strong>Nombre de contacto:</strong> Pedro Mosquera</p>

                    <!-- Botones -->
                    <div class="actions">
                        <button class="btn btn-info"><a href="insumos-brindados.jsp">Insumos brindados</a></button>
                        <div>
                            <button class="btn btn-primary"><a href="edi-proveedor.jsp">Editar</a></button>
                            <button class="btn btn-secondary"><a href="proveedores.jsp">Cancelar</a></button>
                        </div>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>