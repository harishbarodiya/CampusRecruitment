package dto;
import java.io.Serializable;

/**
 *
 * @author harish
 */
public class CourseDto {
    private String courseId;
    private String courseName;
    private String specialization;

    public CourseDto() {
    }

    public CourseDto(String courseId, String courseName, String specialization) {
        this.courseId = courseId;
        this.courseName = courseName;
        this.specialization = specialization;
    }

    public String getCourseId() {
        return courseId;
    }

    public void setCourseId(String courseId) {
        this.courseId = courseId;
    }

    public String getCourseName() {
        return courseName;
    }

    public void setCourseName(String courseName) {
        this.courseName = courseName;
    }

    public String getSpecialization() {
        return specialization;
    }

    public void setSpecialization(String specialization) {
        this.specialization = specialization;
    }
    
}
