/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Peripheral;
import repository.DAOPeripheral;

/**
 *
 * @author administrador-fae
 */
public class NewPeripheral implements Logic{

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
        
        Peripheral p = new Peripheral();
        
        p.setName(req.getParameter("pName"));
        p.setPatrimony(req.getParameter("pPatrimony"));
        p.setMachineName(req.getParameter("machineName"));
        
        DAOPeripheral.addPeripheral(p);
        
        return "mvc?logic=MachineDetails&id=" + req.getParameter("mId") ;
        
    }
    
}
