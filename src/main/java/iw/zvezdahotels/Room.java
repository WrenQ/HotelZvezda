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
    private int number;
    
    /**
     */
    @NotNull
    private boolean extraBedAvailable;

    /**
     */
    @Enumerated
    private RoomType type;

    /**
     */
    @Enumerated
    private RoomState state;

    /**
     */
    @NotNull
    @ManyToOne
    private Category category;

    /**
     */
    @NotNull
    @ManyToOne
    private Hotel hotel;

}
