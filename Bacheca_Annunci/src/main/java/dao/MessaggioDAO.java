package main.java.dao;

import main.java.exception.DAOException;
import main.java.model.Messaggio;
import main.java.others.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class MessaggioDAO {

    public void invioMessaggio(String mittente, String destinatario, int idAnnuncio, String testo) throws DAOException {
        String sql = "{CALL invio_messaggio(?, ?, ?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setString(1, mittente);
            cs.setString(2, destinatario);
            cs.setInt(3, idAnnuncio);
            cs.setString(4, testo);

            cs.execute();
        } catch (SQLException e) {
            throw new DAOException("Errore durante l'invio del messaggio privato: " + e.getMessage(), e);
        }
    }

    public List<Messaggio> visualizzaMessaggi(int idAnnuncio, String richiedente) throws DAOException {
        List<Messaggio> messaggi = new ArrayList<>();
        String sql = "{CALL visualizza_messaggi_annuncio(?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, idAnnuncio);
            cs.setString(2, richiedente);

            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    Messaggio m = new Messaggio();
                    m.setMittente(rs.getString("Mittente"));
                    m.setDestinatario(rs.getString("Destinatario"));
                    m.setDataOra(rs.getTimestamp("DataOra"));
                    m.setTesto(rs.getString("Testo"));
                    m.setAnnuncio(idAnnuncio);
                    messaggi.add(m);
                }
            }
        } catch (SQLException e) {
            throw new DAOException("Errore durante la lettura dei messaggi: " + e.getMessage(), e);
        }
        return messaggi;
    }
}
