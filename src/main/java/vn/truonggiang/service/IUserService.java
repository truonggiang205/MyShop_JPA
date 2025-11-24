package vn.truonggiang.service;

import vn.truonggiang.entity.User;

public interface IUserService {
    User login(String username, String password);
    User findById(int id);
    void register(User user);
}