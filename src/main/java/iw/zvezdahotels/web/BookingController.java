package iw.zvezdahotels.web;
import iw.zvezdahotels.Booking;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Booking.class)
@Controller
@RequestMapping("/bookings")
@RooWebScaffold(path = "bookings", formBackingObject = Booking.class)
public class BookingController {
}
