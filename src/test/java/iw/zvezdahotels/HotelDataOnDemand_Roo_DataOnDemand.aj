// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package iw.zvezdahotels;

import iw.zvezdahotels.Hotel;
import iw.zvezdahotels.HotelDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect HotelDataOnDemand_Roo_DataOnDemand {
    
    declare @type: HotelDataOnDemand: @Component;
    
    private Random HotelDataOnDemand.rnd = new SecureRandom();
    
    private List<Hotel> HotelDataOnDemand.data;
    
    public Hotel HotelDataOnDemand.getNewTransientHotel(int index) {
        Hotel obj = new Hotel();
        setAddress(obj, index);
        setEmail(obj, index);
        setMaxStayingDays(obj, index);
        setName(obj, index);
        setPricePerDouble(obj, index);
        setPricePerExtraBed(obj, index);
        setPricePerSingle(obj, index);
        setStars(obj, index);
        setTelephone(obj, index);
        setWebsite(obj, index);
        return obj;
    }
    
    public void HotelDataOnDemand.setAddress(Hotel obj, int index) {
        String address = "address_" + index;
        obj.setAddress(address);
    }
    
    public void HotelDataOnDemand.setEmail(Hotel obj, int index) {
        String email = "foo" + index + "@bar.com";
        obj.setEmail(email);
    }
    
    public void HotelDataOnDemand.setMaxStayingDays(Hotel obj, int index) {
        int maxStayingDays = index;
        obj.setMaxStayingDays(maxStayingDays);
    }
    
    public void HotelDataOnDemand.setName(Hotel obj, int index) {
        String name = "name_" + index;
        obj.setName(name);
    }
    
    public void HotelDataOnDemand.setPricePerDouble(Hotel obj, int index) {
        double pricePerDouble = new Integer(index).doubleValue();
        obj.setPricePerDouble(pricePerDouble);
    }
    
    public void HotelDataOnDemand.setPricePerExtraBed(Hotel obj, int index) {
        double pricePerExtraBed = new Integer(index).doubleValue();
        obj.setPricePerExtraBed(pricePerExtraBed);
    }
    
    public void HotelDataOnDemand.setPricePerSingle(Hotel obj, int index) {
        double pricePerSingle = new Integer(index).doubleValue();
        obj.setPricePerSingle(pricePerSingle);
    }
    
    public void HotelDataOnDemand.setStars(Hotel obj, int index) {
        int stars = index;
        obj.setStars(stars);
    }
    
    public void HotelDataOnDemand.setTelephone(Hotel obj, int index) {
        String telephone = "telephone_" + index;
        obj.setTelephone(telephone);
    }
    
    public void HotelDataOnDemand.setWebsite(Hotel obj, int index) {
        String website = "website_" + index;
        obj.setWebsite(website);
    }
    
    public Hotel HotelDataOnDemand.getSpecificHotel(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Hotel obj = data.get(index);
        Long id = obj.getId();
        return Hotel.findHotel(id);
    }
    
    public Hotel HotelDataOnDemand.getRandomHotel() {
        init();
        Hotel obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Hotel.findHotel(id);
    }
    
    public boolean HotelDataOnDemand.modifyHotel(Hotel obj) {
        return false;
    }
    
    public void HotelDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Hotel.findHotelEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Hotel' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Hotel>();
        for (int i = 0; i < 10; i++) {
            Hotel obj = getNewTransientHotel(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
