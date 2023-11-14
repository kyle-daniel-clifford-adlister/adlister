package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;



@WebServlet(name = "controllers.UpdateLoginServlet", urlPatterns = "/updateuser")
public class UpdateLoginServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();
        User user = (User) session.getAttribute("user");

        String newUsername = request.getParameter("username");
        String newEmail = request.getParameter("email");
        String newPassword = request.getParameter("password");

        String hash = Password.hash(newPassword);

        if (user != null) {
            user.setUsername(newUsername);
            user.setEmail(newEmail);
            user.setPassword(hash);
            DaoFactory.getUsersDao().update(user);

            // Update the session attribute with the new username
            session.setAttribute("user", user);

            response.sendRedirect("/profile");
        } else {
            request.setAttribute("errorMessage", "User not found. Please try again.");
            request.getRequestDispatcher("/WEB-INF/update-login.jsp").forward(request, response);
        }
    }
}