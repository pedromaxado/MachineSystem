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
public class AdvancedSearch implements Logic {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
        boolean[] searchFor = new boolean[12];
        String[] searchTokens;

        int i = 0;
        for (String s : req.getParameter("searchFor").split(";")) {            
            if (Integer.valueOf(s) == 1) {
                searchFor[i] = true;
            } else {
                searchFor[i] = false;
            }
            i++;
        }
        searchTokens = req.getParameter("searchTokens").split(";");

        List<Machine> machines = DAOMachine.getMachines(searchFor, searchTokens);

        req.setAttribute("machines", machines);

        return "machineList.jsp";
    }

}
