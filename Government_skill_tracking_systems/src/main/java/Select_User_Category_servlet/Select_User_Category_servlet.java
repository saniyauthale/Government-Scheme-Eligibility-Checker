package Select_User_Category_servlet;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;

import java.io.IOException;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

@WebServlet("/Select_User_Category_servlet")
public class Select_User_Category_servlet extends HttpServlet {

    private static final long serialVersionUID = 1L;

    private static final String DB_URL =
            "jdbc:mysql://localhost:3306/skill_tracking_system";

    private static final String DB_USER = "root";
    private static final String DB_PASSWORD = "root";


    @Override
    protected void doPost(HttpServletRequest request,
                           HttpServletResponse response)
            throws ServletException, IOException {

        // Get category and user ID
        String category = request.getParameter("category");
        String userIdStr = request.getParameter("userId");


        // Check category
        if (category == null || category.trim().isEmpty()) {

            response.sendRedirect(
                    "Select_User_Category.jsp?userId=" + userIdStr
            );

            return;
        }


        // Check user ID
        if (userIdStr == null || userIdStr.trim().isEmpty()) {

            response.sendRedirect("RegisterPage.jsp");

            return;
        }


        try {

            int userId = Integer.parseInt(userIdStr);


            // =====================================================
            // UPDATE CATEGORY IN REGISTRATION TABLE
            // =====================================================

            Class.forName("com.mysql.cj.jdbc.Driver");

            try (Connection con =
                    DriverManager.getConnection(
                            DB_URL,
                            DB_USER,
                            DB_PASSWORD
                    );

                 PreparedStatement ps =
                    con.prepareStatement(
                        "UPDATE registration " +
                        "SET category = ? " +
                        "WHERE user_id = ?"
                    )) {


                ps.setString(1, category);
                ps.setInt(2, userId);


                int result = ps.executeUpdate();


                System.out.println(
                        "User ID = " + userId
                );

                System.out.println(
                        "Category = " + category
                );

                System.out.println(
                        "Category update result = " + result
                );


                // =================================================
                // CHECK UPDATE
                // =================================================

                if (result == 0) {

                    response.sendRedirect(
                            "Select_User_Category.jsp?userId="
                            + userId
                            + "&error=user_not_found"
                    );

                    return;
                }
            }


            // =====================================================
            // REDIRECT TO CORRESPONDING PROFILE FORM
            // =====================================================

            switch (category) {

                case "Farmer":

                    response.sendRedirect(
                            "Farmer_Forms.jsp?userId="
                            + userId
                    );

                    break;


                case "Student":

                    response.sendRedirect(
                            "Student_Forms.jsp?userId="
                            + userId
                    );

                    break;


                case "Women":

                    response.sendRedirect(
                            "Women_Forms.jsp?userId="
                            + userId
                    );

                    break;


                case "Business":

                    response.sendRedirect(
                            "Business_Forms.jsp?userId="
                            + userId
                    );

                    break;


                case "Senior Citizen":

                    response.sendRedirect(
                            "Senior_Citizen_Forms.jsp?userId="
                            + userId
                    );

                    break;


                case "Girls Students":

                    response.sendRedirect(
                            "Girls_Forms.jsp?userId="
                            + userId
                    );

                    break;


                default:

                    response.sendRedirect(
                            "Select_User_Category.jsp?userId="
                            + userId
                    );

                    break;
            }


        } catch (NumberFormatException e) {

            e.printStackTrace();

            response.sendRedirect(
                    "RegisterPage.jsp?error=invalid_user"
            );


        } catch (Exception e) {

            e.printStackTrace();

            response.sendRedirect(
                    "Select_User_Category.jsp?userId="
                    + userIdStr
                    + "&error=database"
            );
        }
    }


    @Override
    protected void doGet(HttpServletRequest request,
                         HttpServletResponse response)
            throws ServletException, IOException {

        doPost(request, response);
    }
}