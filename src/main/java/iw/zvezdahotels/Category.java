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
public class Category {

    /**
     */
    @NotNull
    private String cName;

    /**
     */
    @NotNull
    private String cDescription;

    /**
     */
    @NotNull
    private double cPriceFactor;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "rCategory")
    private Set<Room> cRooms = new HashSet<Room>();
}
