package MySQL;

import Exception.DALException;
import contracts.userStorage;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
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
    public void newUser(User user) throws DALException {
        try (Connection conn = DriverManager.getConnection(DBMS_CONN_STRING, DBMS_USERNAME, DBMS_PASSWORD)) {
            CallableStatement statement = conn.prepareCall("{call new_user(?,?)}");
            statement.setString("new_username", user.getUsername());
            statement.setString("new_password", user.getPassword());
            statement.execute();
            statement.close();
            conn.close();
        } catch (SQLException e) {
            new DALException("Problem with posting note", e);
        }
    }

    @Override
    public User checkUser(User user) throws DALException {
        User userC;
        try (Connection conn = DriverManager.getConnection(DBMS_CONN_STRING, DBMS_USERNAME, DBMS_PASSWORD)) {
            PreparedStatement statement = conn.prepareCall("SELECT * FROM StickyNoteBK.user where username=? AND password=?;");
            statement.setString(1, user.getUsername());
            statement.setString(2, user.getPassword());
            try (ResultSet rs = statement.executeQuery()) {
                String username = rs.getString("username");
                String password = rs.getString("password");
                userC = new User(username, password);
            } catch (SQLException e) {
                throw new DALException("Problem witch cheking username", e);
            }
        } catch (SQLException e) {
            throw new DALException("Problem witch cheking username", e);
        }
        return userC;
    }

}
