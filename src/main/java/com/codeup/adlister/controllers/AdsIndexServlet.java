package com.codeup.adlister.controllers;

import com.codeup.adlister.dao.Ads;
import com.codeup.adlister.dao.DaoFactory;
import com.codeup.adlister.models.Ad;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "controllers.AdsIndexServlet", urlPatterns = "/ads")
public class AdsIndexServlet extends HttpServlet {
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setAttribute("ads", DaoFactory.getAdsDao().all());
      String gunCategory = request.getParameter("gunCategory");

      if (gunCategory == null || gunCategory.equals("All")) {
          request.setAttribute("ads", DaoFactory.getAdsDao().all());
      } else if (gunCategory.equals("1")) {
          request.setAttribute("ads", DaoFactory.getAdsDao().find(gunCategory));
      } else if (gunCategory.equals("2")) {
          request.setAttribute("ads", DaoFactory.getAdsDao().find(gunCategory));
      } else if (gunCategory.equals("3")) {
          request.setAttribute("ads", DaoFactory.getAdsDao().find(gunCategory));
      } else if (gunCategory.equals("4")) {
          request.setAttribute("ads", DaoFactory.getAdsDao().find(gunCategory));
      } else if (gunCategory.equals("5")) {
          request.setAttribute("ads", DaoFactory.getAdsDao().find(gunCategory));
      } else if (gunCategory.equals("6")) {
          request.setAttribute("ads", DaoFactory.getAdsDao().find(gunCategory));
      } else if (gunCategory.equals("7")) {
          request.setAttribute("ads", DaoFactory.getAdsDao().find(gunCategory));
      }
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }
}
