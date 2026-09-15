package main.java.dao;

import main.java.exception.DAOException;
import main.java.model.Commento;
import main.java.others.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

public class CommentoDAO {

    public void invioCommento(String commentatore, int idAnnuncio, String testo) throws DAOException {
        String sql = "{CALL invio_commento(?, ?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setString(1, commentatore);
            cs.setInt(2, idAnnuncio);
            cs.setString(3, testo);

            cs.execute();
        } catch (SQLException e) {
            throw new DAOException("Errore durante l'invio del commento: " + e.getMessage(), e);
        }
    }

    public List<Commento> visualizzaCommenti(int idAnnuncio) throws DAOException {
        List<Commento> commenti = new ArrayList<>();
        String sql = "{CALL visualizza_commenti_annuncio(?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, idAnnuncio);
            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    Commento c = new Commento();
                    c.setCommentatore(rs.getString("Commentatore"));
                    c.setDataOra(rs.getTimestamp("DataOra"));
                    c.setTesto(rs.getString("Testo"));
                    c.setAnnuncio(idAnnuncio);
                    commenti.add(c);
                }
            }
        } catch (SQLException e) {
            throw new DAOException("Errore durante la lettura dei commenti: " + e.getMessage(), e);
        }
        return commenti;
    }
}
