package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;
import org.mindrot.jbcrypt.BCrypt;
import java.io.*;
import javax.servlet.*;
import javax.servlet.http.*;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.io.PrintWriter;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        HttpSession session = request.getSession();

        // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || (! password.equals(passwordConfirmation));

        if (inputHasErrors) {
            session.setAttribute("error",inputHasErrors);
            response.sendRedirect("/register");
            return;
        }
       User checkingUser = DaoFactory.getUsersDao().findByUsername(username);
        if(checkingUser == null) {
            // create and save a new user
            User user = new User(username, email, password);

            // hash the password

            String hash = Password.hash(user.getPassword());

            user.setPassword(hash);

            DaoFactory.getUsersDao().insert(user);
            response.sendRedirect("/login");
        }
        else {
            response.setContentType("text/html");
            PrintWriter out = response.getWriter();
            System.out.println("You will see this in the console");
            response.getWriter().println("You should see this in the browser");
            out.println("<script>alert("+"Hello, World!"+")</script>");
            response.sendRedirect("/register");
        }
    }
}
