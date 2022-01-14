package com.accede.angel.admin.model;

import java.io.Serializable;
import java.util.Date;
import java.util.Objects;
import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.FetchType;
import javax.persistence.GeneratedValue;
import javax.persistence.Id;
import javax.persistence.OneToOne;
import javax.persistence.Temporal;
import org.hibernate.annotations.Type;

@Entity
public class Admin implements Serializable {

    /**
     *
     */
    @Id
    @GeneratedValue
    private int adminId;

    private String adminEmail;
    private String adminName;
    private String imagepath;
    private String imagename = "admin.jpg";
    private String adminMobileNo;
    private String adminPassword;
    private String msgKey;
    private String receptionPassword;
    @Type(type = "org.hibernate.type.NumericBooleanType")
    private boolean Status = true;

    public int getAdminId() {
        return adminId;
    }

    public void setAdminId(int adminId) {
        this.adminId = adminId;
    }

    public String getAdminEmail() {
        return adminEmail;
    }

    public void setAdminEmail(String adminEmail) {
        this.adminEmail = adminEmail;
    }

    public String getImagename() {
        return imagename;
    }

    public void setImagename(String imagename) {
        this.imagename = imagename;
    }

    public String getAdminName() {
        return adminName;
    }

    public void setAdminName(String adminName) {
        this.adminName = adminName;
    }

    public String getAdminMobileNo() {
        return adminMobileNo;
    }

    public void setAdminMobileNo(String adminMobileNo) {
        this.adminMobileNo = adminMobileNo;
    }

    public String getImagepath() {
        return imagepath;
    }

    public void setImagepath(String imagepath) {
        this.imagepath = imagepath;
    }

    public String getAdminPassword() {
        return adminPassword;
    }

    public void setAdminPassword(String adminPassword) {
        this.adminPassword = adminPassword;
    }

    public String getReceptionPassword() {
        return receptionPassword;
    }

    public void setReceptionPassword(String receptionPassword) {
        this.receptionPassword = receptionPassword;
    }

    public int getOtp() {
        return otp;
    }

    public void setOtp(int otp) {
        this.otp = otp;
    }

    public Branch getAdminOfBranch() {
        return adminOfBranch;
    }

    public void setAdminOfBranch(Branch adminOfBranch) {
        this.adminOfBranch = adminOfBranch;
    }

    private int otp;
    @Temporal(javax.persistence.TemporalType.DATE)
    private Date registeredDate;

    public Date getRegisteredDate() {
        return registeredDate;
    }

    public void setRegisteredDate(Date registeredDate) {
        this.registeredDate = registeredDate;
    }
    @OneToOne(fetch = FetchType.EAGER)
    private Branch adminOfBranch;

    public boolean isStatus() {
        return Status;
    }

    public void setStatus(boolean Status) {
        this.Status = Status;
    }

    public String getMsgKey() {
        return msgKey;
    }

    public void setMsgKey(String msgKey) {
        this.msgKey = msgKey;
    }

    
    
    @Override
    public String toString() {
        return "Admin{" + "adminId=" + adminId + ", adminEmail=" + adminEmail + ", adminName=" + adminName + ", imagepath=" + imagepath + ", imagename=" + imagename + ", adminMobileNo=" + adminMobileNo + ", adminPassword=" + adminPassword + ", receptionPassword=" + receptionPassword + ", Status=" + Status + ", otp=" + otp + ", registeredDate=" + registeredDate + ", adminOfBranch=" + adminOfBranch + '}';
    }

    @Override
    public int hashCode() {
        int hash = 7;
        hash = 17 * hash + this.adminId;
        hash = 17 * hash + Objects.hashCode(this.adminEmail);
        hash = 17 * hash + Objects.hashCode(this.adminName);
        hash = 17 * hash + Objects.hashCode(this.imagepath);
        hash = 17 * hash + Objects.hashCode(this.imagename);
        hash = 17 * hash + Objects.hashCode(this.adminMobileNo);
        hash = 17 * hash + Objects.hashCode(this.adminPassword);
        hash = 17 * hash + Objects.hashCode(this.msgKey);
        hash = 17 * hash + Objects.hashCode(this.receptionPassword);
        hash = 17 * hash + (this.Status ? 1 : 0);
        hash = 17 * hash + this.otp;
        hash = 17 * hash + Objects.hashCode(this.registeredDate);
        hash = 17 * hash + Objects.hashCode(this.adminOfBranch);
        return hash;
    }

    @Override
    public boolean equals(Object obj) {
        if (obj == null) {
            return false;
        }
        if (getClass() != obj.getClass()) {
            return false;
        }
        final Admin other = (Admin) obj;
        if (this.adminId != other.adminId) {
            return false;
        }
        if (!Objects.equals(this.adminEmail, other.adminEmail)) {
            return false;
        }
        if (!Objects.equals(this.adminName, other.adminName)) {
            return false;
        }
        if (!Objects.equals(this.imagepath, other.imagepath)) {
            return false;
        }
        if (!Objects.equals(this.imagename, other.imagename)) {
            return false;
        }
        if (!Objects.equals(this.adminMobileNo, other.adminMobileNo)) {
            return false;
        }
        if (!Objects.equals(this.adminPassword, other.adminPassword)) {
            return false;
        }
        if (!Objects.equals(this.msgKey, other.msgKey)) {
            return false;
        }
        if (!Objects.equals(this.receptionPassword, other.receptionPassword)) {
            return false;
        }
        if (this.Status != other.Status) {
            return false;
        }
        if (this.otp != other.otp) {
            return false;
        }
        if (!Objects.equals(this.registeredDate, other.registeredDate)) {
            return false;
        }
        if (!Objects.equals(this.adminOfBranch, other.adminOfBranch)) {
            return false;
        }
        return true;
    }
    
    
    
    

}
