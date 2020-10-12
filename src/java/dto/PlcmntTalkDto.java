package dto;
import java.io.Serializable;
/**
 *
 * @author harish
 */
public class PlcmntTalkDto {
    private String vacancy_id;
    private String date;
    private String time;
    private String venue;
    private String address;
    private String link;

    public PlcmntTalkDto() {
    }

    public PlcmntTalkDto(String vacancy_id, String date, String time, String venue, String address, String link) {
        this.vacancy_id = vacancy_id;
        this.date = date;
        this.time = time;
        this.venue = venue;
        this.address = address;
        this.link = link;
    }

    public String getVacancy_id() {
        return vacancy_id;
    }

    public void setVacancy_id(String vacancy_id) {
        this.vacancy_id = vacancy_id;
    }

    public String getDate() {
        return date;
    }

    public void setDate(String date) {
        this.date = date;
    }

    public String getTime() {
        return time;
    }

    public void setTime(String time) {
        this.time = time;
    }

    public String getVenue() {
        return venue;
    }

    public void setVenue(String venue) {
        this.venue = venue;
    }

    public String getAddress() {
        return address;
    }

    public void setAddress(String address) {
        this.address = address;
    }

    public String getLink() {
        return link;
    }

    public void setLink(String link) {
        this.link = link;
    }
    
}
