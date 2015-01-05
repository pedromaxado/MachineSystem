/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import repository.DAOPeripheral;

/**
 *
 * @author administrador-fae
 */
public class DeletePeripheral implements Logic{

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
        
        DAOPeripheral.deletePeripheral(req.getParameter("pId")); 
        
        return "mvc?logic=MachineDetails&id=" + req.getParameter("mId");
        
    }
    
}
