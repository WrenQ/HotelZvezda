// WARNING: DO NOT EDIT THIS FILE. THIS FILE IS MANAGED BY SPRING ROO.
// You may push code into the target .java compilation unit if you wish to edit any member(s).

package iw.zvezdahotels.usuario;

import iw.zvezdahotels.usuario.UserRole;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.Version;

privileged aspect UserRole_Roo_Jpa_Entity {
    
    declare @type: UserRole: @Entity;
    
    @Id
    @GeneratedValue(strategy = GenerationType.AUTO)
    @Column(name = "id")
    private Long UserRole.id;
    
    @Version
    @Column(name = "version")
    private Integer UserRole.version;
    
    public Long UserRole.getId() {
        return this.id;
    }
    
    public void UserRole.setId(Long id) {
        this.id = id;
    }
    
    public Integer UserRole.getVersion() {
        return this.version;
    }
    
    public void UserRole.setVersion(Integer version) {
        this.version = version;
    }
    
}
