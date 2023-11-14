package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;
import com.codeup.adlister.models.User;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import java.io.IOException;
import java.util.ArrayList;
import java.util.Arrays;
import java.util.List;

@WebServlet(name = "controllers.CreateAdServlet", urlPatterns = "/ads/create")
public class CreateAdServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            // add a return statement to exit out of the entire method.
            return;
        }

        request.getRequestDispatcher("/WEB-INF/ads/create.jsp").forward(request, response);

    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");
//        TODO convert to String if doesn't work
        ArrayList<Integer> categoryNames = new ArrayList<>();

        String[] categories = request.getParameterValues("categories");
        for (String category:categories) {
            int value = Integer.parseInt(category);
            System.out.println(value);
            categoryNames.add(value);
        }
        //TODO Use RegisterServlet as guide to populate ad values into table

//        if (categories != null && categories.length > 0) {
//            categoryNames.addAll(Arrays.asList(categories));
//        }

        Ad ad = new Ad(
                loggedInUser.getId(),
                request.getParameter("title"),
                request.getParameter("description"),
                Double.parseDouble(request.getParameter("cost"))
        );

        Long ad_id = DaoFactory.getAdsDao().insert(ad);
        DaoFactory.getAdsDao().insertAdCategories(ad_id,categoryNames);
        DaoFactory.getAdsDao().getCatNames(ad_id);
        response.sendRedirect("/ads");
    }

}
