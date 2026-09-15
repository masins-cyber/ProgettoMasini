package main.java.dao;

import main.java.exception.DAOException;
import main.java.others.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.Date;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.LinkedHashMap;
import java.util.List;
import java.util.Map;

public class AmministratoreDAO {

    public void registraAmministratore(String username, String password, String nome, String cognome,
                                       Date dataNascita) throws DAOException {
        String sql = "{CALL registrazione_amministratore(?, ?, ?, ?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.ADMIN_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setString(1, username);
            cs.setString(2, password);
            cs.setString(3, nome);
            cs.setString(4, cognome);
            cs.setDate(5, dataNascita);

            cs.executeUpdate();
        } catch (SQLException e) {
            throw new DAOException("Errore durante la registrazione dell'amministratore: " + e.getMessage(), e);
        }
    }

    public List<Map<String, Object>> generaReportVendite(String adminUsername) throws DAOException {
        List<Map<String, Object>> report = new ArrayList<>();
        String call = "{CALL genera_report_vendite(?)}";

        try (Connection con = DBConnection.getConnection(DBConnection.ADMIN_CONFIG);
             CallableStatement cs = con.prepareCall(call)) {

            cs.setString(1, adminUsername);
            try (ResultSet rs = cs.executeQuery()) {
                while (rs.next()) {
                    Map<String, Object> riga = new LinkedHashMap<>();
                    riga.put("username", rs.getString("Username"));
                    riga.put("nominativo", rs.getString("Nome") + " " + rs.getString("Cognome"));
                    riga.put("totali", rs.getInt("TotaleAnnunci"));
                    riga.put("venduti", rs.getInt("AnnunciVenduti"));
                    riga.put("percentuale", rs.getDouble("PercentualeSuccessoVendita"));
                    report.add(riga);
                }
            }
        } catch (SQLException e) {
            throw new DAOException("Errore durante l'elaborazione del report vendite: " + e.getMessage(), e);
        }

        return report;
    }
}
