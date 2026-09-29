package Business_Profile_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.math.BigDecimal;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;


@WebServlet("/Business_Profile_servlet")
public class Business_Profile_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
	private static final String DB_URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String DB_USER = "root";

    private static final String DB_PASSWORD = "root";
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String fullName = request.getParameter("fullName");
        String dob = request.getParameter("dob");
        String ageStr = request.getParameter("age");
        String gender = request.getParameter("gender");
        String mobile = request.getParameter("mobile");
        String email = request.getParameter("email");
        String state = request.getParameter("state");
        String district = request.getParameter("district");
        String address = request.getParameter("address");

        // Business Information

        String businessName = request.getParameter("businessName");
        String businessType = request.getParameter("businessType");
        String businessStatus = request.getParameter("businessStatus");
        String yearsOfBusiness = request.getParameter("yearsOfBusiness");
        String employees = request.getParameter("employees");
        String turnover = request.getParameter("turnover");
        String businessRegistration =
                request.getParameter("businessRegistration");

        // Financial Information

        String familyIncome =
                request.getParameter("familyIncome");

        String bankAccount =
                request.getParameter("bankAccount");

        String udyam =
                request.getParameter("udyam");

        String gst =
                request.getParameter("gst");

        // Category Information

        String category =
                request.getParameter("category");

        String womenEntrepreneur =
                request.getParameter("womenEntrepreneur");

        String differentlyAbled =
                request.getParameter("differentlyAbled");

        // Scheme Preference (Checkbox)

        String[] schemeArray =
                request.getParameterValues("schemePreference");

        String schemePreference = "";

        if (schemeArray != null) {
            schemePreference =
                    String.join(", ", schemeArray);
        }

        try {

            // Validation

            if (fullName == null || fullName.trim().isEmpty()) {

                response.getWriter().println(
                        "<script>alert('Full Name is Required');window.history.back();</script>");
                return;
            }

            if (ageStr == null || ageStr.trim().isEmpty()) {

                response.getWriter().println(
                        "<script>alert('Age is Required');window.history.back();</script>");
                return;
            }

            int age;

            try {

                age = Integer.parseInt(ageStr);

            } catch (NumberFormatException e) {

                response.getWriter().println(
                        "<script>alert('Invalid Age');window.history.back();</script>");
                return;
            }

            // Handle null radio buttons

            if (businessRegistration == null)
                businessRegistration = "No";

            if (bankAccount == null)
                bankAccount = "No";

            if (udyam == null)
                udyam = "No";

            if (gst == null)
                gst = "No";

            if (womenEntrepreneur == null)
                womenEntrepreneur = "No";

            if (differentlyAbled == null)
                differentlyAbled = "No";

            // Load JDBC Driver

            Class.forName("com.mysql.cj.jdbc.Driver");

            // Database Connection

            Connection con = DriverManager.getConnection(
                    DB_URL,
                    DB_USER,
                    DB_PASSWORD
            );
            // SQL Query

            String sql = "INSERT INTO business_profile ("
                    + "fullName, dob, age, gender, mobile, email, state, district, address, "
                    + "businessName, businessType, businessStatus, yearsOfBusiness, employees, "
                    + "turnover, businessRegistration, familyIncome, bankAccount, "
                    + "udyam, gst, category, womenEntrepreneur, differentlyAbled, schemePreference"
                    + ") VALUES (?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?,?)";

            PreparedStatement ps = con.prepareStatement(sql);

            // Set Values

            ps.setString(1, fullName);
            ps.setString(2, dob);
            ps.setInt(3, age);
            ps.setString(4, gender);
            ps.setString(5, mobile);
            ps.setString(6, email);
            ps.setString(7, state);
            ps.setString(8, district);
            ps.setString(9, address);

            ps.setString(10, businessName);
            ps.setString(11, businessType);
            ps.setString(12, businessStatus);
            ps.setString(13, yearsOfBusiness);
            ps.setString(14, employees);
            ps.setString(15, turnover);
            ps.setString(16, businessRegistration);

            ps.setString(17, familyIncome);

            ps.setString(18, bankAccount);
            ps.setString(19, udyam);
            ps.setString(20, gst);

            ps.setString(21, category);
            ps.setString(22, womenEntrepreneur);
            ps.setString(23, differentlyAbled);
            ps.setString(24, schemePreference);

            // Execute Query

            int rows = ps.executeUpdate();
            // Success / Failure

            if (rows > 0) {

                response.getWriter().println(
                        "<script>"
                        + "alert('Business Profile Submitted Successfully');"
                        + "window.location='Login_page.jsp';"
                        + "</script>");

            } else {

                response.getWriter().println(
                        "<script>"
                        + "alert('Failed to Submit Business Profile');"
                        + "window.history.back();"
                        + "</script>");
            }

            // Close Resources

            ps.close();
            con.close();

        } catch (Exception e) {

            e.printStackTrace();

            response.getWriter().println(
                    "<script>"
                    + "alert('Error: " + e.getMessage().replace("'", "") + "');"
                    + "window.history.back();"
                    + "</script>");
        }
    }
}
