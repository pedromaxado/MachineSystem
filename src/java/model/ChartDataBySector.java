/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.ArrayList;

/**
 *
 * @author administrador-fae
 */
public class ChartDataBySector {
    
    private String sector;
    private ArrayList<ChartData> datas;

    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public ArrayList<ChartData> getDatas() {
        return datas;
    }

    public void setDatas(ArrayList<ChartData> datas) {
        this.datas = datas;
    }   
}
