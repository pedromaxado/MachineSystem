/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.io.IOException;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import repository.DAOUser;

/**
 *
 * @author administrador-fae
 */
@WebServlet("/Login")
public class Login extends HttpServlet {

    @Override
    protected void doPost(HttpServletRequest req, HttpServletResponse res) throws ServletException, IOException {
        
        try {
            User u = new User();
            
            u.setUsername(req.getParameter("user"));
            u.setPassword(req.getParameter("pwd"));
            
            if( DAOUser.login(u) ) {
                req.getSession().setAttribute("username", u.getUsername());
                req.getRequestDispatcher("index.jsp").forward(req, res);
            }
            else {
                req.setAttribute("error", new String("true"));
                req.getRequestDispatcher("login.jsp").forward(req, res);
            }
        } catch (SQLException ex) {
            Logger.getLogger(Login.class.getName()).log(Level.SEVERE, null, ex);
        }
        
    }
    
}
