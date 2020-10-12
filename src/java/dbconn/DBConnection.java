package dbconn;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

/**
 *
 * @author harish
 */
public class DBConnection implements DBInfo{
    public static final Connection getConnect(){
        try {
            Class.forName(Driver);
            Connection conn = DriverManager.getConnection(URL,UserName,Password); 
            return  conn;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return null;
    }
    public static String tryM(){
        Connection conn = DBConnection.getConnect();
                String query = "SELECT * from student";
        PreparedStatement pstmt;
        try {
            pstmt = conn.prepareStatement(query);
        
        ResultSet rs = pstmt.executeQuery();
        if(rs.next()){
            return rs.getString(1);
        }
        else{
            return "No";
        }
        } catch (SQLException ex) {
            Logger.getLogger(DBConnection.class.getName()).log(Level.SEVERE, null, ex);
        }
        return "";
    }
    public static void main(String[] args) throws SQLException {
            System.out.println(DBConnection.tryM());
    }
}
