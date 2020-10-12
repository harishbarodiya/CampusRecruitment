package dto;
import java.io.Serializable;
/**
 *
 * @author harish
 */
public class CounterDto {
    private String recruiter;
    private String vacancy;
    private String placed;
    private String faculty;

    public CounterDto() {
    }

    public CounterDto(String recruiter, String vacancy, String placed, String faculty) {
        this.recruiter = recruiter;
        this.vacancy = vacancy;
        this.placed = placed;
        this.faculty = faculty;
    }

    public String getRecruiter() {
        return recruiter;
    }

    public void setRecruiter(String recruiter) {
        this.recruiter = recruiter;
    }

    public String getVacancy() {
        return vacancy;
    }

    public void setVacancy(String vacancy) {
        this.vacancy = vacancy;
    }

    public String getPlaced() {
        return placed;
    }

    public void setPlaced(String placed) {
        this.placed = placed;
    }

    public String getFaculty() {
        return faculty;
    }

    public void setFaculty(String faculty) {
        this.faculty = faculty;
    }

    
    
    
}
