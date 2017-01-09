package contracts;

import note.Note;
import Exception.DALException;

public interface noteStorage {

    public void postNote(Note nt,int id) throws DALException;
}
