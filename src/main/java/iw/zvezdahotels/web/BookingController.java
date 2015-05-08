package iw.zvezdahotels.web;
import iw.zvezdahotels.Booking;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Booking.class)
@Controller
@RequestMapping("/bookings")
@RooWebScaffold(path = "bookings", formBackingObject = Booking.class)
public class BookingController {

	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Booking booking, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, booking);
            return "bookings/create";
        }
        uiModel.asMap().clear();
        booking.persist();
        return "redirect:/bookings/" + encodeUrlPathSegment(booking.getId().toString(), httpServletRequest);
    }
}
