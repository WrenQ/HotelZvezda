package iw.zvezdahotels;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class Hotel {

    /**
     */
    @NotNull
    private String hName;

    /**
     */
    @NotNull
    private String hAddress;

    /**
     */
    @NotNull
    private String hTelephone;

    /**
     */
    private String hEmail;

    /**
     */
    private String hWebsite;

    /**
     */
    @NotNull
    private int hStars;

    /**
     */
    @NotNull
    private double hPricePerSingle;

    /**
     */
    @NotNull
    private double hPricePerDouble;

    /**
     */
    @NotNull
    private int hMaxStayingDays;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "rHotel")
    private Set<Room> hRooms = new HashSet<Room>();
}
