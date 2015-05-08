package iw.zvezdahotels;
import org.springframework.roo.addon.javabean.RooJavaBean;
import org.springframework.roo.addon.jpa.activerecord.RooJpaActiveRecord;
import org.springframework.roo.addon.tostring.RooToString;

import iw.zvezdahotels.room.RoomType;

import javax.validation.constraints.NotNull;

import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import javax.persistence.CascadeType;
import javax.persistence.EntityManager;
import javax.persistence.OneToMany;
import javax.persistence.TypedQuery;

import org.springframework.roo.addon.json.RooJson;

@RooJavaBean
@RooToString
@RooJpaActiveRecord(finders = { "findHotelsByAvailableRooms", "findHotelsByBookings" })
@RooJson(deepSerialize = true)
public class Hotel {

    /**
     */
    @NotNull
    private String name;

    /**
     */
    @NotNull
    private String address;

    /**
     */
    @NotNull
    private String telephone;

    /**
     */
    private String email;

    /**
     */
    private String website;

    /**
     */
    @NotNull
    private int stars;

    /**
     */
    @NotNull
    private double pricePerSingle;

    /**
     */
    @NotNull
    private double pricePerDouble;
    
    /**
     */
    @NotNull
    private double pricePerExtraBed;

    /**
     */
    @NotNull
    private int maxStayingDays;

    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "hotel")
    private Set<Room> rooms = new HashSet<Room>();
    
    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "hotel")
    private Set<Booking> bookings = new HashSet<Booking>();
    
    /**
     */
    @OneToMany(cascade = CascadeType.ALL, mappedBy = "hotel")
    private Set<Category> categories = new HashSet<Category>();

    /**
     * CUSTOM FINDERS -------------------------------------
     */
    public static TypedQuery<Long> findHotelsByAvailableRooms(long hotelId, long categoryId, RoomType roomType) {
        EntityManager entityManager = Hotel.entityManager();
        String query = "SELECT COUNT(*)" + "FROM Room" + "WHERE rState = 'AVAILABLE' AND rType = :roomType AND rHotel = :hotelId AND rCategory = :categoryId";
        TypedQuery<Long> typedQuery = entityManager.createQuery(query, Long.class);
        typedQuery.setParameter("hotelId", hotelId);
        typedQuery.setParameter("categoryID", categoryId);
        typedQuery.setParameter("roomType", roomType);
        return typedQuery;
    }

    public static TypedQuery<Long> findHotelsByBookings(long hotelId, long categoryId, RoomType roomType, Date dateArrival, Date dateLeaving) {
        EntityManager entityManager = Hotel.entityManager();
        String query = "SELECT COUNT(*)" + "FROM Booking B, Room R" + "WHERE (:dateArrival BETWEEN B.bDateCheckIn AND B.bDateCheckOut OR :dateLeaving BETWEEN B.bDateCheckIn AND B.bDateCheckOut)" + "AND B.bRoom = R.id AND R.rHotel = :hotelId AND R.rType = :roomType AND R.rCategory = :categoryId";
        TypedQuery<Long> typedQuery = entityManager.createQuery(query, Long.class);
        typedQuery.setParameter("hotelId", hotelId);
        typedQuery.setParameter("categoryId", categoryId);
        typedQuery.setParameter("roomType", roomType);
        typedQuery.setParameter("dateArrival", dateArrival);
        typedQuery.setParameter("dateLeaving", dateLeaving);
        return typedQuery;
    }
   
}
