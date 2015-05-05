package iw.zvezdahotels.web;
import iw.zvezdahotels.Hotel;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Hotel.class)
@Controller
@RequestMapping("/hotels")
@RooWebScaffold(path = "hotels", formBackingObject = Hotel.class)
public class HotelController {
}
