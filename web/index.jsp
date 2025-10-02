<%-- 
    Document   : index
    Created on : 23 set. 2025, 8:37:27 a. m.
    Author     : Pedro
--%>

<%@ page contentType="text/html;charset=UTF-8" language="java" %>
<!DOCTYPE html>
<html lang="es">
    <head>
        <meta charset="UTF-8">
        <title>Login Bembos</title>
        <style>
            :root {
                --bembos-blue: #0047ab;
                --btn-bg: #ffffff;
                --btn-hover: #f2f2f2;
                --card-bg: rgba(255,255,255,0.15);
            }
            *{
                margin:0;
                padding:0;
                box-sizing:border-box;
            }
            body{
                background: url("img/bg-bembos.jpeg") no-repeat center center/cover;
                font-family: Arial, sans-serif;
                color:white;
                height:100vh;
                display:flex;
                flex-direction:column;
                align-items:center;
                justify-content:center;
            }
            .logo{
                width:220px;
                margin-bottom:20px;
            }
            .card{
                background: var(--card-bg);
                backdrop-filter: blur(6px);
                padding:30px;
                border-radius:12px;
                text-align:center;
            }
            .card h2{
                margin-bottom:15px;
            }
            .input-box{
                width:250px;
                padding:10px;
                margin:10px 0;
                border:1px solid #fff;
                border-radius:6px;
                background:transparent;
                color:white;
            }
            .btn{
                width:250px;
                padding:10px;
                margin-top:10px;
                border:none;
                border-radius:6px;
                background:var(--btn-bg);
                color:var(--bembos-blue);
                font-weight:bold;
                cursor:pointer;
                transition:background .3s;
            }
            .btn:hover{
                background:var(--btn-hover);
            }
            .error{
                color:#ff8080;
                margin-top:10px;
            }
        </style>
    </head>
    <body>
        <img src="img/logo-bembos.png" class="logo" alt="Bembos Logo">
        <div class="card">
            <h2>Iniciar Sesión</h2>
            <form action="LoginServlet" method="post">
                <input class="input-box" type="text" name="username" placeholder="Usuario" required><br>
                <input class="input-box" type="password" name="password" placeholder="Contraseña" required><br>
                <button type="submit" class="btn">INICIAR SESIÓN</button>
            </form>
            <%
        String error = (String) request.getAttribute("error");
        if (error != null) {%>
            <div class="error"><%= error%></div>
            <% }%>
        </div>
    </body>
</html>
