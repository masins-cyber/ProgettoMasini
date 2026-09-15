package main.java.dao;

import main.java.exception.DAOException;
import main.java.model.Annuncio;
import main.java.others.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings({"DuplicatedCode", "SqlNoDataSourceInspection"})
public class MonitoraggioDAO {

    public void monitoraAnnuncio(String username, int idAnnuncio) throws DAOException {
        String call = "{CALL monitora_annuncio(?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(call)) {

            cs.setString(1, username);
            cs.setInt(2, idAnnuncio);

            cs.execute();
        } catch (SQLException e) {
            throw new DAOException("Errore durante l'attivazione del monitoraggio: " + e.getMessage(), e);
        }
    }

    public List<Annuncio> getAnnunciMonitorati(String username) throws DAOException {
        List<Annuncio> lista = new ArrayList<>();
        String sql = "{CALL visualizza_annunci_monitorati(?)}";

        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setString(1, username);

            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    Annuncio a = new Annuncio();
                    a.setIdAnnuncio(rs.getInt("IdAnnuncio"));
                    a.setTitolo(rs.getString("Titolo"));
                    a.setDescrizione(rs.getString("Descrizione"));
                    a.setPrezzo(rs.getDouble("Prezzo"));
                    a.setDataPubblicazione(rs.getTimestamp("DataPubblicazione"));
                    a.setAutore(rs.getString("Autore"));
                    a.setNomeCategoria(rs.getString("Categoria"));
                    a.setVenduto(false);

                    lista.add(a);
                }
            }
        } catch (SQLException e) {
            throw new DAOException("Errore nel recupero degli annunci monitorati: " + e.getMessage(), e);
        }
        return lista;
    }

    public List<Annuncio> verificaAnnunciModificati(String username) throws DAOException {
        List<Annuncio> lista = new ArrayList<>();
        String sql = "{CALL verifica_annunci_modificati(?)}";

        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setString(1, username);

            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    Annuncio a = new Annuncio();
                    a.setIdAnnuncio(rs.getInt("IdAnnuncio"));
                    a.setTitolo(rs.getString("Titolo"));
                    a.setPrezzo(rs.getDouble("Prezzo"));
                    a.setAutore(rs.getString("Autore"));
                    lista.add(a);
                }
            }
        } catch (SQLException e) {
            throw new DAOException("Errore verifica notifiche: " + e.getMessage(), e);
        }
        return lista;
    }

    public void resettaFlagNotifica(String username, Integer idAnnuncio) throws DAOException {
        String call = "{CALL resetta_flag_notifica(?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(call)) {

            cs.setString(1, username);
            if (idAnnuncio != null) {
                cs.setInt(2, idAnnuncio);
            } else {
                cs.setNull(2, Types.INTEGER);
            }

            cs.execute();
        } catch (SQLException e) {
            throw new DAOException("Errore durante il reset delle notifiche: " + e.getMessage(), e);
        }
    }
}
