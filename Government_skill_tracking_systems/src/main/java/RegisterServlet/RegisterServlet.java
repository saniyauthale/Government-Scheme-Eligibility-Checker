package RegisterServlet;

import jakarta.servlet.ServletException;
import java.sql.ResultSet;
import java.sql.Statement;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/RegisterServlet")
public class RegisterServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        // Get Form Data
        String name = request.getParameter("name");
        String ageStr = request.getParameter("age");
        String gender = request.getParameter("gender");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String confirmPassword = request.getParameter("confirmPassword");
        String category = request.getParameter("category");

        // Password Validation
        if (password == null || confirmPassword == null ||
                !password.equals(confirmPassword)) {

            response.sendRedirect("RegisterPage.jsp?status=password_error");
            return;
        }

        try {

            // Convert age
            int age = Integer.parseInt(ageStr);

            // Load MySQL Driver
            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database Connection
            Connection con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/skill_tracking_system",
                    "root",
                    "root"
            );

            // INSERT Query
            String sql = "INSERT INTO registration "
                    + "(full_name, age, gender, mobile_no, email, password, c_password, category) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?,?)";

            PreparedStatement ps = con.prepareStatement(sql, Statement.RETURN_GENERATED_KEYS);
            // Set values
            ps.setString(1, name);
            ps.setInt(2, age);
            ps.setString(3, gender);
            ps.setString(4, mobile);
            ps.setString(5, email);
            ps.setString(6, password);
            ps.setString(7, confirmPassword); 
            ps.setString(8, category); // ✅ Corrected

            int result = ps.executeUpdate();

            if (result > 0) {

                ResultSet rs = ps.getGeneratedKeys();

                if (rs.next()) {

                    int userId = rs.getInt(1);

                    response.sendRedirect("Select_User_Category.jsp?userId=" + userId);

                }

            }else {

                response.sendRedirect("RegisterPage.jsp?status=failed");
            }

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect("RegisterPage.jsp?status=error");
        }
    }
}