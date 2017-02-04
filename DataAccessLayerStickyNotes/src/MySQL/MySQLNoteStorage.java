package MySQL;

import contracts.noteStorage;
import note.Note;
import Exception.DALException;
import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

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
    public void postNote(Note note, String username) throws DALException {
        try (Connection conn = DriverManager.getConnection(DBMS_CONN_STRING, DBMS_USERNAME, DBMS_PASSWORD)) {
            try (CallableStatement statement = conn.prepareCall("{call postNote(?,?,?,?)}")) {
                statement.setString("new_title", note.getTitle());
                statement.setString("new_description", note.getDescription());
                statement.setString("new_user_id", username);
                statement.registerOutParameter("new_id", Types.INTEGER);
                statement.execute();
                int newNoteID = statement.getInt("new_id");
            }
        } catch (SQLException e) {
            new DALException("Problem with posting note", e);
        }
    }

    @Override
    public List<Note> getNotes(String username) throws DALException {
        List<Note> notes = new ArrayList<>();
        try (Connection conn = DriverManager.getConnection(DBMS_CONN_STRING, DBMS_USERNAME, DBMS_PASSWORD)) {
            try (PreparedStatement statement = conn.prepareStatement("SELECT title,description FROM StickyNoteBK.Note WHERE user_id=?;")) {
                statement.setString(1, username);
                //statement.execute();
                try (ResultSet rs = statement.executeQuery()) {
                    while (rs.next()) {
                        String title = rs.getString("title");
                        String description = rs.getString("description");
                        notes.add(new Note(title, description));
                    }
                }
            }
        } catch (SQLException e) {
            new DALException("Problem with connection for getting note", e);
        }
        return notes;
    }

}
