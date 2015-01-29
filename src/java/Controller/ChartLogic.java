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
import model.ChartDataBySector;
import repository.DAOChartData;
import repository.DAOMachine;

/**
 *
 * @author administrador-fae
 */
public class ChartLogic implements Logic{

    @Override
    public String executa(HttpServletRequest req, HttpServletResponse res) throws Exception {
        ArrayList<ChartData> listMachineBySector = DAOChartData.getChartData(0);
        ArrayList<String> sectorNames = DAOChartData.getSectorNames();
        
        ArrayList<ChartDataBySector> processorBySectors = new ArrayList<>();
        ArrayList<ChartDataBySector> ramBySectors = new ArrayList<>();
        ArrayList<ChartDataBySector> hdBySectors = new ArrayList<>();
        
        for(String s : sectorNames){
            ChartDataBySector cdsProcessor = new ChartDataBySector();
            ChartDataBySector cdsRam = new ChartDataBySector();
            ChartDataBySector cdsHd = new ChartDataBySector();     
            
            cdsProcessor.setDatas(DAOChartData.getChartDataBySector(s,0));
            cdsRam.setDatas(DAOChartData.getChartDataBySector(s,1)); 
            cdsHd.setDatas(DAOChartData.getChartDataBySector(s,2));
            
            s = s.replace("-", "");
            s = s.replace(" ", "");
            
            cdsProcessor.setSector(s);
            cdsRam.setSector(s);
            cdsHd.setSector(s);
            
            processorBySectors.add(cdsProcessor);
            ramBySectors.add(cdsRam);
            hdBySectors.add(cdsHd);
        }
                
        req.setAttribute("sectors", sectorNames);
        req.setAttribute("charDatas", listMachineBySector);
        req.setAttribute("charDatasProcessor", processorBySectors);
        req.setAttribute("charDatasRam", ramBySectors);
        req.setAttribute("charDatasHd", hdBySectors);
        
        return "stats.jsp";
    }
    
}


//        ChartData cd = new ChartData();
//        String sector = "";
//        String oldSector = "";
//        ArrayList<String> sectorNames = new ArrayList<>();
//        
//        sectorNames.add(listProcessorBySector.get(0).getName());
//        System.out.println(sectorNames.get(0));
//        
//        for(int i = 2; i <= listProcessorBySector.size(); i++){
//            cd = listProcessorBySector.get(i-1);
//            sector = cd.getName();
//            oldSector = sectorNames.get(sectorNames.size()-1);
//            
//            if(!sector.equals(oldSector)){
//                sectorNames.add(sector);
//                System.out.println(sector);
//            }
//        }
//        