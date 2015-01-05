/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package repository;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

/**
 *
 * @author strudel
 */
public class ConnectionFactory {

    public static Connection getConnetion() {
        try {
            DriverManager.registerDriver(new com.mysql.jdbc.Driver());
            //FAE
            return DriverManager.getConnection("jdbc:mysql://150.164.117.21/fae_machines_db","admin","admin");
            //Coltec            
            //return DriverManager.getConnection("jdbc:mysql://150.164.102.160/daw-aluno8","daw-aluno8","daw08");
            //Home
            //return DriverManager.getConnection("jdbc:mysql://sql3.freemysqlhosting.net/sql352783","sql352783","aG3!bW9*");
        } catch (SQLException ex) {
            throw new RuntimeException();
        }

    }
}
