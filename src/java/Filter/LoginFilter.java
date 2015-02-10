/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Filter;

import java.io.IOException;
import javax.servlet.Filter;
import javax.servlet.FilterChain;
import javax.servlet.FilterConfig;
import javax.servlet.ServletContext;
import javax.servlet.ServletException;
import javax.servlet.ServletRequest;
import javax.servlet.ServletResponse;
import javax.servlet.annotation.WebFilter;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

/**
 *
 * @author administrador-fae
 */
@WebFilter("/LoginFilter")
public class LoginFilter implements Filter {

    protected ServletContext context;
    
    @Override
    public void init(FilterConfig filterConfig) throws ServletException {
        this.context = filterConfig.getServletContext();
        this.context.log("Login filter initialized.");
    }

    @Override
    public void doFilter(ServletRequest request, ServletResponse response, FilterChain chain) throws IOException, ServletException {
        
        HttpServletRequest req = (HttpServletRequest)request;
        
        HttpSession session = req.getSession();
        
        if(session.getAttribute("username") == null) {
            this.context.log("User not logged in... redirecting.");
            req.getRequestDispatcher("login.jsp").forward(request, response);
        }
        else {
            this.context.log("User logged... forwarding request.");
            chain.doFilter(request, response);
        }
        
    }

    @Override
    public void destroy() {
        
    }
    
}
