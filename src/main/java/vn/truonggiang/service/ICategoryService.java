package vn.truonggiang.service;

import vn.truonggiang.entity.Category;
import java.util.List;

public interface ICategoryService {
    List<Category> findAll();
    List<Category> findByUserId(int userId);
    Category findById(int id);
    void insert(Category category);
    void update(Category category);
    void delete(int id);
}