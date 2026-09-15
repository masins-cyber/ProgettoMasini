package main.java.controller;

import main.java.dao.AmministratoreDAO;
import main.java.dao.CategoriaDAO;
import main.java.exception.DAOException;
import main.java.model.Categoria;
import main.java.view.AdminView;

import java.io.IOException;
import java.sql.Date;
import java.util.List;
import java.util.Map;

public class AdminController implements Controller {
    private final String adminUsername;
    private final AdminView view;
    private final CategoriaDAO categoriaDAO;
    private final AmministratoreDAO amministratoreDAO;

    public AdminController(AdminView view, String adminUsername) {
        this.adminUsername = adminUsername;
        this.view = view;
        this.categoriaDAO = new CategoriaDAO();
        this.amministratoreDAO = new AmministratoreDAO();
    }

    @Override
    public void start() throws IOException, DAOException {
        boolean running = true;

        while (running) {
            int choice = view.displayMenuAndGetChoice(adminUsername);

            switch (choice) {
                case 1:
                    creaCategoria();
                    break;
                case 2:
                    visualizzaCategorie();
                    break;
                case 3:
                    generaReportVendite();
                    break;
                case 4:
                    registraAmministratore();
                    break;
                case 5:
                    view.showMessage("Uscita dal pannello amministratore.");
                    running = false;
                    break;
                default:
                    view.showMessage("Opzione non valida. Riprova.");
            }
        }
    }

    private void creaCategoria() {
        try {
            String nome = view.getInput("Nome Categoria: ");
            String idPadreStr = view.getInput("ID Padre (INVIO se categoria radice): ");

            Integer idPadre = null;
            if (!idPadreStr.trim().isEmpty()) {
                idPadre = Integer.parseInt(idPadreStr.trim());
            }

            categoriaDAO.creaCategoria(nome, idPadre, adminUsername);
            view.showMessage("Categoria registrata con successo!");
        } catch (NumberFormatException e) {
            view.showMessage("L'ID padre deve essere un valore numerico intero.");
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }

    private void visualizzaCategorie() {
        try {
            List<Categoria> categorie = categoriaDAO.visualizzaTutteCategorie(true);
            view.mostraCategorie(categorie);
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }

    private void generaReportVendite() {
        try {
            List<Map<String, Object>> report = amministratoreDAO.generaReportVendite(adminUsername);
            view.stampaReportVendite(report);
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }

    private void registraAmministratore() {
        try {
            String username = view.getInput("Scegli username: ");
            String password = view.getInput("Scegli password: ");
            String nome = view.getInput("Nome: ");
            String cognome = view.getInput("Cognome: ");
            String dataNascitaStr = view.getInput("Data di Nascita (YYYY-MM-DD): ");

            Date dataNascita = Date.valueOf(dataNascitaStr);

            amministratoreDAO.registraAmministratore(username, password, nome, cognome, dataNascita);
            view.showMessage("Nuovo amministratore registrato con successo!");
        } catch (IllegalArgumentException e) {
            view.showMessage("Formato data non valido. Usa il formato YYYY-MM-DD.");
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }
}
