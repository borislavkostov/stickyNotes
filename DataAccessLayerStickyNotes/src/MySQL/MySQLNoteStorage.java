package MySQL;

import contracts.noteStorage;
import note.Note;
import Exception.DALException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.sql.Types;

public class MySQLNoteStorage implements noteStorage {

    String DBMS_CONN_STRING;
    String DBMS_USERNAME;
    String DBMS_PASSWORD;

    public MySQLNoteStorage(String DBMS_CONN_STRING, String DBMS_USERNAME, String DBMS_PASSWORD) {
        this.DBMS_CONN_STRING = DBMS_CONN_STRING;
        this.DBMS_USERNAME = DBMS_USERNAME;
        this.DBMS_PASSWORD = DBMS_PASSWORD;
    }

    @Override
    public void postNote(Note nt, int id) throws DALException {
        try (Connection conn = DriverManager.getConnection(DBMS_CONN_STRING, DBMS_USERNAME, DBMS_PASSWORD)) {
            CallableStatement statement = conn.prepareCall("{call postNote(?,?,?,?)}");
            statement.setString("new_title", nt.getTitle());
            statement.setString("new_description", nt.getDescription());
            statement.setInt("new_user_id", id);
            statement.registerOutParameter("new_id", Types.INTEGER);
            statement.execute();
            int newNoteID = statement.getInt("new_id");
            statement.close();
            conn.close();
        } catch (SQLException e) {
            new DALException("Problem with posting note", e);
        }
    }

}
