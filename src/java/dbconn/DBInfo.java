package dbconn;

/**
 *
 * @author harish
 */
public interface DBInfo {
    final static String Driver = "com.mysql.cj.jdbc.Driver";
    final static String URL = "jdbc:mysql://localhost:3306/crsdb?useUnicode=true&useJDBCCompliantTimezoneShift=true&useLegacyDatetimeCode=false&serverTimezone=UTC";
    final static String UserName = "root";
    final static String Password = "";
}
