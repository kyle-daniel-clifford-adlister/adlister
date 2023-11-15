package com.codeup.adlister.controllers;

import com.codeup.adlister.models.User;
import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet(name = "DeleteAdServlet", urlPatterns = "/ads/*")
public class DeleteAdServlet extends HttpServlet {
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        User loggedInUser = (User) request.getSession().getAttribute("user");



        // Check if the logged-in user is the owner of the ad
        Ads adsDao = DaoFactory.getAdsDao();
        long adId = Long.parseLong(request.getParameter("adId"));
        long userId = DaoFactory.getAdsDao().findAdById(adId).getUserId();
        if (loggedInUser.getId() == userId) {
            // Delete the ad
            adsDao.deleteAd(adId);
            response.sendRedirect("/profile");
        } else {
            // Redirect to an error page or handle unauthorized deletion
            response.sendRedirect("/error");



        }
    }
}