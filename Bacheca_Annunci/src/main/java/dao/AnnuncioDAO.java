package main.java.dao;

import main.java.exception.DAOException;
import main.java.model.Annuncio;
import main.java.others.DBConnection;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

@SuppressWarnings({"DuplicatedCode", "SqlNoDataSourceInspection"})
public class AnnuncioDAO {

    public void pubblicazioneAnnuncio(String titolo, String descrizione, double prezzo,
                                      String autore, int idCategoria) throws DAOException {
        String sql = "{CALL pubblicazione_annuncio(?, ?, ?, ?, ?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setString(1, titolo);
            cs.setString(2, descrizione);
            cs.setDouble(3, prezzo);
            cs.setString(4, autore);
            cs.setInt(5, idCategoria);
            cs.registerOutParameter(6, Types.INTEGER);

            cs.execute();
        } catch (SQLException e) {
            throw new DAOException("Errore durante l'inserimento dell'annuncio: " + e.getMessage(), e);
        }
    }

    public void modificaAnnuncio(int idAnnuncio, String autore, String nuovoTitolo,
                                 String nuovaDescrizione, double nuovoPrezzo) throws DAOException {
        String sql = "{CALL modifica_annuncio(?, ?, ?, ?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, idAnnuncio);
            cs.setString(2, autore);
            cs.setString(3, nuovoTitolo);
            cs.setString(4, nuovaDescrizione);
            cs.setDouble(5, nuovoPrezzo);

            cs.execute();
        } catch (SQLException e) {
            throw new DAOException("Errore durante la modifica dell'annuncio: " + e.getMessage(), e);
        }
    }

    public void annuncioVenduto(int idAnnuncio, String autore) throws DAOException {
        String sql = "{CALL annuncio_venduto(?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setInt(1, idAnnuncio);
            cs.setString(2, autore);

            cs.execute();
        } catch (SQLException e) {
            throw new DAOException("Errore durante il contrassegno a venduto: " + e.getMessage(), e);
        }
    }

    public List<Annuncio> visualizzaAnnunciNonVenduti() throws DAOException {
        List<Annuncio> list = new ArrayList<>();
        String sql = "{CALL visualizza_annunci_non_venduti()}";
        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {
                Annuncio a = new Annuncio();
                a.setIdAnnuncio(rs.getInt("IdAnnuncio"));
                a.setTitolo(rs.getString("Titolo"));
                a.setDescrizione(rs.getString("Descrizione"));
                a.setPrezzo(rs.getDouble("Prezzo"));
                a.setDataPubblicazione(rs.getTimestamp("DataPubblicazione"));
                a.setVenduto(false);
                a.setAutore(rs.getString("Autore"));
                a.setNomeCategoria(rs.getString("Categoria"));
                list.add(a);
            }
        } catch (SQLException e) {
            throw new DAOException("Errore nel recupero della bacheca annunci: " + e.getMessage(), e);
        }
        return list;
    }

    public List<Annuncio> visualizzaAnnunciUtente(String username) throws DAOException {
        List<Annuncio> list = new ArrayList<>();
        String sql = "{CALL visualizza_annunci_utente(?)}";
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
                    a.setVenduto(rs.getBoolean("Venduto"));
                    a.setNomeCategoria(rs.getString("Categoria"));
                    list.add(a);
                }
            }
        } catch (SQLException e) {
            throw new DAOException("Errore nel recupero dei propri annunci: " + e.getMessage(), e);
        }
        return list;
    }
    public void verificaModificabilitaAnnuncio(int idAnnuncio, String username) throws DAOException {
        String sql = "{CALL visualizza_annunci_utente(?)}";

        try (Connection con = DBConnection.getConnection(DBConnection.STANDARD_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setString(1, username);

            try (ResultSet rs = cs.executeQuery()) {
                boolean trovato = false;

                while (rs.next()) {
                    if (rs.getInt("IdAnnuncio") == idAnnuncio) {
                        trovato = true;
                        if (rs.getBoolean("Venduto")) {
                            throw new DAOException("Impossibile modificare un annuncio contrassegnato come venduto.");
                        }
                        break;
                    }
                }

                if (!trovato) {
                    throw new DAOException("Annuncio non trovato tra quelli pubblicati da te.");
                }
            }
        } catch (SQLException e) {
            throw new DAOException("Errore durante la verifica dell'annuncio: " + e.getMessage(), e);
        }
    }
}