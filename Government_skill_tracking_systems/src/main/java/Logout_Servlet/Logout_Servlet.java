package Logout_Servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

@WebServlet("/Logout_Servlet")
public class Logout_Servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request,
                          HttpServletResponse response)
            throws ServletException, IOException {

        // Get current session
        HttpSession session = request.getSession(false);

        // Destroy session
        if (session != null) {
            session.invalidate();
        }

        // Prevent browser from showing cached dashboard
        response.setHeader("Cache-Control",
                "no-cache, no-store, must-revalidate");

        response.setHeader("Pragma", "no-cache");

        response.setDateHeader("Expires", 0);

        // Redirect to User Login page
        response.sendRedirect("Login_page.jsp");
    }
}