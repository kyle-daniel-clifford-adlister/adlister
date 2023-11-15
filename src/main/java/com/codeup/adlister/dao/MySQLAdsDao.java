
package com.codeup.adlister.dao;

import com.codeup.adlister.models.Ad;
import com.codeup.adlister.util.Config;
import com.mysql.cj.jdbc.Driver;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class MySQLAdsDao implements Ads {
    private Connection connection = null;


    public MySQLAdsDao(Config config) {
        try {
            DriverManager.registerDriver(new Driver());
            connection = DriverManager.getConnection(
                    config.getUrl(),
                    config.getUser(),
                    config.getPassword()
            );
        } catch (SQLException e) {
            throw new RuntimeException("Error connecting to the database!", e);
        }
    }

    @Override
    public List<Ad> all() {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads");
            rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException("Error closing resources.", e);
            }
        }
    }
    public List<Ad>findbyuserid(Long user_id){
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads where user_id like ?");
            stmt.setLong(1,user_id);
            rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        } finally {
            try {
                if (rs != null) {
                    rs.close();
                }
                if (stmt != null) {
                    stmt.close();
                }
            } catch (SQLException e) {
                throw new RuntimeException("Error closing resources.", e);
            }
        }
    }

    @Override
    public Ad findAdById(long adId) {
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = connection.prepareStatement("SELECT * FROM ads WHERE id = ?");
            stmt.setLong(1, adId);
            rs = stmt.executeQuery();
            rs.next();
            return extractAd(rs);
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving ad.", e);
        }
    }


    @Override
    public Long insert(Ad ad) {
        try {
            String insertQuery = "INSERT INTO ads (user_id, title, description, cost) VALUES (?, ?, ?, ?)";
            PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
            stmt.setLong(1, ad.getUserId());
            stmt.setString(2, ad.getTitle());
            stmt.setString(3, ad.getDescription());
            stmt.setDouble(4, ad.getCost());
            stmt.executeUpdate();
            ResultSet rs = stmt.getGeneratedKeys();
            rs.next();
            long adId = rs.getLong(1);


            return adId;
        } catch (SQLException e) {
            throw new RuntimeException("Error creating ad.", e);
        }

        }
        @Override
        public Long insertAdCategories(Long ad_id, ArrayList<Integer> categoryNames) {
        for (int num:categoryNames) {
            try{
                String insertQuery = "INSERT INTO ad_categories (ad_id, category_id) VALUES (?, ?)";
                PreparedStatement stmt = connection.prepareStatement(insertQuery, Statement.RETURN_GENERATED_KEYS);
                stmt.setLong(1, ad_id);
                stmt.setInt(2, num);
                stmt.executeUpdate();
                ResultSet rs = stmt.getGeneratedKeys();
                rs.next();
            }catch (SQLException e){
                System.out.println(e);
            }
        }
        return ad_id;
    }
    public List<String>getCatNames(Long ad_id) {
        List<String> listnames = new ArrayList<>();
        PreparedStatement stmt = null;
        ResultSet rs = null;
        String query = "select name from categories join ad_categories ac on categories.id = ac.category_id join ads a on a.id = ac.ad_id where ad_id LIKE ?;";
        try {
            stmt = connection.prepareStatement(query);
            //TODO Get ad_id in set String
            stmt.setLong(1, ad_id);
            rs = stmt.executeQuery();
            while (rs.next()) {
                listnames.add(rs.getString(1));
            }
            return listnames;
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }
    @Override
    public List<Ad> find(String catId) {
        String query = "SELECT a.*, c.* FROM ad_categories ac JOIN ads a ON a.id = ac.ad_id JOIN categories c ON c.id = ac.category_id WHERE c.id = ? ";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, catId);
            ResultSet rs = stmt.executeQuery();
            return createAdsFromResults(rs);
        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    private void insertAdCategories(long adId, Object categoryNames) {
    }

    @Override
    public Ad findById(Long id) {
        String query = "SELECT * FROM ads WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setLong(1, id);
            return extractAd(stmt.executeQuery());
        } catch (SQLException e) {
            throw new RuntimeException("Error finding a user by id", e);
        }
    }

    private Ad extractAd(ResultSet rs) throws SQLException {
        return new Ad(
        rs.getLong("id"),
        rs.getLong("user_id"),
        rs.getString("title"),
        rs.getString("description"),
        rs.getDouble("cost")
        );
    }

    private List<Ad> createAdsFromResults(ResultSet rs) throws SQLException {
        List<Ad> ads = new ArrayList<>();
        while (rs.next()) {
            ads.add(extractAd(rs));
        }
        return ads;
    }
    private List<String> createAdsListFromResults(ResultSet rs) throws SQLException {
        List<String> list = new ArrayList<>();
        while (rs.next()) {
            list.add(rs.getString("name"));
        }
        return list;
    }
    public void deleteAd(long ad_id){
        PreparedStatement stmt = null;
        ResultSet rs = null;
        try {
            stmt = connection.prepareStatement("delete from ad_categories where ad_id = ?");
            stmt.setLong(1,ad_id);
            stmt.executeUpdate();
            stmt = connection.prepareStatement("delete from ads where id = ?");
            stmt.setLong(1,ad_id);
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error retrieving all ads.", e);
        }
    }


    @Override
    public List<Ad> update(Ad ads) {
        String query = "UPDATE ads SET title = ?, description = ?, cost = ? WHERE id = ?";
        try {
            PreparedStatement stmt = connection.prepareStatement(query);
            stmt.setString(1, ads.getTitle());
            stmt.setString(2, ads.getDescription());
            stmt.setDouble(3, ads.getCost());
            stmt.setLong(4, ads.getId());
            stmt.executeUpdate();
        } catch (SQLException e) {
            throw new RuntimeException("Error updating user", e);
        }
        return null;
    }
}
