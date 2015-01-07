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
import model.Machine;

/**
 *
 * @author administrador-fae
 */
public class DAOMachine extends DAO {

    public enum QueryType {

        byID("SELECT * FROM machines_fae WHERE ID=?"),
        simpleSearch("SELECT * FROM machines_fae WHERE name LIKE ? OR sector LIKE ? OR room LIKE ? OR ip LIKE ?"),
        all("SELECT * FROM machines_fae WHERE 1 ORDER BY sector,room,name");

        private String query;

        private QueryType(String query) {
            this.query = query;
        }

        public String getQuery() {
            return this.query;
        }

    }

    public static void addMachine(Machine m) throws SQLException {

        String sql = "INSERT INTO machines_fae (sector,room,name,ip,Patrimony,CheckedDate,Observation) VALUES(?,?,?,?,?,?,?)";
        PreparedStatement stmt1 = connection.prepareStatement(sql);

        stmt1.setString(1, m.getSector());
        stmt1.setString(2, m.getRoom());
        stmt1.setString(3, m.getName());
        stmt1.setString(4, m.getIp());
        stmt1.setString(5, m.getPatrimony());
        stmt1.setString(6, m.getCheckedDate());
        stmt1.setString(7, m.getObservation());

        stmt1.execute();
        stmt1.close();

        int id = getMachineID(m.getName());
        m.setId(id);
        m.getComponents().setMachineId(id);

        DAOComponent.addComponent(m.getComponents());

        for (int i = 0; i < m.getPeripherals().size(); i++) {
            DAOPeripheral.addPeripheral(m.getPeripherals().get(i));
        }

    }

    private static int getMachineID(String machineName) throws SQLException {
        String query = "SELECT id FROM machines_fae WHERE name = ?";
        PreparedStatement stmt = connection.prepareStatement(query);

        stmt.setString(1, machineName);

        ResultSet rs = stmt.executeQuery();

        int id = 0;

        while (rs.next()) {
            id = rs.getInt("id");
        }

        stmt.close();
        rs.close();

        return id;

    }

    public static ArrayList<Machine> getMachines(boolean[] searchFor, String[] searchTokens) throws SQLException {

        String query = "SELECT * FROM machines_fae INNER JOIN machines_components_fae ON name=machineName WHERE ";

        for (int i = 0; i < searchFor.length; i++) {
            if (searchFor[i]) {
                query += getSearchCase(i) + " AND ";
            }
        }

        query = query.substring(0, query.length() - 5);

        PreparedStatement stmt = connection.prepareStatement(query);

        for (int i = 0; i < searchTokens.length; i++) {
            stmt.setString(i + 1, "%" + searchTokens[i].toUpperCase() + "%");
        }

        System.out.println(query);
        System.out.println(stmt);
        ArrayList<Machine> machines = new ArrayList<Machine>();

        ResultSet rs = stmt.executeQuery();

        while (rs.next()) {
            Machine m = new Machine();

            m.setId(rs.getInt("id"));
            m.setSector(rs.getString("sector"));
            m.setRoom(rs.getString("room"));
            m.setName(rs.getString("name"));
            m.setIp(rs.getString("ip"));
            m.setPatrimony(rs.getString("patrimony"));
            m.setCheckedDate(rs.getString("CheckedDate"));
            m.setObservation(rs.getString("Observation"));

            m.setComponents(DAOComponent.getComponent(m.getName()));
            m.setPeripherals(DAOPeripheral.getPeripherals(m.getName()));

            machines.add(m);
        }

        stmt.close();

        return machines;

    }

    public static ArrayList<Machine> getMachines(String search, QueryType qt) {

        String query = qt.getQuery();

        //String sql = "SELECT * FROM maquinas_fae,componentes_maquinas_fae WHERE maquinas_fae.nome=componentes_maquinas_fae.nome_maquina";
        ArrayList<Machine> machines = new ArrayList<Machine>();

        try {
            PreparedStatement stmt = connection.prepareStatement(query);

            if (qt == QueryType.simpleSearch) {
                stmt.setString(1, "%" + search.toUpperCase() + "%");
                stmt.setString(2, "%" + search.toUpperCase() + "%");
                stmt.setString(3, "%" + search.toUpperCase() + "%");
                stmt.setString(4, "%" + search.toUpperCase() + "%");
            } else if (qt != QueryType.all) {
                stmt.setString(1, search);
            }

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {
                Machine m = new Machine();

                m.setId(rs.getInt("id"));
                m.setSector(rs.getString("sector"));
                m.setRoom(rs.getString("room"));
                m.setName(rs.getString("name"));
                m.setIp(rs.getString("ip"));
                m.setPatrimony(rs.getString("patrimony"));
                m.setCheckedDate(rs.getString("CheckedDate"));
                m.setObservation(rs.getString("Observation"));

                m.setComponents(DAOComponent.getComponent(m.getName()));
                m.setPeripherals(DAOPeripheral.getPeripherals(m.getName()));

                machines.add(m);
            }

            stmt.close();

            return machines;

        } catch (SQLException e) {
            throw new RuntimeException(e);
        }
    }

    public static void deleteMachine(Machine m) throws SQLException {

        String sql = "DELETE FROM machines_fae WHERE id=?";
        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setInt(1, m.getId());

        stmt.execute();
        stmt.close();

        DAOComponent.deleteComponent(m.getName());
        DAOPeripheral.deletePeripheral(m.getName());

    }

    public static void alterMachine(Machine m) throws SQLException {

        String sql = "UPDATE machines_fae SET sector=?, room=?, name=?, ip=?, patrimony=?, checkedDate=?, observation=? WHERE id=?";
        PreparedStatement stmt = connection.prepareStatement(sql);

        stmt.setString(1, m.getSector());
        stmt.setString(2, m.getRoom());
        stmt.setString(3, m.getName());
        stmt.setString(4, m.getIp());
        stmt.setString(5, m.getPatrimony());
        stmt.setString(6, m.getCheckedDate());
        stmt.setString(7, m.getObservation());
        stmt.setInt(8, m.getId());

        stmt.execute();
        stmt.close();

    }

    private static String getSearchCase(int searchCase) {
        String search = "";
        switch (searchCase) {
            case 0:
                search = "sector LIKE ?";
                break;
            case 1:
                search = "room LIKE ?";
                break;
            case 2:
                search = "ip LIKE ?";
                break;
            case 3:
                search = "patrimony LIKE ?";
                break;
            case 4:
                search = "checkedDate LIKE ?";
                break;
            case 5:
                search = "name LIKE ?";
                break;
            case 6:
                search = "processor LIKE ?";
                break;
            case 7:
                search = "ram LIKE ?";
                break;
            case 8:
                search = "hd LIKE ?";
                break;
            case 9:
                search = "videoCard LIKE ?";
                break;
            case 10:
                search = "os LIKE ?";
                break;
            case 11:
                search = "observation LIKE ?";
                break;
        }

        return search;

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
        else if(type == 1){
            String sql = "SELECT sector, Processor, COUNT(Processor) AS QTD FROM machines_components_fae "
                    +    "INNER JOIN machines_fae ON machineid=id GROUP BY Processor ORDER BY sector,Processor";
            PreparedStatement stmt = connection.prepareStatement(sql);

            ResultSet rs = stmt.executeQuery();

            while (rs.next()) {

                ChartData cd = new ChartData();

                cd.setName(rs.getString("sector"));
                cd.setValue(rs.getString("processor"));
                cd.setOptionalValue(rs.getString("QTD"));

                list.add(cd);
            }
        }
        return list;
    }

}
