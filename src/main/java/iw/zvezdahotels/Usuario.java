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
import javax.persistence.ManyToMany;

@RooJavaBean
@RooToString
@RooJson(deepSerialize = true)
@RooJpaActiveRecord(table = "usuario", finders = { "findUsuariosByUUsernameEquals" })
public class Usuario {

    /**
     */
    @NotNull
    private String fullName;

    /**
     */
    @NotNull
    private String email;

    /**
     */
    @NotNull
    @Size(min = 6)
    private String username;

    /**
     */
    @NotNull
    @Size(min = 8)
    private String password;

    /**
     */
    @NotNull
    @Temporal(TemporalType.TIMESTAMP)
    @DateTimeFormat(pattern = "dd-MM-yyyy hh:mm:ss")
    private Date dateRegistration;

    /**
     */
    @NotNull
    private Boolean enabled;

    /**
     */
    @NotNull
    @ManyToMany(cascade = CascadeType.ALL)
    private Set<UserRole> roles = new HashSet<UserRole>();
}
