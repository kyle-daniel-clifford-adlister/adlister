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


@WebServlet(name = "controllers.UpdateAdServlet", urlPatterns = "/updateAd")
public class UpdateAdServlet extends HttpServlet {

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        if(request.getSession().getAttribute("user") == null) {
            response.sendRedirect("/login");
            // add a return statement to exit out of the entire method.
            return;
        }

        Long adId = Long.valueOf(request.getParameter("adId"));
        Ad toBeUpdated =  DaoFactory.getAdsDao().findById(adId);
        request.setAttribute("ad", toBeUpdated);

        request.getRequestDispatcher("/WEB-INF/ads/update-ad.jsp").forward(request, response);

    }
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws IOException, ServletException {
        HttpSession session = request.getSession();

        Long adId = Long.valueOf(request.getParameter("adId"));

        String updatedTitle = request.getParameter("title");
        String updatedDescription = request.getParameter("description");
        Double updatedCost = Double.valueOf(request.getParameter("cost"));
//        String updatedCategories = request.getParameter("categories[]");

        Ad ad = DaoFactory.getAdsDao().findById(adId);

        if (ad != null) {
            ad.setTitle(updatedTitle);
            ad.setDescription(updatedDescription);
            ad.setCost(Double.parseDouble(String.valueOf(updatedCost)));
            DaoFactory.getAdsDao().update(ad);

            // Update the session attribute with the new username
            session.setAttribute("ad", ad);

            response.sendRedirect("/profile");
        } else {
            request.setAttribute("errorMessage", "User not found. Please try again.");
            request.getRequestDispatcher("/WEB-INF/update-login.jsp").forward(request, response);
        }
    }
}

