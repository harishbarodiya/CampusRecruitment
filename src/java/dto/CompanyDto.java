package dto;
import java.io.Serializable;
/**
 *
 * @author harish
 */
public class CompanyDto {
    private String comName;
    private String userId;
    private String branch;
    private String hrName;
    private String mobile;
    private String email;
    private String password;

    public CompanyDto() {
    }

    public CompanyDto(String comName, String userId, String branch, String hrName, String mobile, String email, String password) {
        this.comName = comName;
        this.userId = userId;
        this.branch = branch;
        this.hrName = hrName;
        this.mobile = mobile;
        this.email = email;
        this.password = password;
    }

    public String getComName() {
        return comName;
    }

    public void setComName(String comName) {
        this.comName = comName;
    }

    public String getUserId() {
        return userId;
    }

    public void setUserId(String userId) {
        this.userId = userId;
    }

    public String getBranch() {
        return branch;
    }

    public void setBranch(String branch) {
        this.branch = branch;
    }

    public String getHrName() {
        return hrName;
    }

    public void setHrName(String hrName) {
        this.hrName = hrName;
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
