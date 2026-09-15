package main.java.dao;

import main.java.exception.DAOException;
import main.java.model.Credenziali;
import main.java.others.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.SQLException;
import java.sql.Types;

public class CredenzialiDAO {

    public Credenziali login(String username, String password) throws DAOException {
        String call = "{CALL login(?, ?, ?)}";

        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(call)) {

            cs.setString(1, username);
            cs.setString(2, password);
            cs.registerOutParameter(3, Types.VARCHAR);

            cs.execute();

            String ruolo = cs.getString(3);
            if (ruolo != null) {
                return new Credenziali(username, null, ruolo);
            }

        }
        catch (SQLException e) {
            throw new DAOException(e.getMessage(), e);
        }
        return null;
    }
}
