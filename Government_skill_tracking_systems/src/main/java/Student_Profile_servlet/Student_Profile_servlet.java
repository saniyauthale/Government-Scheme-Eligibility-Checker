package Student_Profile_servlet;
import java.sql.ResultSet;
import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import jakarta.servlet.http.HttpSession;
@WebServlet("/Student_Profile_servlet")
public class Student_Profile_servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DB_URL = "jdbc:mysql://localhost:3306/skill_tracking_system";
    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {

        response.setContentType("text/html");
        HttpSession session = request.getSession(false);

      
        try {

            // ================= PERSONAL DETAILS =================

            String fullName = request.getParameter("fullName");
            String dob = request.getParameter("dob");

            String ageStr = request.getParameter("age");
            int age = 0;
            if (ageStr != null && !ageStr.isEmpty()) {
                age = Integer.parseInt(ageStr);
            }

            String gender = request.getParameter("gender");
            String mobile = request.getParameter("mobile");
            String email = request.getParameter("email");
            String state = request.getParameter("state");
            String district = request.getParameter("district");

            // ================= EDUCATION =================

            String level = request.getParameter("educationLevel");
            String course = request.getParameter("courseName");
            String semester = request.getParameter("yearSemester");
            String college = request.getParameter("collegeName");
            String percentage = request.getParameter("percentage");
            String university = request.getParameter("boardUniversity");
            String medium = request.getParameter("medium");
            String stream = request.getParameter("stream");

            // ================= FAMILY DETAILS =================

            String income = request.getParameter("annualIncome");
            String category = request.getParameter("category");
            String parentFarmer = request.getParameter("parentFarmer");
            String orphan = request.getParameter("orphan");
            String disabled = request.getParameter("disabled");
            String familyMembers = request.getParameter("familyMembers");
            String govJob = request.getParameter("govJob");
            String familyType = request.getParameter("familyType");

            // ================= ADDITIONAL DETAILS =================

            String hostel = request.getParameter("hostel");
            String scholarship = request.getParameter("scholarship");
            String schemeName = request.getParameter("schemeName");
            String distance = request.getParameter("distance");
            String bank = request.getParameter("bank");
            String internet = request.getParameter("internet");
            String laptop = request.getParameter("laptop");

            // ================= DATABASE =================

            Class.forName("com.mysql.cj.jdbc.Driver");

            Connection con = DriverManager.getConnection(
                    DB_URL, DB_USER, DB_PASSWORD);
         // ================= GET USER ID FROM REGISTRATION =================

            int userId = 0;

            String userSql =
                    "SELECT user_id FROM registration WHERE email = ?";

            PreparedStatement userPs = con.prepareStatement(userSql);

            userPs.setString(1, email);

            ResultSet userRs = userPs.executeQuery();

            if (userRs.next()) {

                userId = userRs.getInt("user_id");

            } else {

                response.getWriter().println(
                    "<script>" +
                    "alert('Email is not registered. Please enter your registered email.');" +
                    "window.history.back();" +
                    "</script>"
                );

                userRs.close();
                userPs.close();
                con.close();

                return;
            }

            userRs.close();
            userPs.close();

            String sql =
                    "INSERT INTO student_profile (" +
                    "user_id,full_name,dob,age,gender,mobile,email,state,district," +
                    "education_level,courseName,yearSemester,collegeName,percentage,boardUniversity,medium,stream," +
                    "annualIncome,category,parentFarmer,orphan,disabled,familyMembers,govJob,familyType," +
                    "hostel,scholarship,schemeName,distance,bank,internet,laptop" +
                    ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";
            
            PreparedStatement ps = con.prepareStatement(sql);

            ps.setInt(1, userId);
            ps.setString(2, fullName);
            ps.setString(3, dob);
            ps.setInt(4, age);
            ps.setString(5, gender);
            ps.setString(6, mobile);
            ps.setString(7, email);
            ps.setString(8, state);
            ps.setString(9, district);

            ps.setString(10, level);
            ps.setString(11, course);
            ps.setString(12, semester);
            ps.setString(13, college);
            ps.setString(14, percentage);
            ps.setString(15, university);
            ps.setString(16, medium);
            ps.setString(17, stream);

            ps.setString(18, income);
            ps.setString(19, category);
            ps.setString(20, parentFarmer);
            ps.setString(21, orphan);
            ps.setString(22, disabled);
            ps.setString(23, familyMembers);
            ps.setString(24, govJob);
            ps.setString(25, familyType);

            ps.setString(26, hostel);
            ps.setString(27, scholarship);
            ps.setString(28, schemeName);
            ps.setString(29, distance);
            ps.setString(30, bank);
            ps.setString(31, internet);
            ps.setString(32, laptop);

            int rows = ps.executeUpdate();

            ps.close();
            con.close();

            if (rows > 0) {

                response.getWriter().println(
                    "<script>" +
                    "alert('Student Profile Saved Successfully');" +
                    "window.location='Login_page.jsp';" +
                    "</script>"
                );
            }else {

                response.getWriter().println(
                        "<script>"
                        + "alert('Failed to Save Student Profile');"
                        + "window.history.back();"
                        + "</script>");
            }

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<script>"
                    + "alert('Error : " + e.getMessage().replace("'", "") + "');"
                    + "window.history.back();"
                    + "</script>");
        }
    }
}