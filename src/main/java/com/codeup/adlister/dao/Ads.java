package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;

import java.util.ArrayList;
import java.util.List;

public interface Ads {
    // get a list of all the ads
    List<Ad> all();
    // insert a new ad and return the new ad's id
    Long insert(Ad ad);

    Long insertAdCategories(Long ad_id, ArrayList<Integer> categoryNames);

    List<String>getCatNames(Long ad_id);

    List<Ad> find(String catId);

    List<Ad>findbyuserid(Long user_id);

    Ad findAdById(long adId);

    void deleteAd(long adId);
}
