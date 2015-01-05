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
public class EditPeripheral implements Logic {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
        Peripheral p = new Peripheral();

        p.setName(req.getParameter("name"));
        p.setPatrimony(req.getParameter("patrimony"));
        p.setId(Integer.valueOf(req.getParameter("pId")));
        p.setMachineName(req.getParameter("machineName"));

        DAOPeripheral.alterPeripheral(p);

        return "mvc?logic=MachineDetails&id=" + req.getParameter("mId");

    }
}
