package UsersServlet;

import Manage_Scheme_servlet.DBConnection;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;

@WebServlet("/UsersServlet")
public class UsersServlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        List<User> userList = new ArrayList<>();

        try {

            Connection con = DBConnection.getConnection();

            String sql = "SELECT user_id, full_name, age, gender, mobile_no, " +
                         "email, category, status " +
                         "FROM registration ORDER BY user_id DESC";

            PreparedStatement ps = con.prepareStatement(sql);

            ResultSet rs = ps.executeQuery();

            while (rs.next()) {

                User u = new User();

                u.setUserId(rs.getInt("user_id"));
                u.setFullName(rs.getString("full_name"));
                u.setAge(rs.getInt("age"));
                u.setGender(rs.getString("gender"));
                u.setMobile(rs.getString("mobile_no"));
                u.setEmail(rs.getString("email"));
                u.setCategory(rs.getString("category"));

                userList.add(u);
            }

            rs.close();
            ps.close();
            con.close();

        } catch (Exception e) {
            e.printStackTrace();
        }

        request.setAttribute("userList", userList);

        request.getRequestDispatcher("Admin_View_Users.jsp")
               .forward(request, response);
    }
}