package iw.zvezdahotels;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;
import java.util.Date;
import javax.persistence.Temporal;
import javax.persistence.TemporalType;
import org.springframework.format.annotation.DateTimeFormat;
import iw.zvezdahotels.usuario.UserRole;
import javax.persistence.ManyToOne;
import java.util.HashSet;
import java.util.Set;
import javax.persistence.CascadeType;
import javax.persistence.OneToMany;
import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord
@RooJson(deepSerialize = true)
public class Usuario {

    /**
     */
    @NotNull
    private String uFullName;

    /**
     */
    @NotNull
    private String uEmail;

    /**
     */
    @NotNull
    @Size(min = 6)
    private String uUsername;

    /**
     */
    @NotNull
    @Size(min = 8)
    private String uPassword;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date uDateRegistration;

    /**
     */
    @NotNull
    @ManyToOne
    private UserRole uRol;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "bUser")
    private Set<Booking> uBookings = new HashSet<Booking>();
}
