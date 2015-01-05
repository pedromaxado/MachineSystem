/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.Components;
import model.Machine;
import model.Peripheral;
import repository.DAOMachine;

/**
 *
 * @author strudel
 */
public class NewMachine implements Logic {

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
        Machine m = new Machine();
        Components c = new Components();

        int peripheralNumber = Integer.valueOf(req.getParameter("pNumber"));
        List<Peripheral> peripherals = new ArrayList<>();

        for (int i = 1; i < peripheralNumber + 1; i++) {
            if (!req.getParameter("pName" + i).isEmpty() || !req.getParameter("pPatrimony" + i).isEmpty()) {
                Peripheral p = new Peripheral();
                p.setName(req.getParameter("pName" + i));
                p.setPatrimony(req.getParameter("pPatrimony" + i));
                p.setMachineName(req.getParameter("hostname"));

                peripherals.add(p);
            }
        }

        m.setSector(req.getParameter("setor"));
        m.setRoom(req.getParameter("sala"));
        m.setName(req.getParameter("hostname"));
        m.setIp(req.getParameter("ip"));
        m.setPatrimony(req.getParameter("npatrimonio"));
        m.setCheckedDate(req.getParameter("dataverificacao"));
        m.setObservation(req.getParameter("observacoes"));

        c.setProcessor(req.getParameter("processador"));
        c.setRam(req.getParameter("ram"));
        c.setHd(req.getParameter("hd"));
        c.setVideoCard(req.getParameter("placavideo"));
        c.setMonitor(req.getParameter("monitor"));
        c.setPatrimonyMonitor(req.getParameter("patrimoniomonitor"));
        c.setMachineName(req.getParameter("hostname"));
        c.setOs(req.getParameter("os"));

        m.setComponents(c);
        m.setPeripherals(peripherals);

        DAOMachine.addMachine(m);

        return "mvc?logic=ListMachine";
    }

}
