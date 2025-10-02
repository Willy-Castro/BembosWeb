package com.bembos.auth;

import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

@WebServlet("/LoginServlet")
public class LoginServlet extends HttpServlet {
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp)
            throws ServletException, IOException {
        
        String user = req.getParameter("username");
        String pass = req.getParameter("password");

        // DEMO: credenciales fijas
        if("admin".equals(user) && "admin123".equals(pass)){
            HttpSession session = req.getSession(true);
            session.setAttribute("user", user);
            resp.sendRedirect("dashboard.jsp");
        }else{
            req.setAttribute("error", "Usuario o contraseña incorrectos");
            req.getRequestDispatcher("index.jsp").forward(req, resp);
        }
    }
}

