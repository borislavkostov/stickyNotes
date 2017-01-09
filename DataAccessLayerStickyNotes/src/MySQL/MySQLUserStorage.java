package MySQL;

import Exception.DALException;
import contracts.userStorage;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;
import user.User;

public class MySQLUserStorage implements userStorage {

    String DBMS_CONN_STRING;
    String DBMS_USERNAME;
    String DBMS_PASSWORD;

    public MySQLUserStorage(String DBMS_CONN_STRING, String DBMS_USERNAME, String DBMS_PASSWORD) {
        this.DBMS_CONN_STRING = DBMS_CONN_STRING;
        this.DBMS_USERNAME = DBMS_USERNAME;
        this.DBMS_PASSWORD = DBMS_PASSWORD;
    }

    @Override
    public int newUser(User user) throws DALException {
        int newUserID = 0;
        try (Connection conn = DriverManager.getConnection(DBMS_CONN_STRING, DBMS_USERNAME, DBMS_PASSWORD)) {
            CallableStatement statement = conn.prepareCall("{call new_user(?,?,?)}");
            statement.setString("new_username", user.getUsername());
            statement.setString("new_password", user.getPassword());
            statement.registerOutParameter("new_id", Types.INTEGER);
            statement.execute();
            newUserID = statement.getInt("new_id");
            statement.close();
            conn.close();
            return newUserID;
        } catch (SQLException e) {
            new DALException("Problem with posting note", e);
        }
        return newUserID;
    }

}
