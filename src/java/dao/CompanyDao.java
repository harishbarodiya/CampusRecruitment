package dao;
import dbconn.DBConnection;
import dto.CompanyDto;
import dto.InternshipDto;
import dto.PlcmntTalkDto;
import dto.VacancyDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
/**
 *
 * @author harish
 */
public class CompanyDao {

    private static void VacancyDto() {
        throw new UnsupportedOperationException("Not supported yet."); //To change body of generated methods, choose Tools | Templates.
    }
    public String verifyCompany(String userId, String password) throws SQLException, ClassNotFoundException{
        String errorMsg;
        Connection conn = DBConnection.getConnect();
        String query = "SELECT * from company where userid=? and password=? ";
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
        return errorMsg;   
    }
    
    public String registerCompany(CompanyDto cDto) {
        String message = null;
        try {
            Connection conn = DBConnection.getConnect();
            String query = "INSERT into company values(?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, cDto.getComName());
            pstmt.setString(2, cDto.getUserId());
            pstmt.setString(3, cDto.getBranch());
            pstmt.setString(4, cDto.getHrName());
            pstmt.setString(5, cDto.getMobile());
            pstmt.setString(6, cDto.getEmail());
            pstmt.setString(7, cDto.getPassword());
            pstmt.setString(8, "unapproved");
            int i = pstmt.executeUpdate();
            conn.close();
            if(i != 0){
                message = "Successfully Requested to Approve. Wait for approvement...!!! ";
            }
            else
                message = "Something went wrong...!!! ";
        } catch (SQLException ex) {
            if(ex.getMessage().startsWith("Duplicate entry")){
                message = "You have already registered";
                System.out.println(ex);
            }
        }
        return message;
    }
    public static String getName(String userId) throws SQLException{
         String name=null;
        Connection conn = DBConnection.getConnect();
        String query = "SELECT company_name from company where userId=? ";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, userId);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next())
            name = rs.getString(1);   
        return name;
    }
    public String addVacancy(VacancyDto vDto) throws SQLException {
        String message = null;
            Connection conn = DBConnection.getConnect();
            String query = "INSERT into vacancy(company_id, job_profile, salary, last_date, location, placement_talk, online_test, about, more_details, register_link) value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, vDto.getCompanyId());
            pstmt.setString(2, vDto.getProfile());
            pstmt.setString(3, vDto.getSalary());
            pstmt.setString(4, vDto.getLastDate());
            pstmt.setString(5, vDto.getLocation());
            pstmt.setString(6, vDto.getPlcmntTalk());
            pstmt.setString(7, vDto.getTest());
            pstmt.setString(8, vDto.getAbout());
            pstmt.setString(9, vDto.getDetails());
            pstmt.setString(10, vDto.getLink());
            int i = pstmt.executeUpdate();
            if(i != 0){
                query = "SELECT MAX(vacancy_id) from vacancy where company_id=?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, vDto.getCompanyId());
                ResultSet rs = pstmt.executeQuery();
                if(rs.next()){
                    query = "INSERT INTO vacancyfor(vacancy_id, course_id) value ";
                    for(String course_id : vDto.getCourses()){
                        query = query + "("+rs.getString(1)+", "+course_id+"),";
                    }
                    query = query.substring(0,query.length()-1);
                    pstmt = conn.prepareStatement(query);
                    i = pstmt.executeUpdate();
                    if(i != 0)
                        message = "Vacancy Added Successfully...!!! ";
                    else
                        message = "Something went wrong...!!! ";
                }
                else
                    message = "Something went wrong...!!! ";
            }
            else
                message = "Something went wrong...!!! ";   
        return message;
    }    
    public String addInternship(InternshipDto iDto) throws SQLException {
        String message = null;
            Connection conn = DBConnection.getConnect();
            String query = "INSERT into internship(company_id, job_profile, type, location, stipend, last_date, duration,  openings, requirements, responsibilities, link) value(?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, iDto.getCompanyId());
            pstmt.setString(2, iDto.getProfile());
            pstmt.setString(3, iDto.getType());
            pstmt.setString(4, iDto.getLocation());
            pstmt.setString(5, iDto.getStipend());
            pstmt.setString(6, iDto.getLastDate());
            pstmt.setString(7, iDto.getDuration());
            pstmt.setString(8, iDto.getOpenings());
            pstmt.setString(9, iDto.getRequirements());
            pstmt.setString(10, iDto.getResponsibilities());
            pstmt.setString(11, iDto.getLink());
            int i = pstmt.executeUpdate();
            if(i != 0){
                query = "SELECT MAX(internship_id) from internship where company_id=?";
                pstmt = conn.prepareStatement(query);
                pstmt.setString(1, iDto.getCompanyId());
                ResultSet rs = pstmt.executeQuery();
                if(rs.next()){
                    query = "INSERT INTO internshipfor(internship_id, course_id) value ";
                    for(String course_id : iDto.getCourses()){
                        query = query + "("+rs.getString(1)+", "+course_id+"),";
                    }
                    query = query.substring(0,query.length()-1);
                    pstmt = conn.prepareStatement(query);
                    i = pstmt.executeUpdate();
                    if(i != 0)
                        message = "Internship Posted Successfully...!!! ";
                    else
                        message = "Something went wrong...!!! ";
                }
                else
                    message = "Something went wrong...!!! ";
            }
            else
                message = "Something went wrong...!!! ";   
        return message;
    }    
     public static ArrayList<VacancyDto> getVacancy( String companyId) throws SQLException{
        ArrayList<VacancyDto> vacancies = new ArrayList<>();
        Connection conn = DBConnection.getConnect();
        String query = "SELECT vacancy_id, job_profile from vacancy where company_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, companyId);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            VacancyDto vacancy = new VacancyDto();
            vacancy.setVacancyId(rs.getString(1));
            vacancy.setProfile(rs.getString(2));
            vacancies.add(vacancy);
        }
        conn.close();
        return vacancies;
    }
      public String addPlcmntTalk(PlcmntTalkDto pDto) {
        String message = null;
        try {
            Connection conn = DBConnection.getConnect();
            String query = "INSERT into plcmnt_talk values(?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, pDto.getVacancy_id());
            pstmt.setString(2, pDto.getDate());
            pstmt.setString(3, pDto.getTime());
            pstmt.setString(4, pDto.getVenue());
            pstmt.setString(5, pDto.getAddress());
            pstmt.setString(6, pDto.getLink());
            int i = pstmt.executeUpdate();
            conn.close();
            if(i != 0){
                message = "Successfully posted the placement talk...!!! ";
            }
            else
                message = "Something went wrong...!!! ";
        } catch (SQLException ex) {
            if(ex.getMessage().startsWith("Duplicate entry")){
                message = "You have already posted for this profile";
                System.out.println(ex);
            }
            else 
                System.out.println(ex);
        }
        return message;
    }
      public CompanyDto getCompany(String userId) throws SQLException{
        CompanyDto company = new CompanyDto();
        Connection conn = DBConnection.getConnect();
        String query = "SELECT * from company where userId = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, userId);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            company.setComName(rs.getString(1));
            company.setUserId(rs.getString(2));
            company.setBranch(rs.getString(3));
            company.setHrName(rs.getString(4));
            company.setMobile(rs.getString(5));
            company.setEmail(rs.getString(6));
        }
        conn.close();
        return company;   
    }
     public String updateCompany(CompanyDto cDto) {
        String message = null;
        try {
            Connection conn = DBConnection.getConnect();
            String query = "UPDATE company set company_name=?, location=?, hr_name=?, mobile=?,email=? where userId=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, cDto.getComName());
            pstmt.setString(2, cDto.getBranch());
            pstmt.setString(3, cDto.getHrName());
            pstmt.setString(4, cDto.getMobile());
            pstmt.setString(5, cDto.getEmail());
            pstmt.setString(6, cDto.getUserId());
            int i = pstmt.executeUpdate();
            conn.close();
            if(i != 0){
                message = "Profile Updated successfully...!!! ";
            }
            else
                message = "Something went wrong...!!! ";
        } catch (SQLException ex) {
            System.out.println(ex);
        }
        return message;
    }
     
     public String updateCompanyPass(String userId, String oldPass, String newPass){
         String message=null;
        try {
            Connection conn = DBConnection.getConnect();
            String query = "UPDATE company SET password=? where userId=? and password=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, newPass);
            pstmt.setString(2, userId);
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
    public static void main(String[] args) {
        
    }
}
