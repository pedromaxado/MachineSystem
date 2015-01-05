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
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import model.Peripheral;
import static repository.DAO.connection;

/**
 *
 * @author administrador-fae
 */
public class DAOPeripheral extends DAO {
    
    public static void addPeripheral(Peripheral p) throws SQLException {
        
        String sql = "INSERT INTO machines_peripherals_fae (name, patrimony, machineName) VALUES (?,?,?)";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        stmt.setString(1, p.getName());
        stmt.setString(2, p.getPatrimony());
        stmt.setString(3, p.getMachineName());
        
        stmt.execute();
        stmt.close();
        
    }
    
    public static List<Peripheral> getPeripherals(String MachineName){
        String sql = "SELECT * FROM machines_peripherals_fae WHERE machineName = ?";

        try {
            PreparedStatement stmt = connection.prepareStatement(sql);
            stmt.setString(1, MachineName);

            ResultSet rs = stmt.executeQuery();

            List<Peripheral> peripherals = new ArrayList<>();

            while (rs.next()) {
                Peripheral p = new Peripheral();
                
                p.setName(rs.getString("Name"));
                p.setPatrimony(rs.getString("Patrimony"));
                p.setMachineName(rs.getString("MachineName"));
                p.setId(rs.getInt("id"));
                
                peripherals.add(p);
                
            }
            stmt.close();
            rs.close();
            
            return peripherals;
            
        } catch (SQLException ex) {
            Logger.getLogger(DAOComponent.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    
    public static void deletePeripheral(String id) throws SQLException {
        
        String sql = "DELETE FROM machines_peripherals_fae WHERE id=?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        stmt.setString(1, id);
        
        stmt.execute();
        stmt.close();
        
    }
    
    public static void alterPeripheral(Peripheral p) throws SQLException {
        
        String sql = "UPDATE machines_peripherals_fae SET name=?, patrimony=?, machineName=? WHERE id=?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        stmt.setString(1, p.getName());
        stmt.setString(2, p.getPatrimony());
        stmt.setString(3, p.getMachineName());
        stmt.setInt(4, p.getId());
        
        stmt.execute();
        stmt.close();
        
    }
    
}
