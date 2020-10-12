package dto;
import java.io.Serializable;
/**
 *
 * @author harish
 */
public class AdminDto {
    private String adminId;
    private String fName;
    private String lName;
    private String designation;
    private String mobile;
    private String email;
    private String password;

    public AdminDto() {
    }

    public AdminDto(String adminId, String fName, String lName, String designation, String mobile, String email, String password) {
        this.adminId = adminId;
        this.fName = fName;
        this.lName = lName;
        this.designation = designation;
        this.mobile = mobile;
        this.email = email;
        this.password = password;
    }

    public String getAdminId() {
        return adminId;
    }

    public void setAdminId(String adminId) {
        this.adminId = adminId;
    }

    public String getfName() {
        return fName;
    }

    public void setfName(String fName) {
        this.fName = fName;
    }

    public String getlName() {
        return lName;
    }

    public void setlName(String lName) {
        this.lName = lName;
    }

    public String getDesignation() {
        return designation;
    }

    public void setDesignation(String designation) {
        this.designation = designation;
    }

    public String getMobile() {
        return mobile;
    }

    public void setMobile(String mobile) {
        this.mobile = mobile;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }
    
    
}
