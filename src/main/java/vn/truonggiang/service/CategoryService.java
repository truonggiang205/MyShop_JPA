package vn.truonggiang.service;

import vn.truonggiang.entity.Category;
import vn.truonggiang.repository.CategoryRepository;
import vn.truonggiang.repository.ICategoryRepository;

import java.util.List;

public class CategoryService implements ICategoryService {
    
    private ICategoryRepository categoryRepo = new CategoryRepository();
    
    @Override
    public List<Category> findAll() {
        return categoryRepo.findAll();
    }
    
    @Override
    public List<Category> findByUserId(int userId) {
        return categoryRepo.findByUserId(userId);
    }
    
    @Override
    public Category findById(int id) {
        return categoryRepo.findById(id);
    }
    
    @Override
    public void insert(Category category) {
        categoryRepo.insert(category);
    }
    
    @Override
    public void update(Category category) {
        categoryRepo.update(category);
    }
    
    @Override
    public void delete(int id) {
        categoryRepo.delete(id);
    }
}