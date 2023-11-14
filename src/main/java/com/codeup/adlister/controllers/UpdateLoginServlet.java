package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;

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

        if (user != null) {
            user.setUsername(newUsername);
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