// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package iw.zvezdahotels;

import iw.zvezdahotels.Booking;
import iw.zvezdahotels.BookingDataOnDemand;
import iw.zvezdahotels.Room;
import iw.zvezdahotels.RoomDataOnDemand;
import iw.zvezdahotels.Usuario;
import iw.zvezdahotels.UsuarioDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Component;

privileged aspect BookingDataOnDemand_Roo_DataOnDemand {
    
    declare @type: BookingDataOnDemand: @Component;
    
    private Random BookingDataOnDemand.rnd = new SecureRandom();
    
    private List<Booking> BookingDataOnDemand.data;
    
    @Autowired
    RoomDataOnDemand BookingDataOnDemand.roomDataOnDemand;
    
    @Autowired
    UsuarioDataOnDemand BookingDataOnDemand.usuarioDataOnDemand;
    
    public Booking BookingDataOnDemand.getNewTransientBooking(int index) {
        Booking obj = new Booking();
        setBCode(obj, index);
        setBCreditCard(obj, index);
        setBDateBooking(obj, index);
        setBDateCheckIn(obj, index);
        setBDateCheckOut(obj, index);
        setBPartialBill(obj, index);
        setBRoom(obj, index);
        setBUser(obj, index);
        setBWithExtraBed(obj, index);
        return obj;
    }
    
    public void BookingDataOnDemand.setBCode(Booking obj, int index) {
        int bCode = index;
        obj.setBCode(bCode);
    }
    
    public void BookingDataOnDemand.setBCreditCard(Booking obj, int index) {
        String bCreditCard = "bCreditCardxxx_" + index;
        if (bCreditCard.length() > 16) {
            bCreditCard = bCreditCard.substring(0, 16);
        }
        obj.setBCreditCard(bCreditCard);
    }
    
    public void BookingDataOnDemand.setBDateBooking(Booking obj, int index) {
        Date bDateBooking = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setBDateBooking(bDateBooking);
    }
    
    public void BookingDataOnDemand.setBDateCheckIn(Booking obj, int index) {
        Date bDateCheckIn = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setBDateCheckIn(bDateCheckIn);
    }
    
    public void BookingDataOnDemand.setBDateCheckOut(Booking obj, int index) {
        Date bDateCheckOut = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setBDateCheckOut(bDateCheckOut);
    }
    
    public void BookingDataOnDemand.setBPartialBill(Booking obj, int index) {
        double bPartialBill = new Integer(index).doubleValue();
        obj.setBPartialBill(bPartialBill);
    }
    
    public void BookingDataOnDemand.setBRoom(Booking obj, int index) {
        Room bRoom = roomDataOnDemand.getRandomRoom();
        obj.setBRoom(bRoom);
    }
    
    public void BookingDataOnDemand.setBUser(Booking obj, int index) {
        Usuario bUser = usuarioDataOnDemand.getRandomUsuario();
        obj.setBUser(bUser);
    }
    
    public void BookingDataOnDemand.setBWithExtraBed(Booking obj, int index) {
        Boolean bWithExtraBed = Boolean.TRUE;
        obj.setBWithExtraBed(bWithExtraBed);
    }
    
    public Booking BookingDataOnDemand.getSpecificBooking(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Booking obj = data.get(index);
        Long id = obj.getId();
        return Booking.findBooking(id);
    }
    
    public Booking BookingDataOnDemand.getRandomBooking() {
        init();
        Booking obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Booking.findBooking(id);
    }
    
    public boolean BookingDataOnDemand.modifyBooking(Booking obj) {
        return false;
    }
    
    public void BookingDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Booking.findBookingEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Booking' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Booking>();
        for (int i = 0; i < 10; i++) {
            Booking obj = getNewTransientBooking(i);
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
