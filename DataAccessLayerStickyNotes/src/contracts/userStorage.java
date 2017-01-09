
package contracts;
import user.User;
import Exception.DALException;

public interface userStorage {
    public int newUser(User user)throws DALException;
}
