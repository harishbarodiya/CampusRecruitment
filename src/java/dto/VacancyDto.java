package dto;
import java.io.Serializable;
/**
 *  
 * @author harish
 */
public class VacancyDto {
    private String vacancyId;
    private String companyId;
    private String profile;
    private String courses[];
    private String salary;
    private String lastDate;
    private String location;
    private String plcmntTalk;
    private String test;
    private String about;
    private String details;
    private String link;

    public VacancyDto() {
    }

    public VacancyDto(String vacancyId, String companyId, String profile, String[] courses, String salary, String lastDate, String location, String plcmntTalk, String test, String about, String details, String link) {
        this.vacancyId = vacancyId;
        this.companyId = companyId;
        this.profile = profile;
        this.courses = courses;
        this.salary = salary;
        this.lastDate = lastDate;
        this.location = location;
        this.plcmntTalk = plcmntTalk;
        this.test = test;
        this.about = about;
        this.details = details;
        this.link = link;
    }

    public String getVacancyId() {
        return vacancyId;
    }

    public void setVacancyId(String vacancyId) {
        this.vacancyId = vacancyId;
    }

    public String getCompanyId() {
        return companyId;
    }

    public void setCompanyId(String companyId) {
        this.companyId = companyId;
    }

    public String getProfile() {
        return profile;
    }

    public void setProfile(String profile) {
        this.profile = profile;
    }

    public String[] getCourses() {
        return courses;
    }

    public void setCourses(String[] courses) {
        this.courses = courses;
    }

    public String getSalary() {
        return salary;
    }

    public void setSalary(String salary) {
        this.salary = salary;
    }

    public String getLastDate() {
        return lastDate;
    }

    public void setLastDate(String lastDate) {
        this.lastDate = lastDate;
    }

    public String getLocation() {
        return location;
    }

    public void setLocation(String location) {
        this.location = location;
    }

    public String getPlcmntTalk() {
        return plcmntTalk;
    }

    public void setPlcmntTalk(String plcmntTalk) {
        this.plcmntTalk = plcmntTalk;
    }

    public String getTest() {
        return test;
    }

    public void setTest(String test) {
        this.test = test;
    }

    public String getAbout() {
        return about;
    }

    public void setAbout(String about) {
        this.about = about;
    }

    public String getDetails() {
        return details;
    }

    public void setDetails(String details) {
        this.details = details;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }

}
