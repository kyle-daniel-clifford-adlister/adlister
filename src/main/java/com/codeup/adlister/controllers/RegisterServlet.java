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
import java.sql.Connection;

@WebServlet(name = "controllers.RegisterServlet", urlPatterns = "/register")
public class RegisterServlet extends HttpServlet {
    Connection connection = null;
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.getRequestDispatcher("/WEB-INF/register.jsp").forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        String username = request.getParameter("username");
        String email = request.getParameter("email");
        String password = request.getParameter("password");
        String passwordConfirmation = request.getParameter("confirm_password");
        HttpSession session = request.getSession();
        //STORES Input into fields
        session.setAttribute("username",username);
        session.setAttribute("email",email);
        //RESETS Errors
        session.setAttribute("error",false);
        session.setAttribute("hacker",false);
        // validate input
        boolean inputHasErrors = username.isEmpty()
            || email.isEmpty()
            || password.isEmpty()
            || (! password.equals(passwordConfirmation));
        if (inputHasErrors) {
            response.sendRedirect("/register");
            return;
        }
        if (username.contains("<")||username.contains(">")||username.contains("(")||username.contains(")")||email.contains("<")||email.contains(">")||email.contains("(")||email.contains(")")){
            session.setAttribute("hacker",true);
            response.sendRedirect("/register");
            return;
        }
        User checkingUser = DaoFactory.getUsersDao().findByUsername(username);
        //USER HAS TO NOT BE FOUND TO ADD TO DATABASE
        if(checkingUser == null) {
            session.setAttribute("hacker",false);
            // create and save a new user
            User user = new User(username, email, password);

            // hash the password

            String hash = Password.hash(user.getPassword());

            user.setPassword(hash);

            DaoFactory.getUsersDao().insert(user);
            response.sendRedirect("/login");
        }
        else {
            //IF USER IS FOUND, ERROR MESSAGE POPULATES
            session.setAttribute("error",true);
            response.sendRedirect("/register");
        }
    }
}
