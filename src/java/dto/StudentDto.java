package dto;
import java.io.Serializable;
/**
 *
 * @author harish
 */
public class StudentDto {
    private String fName;
    private String lName;
    private String enrollment;
    private String courseId;
    private String mobile;
    private String email;
    private String password;

    public StudentDto() {
    }

    public StudentDto(String fName, String lName, String enrollment, String courseId, String mobile, String email, String password) {
        this.fName = fName;
        this.lName = lName;
        this.enrollment = enrollment;
        this.courseId = courseId;
        this.mobile = mobile;
        this.email = email;
        this.password = password;
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

    public String getEnrollment() {
        return enrollment;
    }

    public void setEnrollment(String enrollment) {
        this.enrollment = enrollment;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
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
