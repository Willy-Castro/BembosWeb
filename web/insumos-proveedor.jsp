<%-- 
    Document   : insumos-proveedor
    Created on : 24 set. 2025, 10:46:58 a. m.
    Author     : Pedro
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="es">
<head>
  <meta charset="UTF-8">
  <title>Insumos del Proveedor</title>
  <style>
    body {
      margin: 0;
      font-family: Arial, sans-serif;
      background: #f9f9fb;
    }

    /* Sidebar */
    .sidebar {
      position: fixed;
      left: 0; top: 0;
      width: 180px;
      height: 100%;
      background: #f4f6fa;
      border-right: 1px solid #ddd;
      padding-top: 20px;
    }
    .sidebar img {
      width: 100px;
      display: block;
      margin: 0 auto 20px;
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
      margin-left: 200px;
      padding: 20px;
    }

    h2 {
      color: #5a8dee;
      margin-bottom: 20px;
    }

    .top-bar {
      display: flex;
      justify-content: space-between;
      align-items: center;
      margin-bottom: 10px;
    }
    .top-bar select, 
    .top-bar input {
      padding: 5px;
      border: 1px solid #ccc;
      border-radius: 4px;
    }

    table {
      width: 100%;
      border-collapse: collapse;
      background: #fff;
    }
    th, td {
      text-align: left;
      padding: 10px;
      border-bottom: 1px solid #ddd;
    }
    th {
      color: #777;
      font-size: 14px;
    }
    tr:hover {
      background: #f5f8ff;
    }

    .footer {
      text-align: right;
      padding: 10px;
      font-size: 12px;
      color: #888;
    }
  </style>
</head>
<body>

  <!-- Sidebar -->
  <div class="sidebar">
    <img src="bembos-logo.png" alt="Bembos">
    <div class="menu">
      <a href="#">Insumos</a>
      <a href="#" class="active">Proveedores</a>
      <a href="#">Inventario</a>
      <a href="#">Reportes</a>
    </div>
  </div>

  <!-- Contenido principal -->
  <div class="main">
    <h2>Insumos del Proveedor</h2>

    <div class="top-bar">
      <div>
        Mostrar 
        <select>
          <option>5</option>
          <option>10</option>
          <option>20</option>
        </select>
        filas por página
      </div>
      <div>
        Buscar: <input type="text" placeholder="Buscar...">
      </div>
    </div>

    <table>
      <thead>
        <tr>
          <th>Entrega</th>
          <th>Insumo</th>
          <th>Vencimiento</th>
          <th>Cantidad</th>
        </tr>
      </thead>
      <tbody>
        <tr>
          <td>12/09/2025</td>
          <td>Papa</td>
          <td>28/09/2025</td>
          <td>37Kg</td>
        </tr>
        <tr>
          <td>10/09/2025</td>
          <td>Tomate</td>
          <td>21/09/2025</td>
          <td>30Kg</td>
        </tr>
        <tr>
          <td>29/08/2025</td>
          <td>Carne de pollo</td>
          <td>15/09/2025</td>
          <td>35Kg</td>
        </tr>
        <tr>
          <td>20/08/2025</td>
          <td>Carne de cerdo</td>
          <td>08/09/2025</td>
          <td>48Kg</td>
        </tr>
        <tr>
          <td>11/08/2025</td>
          <td>Carne de cordero</td>
          <td>25/08/2025</td>
          <td>20Kg</td>
        </tr>
      </tbody>
    </table>

    <div class="footer">
      1-5 of 1240
    </div>
  </div>

</body>
</html>

