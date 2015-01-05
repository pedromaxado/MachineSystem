/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Components;
import model.Machine;
import repository.DAOComponent;
import repository.DAOMachine;

/**
 *
 * @author administrador-fae
 */
public class EditMachine implements Logic{

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
        
        Machine m = new Machine();
        Components c = new Components();
        
        m.setId(Integer.valueOf(req.getParameter("mId")));
        m.setSector(req.getParameter("sector"));
        m.setRoom(req.getParameter("room"));
        m.setName(req.getParameter("name"));
        m.setIp(req.getParameter("ip"));
        m.setPatrimony(req.getParameter("patrimony"));
        m.setCheckedDate(req.getParameter("checkedDate"));
        m.setObservation(req.getParameter("observation"));

        c.setProcessor(req.getParameter("processor"));
        c.setRam(req.getParameter("ram"));
        c.setHd(req.getParameter("hd"));
        c.setVideoCard(req.getParameter("videoCard"));
        c.setMonitor(req.getParameter("monitor"));
        c.setPatrimonyMonitor(req.getParameter("patrimonyMonitor"));
        c.setMachineName(req.getParameter("name"));
        c.setMachineId(Integer.valueOf(req.getParameter("mId")));
        c.setOs(req.getParameter("os"));
        
        DAOMachine.alterMachine(m);
        DAOComponent.alterComponent(c);
        
        req.setAttribute("showOkMessage", true);
        
        return "mvc?logic=MachineDetails&id=" + req.getParameter("mId");
        
        
    }
    
}
