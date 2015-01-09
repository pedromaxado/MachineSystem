/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import model.ChartData;
import static repository.DAO.connection;

/**
 *
 * @author administrador-fae
 */
public class DAOChartData extends DAO {

    public static ArrayList<String> getSectorNames() throws SQLException {
        ArrayList<String> list = new ArrayList<>();

        String sql = "SELECT DISTINCT sector FROM `machines_fae` ORDER BY sector";

        PreparedStatement stmt = connection.prepareStatement(sql);

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            list.add(rs.getString("sector"));
        }

        return list;
    }

    public static ArrayList<ChartData> getChartData(int type) throws SQLException {

        ArrayList<ChartData> list = new ArrayList<>();

        if (type == 0) {

            String sql = "SELECT sector,COUNT(*) AS valor FROM machines_fae GROUP BY sector";
            PreparedStatement stmt = connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                ChartData cd = new ChartData();

                cd.setName(rs.getString("sector"));
                cd.setValue(rs.getString("valor"));

                list.add(cd);
            }
        }
        return list;
    }

    public static ArrayList<ChartData> getChartDataBySector(String sector, int type) throws SQLException {

        ArrayList<ChartData> list = new ArrayList<>();

        if (type == 0) {

            String sql = "SELECT Processor, COUNT(Processor) AS QTD FROM machines_components_fae "
                    + "INNER JOIN machines_fae ON machineid=id WHERE sector = ? GROUP BY Processor";

            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, sector);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ChartData cd = new ChartData();

                cd.setName(rs.getString("processor"));
                cd.setValue(rs.getString("QTD"));
                
                if(cd.getName().equals("-")){
                    cd.setName("Não Identificado");
                }              
                
                list.add(cd);
                //System.out.println(sector + " " + list.size());
            }
            stmt.close();
            rs.close();
        }else if (type == 1) {

            String sql = "SELECT RAM, COUNT(RAM) AS QTD FROM machines_components_fae "
                    + "INNER JOIN machines_fae ON machineid=id WHERE sector = ? GROUP BY RAM";

            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, sector);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ChartData cd = new ChartData();

                cd.setName(rs.getString("RAM"));
                cd.setValue(rs.getString("QTD"));
                
                if(cd.getName().equals("-")){
                    cd.setName("Não Identificado");
                }
                
                list.add(cd);
                //System.out.println(sector + " " + list.size());
            }
            stmt.close();
            rs.close();
        }else if (type == 2) {

            String sql = "SELECT HD, COUNT(HD) AS QTD FROM machines_components_fae "
                    + "INNER JOIN machines_fae ON machineid=id WHERE sector = ? GROUP BY HD";

            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, sector);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                ChartData cd = new ChartData();

                cd.setName(rs.getString("HD"));
                cd.setValue(rs.getString("QTD"));
                
                if(cd.getName().equals("-")){
                    cd.setName("Não Identificado");
                }

                list.add(cd);
                //System.out.println(sector + " " + list.size());
            }
            stmt.close();
            rs.close();
        }

        //System.out.println("FORA DO WHILE " + sector + " " + list.size());
        //System.out.println(list.get(0).getName() + " " + list.get(0).getValue());
        return list;
    }

}
