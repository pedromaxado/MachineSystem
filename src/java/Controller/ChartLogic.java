/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package Controller;

import java.util.ArrayList;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import model.ChartData;
import repository.DAOMachine;

/**
 *
 * @author administrador-fae
 */
public class ChartLogic implements Logic{

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
        ArrayList<ChartData> listMachineBySector = DAOMachine.getChartData(0);
        ArrayList<ChartData> listProcessorBySector = DAOMachine.getChartData(1);
        
        ChartData cd = new ChartData();
        String sector = "";
        String oldSector = "";
        ArrayList<String> sectorNames = new ArrayList<>();
        
        sectorNames.add(listProcessorBySector.get(0).getName());
        System.out.println(sectorNames.get(0));
        
        for(int i = 2; i <= listProcessorBySector.size(); i++){
            cd = listProcessorBySector.get(i-1);
            sector = cd.getName();
            oldSector = sectorNames.get(sectorNames.size()-1);
            
            if(!sector.equals(oldSector)){
                sectorNames.add(sector);
                System.out.println(sector);
            }
        }
        
        req.setAttribute("charDatas", listMachineBySector);
        req.setAttribute("charDatasProcessor", listProcessorBySector);
        
        return "stats.jsp";
    }
    
}
