package vn.truonggiang.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.truonggiang.entity.Category;
import vn.truonggiang.entity.User;
import vn.truonggiang.service.CategoryService;
import vn.truonggiang.service.ICategoryService;

import java.io.IOException;
import java.util.List;

@WebServlet(urlPatterns = {"/user/home", "/user/category/add", "/user/category/edit", 
                           "/user/category/view", "/user/category/delete"})
public class UserCategoryController extends HttpServlet {
    
    private ICategoryService categoryService = new CategoryService();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String url = req.getRequestURI();
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");
        
        if (url.contains("/user/home")) {
            showAllCategories(req, resp);
        } else if (url.contains("/user/category/add")) {
            req.getRequestDispatcher("/views/admin/category-add.jsp").forward(req, resp);
        } else if (url.contains("/user/category/edit")) {
            showEditForm(req, resp, user.getUserId());
        } else if (url.contains("/user/category/view")) {
            showCategoryDetail(req, resp);
        } else if (url.contains("/user/category/delete")) {
            deleteCategory(req, resp, user.getUserId());
        }
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String url = req.getRequestURI();
        
        if (url.contains("/user/category/add")) {
            addCategory(req, resp);
        } else if (url.contains("/user/category/edit")) {
            updateCategory(req, resp);
        }
    }
    
    private void showAllCategories(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        List<Category> categories = categoryService.findAll();
        req.setAttribute("categories", categories);
        req.getRequestDispatcher("/views/admin/home.jsp").forward(req, resp);
    }
    
    private void showEditForm(HttpServletRequest req, HttpServletResponse resp, int userId) 
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Category category = categoryService.findById(id);
        
        // Check if user owns this category
        if (category != null && category.getUser().getUserId() == userId) {
            req.setAttribute("category", category);
            req.getRequestDispatcher("/views/admin/category-edit.jsp").forward(req, resp);
        } else {
            resp.sendRedirect(req.getContextPath() + "/accessDenied");
        }
    }
    
    private void showCategoryDetail(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        int id = Integer.parseInt(req.getParameter("id"));
        Category category = categoryService.findById(id);
        req.setAttribute("category", category);
        req.getRequestDispatcher("/views/admin/category-view.jsp").forward(req, resp);
    }
    
    private void addCategory(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");
        
        String categoryName = req.getParameter("categoryname");
        String description = req.getParameter("description");
        
        Category category = new Category();
        category.setCategoryName(categoryName);
        category.setDescription(description);
        category.setUser(user);
        
        categoryService.insert(category);
        
        resp.sendRedirect(req.getContextPath() + "/user/home");
    }
    
    private void updateCategory(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        HttpSession session = req.getSession();
        User user = (User) session.getAttribute("account");
        
        int id = Integer.parseInt(req.getParameter("id"));
        Category category = categoryService.findById(id);
        
        // Check if user owns this category
        if (category != null && category.getUser().getUserId() == user.getUserId()) {
            String categoryName = req.getParameter("categoryname");
            String description = req.getParameter("description");
            
            category.setCategoryName(categoryName);
            category.setDescription(description);
            categoryService.update(category);
        }
        
        resp.sendRedirect(req.getContextPath() + "/user/home");
    }
    
    private void deleteCategory(HttpServletRequest req, HttpServletResponse resp, int userId) 
            throws ServletException, IOException {
        
        int id = Integer.parseInt(req.getParameter("id"));
        Category category = categoryService.findById(id);
        
        // Check if user owns this category
        if (category != null && category.getUser().getUserId() == userId) {
            categoryService.delete(id);
        }
        
        resp.sendRedirect(req.getContextPath() + "/user/home");
    }
}