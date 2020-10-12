package dto;
import java.io.Serializable;
/**
 *
 * @author harish
 */
public class InternshipDto {
    private String internshipId;
    private String companyId;
    private String courses[];
    private String profile;
    private String type;
    private String location;
    private String stipend;
    private String lastDate;
    private String duration;
    private String openings;
    private String requirements;
    private String responsibilities;
    private String link;

    public InternshipDto() {
    }

    public InternshipDto(String internshipId, String companyId, String[] courses, String profile, String type, String location, String stipend, String lastDate, String duration, String openings, String requirements, String responsibilities, String link) {
        this.internshipId = internshipId;
        this.companyId = companyId;
        this.courses = courses;
        this.profile = profile;
        this.type = type;
        this.location = location;
        this.stipend = stipend;
        this.lastDate = lastDate;
        this.duration = duration;
        this.openings = openings;
        this.requirements = requirements;
        this.responsibilities = responsibilities;
        this.link = link;
    }

    public String getInternshipId() {
        return internshipId;
    }

    public void setInternshipId(String internshipId) {
        this.internshipId = internshipId;
    }

    

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    public String[] getCourses() {
        return courses;
    }

    public void setCourses(String[] courses) {
        this.courses = courses;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String getType() {
        return type;
    }

    public void setType(String type) {
        this.type = type;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getStipend() {
        return stipend;
    }

    public void setStipend(String stipend) {
        this.stipend = stipend;
    }

    public String getLastDate() {
        return lastDate;
    }

    public void setLastDate(String lastDate) {
        this.lastDate = lastDate;
    }

    public String getDuration() {
        return duration;
    }

    public void setDuration(String duration) {
        this.duration = duration;
    }

    public String getOpenings() {
        return openings;
    }

    public void setOpenings(String openings) {
        this.openings = openings;
    }

    public String getRequirements() {
        return requirements;
    }

    public void setRequirements(String requirements) {
        this.requirements = requirements;
    }

    public String getResponsibilities() {
        return responsibilities;
    }

    public void setResponsibilities(String responsibilities) {
        this.responsibilities = responsibilities;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

    
    
}
