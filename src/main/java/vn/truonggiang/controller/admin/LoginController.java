package vn.truonggiang.controller.admin;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.truonggiang.entity.User;
import vn.truonggiang.service.IUserService;
import vn.truonggiang.service.UserService;

import java.io.IOException;

@WebServlet(urlPatterns = {"/login"})
public class LoginController extends HttpServlet {
    
    private IUserService userService = new UserService();
    
    @Override
    protected void doGet(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        req.getRequestDispatcher("/views/admin/login.jsp").forward(req, resp);
    }
    
    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse resp) 
            throws ServletException, IOException {
        
        String username = req.getParameter("username");
        String password = req.getParameter("password");
        
        User user = userService.login(username, password);
        
        if (user != null) {
            HttpSession session = req.getSession();
            session.setAttribute("account", user);
            
            // Redirect based on role
            switch (user.getRoleId()) {
                case 1:
                    resp.sendRedirect(req.getContextPath() + "/user/home");
                    break;
                case 2:
                    resp.sendRedirect(req.getContextPath() + "/manager/home");
                    break;
                case 3:
                    resp.sendRedirect(req.getContextPath() + "/admin/home");
                    break;
                default:
                    resp.sendRedirect(req.getContextPath() + "/login");
            }
        } else {
            req.setAttribute("error", "Invalid username or password");
            req.getRequestDispatcher("/views/admin/login.jsp").forward(req, resp);
        }
    }
}