package dao;
import dbconn.DBConnection;
import dto.InternshipDto;
import dto.PlcmntTalkDto;
import dto.StudentDto;
import dto.VacancyDto;
import java.sql.*;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author harish
 */
public class StudentDao {
    public String verifyStudent(String userId, String password) throws SQLException, ClassNotFoundException{
        String errorMsg;
        Connection conn = DBConnection.getConnect();
        String query = "SELECT * from student where enrollment=? and password=? ";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, userId);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
           if(rs.getString(8).equals("approved"))
               errorMsg = null;
           else 
               errorMsg = "Your account is not approved yet";
          }
        else 
            errorMsg = "Incorrect User Id or Password";
        conn.close();
        return errorMsg;   
    }
    public String registerStudent(StudentDto sDto) {
        String message = null;
        try {
            Connection conn = DBConnection.getConnect();
            String query = "INSERT into student values(?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, sDto.getEnrollment());
            pstmt.setString(2, sDto.getfName());
            pstmt.setString(3, sDto.getlName());
            pstmt.setString(4, sDto.getCourseId());
            pstmt.setString(5, sDto.getMobile());
            pstmt.setString(6, sDto.getEmail());
            pstmt.setString(7, sDto.getPassword());
            pstmt.setString(8, "unapproved");
            int i = pstmt.executeUpdate();
            conn.close();
            if(i != 0){
                message = "Successfully Requested to Approve. Wait for approvement...!!! ";
            }
            else
                message = "Something went wrong...!!! ";
        } catch (SQLException ex) {
            if(ex.getMessage().startsWith("Duplicate entry"))
                message = "You have already registered";
        }
        return message;
    }
    public static String getName(String enrollment) throws SQLException{
         String name=null;
        Connection conn = DBConnection.getConnect();
        String query = "SELECT first_name from student where enrollment=? ";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, enrollment);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next())
            name = rs.getString(1);   
        return name;
    }
    public static ArrayList<VacancyDto> getVacancies( String enrollment) throws SQLException{
        ArrayList<VacancyDto> vacancies = new ArrayList<>();
        Connection conn = DBConnection.getConnect();
        String query = "SELECT vacancy.* FROM `vacancy` INNER JOIN vacancyfor ON vacancy.vacancy_id=vacancyfor.vacancy_id INNER JOIN student ON student.courseId=vacancyfor.course_id WHERE enrollment=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, enrollment);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            VacancyDto vacancy = new VacancyDto();
            vacancy.setVacancyId(rs.getString(1));
            vacancy.setCompanyId(rs.getString(2));
            vacancy.setProfile(rs.getString(3));
            vacancy.setSalary(rs.getString(4));
            vacancy.setLastDate(rs.getString(5));
            vacancy.setLocation(rs.getString(6));
            vacancy.setPlcmntTalk(rs.getString(7));
            vacancy.setTest(rs.getString(8));
            vacancy.setAbout(rs.getString(9));
            vacancy.setDetails(rs.getString(10));
            vacancy.setLink(rs.getString(11));
            vacancies.add(vacancy);
        }
        conn.close();
        return vacancies;
    }
    public static String getComName(String companyId) throws SQLException{
         String name=null;
        Connection conn = DBConnection.getConnect();
        String query = "SELECT company_name from company where userId=? ";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, companyId);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next())
            name = rs.getString(1);   
        return name;
    }
    public static ArrayList<PlcmntTalkDto> getPlcmntTalks( String enrollment) throws SQLException{
        ArrayList<PlcmntTalkDto> plcmntTalks = new ArrayList<>();
        Connection conn = DBConnection.getConnect();
        String query = "SELECT plcmnt_talk.* FROM `plcmnt_talk` INNER JOIN vacancyfor ON vacancyfor.vacancy_id=plcmnt_talk.vacancy_id INNER JOIN student ON student.courseId=vacancyfor.course_id WHERE enrollment=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, enrollment);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            PlcmntTalkDto plcmntTalk = new PlcmntTalkDto();
            plcmntTalk.setVacancy_id(rs.getString(1));
            plcmntTalk.setDate(rs.getString(2));
            plcmntTalk.setTime(rs.getString(3));
            plcmntTalk.setVenue(rs.getString(4));
            plcmntTalk.setAddress(rs.getString(5));
            plcmntTalk.setLink(rs.getString(6));
            plcmntTalks.add(plcmntTalk);
        }
        conn.close();
        return plcmntTalks;
    }
    public static String getComNameByVId(String vacancyId) throws SQLException{
         String name=null;
        Connection conn = DBConnection.getConnect();
        String query = "SELECT company_name from company INNER JOIN vacancy ON vacancy.company_id=company.userId where vacancy_id=? ";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, vacancyId);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next())
            name = rs.getString(1);   
        return name;
    }
     public static String getJobProfile(String vacancyId) throws SQLException{
         String name=null;
        Connection conn = DBConnection.getConnect();
        String query = "SELECT job_profile from vacancy where vacancy_id=? ";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, vacancyId);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next())
            name = rs.getString(1);   
        return name;
    }
     public static ArrayList<InternshipDto> getInternships( String enrollment) throws SQLException{
        ArrayList<InternshipDto> internships = new ArrayList<>();
        Connection conn = DBConnection.getConnect();
        String query = "SELECT internship.* FROM `internship` INNER JOIN internshipfor ON internship.internship_id=internshipfor.internship_id INNER JOIN student ON student.courseId=internshipfor.course_id WHERE enrollment=?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, enrollment);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            InternshipDto internship = new InternshipDto();
            internship.setInternshipId(rs.getString(1));
            internship.setCompanyId(rs.getString(2));
            internship.setProfile(rs.getString(3));
            internship.setType(rs.getString(4));
            internship.setLocation(rs.getString(5));
            internship.setStipend(rs.getString(6));
            internship.setLastDate(rs.getString(7));
            internship.setDuration(rs.getString(8));
            internship.setOpenings(rs.getString(9));
            internship.setRequirements(rs.getString(10));
            internship.setResponsibilities(rs.getString(11));
            internship.setLink(rs.getString(12));
            internships.add(internship);
        }
        conn.close();
        return internships;
    }
     public String updateStudentPass(String enrollment, String oldPass, String newPass){
         String message=null;
        try {
            Connection conn = DBConnection.getConnect();
            String query = "UPDATE student SET password=? where enrollment=? and password=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, newPass);
            pstmt.setString(2, enrollment);
            pstmt.setString(3, oldPass);
            int i = pstmt.executeUpdate();
            conn.close();
            if(i != 0)
                message = "Password updated successfully...!!!";
            else
                message = "Wrong Old Password..!!!";
        } catch (SQLException ex) {
            System.out.print(ex);
            message = "Something went wrong...!!!";
        }
        return message;
    }
    public static void main(String[] args) throws SQLException, ClassNotFoundException {
        StudentDao sd = new StudentDao();
        System.out.println(sd.verifyStudent("E1", "123"));
    }
}
