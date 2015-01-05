/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.User;
import repository.DAOUser;

/**
 *
 * @author administrador-fae
 */
public class Login implements Logic {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
        
        boolean correctLogin = false;
        
        User u = new User();
        
        u.setUsername(req.getParameter("user"));
        u.setPassword(req.getParameter("pwd"));
        
        if( DAOUser.login(u) ) {
            req.getSession().setAttribute("username", u.getUsername());
            return "index.jsp";
        }
        else {
            req.setAttribute("error", new String("true"));
            return "login.jsp";
        }
        
    }
    
}
