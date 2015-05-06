// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package iw.zvezdahotels.web;

import iw.zvezdahotels.Booking;
import iw.zvezdahotels.Room;
import iw.zvezdahotels.Usuario;
import iw.zvezdahotels.web.BookingController;
import java.io.UnsupportedEncodingException;
import java.util.ArrayList;
import java.util.List;
import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.util.UriUtils;
import org.springframework.web.util.WebUtils;

privileged aspect BookingController_Roo_Controller {
    
    @RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String BookingController.create(@Valid Booking booking, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, booking);
            return "bookings/create";
        }
        uiModel.asMap().clear();
        booking.persist();
        return "redirect:/bookings/" + encodeUrlPathSegment(booking.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(params = "form", produces = "text/html")
    public String BookingController.createForm(Model uiModel) {
        populateEditForm(uiModel, new Booking());
        List<String[]> dependencies = new ArrayList<String[]>();
        if (Usuario.countUsuarios() == 0) {
            dependencies.add(new String[] { "bUser", "usuarios" });
        }
        if (Room.countRooms() == 0) {
            dependencies.add(new String[] { "bRoom", "rooms" });
        }
        uiModel.addAttribute("dependencies", dependencies);
        return "bookings/create";
    }
    
    @RequestMapping(value = "/{id}", produces = "text/html")
    public String BookingController.show(@PathVariable("id") Long id, Model uiModel) {
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("booking", Booking.findBooking(id));
        uiModel.addAttribute("itemId", id);
        return "bookings/show";
    }
    
    @RequestMapping(produces = "text/html")
    public String BookingController.list(@RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, @RequestParam(value = "sortFieldName", required = false) String sortFieldName, @RequestParam(value = "sortOrder", required = false) String sortOrder, Model uiModel) {
        if (page != null || size != null) {
            int sizeNo = size == null ? 10 : size.intValue();
            final int firstResult = page == null ? 0 : (page.intValue() - 1) * sizeNo;
            uiModel.addAttribute("bookings", Booking.findBookingEntries(firstResult, sizeNo, sortFieldName, sortOrder));
            float nrOfPages = (float) Booking.countBookings() / sizeNo;
            uiModel.addAttribute("maxPages", (int) ((nrOfPages > (int) nrOfPages || nrOfPages == 0.0) ? nrOfPages + 1 : nrOfPages));
        } else {
            uiModel.addAttribute("bookings", Booking.findAllBookings(sortFieldName, sortOrder));
        }
        addDateTimeFormatPatterns(uiModel);
        return "bookings/list";
    }
    
    @RequestMapping(method = RequestMethod.PUT, produces = "text/html")
    public String BookingController.update(@Valid Booking booking, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) {
            populateEditForm(uiModel, booking);
            return "bookings/update";
        }
        uiModel.asMap().clear();
        booking.merge();
        return "redirect:/bookings/" + encodeUrlPathSegment(booking.getId().toString(), httpServletRequest);
    }
    
    @RequestMapping(value = "/{id}", params = "form", produces = "text/html")
    public String BookingController.updateForm(@PathVariable("id") Long id, Model uiModel) {
        populateEditForm(uiModel, Booking.findBooking(id));
        return "bookings/update";
    }
    
    @RequestMapping(value = "/{id}", method = RequestMethod.DELETE, produces = "text/html")
    public String BookingController.delete(@PathVariable("id") Long id, @RequestParam(value = "page", required = false) Integer page, @RequestParam(value = "size", required = false) Integer size, Model uiModel) {
        Booking booking = Booking.findBooking(id);
        booking.remove();
        uiModel.asMap().clear();
        uiModel.addAttribute("page", (page == null) ? "1" : page.toString());
        uiModel.addAttribute("size", (size == null) ? "10" : size.toString());
        return "redirect:/bookings";
    }
    
    void BookingController.addDateTimeFormatPatterns(Model uiModel) {
        uiModel.addAttribute("booking_bdatebooking_date_format", "dd-MM-yyyy hh:mm:ss");
        uiModel.addAttribute("booking_bdatecheckin_date_format", "dd-MM-yyyy hh:mm:ss");
        uiModel.addAttribute("booking_bdatecheckout_date_format", "dd-MM-yyyy hh:mm:ss");
    }
    
    void BookingController.populateEditForm(Model uiModel, Booking booking) {
        uiModel.addAttribute("booking", booking);
        addDateTimeFormatPatterns(uiModel);
        uiModel.addAttribute("rooms", Room.findAllRooms());
        uiModel.addAttribute("usuarios", Usuario.findAllUsuarios());
    }
    
    String BookingController.encodeUrlPathSegment(String pathSegment, HttpServletRequest httpServletRequest) {
        String enc = httpServletRequest.getCharacterEncoding();
        if (enc == null) {
            enc = WebUtils.DEFAULT_CHARACTER_ENCODING;
        }
        try {
            pathSegment = UriUtils.encodePathSegment(pathSegment, enc);
        } catch (UnsupportedEncodingException uee) {}
        return pathSegment;
    }
    
}