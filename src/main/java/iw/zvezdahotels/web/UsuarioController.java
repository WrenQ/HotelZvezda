package iw.zvezdahotels.web;
import java.io.UnsupportedEncodingException;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Calendar;
import java.util.Date;
import java.util.HashSet;
import java.util.Set;

import iw.zvezdahotels.Usuario;
import iw.zvezdahotels.usuario.UserRole;

import javax.servlet.http.HttpServletRequest;
import javax.validation.Valid;

import org.springframework.roo.addon.web.mvc.controller.json.RooWebJson;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.roo.addon.web.mvc.controller.scaffold.RooWebScaffold;

@RooWebJson(jsonObject = Usuario.class)
@Controller
@RequestMapping("/usuarios")
@RooWebScaffold(path = "usuarios", formBackingObject = Usuario.class)
public class UsuarioController {

	private String sha256(String password) throws NoSuchAlgorithmException, UnsupportedEncodingException{
		MessageDigest digest = MessageDigest.getInstance("SHA-256");
		digest.update(password.getBytes("UTF-8"));
		byte[] hash = digest.digest();
		StringBuffer stringBuffer = new StringBuffer();
		for(int i = 0; i < hash.length; i++)
			stringBuffer.append(Integer.toString((hash[i] & 0xff) + 0x100, 16).substring(1));
		return stringBuffer.toString();
	}
	
	@RequestMapping(method = RequestMethod.POST, produces = "text/html")
    public String create(@Valid Usuario usuario, BindingResult bindingResult, Model uiModel, HttpServletRequest httpServletRequest) {
        if (bindingResult.hasErrors()) 
            populateEditForm(uiModel, usuario);
        try{
        	String hashedPassword = sha256(usuario.getPassword());
        	usuario.setPassword(hashedPassword);
        	usuario.setEnabled(true);
        	Set<UserRole> userRoles = new HashSet<UserRole>();
        	userRoles.add(UserRole.findUserRole((long)3)); //Se asigna automáticamente rol de usuario regular 'ROLE_USER'
        	usuario.setRoles(userRoles);
        	usuario.setDateRegistration(Calendar.getInstance().getTime());
	        uiModel.asMap().clear();
	        usuario.persist();
	        return "redirect:/usuarios/" + encodeUrlPathSegment(usuario.getId().toString(), httpServletRequest);
        }catch(NoSuchAlgorithmException e){}
        catch(UnsupportedEncodingException e){}
        
        return "usuarios/create";
	}
}
