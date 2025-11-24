package vn.truonggiang.controller.admin;

import jakarta.servlet.*;
import jakarta.servlet.annotation.WebFilter;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import jakarta.servlet.http.HttpSession;
import vn.truonggiang.entity.User;

import java.io.IOException;

@WebFilter(urlPatterns = {"/admin/*", "/manager/*", "/user/*"})
public class AuthFilter implements Filter {
    
    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain)
            throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest) request;
        HttpServletResponse resp = (HttpServletResponse) response;
        HttpSession session = req.getSession(false);
        
        String uri = req.getRequestURI();
        
        // Check if user is logged in
        if (session == null || session.getAttribute("account") == null) {
            resp.sendRedirect(req.getContextPath() + "/login");
            return;
        }
        
        User user = (User) session.getAttribute("account");
        int roleId = user.getRoleId();
        
        // Check role-based access
        if (uri.contains("/admin/") && roleId != 3) {
            resp.sendRedirect(req.getContextPath() + "/accessDenied");
            return;
        }
        
        if (uri.contains("/manager/") && roleId != 2) {
            resp.sendRedirect(req.getContextPath() + "/accessDenied");
            return;
        }
        
        if (uri.contains("/user/") && roleId != 1) {
            resp.sendRedirect(req.getContextPath() + "/accessDenied");
            return;
        }
        
        chain.doFilter(request, response);
    }
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
    }
    
    @Override
    public void destroy() {
    }
}