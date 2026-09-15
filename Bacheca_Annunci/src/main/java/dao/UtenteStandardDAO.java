package main.java.dao;

import main.java.exception.DAOException;
import main.java.others.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.SQLException;

public class UtenteStandardDAO {

    public void registraUtenteStandard(String username, String password, String nome, String cognome,
                                       Date dataNascita, String residenza, String fatturazione,
                                       String contattoValore, String contattoTipo) throws DAOException {
        String sql = "{CALL registrazione_utente_standard(?, ?, ?, ?, ?, ?, ?, ?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setString(1, username);
            cs.setString(2, password);
            cs.setString(3, nome);
            cs.setString(4, cognome);
            cs.setDate(5, dataNascita);
            cs.setString(6, residenza);
            cs.setString(7, fatturazione);
            cs.setString(8, contattoValore);
            cs.setString(9, contattoTipo);

            cs.execute();
        } catch (SQLException e) {
            throw new DAOException("Errore durante la registrazione dell'utente standard: " + e.getMessage(), e);
        }
    }

    public void registraContatto(String username, String tipo, String valore, boolean preferito) throws DAOException {
        String sql = "{CALL registrazione_contatto(?, ?, ?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setString(1, username);
            cs.setString(2, tipo);
            cs.setString(3, valore);
            cs.setBoolean(4, preferito);

            cs.execute();
        }
        catch (SQLException e) {
            throw new DAOException("Errore durante l'inserimento del contatto: " + e.getMessage(), e);
        }
    }

    public void rimuoviContatto(String username, String tipo, String valore) throws DAOException {
        String sql = "{CALL rimuovi_contatto(?, ?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setString(1, username);
            cs.setString(2, tipo);
            cs.setString(3, valore);

            cs.execute();
        } catch (SQLException e) {
            throw new DAOException("Errore durante l'eliminazione del contatto: " + e.getMessage(), e);
        }
    }

    public void impostaContattoPreferito(String username, String tipo, String valore) throws DAOException {
        String sql = "{CALL imposta_contatto_preferito(?, ?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setString(1, username);
            cs.setString(2, tipo);
            cs.setString(3, valore);

            cs.execute();
        } catch (SQLException e) {
            throw new DAOException("Errore durante l'aggiornamento del contatto preferito: " + e.getMessage(), e);
        }
    }
}
