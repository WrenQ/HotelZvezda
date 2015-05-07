package iw.zvezdahotels.web;
import java.util.Date;

import iw.zvezdahotels.Booking;
import iw.zvezdahotels.Category;
import iw.zvezdahotels.Hotel;
import iw.zvezdahotels.room.RoomType;

import org.springframework.format.annotation.DateTimeFormat;
import org.springframework.format.annotation.DateTimeFormat.ISO;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Hotel.class)
@Controller
@RequestMapping("/hotels")
@RooWebScaffold(path = "hotels", formBackingObject = Hotel.class)
public class HotelController {
	
	@RequestMapping(params = { "find=ByAvailableRooms", "form" }, method = RequestMethod.GET)
	public String findHotelsByAvailableRoomsForm(Model uiModel){
		populateEditForm(uiModel, new Hotel());
		return "hotels/findHotelsByAvailableRooms";
	}
	
	@RequestMapping(params = "find=ByAvailableRooms", method = RequestMethod.GET)
	public String findHotelsByAvailableRooms(@RequestParam("dateArrival") @DateTimeFormat(iso = ISO.DATE) Date dateArrival,
			@RequestParam("dateLeaving") @DateTimeFormat(iso = ISO.DATE) Date dateLeaving,
			@RequestParam("hotelId") long hotelId, @RequestParam("categoryId") long categoryId, @RequestParam("roomType") RoomType roomType,
			@RequestParam(required = false, defaultValue = "false") Boolean extraBed, Model uiModel){
		Long availableRoomsN = Hotel.findHotelsByAvailableRooms(hotelId, categoryId, roomType).getSingleResult() -
				Hotel.findHotelsByBookings(hotelId, categoryId, roomType, dateArrival, dateLeaving).getSingleResult();
		if(availableRoomsN > 0){
			uiModel.addAttribute("category", Category.findCategory(categoryId).getCName());
			uiModel.addAttribute("roomtype", roomType.name());
			uiModel.addAttribute("availableRooms", availableRoomsN);
		} else if (roomType.name().equals("SINGLE")){
			Long availableRoomsN2 = Hotel.findHotelsByAvailableRooms(hotelId, categoryId, RoomType.DOBLE).getSingleResult() -
					Hotel.findHotelsByBookings(hotelId, categoryId, roomType, dateArrival, dateLeaving).getSingleResult();
			if(availableRoomsN2 > 0){
				uiModel.addAttribute("doubleAvailable", true);
				uiModel.addAttribute("category", Category.findCategory(categoryId).getCName());
				uiModel.addAttribute("roomtype", roomType.name());
				uiModel.addAttribute("roomTypeAlt", RoomType.DOBLE.name());
				uiModel.addAttribute("availableRooms", availableRoomsN2);
			} else {
				uiModel.addAttribute("notAvailability", true);
			}
		}
		return "hotels/availableRooms";
	}
	
	public double getPricefromBooking(Booking booking) {
        double price = 0;
        double categoryFactor = booking.getBRoom().getRCategory().getCPriceFactor();
        Hotel hotelBooking = booking.getBRoom().getRHotel();
        if (booking.getBRoom().getRType() == RoomType.SINGLE)
        	price = booking.getBDays() * (hotelBooking.getHPricePerSingle() * categoryFactor);
        else 
        	price = booking.getBDays() * (hotelBooking.getHPricePerDouble() * categoryFactor);
        if(booking.getBWithExtraBed())
        	price += hotelBooking.getHPricePerExtraBed();
        return price;
    }
	
	private void populateFormEdit(Model uiModel, Hotel hotel){
		
	}
	
}
