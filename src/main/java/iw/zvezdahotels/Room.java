package iw.zvezdahotels;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import iw.zvezdahotels.room.RoomType;
import javax.persistence.Enumerated;
import iw.zvezdahotels.room.RoomState;
import javax.persistence.ManyToOne;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findRoomsByRCategory", "findRoomsByRHotel", "findRoomsByRState", "findRoomsByRType" })
@RooJson(deepSerialize = true)
public class Room {

    /**
     */
    @NotNull
    private int rNumber;

    /**
     */
    @Enumerated
    private RoomType rType;

    /**
     */
    @Enumerated
    private RoomState rState;

    /**
     */
    @NotNull
    @ManyToOne
    private Category rCategory;

    /**
     */
    @NotNull
    @ManyToOne
    private Hotel rHotel;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bRoom")
    private Set<Booking> rBookings = new HashSet<Booking>();
}
