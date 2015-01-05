/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Components;
import static repository.DAO.connection;

/**
 *
 * @author administrador-fae
 */
public class DAOComponent extends DAO {

    public static void addComponent(Components c) throws SQLException {

        String sql = "INSERT INTO machines_components_fae (Processor,RAM,HD,VideoCard,Monitor,MonitorPatrimony,MachineName,MachineId,OS) VALUES(?,?,?,?,?,?,?,?,?)";
        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setString(1, c.getProcessor());
        stmt.setString(2, c.getRam());
        stmt.setString(3, c.getHd());
        stmt.setString(4, c.getVideoCard());
        stmt.setString(5, c.getMonitor());
        stmt.setString(6, c.getPatrimonyMonitor());
        stmt.setString(7, c.getMachineName());
        stmt.setInt(8, c.getMachineId());
        stmt.setString(9, c.getOs());

        stmt.execute();
        stmt.close();

    }

    public static Components getComponent(String MachineName) {
        String sql = "SELECT * FROM machines_components_fae WHERE machineName = ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, MachineName);

            ResultSet rs = stmt.executeQuery();

            Components c = new Components();

            while (rs.next()) {
                c.setProcessor(rs.getString("Processor"));
                c.setRam(rs.getString("RAM"));
                c.setHd(rs.getString("HD"));
                c.setVideoCard(rs.getString("VideoCard"));
                c.setMonitor(rs.getString("Monitor"));
                c.setPatrimonyMonitor(rs.getString("MonitorPatrimony"));
                c.setMachineName(rs.getString("MachineName"));
                c.setMachineId(rs.getInt("MachineId"));
                c.setOs(rs.getString("OS"));
            }
            stmt.close();
            rs.close();

            return c;

        } catch (SQLException ex) {
            Logger.getLogger(DAOComponent.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }

    public static void deleteComponent(String machineName) throws SQLException {

        String sql = "DELETE FROM machines_components_fae WHERE MachineName=?";
        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setString(1, machineName);

        stmt.execute();
        stmt.close();

    }

    public static void alterComponent(Components c) throws SQLException {

        String sql = "UPDATE machines_components_fae SET processor=?, ram=?, hd=?, videoCard=?, monitor=?, monitorPatrimony=?, os=? ,machineName=? WHERE machineId=?";
        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setString(1, c.getProcessor());
        stmt.setString(2, c.getRam());
        stmt.setString(3, c.getHd());
        stmt.setString(4, c.getVideoCard());
        stmt.setString(5, c.getMonitor());
        stmt.setString(6, c.getPatrimonyMonitor());
        stmt.setString(7, c.getOs());
        stmt.setString(8, c.getMachineName());
        stmt.setInt(9, c.getMachineId());

        stmt.execute();
        stmt.close();

    }

}
