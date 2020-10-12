package dao;
import dbconn.DBConnection;
import dto.AdminDto;
import dto.CompanyDto;
import dto.CounterDto;
import dto.StudentDto;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.logging.Level;
import java.util.logging.Logger;
/**
 *
 * @author harish
 */
public class AdminDao {
    public String verifyAdmin(String adminId, String password) throws SQLException, ClassNotFoundException{
        String errorMsg;
        Connection conn = DBConnection.getConnect();
        String query = "SELECT * from admin where adminId=? and password=? ";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, adminId);
        pstmt.setString(2, password);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next())
            errorMsg = null;
        else 
            errorMsg = "Incorrect User Id or Password";
        return errorMsg;   
    }
    public static String getAdminName(String adminId) throws SQLException, ClassNotFoundException{
        String name=null;
        Connection conn = DBConnection.getConnect();
        String query = "SELECT f_name from admin where adminId=? ";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, adminId);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next())
            name = rs.getString(1);   
        return name;
    }
    
    public ArrayList<StudentDto> getUnapprovedStd() throws SQLException{
        ArrayList<StudentDto> unapprovedStd = new ArrayList<>();
        Connection conn = DBConnection.getConnect();
        String query = "SELECT * from student where status = 'unapproved'";
        PreparedStatement pstmt = conn.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            StudentDto student = new StudentDto();
            student.setEnrollment(rs.getString(1));
            student.setfName(rs.getString(2));
            student.setlName(rs.getString(3));
            student.setCourseId(rs.getString(4));
            student.setMobile(rs.getString(5));
            student.setEmail(rs.getString(6));
            unapprovedStd.add(student);
        }
        conn.close();
        return unapprovedStd;   
    }
    
    public boolean changeStdStatus(String enrollment, String status){
        try {
            Connection conn = DBConnection.getConnect();
            String query = "UPDATE student SET status = ? where enrollment = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, status);
            pstmt.setString(2, enrollment);
            int i = pstmt.executeUpdate();
            conn.close();
            if(i != 0)
                return true;
            return false;
        } catch (SQLException ex) {
            System.out.print(ex);
            return false;
        }
    }
    
    public ArrayList<CompanyDto> getUnapprovedCmp() throws SQLException{
        ArrayList<CompanyDto> unapprovedCmp = new ArrayList<>();
        Connection conn = DBConnection.getConnect();
        String query = "SELECT * from company where status = 'unapproved'";
        PreparedStatement pstmt = conn.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            CompanyDto company = new CompanyDto();
            company.setComName(rs.getString(1));
            company.setUserId(rs.getString(2));
            company.setBranch(rs.getString(3));
            company.setHrName(rs.getString(4));
            company.setMobile(rs.getString(5));
            company.setEmail(rs.getString(6));
            unapprovedCmp.add(company);
        }
        conn.close();
        return unapprovedCmp;   
    }
    
    public boolean changeCmpStatus(String userId, String status){
        try {
            Connection conn = DBConnection.getConnect();
            String query = "UPDATE company SET status = ? where userId = ?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, status);
            pstmt.setString(2, userId);
            int i = pstmt.executeUpdate();
            conn.close();
            if(i != 0)
                return true;
            return false;
        } catch (SQLException ex) {
            System.out.print(ex);
            return false;
        }
    }
    
    public String registerAdmin(AdminDto aDto) {
        String message = null;
        try {
            Connection conn = DBConnection.getConnect();
            String query = "INSERT into admin values(?, ?, ?, ?, ?, ?, ?)";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, aDto.getAdminId());
            pstmt.setString(2, aDto.getfName());
            pstmt.setString(3, aDto.getlName());
            pstmt.setString(4, aDto.getDesignation());
            pstmt.setString(5, aDto.getMobile());
            pstmt.setString(6, aDto.getEmail());
            pstmt.setString(7, aDto.getPassword());
            int i = pstmt.executeUpdate();
            conn.close();
            if(i != 0){
                message = "Admin added successfully...!!! ";
            }
            else
                message = "Something went wrong...!!! ";
        } catch (SQLException ex) {
            if(ex.getMessage().startsWith("Duplicate entry"))
                message = "This AdminId is already registered";
            else
                System.out.println(ex);
        }
        return message;
    }
     public String editCounter(CounterDto ctrDto){
         String message=null;
        try {
            Connection conn = DBConnection.getConnect();
            String query = "UPDATE counter SET recruiter=?, vacancy=?, placed=?, faculty=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, ctrDto.getRecruiter());
            pstmt.setString(2, ctrDto.getVacancy());
            pstmt.setString(3, ctrDto.getPlaced());
            pstmt.setString(4, ctrDto.getFaculty());
            int i = pstmt.executeUpdate();
            conn.close();
            if(i != 0)
                message = "Counters updated successfully...!!!";
            else
                message = "Something went wrong..!!!";
        } catch (SQLException ex) {
            System.out.print(ex);
            message = "Something went wrong...!!!";
        }
        return message;
    }
     public CounterDto getCounter() throws SQLException{
        CounterDto cDto = new CounterDto();
        Connection conn = DBConnection.getConnect();
        String query = "SELECT * from counter";
        PreparedStatement pstmt = conn.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            cDto.setRecruiter(rs.getString(1));
            cDto.setVacancy(rs.getString(2));
            cDto.setPlaced(rs.getString(3));
            cDto.setFaculty(rs.getString(4));
        }
        conn.close();
        return cDto;   
    }
     public AdminDto getAdmin(String adminId) throws SQLException{
        AdminDto aDto = new AdminDto();
        Connection conn = DBConnection.getConnect();
        String query = "SELECT * from admin where adminId = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, adminId);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            aDto.setAdminId(rs.getString(1));
            aDto.setfName(rs.getString(2));
            aDto.setlName(rs.getString(3));
            aDto.setDesignation(rs.getString(4));
            aDto.setMobile(rs.getString(5));
            aDto.setEmail(rs.getString(6));
        }
        conn.close();
        return aDto;   
    }
     
     public String updateAdmin(AdminDto aDto) {
        String message = null;
        try {
            Connection conn = DBConnection.getConnect();
            String query = "UPDATE admin set f_name=?, l_name=?, designation=?, mobile=?,email=? where adminId=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, aDto.getfName());
            pstmt.setString(2, aDto.getlName());
            pstmt.setString(3, aDto.getDesignation());
            pstmt.setString(4, aDto.getMobile());
            pstmt.setString(5, aDto.getEmail());
            pstmt.setString(6, aDto.getAdminId());
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
     public String updateAdminPass(String adminId, String oldPass, String newPass){
         String message=null;
        try {
            Connection conn = DBConnection.getConnect();
            String query = "UPDATE admin SET password=? where adminId=? and password=?";
            PreparedStatement pstmt = conn.prepareStatement(query);
            pstmt.setString(1, newPass);
            pstmt.setString(2, adminId);
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
}
