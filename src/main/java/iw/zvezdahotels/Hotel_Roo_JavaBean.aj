// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package iw.zvezdahotels;

import iw.zvezdahotels.Hotel;
import iw.zvezdahotels.Room;
import java.util.Set;

privileged aspect Hotel_Roo_JavaBean {
    
    public String Hotel.getHName() {
        return this.hName;
    }
    
    public void Hotel.setHName(String hName) {
        this.hName = hName;
    }
    
    public String Hotel.getHAddress() {
        return this.hAddress;
    }
    
    public void Hotel.setHAddress(String hAddress) {
        this.hAddress = hAddress;
    }
    
    public String Hotel.getHTelephone() {
        return this.hTelephone;
    }
    
    public void Hotel.setHTelephone(String hTelephone) {
        this.hTelephone = hTelephone;
    }
    
    public String Hotel.getHEmail() {
        return this.hEmail;
    }
    
    public void Hotel.setHEmail(String hEmail) {
        this.hEmail = hEmail;
    }
    
    public String Hotel.getHWebsite() {
        return this.hWebsite;
    }
    
    public void Hotel.setHWebsite(String hWebsite) {
        this.hWebsite = hWebsite;
    }
    
    public int Hotel.getHStars() {
        return this.hStars;
    }
    
    public void Hotel.setHStars(int hStars) {
        this.hStars = hStars;
    }
    
    public double Hotel.getHPricePerSingle() {
        return this.hPricePerSingle;
    }
    
    public void Hotel.setHPricePerSingle(double hPricePerSingle) {
        this.hPricePerSingle = hPricePerSingle;
    }
    
    public double Hotel.getHPricePerDouble() {
        return this.hPricePerDouble;
    }
    
    public void Hotel.setHPricePerDouble(double hPricePerDouble) {
        this.hPricePerDouble = hPricePerDouble;
    }
    
    public int Hotel.getHMaxStayingDays() {
        return this.hMaxStayingDays;
    }
    
    public void Hotel.setHMaxStayingDays(int hMaxStayingDays) {
        this.hMaxStayingDays = hMaxStayingDays;
    }
    
    public Set<Room> Hotel.getHRooms() {
        return this.hRooms;
    }
    
    public void Hotel.setHRooms(Set<Room> hRooms) {
        this.hRooms = hRooms;
    }
    
}