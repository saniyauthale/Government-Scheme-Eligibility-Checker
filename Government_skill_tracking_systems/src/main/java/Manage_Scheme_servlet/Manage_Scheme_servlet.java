package Manage_Scheme_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.*;
import java.util.ArrayList;

@WebServlet("/Manage_Scheme_servlet")
public class Manage_Scheme_servlet extends HttpServlet {

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
	        throws ServletException, IOException {

	    // 🔍 ADD THIS DEBUG LINE HERE (VERY IMPORTANT)
	    System.out.println("ADMIN = CHECKING SESSION NOT ADDED YET");

	    ArrayList<Scheme> schemeList = new ArrayList<>();

	    try {
	        Class.forName("com.mysql.cj.jdbc.Driver");

	        Connection con = DriverManager.getConnection(
	                "jdbc:mysql://localhost:3306/skill_tracking_system",
	                "root",
	                "root"
	        );

	        String sql = "SELECT * FROM schemes";
	        PreparedStatement ps = con.prepareStatement(sql);
	        ResultSet rs = ps.executeQuery();

	        while (rs.next()) {
	            Scheme s = new Scheme();

	            s.setId(rs.getInt("scheme_id"));
	            s.setName(rs.getString("scheme_name"));
	            s.setDescription(rs.getString("description"));
	            s.setCategory(rs.getString("category"));

	            schemeList.add(s);
	        }

	        con.close();

	        request.setAttribute("schemeList", schemeList);
	        request.getRequestDispatcher("manage_scheme.jsp").forward(request, response);

	    } catch (Exception e) {
	        e.printStackTrace();
	    }
	}
}