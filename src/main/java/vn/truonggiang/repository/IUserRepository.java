package vn.truonggiang.repository;

import vn.truonggiang.entity.User;

public interface IUserRepository {
    User findByUsername(String username);
    User findById(int id);
    void insert(User user);
    void update(User user);
}