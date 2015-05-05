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
@RooJpaActiveRecord(finders = { "findBookingsByBDateBookingBetween", "findBookingsByBRoom" })
@RooJson(deepSerialize = true)
public class Booking {

    /**
     */
    @NotNull
    private int bCode;

    /**
     */
    @NotNull
    private Boolean bWithExtraBed;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date bDateBooking;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date bDateCheckIn;

    /**
     */
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date bDateCheckOut;

    /**
     */
    @NotNull
    @Size(min = 16, max = 16)
    private String bCreditCard;

    /**
     */
    @NotNull
    private double bPartialBill;

    /**
     */
    @NotNull
    @ManyToOne
    private Usuario bUser;

    /**
     */
    @NotNull
    @ManyToOne
    private Room bRoom;
}
