package Admin_Login_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.http.HttpSession;

@WebServlet("/Admin_Login_servlet")
public class Admin_Login_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	  private static final String ADMIN_USERNAME = "Admin@123";
	    private static final String ADMIN_PASSWORD = "Pass@123"; 
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		 String username = request.getParameter("username");
	        String password = request.getParameter("password");

	        // Check credentials
	        if (ADMIN_USERNAME.equals(username) && ADMIN_PASSWORD.equals(password)) {

	            // Create session
	            HttpSession session = request.getSession();
	            session.setAttribute("adminUser", username);

	            // Redirect to admin dashboard
	            response.sendRedirect("Admin_Dashboard_servlet");

	        } else {
	            // Invalid login
	            response.setContentType("text/html");
	            response.getWriter().println("<script type='text/javascript'>");
	            response.getWriter().println("alert('Invalid Username or Password');");
	            response.getWriter().println("location='Admin_Login.jsp';");
	            response.getWriter().println("</script>");
	        }
	    }
	}


