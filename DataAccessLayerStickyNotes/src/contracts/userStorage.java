package contracts;

import user.User;
import Exception.DALException;

public interface userStorage {

    public void newUser(User user) throws DALException;

    public User checkUser(User user) throws DALException;
}
