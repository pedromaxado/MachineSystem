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
public class SimpleSearch implements Logic{

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
        List<Machine> machines = DAOMachine.getMachines(req.getParameter("query"), DAOMachine.QueryType.simpleSearch);
        
        req.setAttribute("machines", machines);
        req.setAttribute("search", true);
        req.setAttribute("query", req.getParameter("query"));
        
        return "machineList.jsp";
    }
    
}
