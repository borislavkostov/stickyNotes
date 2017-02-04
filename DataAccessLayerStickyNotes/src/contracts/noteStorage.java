package contracts;

import note.Note;
import Exception.DALException;
import java.util.List;

public interface noteStorage {

    public void postNote(Note nt, String username) throws DALException;

    public List<Note> getNotes(String username) throws DALException;
}
