package iw.zvezdahotels.web;
import iw.zvezdahotels.usuario.UserRole;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = UserRole.class)
@Controller
@RequestMapping("/userroles")
@RooWebScaffold(path = "userroles", formBackingObject = UserRole.class)
public class UserRoleController {
}
