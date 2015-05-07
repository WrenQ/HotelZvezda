// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package iw.zvezdahotels;

import iw.zvezdahotels.Usuario;
import iw.zvezdahotels.UsuarioDataOnDemand;
import java.security.SecureRandom;
import java.util.ArrayList;
import java.util.Calendar;
import java.util.Date;
import java.util.GregorianCalendar;
import java.util.Iterator;
import java.util.List;
import java.util.Random;
import javax.validation.ConstraintViolation;
import javax.validation.ConstraintViolationException;
import org.springframework.stereotype.Component;

privileged aspect UsuarioDataOnDemand_Roo_DataOnDemand {
    
    declare @type: UsuarioDataOnDemand: @Component;
    
    private Random UsuarioDataOnDemand.rnd = new SecureRandom();
    
    private List<Usuario> UsuarioDataOnDemand.data;
    
    public Usuario UsuarioDataOnDemand.getNewTransientUsuario(int index) {
        Usuario obj = new Usuario();
        setUDateRegistration(obj, index);
        setUEmail(obj, index);
        setUEnabled(obj, index);
        setUFullName(obj, index);
        setUPassword(obj, index);
        setUUsername(obj, index);
        return obj;
    }
    
    public void UsuarioDataOnDemand.setUDateRegistration(Usuario obj, int index) {
        Date uDateRegistration = new GregorianCalendar(Calendar.getInstance().get(Calendar.YEAR), Calendar.getInstance().get(Calendar.MONTH), Calendar.getInstance().get(Calendar.DAY_OF_MONTH), Calendar.getInstance().get(Calendar.HOUR_OF_DAY), Calendar.getInstance().get(Calendar.MINUTE), Calendar.getInstance().get(Calendar.SECOND) + new Double(Math.random() * 1000).intValue()).getTime();
        obj.setUDateRegistration(uDateRegistration);
    }
    
    public void UsuarioDataOnDemand.setUEmail(Usuario obj, int index) {
        String uEmail = "foo" + index + "@bar.com";
        obj.setUEmail(uEmail);
    }
    
    public void UsuarioDataOnDemand.setUEnabled(Usuario obj, int index) {
        Boolean uEnabled = Boolean.TRUE;
        obj.setUEnabled(uEnabled);
    }
    
    public void UsuarioDataOnDemand.setUFullName(Usuario obj, int index) {
        String uFullName = "uFullName_" + index;
        obj.setUFullName(uFullName);
    }
    
    public void UsuarioDataOnDemand.setUPassword(Usuario obj, int index) {
        String uPassword = "uPassword_" + index;
        obj.setUPassword(uPassword);
    }
    
    public void UsuarioDataOnDemand.setUUsername(Usuario obj, int index) {
        String uUsername = "uUsername_" + index;
        obj.setUUsername(uUsername);
    }
    
    public Usuario UsuarioDataOnDemand.getSpecificUsuario(int index) {
        init();
        if (index < 0) {
            index = 0;
        }
        if (index > (data.size() - 1)) {
            index = data.size() - 1;
        }
        Usuario obj = data.get(index);
        Long id = obj.getId();
        return Usuario.findUsuario(id);
    }
    
    public Usuario UsuarioDataOnDemand.getRandomUsuario() {
        init();
        Usuario obj = data.get(rnd.nextInt(data.size()));
        Long id = obj.getId();
        return Usuario.findUsuario(id);
    }
    
    public boolean UsuarioDataOnDemand.modifyUsuario(Usuario obj) {
        return false;
    }
    
    public void UsuarioDataOnDemand.init() {
        int from = 0;
        int to = 10;
        data = Usuario.findUsuarioEntries(from, to);
        if (data == null) {
            throw new IllegalStateException("Find entries implementation for 'Usuario' illegally returned null");
        }
        if (!data.isEmpty()) {
            return;
        }
        
        data = new ArrayList<Usuario>();
        for (int i = 0; i < 10; i++) {
            Usuario obj = getNewTransientUsuario(i);
            try {
                obj.persist();
            } catch (final ConstraintViolationException e) {
                final StringBuilder msg = new StringBuilder();
                for (Iterator<ConstraintViolation<?>> iter = e.getConstraintViolations().iterator(); iter.hasNext();) {
                    final ConstraintViolation<?> cv = iter.next();
                    msg.append("[").append(cv.getRootBean().getClass().getName()).append(".").append(cv.getPropertyPath()).append(": ").append(cv.getMessage()).append(" (invalid value = ").append(cv.getInvalidValue()).append(")").append("]");
                }
                throw new IllegalStateException(msg.toString(), e);
            }
            obj.flush();
            data.add(obj);
        }
    }
    
}
