package iw.zvezdahotels;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import javax.validation.constraints.Size;
import javax.persistence.ManyToOne;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findBookingsByDateBookingBetween", "findBookingsByRoom" })
@RooJson(deepSerialize = true)
public class Booking {

    /**
     */
    @NotNull
    private int code;

    /**
     */
    @NotNull
    private boolean withExtraBed;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date dateBooking;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date dateCheckIn;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date dateCheckOut;

    /**
     */
    @NotNull
    @Size(min = 16, max = 16)
    private String creditCard;

    /**
     */
    @NotNull
    private double partialBill;

    /**
     */
    @NotNull
    @ManyToOne
    private Usuario user;

    /**
     */
    @NotNull
    @ManyToOne
    private Hotel hotel;
    
    /**
     */
    @NotNull
    @ManyToOne
    private Category category;

}
