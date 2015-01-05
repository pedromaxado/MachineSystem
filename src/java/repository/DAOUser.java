/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import model.User;

/**
 *
 * @author administrador-fae
 */
public class DAOUser extends DAO {
    
    public static boolean login(User u) throws SQLException {
        
        String sql = "SELECT * FROM users WHERE user=?";
        PreparedStatement stmt = connection.prepareStatement(sql);
        
        stmt.setString(1, u.getUsername());
        
        ResultSet rs = stmt.executeQuery();
        
        return rs.next() && rs.getString("password").equals(u.getPassword());
        
    }
    
}
