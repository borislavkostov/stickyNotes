
import Exception.DALException;
import MySQL.MySQLNoteStorage;
import MySQL.MySQLUserStorage;
import user.User;
import java.util.List;
import note.Note;

public class trash {

    public static void main(String args[]) throws DALException {
        String DBMS_CONN_STRING = "jdbc:mysql://localhost:3306/StickyNoteBK?useUnicode=true&characterEncoding=UTF-8";
        String DBMS_USERNAME = "root";
        String DBMS_PASSWORD = "173173";
        MySQLNoteStorage ntStorage = new MySQLNoteStorage(DBMS_CONN_STRING, DBMS_USERNAME, DBMS_PASSWORD);
        MySQLUserStorage us = new MySQLUserStorage(DBMS_CONN_STRING, DBMS_USERNAME, DBMS_PASSWORD);
        //Note note = new Note("Buy cat", "next week");
        //System.out.println(note.getTitle());
        //ntStorage.postNote(note, "boriou");
        //System.out.println("HI");
        User user = new User("boriou","1234");
        User userc = us.checkUser(user);
        System.out.println(userc.getUsername());
//        List<Note> notes = ntStorage.getNotes(1);
//        for (Note note : notes) {
//        System.out.println(note.getTitle());
//        }
    }
}
