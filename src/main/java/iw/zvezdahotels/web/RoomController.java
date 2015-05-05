package iw.zvezdahotels.web;
import iw.zvezdahotels.Room;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Room.class)
@Controller
@RequestMapping("/rooms")
@RooWebScaffold(path = "rooms", formBackingObject = Room.class)
public class RoomController {
}
