/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

/**
 *
 * @author administrador-fae
 */
public class Logout implements Logic {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
        
        HttpSession session = req.getSession();
        
        session.setAttribute("username", null);
        session.invalidate();
        
        return "login.jsp";
        
    }
    
}
