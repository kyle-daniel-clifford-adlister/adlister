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
        List<Ad> list = DaoFactory.getAdsDao().all();
//        List<List<String>>listoflists = new ArrayList<>();
//        for (Ad ad:list) {
//            //Creates the list of categories PER ad
//            List<String> listofcats = DaoFactory.getAdsDao().getCatNames(ad.getId());
//            System.out.println(listofcats.toString());
//            listoflists.add(listofcats);
//        }
//        for (List<String> lisst:listoflists) {
//            for (String cat:lisst) {
//                System.out.println(cat);
//            }
//        }
//        request.setAttribute("cat",listoflists);
        request.getRequestDispatcher("/WEB-INF/ads/index.jsp").forward(request, response);
    }
}
