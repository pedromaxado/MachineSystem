/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */

package repository;

import java.sql.Connection;

/**
 *
 * @author Pedro
 */
public class DAO {
    static final Connection connection;

    static {
        connection = ConnectionFactory.getConnetion();
    }
}
