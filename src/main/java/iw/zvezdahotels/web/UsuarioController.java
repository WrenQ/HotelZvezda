package iw.zvezdahotels.web;
import iw.zvezdahotels.Usuario;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Usuario.class)
@Controller
@RequestMapping("/usuarios")
@RooWebScaffold(path = "usuarios", formBackingObject = Usuario.class)
public class UsuarioController {
}
