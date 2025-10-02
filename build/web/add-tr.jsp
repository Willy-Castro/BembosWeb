<%-- 
    Document   : reportesconsulta
    Created on : 24 set. 2025, 10:17:17?a. m.
    Author     : Pedro
--%>

<!DOCTYPE html>
<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<%@ page session="true" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Añadir Proveedor</title>
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

            /* Barra superior */
            .topbar {
                position:fixed;
                top:0;
                left:0;
                width:100%;
                height:80px;
                background:#f7f8fc;
                display:flex;
                align-items:center;
                padding:0 20px;
                z-index:1;
            }
            .topbar::after {
                content:"";
                position:absolute;
                right:0;
                top:0;
                width:85.45%;
                height:100%;
                background:var(--bembos-blue);
                z-index:-1;
            }
            .topbar img {
                height:50px;
                z-index:2;
            }

            /* Layout */
            .layout {
                display:flex;
                margin-top:80px;
            }

            /* Sidebar */
            .sidebar {
                width:var(--sidebar-width);
                background:#f9f9f9;
                border-right:1px solid #ddd;
                display:flex;
                flex-direction:column;
                justify-content:space-between;
                min-height:calc(100vh - 80px);
            }
            .sidebar ul {
                list-style:none;
            }
            .sidebar li {
                padding:12px 20px;
                color:#333;
                display:flex;
                align-items:center;
                cursor:pointer;
            }
            .sidebar li:hover {
                background:#eee;
            }
            .sidebar a {
                color:#555;
                text-decoration:none;
            }
            .logout {
                position:absolute;
                bottom:20px;
                left:20px;
                font-size:14px;
                color:#666;
            }
            .logout button {
                background:none;
                border:none;
                color:#666;
                cursor:pointer;
                text-decoration:underline;
            }

            /* Main */
            .main {
                flex:1;
                padding:20px;
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
                margin-top:8px;
            }
            .checklist label {
                font-size:14px;
                color:#444;
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
                    <h2>Transacción Nueva</h2>
                    <!-- Checklist de insumos -->
                    <div class="form-group" style="align-items:flex-start;">
                        <label for="insumos">Selecciona un insumo:</label>
                        <select id="insumos" name="insumos">
                            <option value="carne-res">Carne de res</option>
                            <option value="pollo">Pollo</option>
                            <option value="tocino">Tocino</option>
                            <option value="jamon">Jamón</option>
                            <option value="salchichas">Salchichas</option>
                            <option value="pan-clasico">Pan clásico</option>
                            <option value="pan-semillas">Pan con semillas</option>
                            <option value="queso-cheddar">Queso cheddar</option>
                            <option value="queso-americano">Queso americano</option>
                            <option value="queso-mozzarella">Queso mozzarella</option>
                            <option value="lechuga">Lechuga</option>
                            <option value="tomate">Tomate</option>
                            <option value="cebolla">Cebolla</option>
                            <option value="papas">Papas</option>
                            <option value="nuggets">Nuggets</option>
                            <option value="mayonesa">Mayonesa</option>
                            <option value="mostaza">Mostaza</option>
                            <option value="ketchup">Ketchup</option>
                            <option value="aceite">Aceite</option>
                            <option value="harina">Harina</option>
                            <option value="sal">Sal</option>
                        </select>

                    </div>

                    <div class="form-group" >
                        <label for="stock">Stock:</label>
                        <input type="text" id="ruc" placeholder="Ingrese el Stock">
                    </div>
                    <div class="form-group" style="align-items:flex-start;">
                        <label for="tipoTransaccion" >Tipo de transacción:</label>
                        <select id="tipoTransaccion" name="tipoTransaccion">
                            <option value="salida">Transacción de salida</option>
                            <option value="ingreso">Transacción de ingreso</option>
                        </select>
                    </div>
                    <div class="form-group">
                        <label for="fecha">Fecha:</label>
                        <input type="date" id="fecha">
                    </div>


                    

                    <div class="form-group">
                        <label for="Detalles">Detalles:</label>
                        <input type="text" id="detalles" placeholder="Destalles">
                    </div>

                    



                    <div class="acciones">
                        <button class="btn guardar"><a href="reportes.jsp">Guardar</a></button>
                        <button class="btn cancelar"><a href="reportes.jsp">Cancelar</a></button>
                    </div>
                </div>
            </div>
        </div>

    </body>
</html>

