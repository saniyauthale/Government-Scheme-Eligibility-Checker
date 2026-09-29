package Admin_Dashboard_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;

import java.io.IOException;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;

import java.util.ArrayList;

@WebServlet("/Admin_Dashboard_servlet")
public class Admin_Dashboard_servlet extends HttpServlet {

    protected void doGet(HttpServletRequest request,
            HttpServletResponse response)
            throws ServletException, IOException {
    	 HttpSession session = request.getSession(false);

    	    if(session == null || session.getAttribute("adminUser") == null){

    	        response.sendRedirect("Admin_Login.jsp");

    	        return;
    	    }
    	
        Connection con = null;
        PreparedStatement ps = null;
        ResultSet rs = null;

        // DASHBOARD COUNTS

        int totalSchemes = 0;
        int activeSchemes = 0;
        int inactiveSchemes = 0;
        int totalUsers = 0;
        // RECENT SCHEME LIST

        ArrayList<Scheme> schemeList =
                new ArrayList<Scheme>();

        try {

            con = DBConnection.getConnection();

            // =====================================================
            // TOTAL SCHEMES
            // =====================================================

            ps = con.prepareStatement(
                    "SELECT COUNT(*) FROM schemes");

            rs = ps.executeQuery();

            if (rs.next()) {

                totalSchemes = rs.getInt(1);
            }

            // =====================================================
            // ACTIVE SCHEMES
            // =====================================================

            ps = con.prepareStatement(
                    "SELECT COUNT(*) FROM schemes WHERE status='Active'");

            rs = ps.executeQuery();

            if (rs.next()) {

                activeSchemes = rs.getInt(1);
            }
            System.out.println("TOTAL SCHEMES = " + totalSchemes);
            System.out.println("DATABASE = " + con.getCatalog());

            // =====================================================
            // INACTIVE SCHEMES
            // =====================================================

            ps = con.prepareStatement(
                    "SELECT COUNT(*) FROM schemes WHERE status='Inactive'");

            rs = ps.executeQuery();

            if (rs.next()) {

                inactiveSchemes = rs.getInt(1);
            }
            
         // =====================================================
         // TOTAL USERS
         // =====================================================

         ps = con.prepareStatement(
                 "SELECT COUNT(*) FROM registration");

         rs = ps.executeQuery();

         if(rs.next()){

             totalUsers = rs.getInt(1);
         }

            // =====================================================
            // FETCH RECENT SCHEMES
            // =====================================================

            ps = con.prepareStatement(
                    "SELECT * FROM schemes ORDER BY scheme_id DESC");

            rs = ps.executeQuery();

            while (rs.next()) {

                Scheme s = new Scheme();

                s.setSchemeId(rs.getInt("scheme_id"));

                s.setSchemeName(
                        rs.getString("scheme_name"));

                s.setCategory(
                        rs.getString("category"));

                s.setCandidateType(
                        rs.getString("candidate_type"));

                s.setStatus(
                        rs.getString("status"));

                s.setLastDate(
                        rs.getString("last_date"));

                s.setCreatedAt(
                        rs.getString("created_at"));

                schemeList.add(s);
            }

            // =====================================================
            // SEND DATA TO JSP
            // =====================================================

            request.setAttribute("totalSchemes", totalSchemes);

            request.setAttribute("activeSchemes", activeSchemes);

            request.setAttribute("inactiveSchemes", inactiveSchemes);

            request.setAttribute("schemeList", schemeList);
            
            request.setAttribute("totalUsers", totalUsers);

            // =====================================================
            // FORWARD TO JSP
            // =====================================================

            request.getRequestDispatcher("Admin_Dashboard.jsp")
            .forward(request, response);

        } catch (Exception e) {

            e.printStackTrace();
        }
    }
}