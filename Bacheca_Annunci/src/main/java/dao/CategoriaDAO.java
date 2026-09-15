package main.java.dao;

import main.java.exception.DAOException;
import main.java.model.Categoria;
import main.java.others.DBConnection;

import java.sql.CallableStatement;
import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Types;
import java.util.ArrayList;
import java.util.List;

public class CategoriaDAO {

    public void creaCategoria(String nome, Integer padre, String adminUsername) throws DAOException {
        String sql = "{CALL crea_categoria(?, ?, ?, ?)}";
        try (Connection con = DBConnection.getConnection(DBConnection.ADMIN_CONFIG);
             CallableStatement cs = con.prepareCall(sql)) {

            cs.setString(1, nome);
            if (padre != null) {
                cs.setInt(2, padre);
            } else {
                cs.setNull(2, Types.INTEGER);
            }
            cs.setString(3, adminUsername);
            cs.registerOutParameter(4, Types.INTEGER);

            cs.execute();
        } catch (SQLException e) {
            throw new DAOException(e.getMessage(), e);
        }
    }

    public List<Categoria> visualizzaTutteCategorie(boolean isAdmin) throws DAOException {
        List<Categoria> list = new ArrayList<>();
        String config;
        if (isAdmin) {
            config = DBConnection.ADMIN_CONFIG;
        } else {
            config = DBConnection.STANDARD_CONFIG;
        }

        String sql = "{CALL visualizza_tutte_categorie()}";

        try (Connection con = DBConnection.getConnection(config);
             CallableStatement cs = con.prepareCall(sql);
             ResultSet rs = cs.executeQuery()) {

            while (rs.next()) {
                Categoria c = new Categoria();
                c.setIdCategoria(rs.getInt("IdCategoria"));
                c.setNomeCategoria(rs.getString("NomeCategoria"));
                int p = rs.getInt("IdPadre");
                if (!rs.wasNull()) {
                    c.setPadre(p);
                }
                c.setNomePadre(rs.getString("NomePadre"));
                c.setAmministratore(rs.getString("CreatoDa"));
                list.add(c);
            }
        } catch (SQLException e) {
            throw new DAOException("Errore durante la lettura delle categorie: " + e.getMessage(), e);
        }
        return list;
    }
}
