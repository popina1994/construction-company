/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package student;

import java.io.Serializable;
import javax.persistence.Basic;
import javax.persistence.Column;
import javax.persistence.Entity;
import javax.persistence.Id;
import javax.persistence.NamedQueries;
import javax.persistence.NamedQuery;
import javax.persistence.Table;
import javax.xml.bind.annotation.XmlRootElement;

/**
 *
 * @author popina
 */
@Entity
@Table(name = "I", catalog = "Zadatak4", schema = "dbo")
@XmlRootElement
@NamedQueries({
    @NamedQuery(name = "I.findAll", query = "SELECT i FROM I i")
    , @NamedQuery(name = "I.findByISif", query = "SELECT i FROM I i WHERE i.iSif = :iSif")
    , @NamedQuery(name = "I.findByNaziv", query = "SELECT i FROM I i WHERE i.naziv = :naziv")
    , @NamedQuery(name = "I.findByStatus", query = "SELECT i FROM I i WHERE i.status = :status")
    , @NamedQuery(name = "I.findByDrzava", query = "SELECT i FROM I i WHERE i.drzava = :drzava")})
public class I implements Serializable {

    private static final long serialVersionUID = 1L;
    @Id
    @Basic(optional = false)
    @Column(name = "I_SIF")
    private Integer iSif;
    @Basic(optional = false)
    @Column(name = "NAZIV")
    private String naziv;
    @Basic(optional = false)
    @Column(name = "STATUS")
    private Character status;
    @Basic(optional = false)
    @Column(name = "DRZAVA")
    private String drzava;

    public I() {
    }

    public I(Integer iSif) {
        this.iSif = iSif;
    }

    public I(Integer iSif, String naziv, Character status, String drzava) {
        this.iSif = iSif;
        this.naziv = naziv;
        this.status = status;
        this.drzava = drzava;
    }

    public Integer getISif() {
        return iSif;
    }

    public void setISif(Integer iSif) {
        this.iSif = iSif;
    }

    public String getNaziv() {
        return naziv;
    }

    public void setNaziv(String naziv) {
        this.naziv = naziv;
    }

    public Character getStatus() {
        return status;
    }

    public void setStatus(Character status) {
        this.status = status;
    }

    public String getDrzava() {
        return drzava;
    }

    public void setDrzava(String drzava) {
        this.drzava = drzava;
    }

    @Override
    public int hashCode() {
        int hash = 0;
        hash += (iSif != null ? iSif.hashCode() : 0);
        return hash;
    }

    @Override
    public boolean equals(Object object) {
        // TODO: Warning - this method won't work in the case the id fields are not set
        if (!(object instanceof I)) {
            return false;
        }
        I other = (I) object;
        if ((this.iSif == null && other.iSif != null) || (this.iSif != null && !this.iSif.equals(other.iSif))) {
            return false;
        }
        return true;
    }

    @Override
    public String toString() {
        return "student.I[ iSif=" + iSif + " ]";
    }
    
}
