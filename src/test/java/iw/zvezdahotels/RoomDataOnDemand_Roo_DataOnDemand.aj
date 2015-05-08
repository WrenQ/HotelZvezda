// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package iw.zvezdahotels;

import iw.zvezdahotels.Category;
import iw.zvezdahotels.CategoryDataOnDemand;
import iw.zvezdahotels.Hotel;
import iw.zvezdahotels.HotelDataOnDemand;
import iw.zvezdahotels.Room;
import iw.zvezdahotels.RoomDataOnDemand;
import iw.zvezdahotels.room.RoomState;
import iw.zvezdahotels.room.RoomType;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect RoomDataOnDemand_Roo_DataOnDemand {
    
    declare @type: RoomDataOnDemand: @Component;
    
    private Random RoomDataOnDemand.rnd = new SecureRandom();
    
    private List<Room> RoomDataOnDemand.data;
    
    @Autowired
    CategoryDataOnDemand RoomDataOnDemand.categoryDataOnDemand;
    
    @Autowired
    HotelDataOnDemand RoomDataOnDemand.hotelDataOnDemand;
    
    public Room RoomDataOnDemand.getNewTransientRoom(int index) {
        Room obj = new Room();
        setCategory(obj, index);
        setExtraBedAvailable(obj, index);
        setHotel(obj, index);
        setNumber(obj, index);
        setState(obj, index);
        setType(obj, index);
        return obj;
    }
    
    public void RoomDataOnDemand.setCategory(Room obj, int index) {
        Category category = categoryDataOnDemand.getRandomCategory();
        obj.setCategory(category);
    }
    
    public void RoomDataOnDemand.setExtraBedAvailable(Room obj, int index) {
        Boolean extraBedAvailable = true;
        obj.setExtraBedAvailable(extraBedAvailable);
    }
    
    public void RoomDataOnDemand.setHotel(Room obj, int index) {
        Hotel hotel = hotelDataOnDemand.getRandomHotel();
        obj.setHotel(hotel);
    }
    
    public void RoomDataOnDemand.setNumber(Room obj, int index) {
        int number = index;
        obj.setNumber(number);
    }
    
    public void RoomDataOnDemand.setState(Room obj, int index) {
        RoomState state = RoomState.class.getEnumConstants()[0];
        obj.setState(state);
    }
    
    public void RoomDataOnDemand.setType(Room obj, int index) {
        RoomType type = RoomType.class.getEnumConstants()[0];
        obj.setType(type);
    }
    
    public Room RoomDataOnDemand.getSpecificRoom(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Room obj = data.get(index);
        Long id = obj.getId();
        return Room.findRoom(id);
    }
    
    public Room RoomDataOnDemand.getRandomRoom() {
        init();
        Room obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Room.findRoom(id);
    }
    
    public boolean RoomDataOnDemand.modifyRoom(Room obj) {
        return false;
    }
    
    public void RoomDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Room.findRoomEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Room' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Room>();
        for (int i = 0; i < 10; i++) {
            Room obj = getNewTransientRoom(i);
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
