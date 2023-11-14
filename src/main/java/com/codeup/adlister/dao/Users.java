package com.codeup.adlister.dao;

import com.codeup.adlister.models.User;
import com.codeup.adlister.util.Password;

import java.util.List;

public interface Users {
    User findByUsername(String username);
    Long insert(User user);

    void update(User user);

    void update(Password password);

    User findById(Long userId);
}
