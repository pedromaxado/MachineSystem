/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Machine;
import repository.DAOMachine;

/**
 *
 * @author administrador-fae
 */
public class DeleteMachine implements Logic {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
        
        int id = Integer.parseInt(req.getParameter("id"));
        
        Machine m = new Machine();
        m.setId(id);
        m.setName(req.getParameter("name"));
        
        DAOMachine.deleteMachine(m);
        
        return "mvc?logic=ListMachine";
        
    }
    
}
