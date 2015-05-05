package iw.zvezdahotels.web;
import iw.zvezdahotels.Category;
import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Category.class)
@Controller
@RequestMapping("/categorys")
@RooWebScaffold(path = "categorys", formBackingObject = Category.class)
public class CategoryController {
}
