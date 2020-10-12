package dao;
import dbconn.DBConnection;
import dto.CourseDto;
import dto.StudentDto;
import java.sql.*;
import java.util.*;
/**
 *
 * @author harish
 */
public class CourseDao {
    public static ArrayList<CourseDto> fetchCourses() throws SQLException, ClassNotFoundException{
        ArrayList<CourseDto> courses = new ArrayList<>();
        Connection conn = DBConnection.getConnect();
        String query = "SELECT * from course";
        PreparedStatement pstmt = conn.prepareStatement(query);
        ResultSet rs = pstmt.executeQuery();
        while(rs.next()){
            courses.add(new CourseDto(rs.getString(1), rs.getString(2),rs.getString(3)));
        }
        conn.close();
        return courses;   
    }
    
    public static CourseDto getCourse( String courseId) throws SQLException{
        CourseDto course = new CourseDto();
        Connection conn = DBConnection.getConnect();
        String query = "SELECT * from course where course_id = ?";
        PreparedStatement pstmt = conn.prepareStatement(query);
        pstmt.setString(1, courseId);
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
            course.setCourseId(rs.getString(1));
            course.setCourseName(rs.getString(2));
            course.setSpecialization(rs.getString(3));
        }
        conn.close();
        return course;
    }
}