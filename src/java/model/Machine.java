/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package model;

import java.util.List;

/**
 *
 * @author administrador-fae
 */
public class Machine {
    
    private int id;
    private String sector;
    private String room;
    private String name;
    private String ip;
    private String patrimony;
    private String checkedDate;
    private String observation;
    
    private Components components;
    private List<Peripheral> peripherals;    

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    } 
    
    public String getSector() {
        return sector;
    }

    public void setSector(String sector) {
        this.sector = sector;
    }

    public String getRoom() {
        return room;
    }

    public void setRoom(String room) {
        this.room = room;
    }

    public String getName() {
        return name;
    }

    public void setName(String name) {
        this.name = name;
    }

    public String getIp() {
        return ip;
    }

    public void setIp(String ip) {
        this.ip = ip;
    }

    public String getPatrimony() {
        return patrimony;
    }

    public void setPatrimony(String patrimony) {
        this.patrimony = patrimony;
    }

    public String getCheckedDate() {
        return checkedDate;
    }

    public void setCheckedDate(String checkedDate) {
        this.checkedDate = checkedDate;
    }

    public String getObservation() {
        return observation;
    }

    public void setObservation(String observation) {
        this.observation = observation;
    }
    
    public Components getComponents() {
        return components;
    }

    public void setComponents(Components components) {
        this.components = components;
    }
    
    public List<Peripheral> getPeripherals() {
        return peripherals;
    }

    public void setPeripherals(List<Peripheral> peripherals) {
        this.peripherals = peripherals;
    }

    public String getProcessor() {        
        return components.getProcessor();
    }

    public String getRam() {
        return components.getRam();
    }

    public String getHd() {
        return components.getHd();
    }

    public String getVideoCard() {
        return components.getVideoCard();
    }

    public String getMonitor() {
        return components.getMonitor();
    }

    public String getPatrimonyMonitor() {
        return components.getPatrimonyMonitor();
    }

    public String getMachineName() {
        return components.getMachineName();
    }
    
    public String getOS() {
        return components.getOs();
    }
    
}
