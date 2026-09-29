package Add_Scheme_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;
import jakarta.servlet.*;
import jakarta.servlet.annotation.MultipartConfig;
import jakarta.servlet.annotation.WebServlet;
import java.nio.file.Paths;
import jakarta.servlet.http.Part;
import java.io.File;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.DriverManager;

@WebServlet("/Add_Scheme_servlet")
@MultipartConfig(
	    fileSizeThreshold = 1024 * 1024 * 2,   // 2MB
	    maxFileSize = 1024 * 1024 * 10,        // 10MB
	    maxRequestSize = 1024 * 1024 * 50      // 50MB
	)

public class Add_Scheme_servlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
	 private static final String UPLOAD_DIR = "uploads/pdf";
    
	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String schemeName = request.getParameter("schemeName");
        String category = request.getParameter("category");
        String candidateType = request.getParameter("candidateType");
        String status = request.getParameter("status");
        String description = request.getParameter("description");
        String eligibility = request.getParameter("eligibility");
        String benefits = request.getParameter("benefits");
        String process = request.getParameter("process");
        String documents = request.getParameter("documents");
        String website = request.getParameter("website");
        String lastDate = request.getParameter("lastDate");
        String minAge = request.getParameter("minAge");
        String maxAge = request.getParameter("maxAge");
        String maxIncome = request.getParameter("maxIncome");

        String genderRequired =
                request.getParameter("genderRequired");

        String categoryRequired =
                request.getParameter("categoryRequired");

        String disabilityRequired =
                request.getParameter("disabilityRequired");

        String healthInsuranceRequired =
                request.getParameter("healthInsuranceRequired");

        String bankAccountRequired =
                request.getParameter("bankAccountRequired");
        // =========================
        // PDF Upload
        // =========================

        Part filePart = request.getPart("schemePdf");

        String fileName = Paths.get(filePart.getSubmittedFileName())
                               .getFileName()
                               .toString();

        // Project upload path
        String applicationPath = request.getServletContext().getRealPath("");
        String uploadPath = applicationPath + File.separator + UPLOAD_DIR;

        File uploadFolder = new File(uploadPath);

        if (!uploadFolder.exists()) {
            uploadFolder.mkdirs();
        }

        // Save file
        if (fileName != null && !fileName.isEmpty()) {

            filePart.write(uploadPath + File.separator + fileName);
        }

        // =========================
        // Database Insert
        // =========================

        Connection con = null;
        PreparedStatement ps = null;

        try {

            Class.forName("com.mysql.cj.jdbc.Driver");

            con = DriverManager.getConnection(
                    "jdbc:mysql://localhost:3306/skill_tracking_system",
                    "root",
                    "root"
            );

            String query =
                    "INSERT INTO schemes "
                    + "(scheme_name, category, candidate_type, status, "
                    + "description, eligibility, benefits, application_process, "
                    + "required_documents, website_link, last_date, pdf_file_name, "
                    + "min_age, max_age, max_income, gender_required, "
                    + "category_required, disability_required, "
                    + "health_insurance_required, bank_account_required) "
                    + "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = con.prepareStatement(query);

            ps.setString(1, schemeName);
            ps.setString(2, category);
            ps.setString(3, candidateType);
            ps.setString(4, status);
            ps.setString(5, description);
            ps.setString(6, eligibility);
            ps.setString(7, benefits);
            ps.setString(8, process);
            ps.setString(9, documents);
            ps.setString(10, website);
            ps.setString(11, lastDate);
            ps.setString(12, fileName);
         // Minimum Age
            if (minAge != null && !minAge.trim().isEmpty()) {
                ps.setInt(13, Integer.parseInt(minAge));
            } else {
                ps.setNull(13, java.sql.Types.INTEGER);
            }

            // Maximum Age
            if (maxAge != null && !maxAge.trim().isEmpty()) {
                ps.setInt(14, Integer.parseInt(maxAge));
            } else {
                ps.setNull(14, java.sql.Types.INTEGER);
            }

            // Maximum Income
            if (maxIncome != null && !maxIncome.trim().isEmpty()) {
                ps.setBigDecimal(
                        15,
                        new java.math.BigDecimal(maxIncome)
                );
            } else {
                ps.setNull(15, java.sql.Types.DECIMAL);
            }

            ps.setString(16, genderRequired);
            ps.setString(17, categoryRequired);
            ps.setString(18, disabilityRequired);
            ps.setString(19, healthInsuranceRequired);
            ps.setString(20, bankAccountRequired);
            int result = ps.executeUpdate();

            if (result > 0) {

                response.sendRedirect("Admin_Dashboard.jsp?success=Scheme Added");

            } else {

                response.getWriter().println("Failed to add scheme.");
            }

        } catch (Exception e) {

            e.printStackTrace();
            response.getWriter().println("Error: " + e.getMessage());

        } finally {

            try {

                if (ps != null)
                    ps.close();

                if (con != null)
                    con.close();

            } catch (Exception e) {

                e.printStackTrace();
            }
        }
    
	}

}
