/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Machine;
import repository.DAOMachine;

/**
 *
 * @author administrador-fae
 */
public class GetMachine implements Logic {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
        
        List<Machine> mList = DAOMachine.getMachines(req.getParameter("id"), DAOMachine.QueryType.byID);
        req.setAttribute("machine", mList.get(0));
        req.setAttribute("machineComponents",mList.get(0).getComponents());
        req.setAttribute("machinePeripheral",mList.get(0).getPeripherals());
        
        return "editMachine.jsp";
        
    }
    
}
