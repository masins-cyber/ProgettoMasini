package main.java.controller;

import main.java.dao.CredenzialiDAO;
import main.java.dao.UtenteStandardDAO;
import main.java.exception.DAOException;
import main.java.model.Credenziali;
import main.java.view.AdminView;
import main.java.view.LoginView;
import main.java.view.UtenteStandardView;

import java.io.IOException;
import java.sql.Date;

public class LoginController implements Controller {
    private final CredenzialiDAO credenzialiDAO;
    private final UtenteStandardDAO utenteStandardDAO;
    private final LoginView loginView;

    public LoginController() {
        this.credenzialiDAO = new CredenzialiDAO();
        this.utenteStandardDAO = new UtenteStandardDAO();
        this.loginView = new LoginView();
    }

    @Override
    public void start() throws IOException, DAOException {
        boolean running = true;

        while (running) {
            int choice = loginView.displayLoginMenuAndGetChoice();

            switch (choice) {
                case 1:
                    handleLogin();
                    break;
                case 2:
                    registrazioneUtenteStandard();
                    break;
                case 3:
                    loginView.showMessage("Uscita dall'applicazione.");
                    running = false;
                    break;
                default:
                    loginView.showMessage("Comando non valido. Riprova.");
            }
        }
    }

    private void handleLogin() {
        String username = loginView.getInput("Username: ");
        String password = loginView.getInput("Password: ");

        try {
            Credenziali credenziali = credenzialiDAO.login(username, password);

            if (credenziali != null) {
                loginView.showMessage("Login riuscito! Ruolo: " + credenziali.getRuolo());

                if ("amministratore".equalsIgnoreCase(credenziali.getRuolo())) {
                    AdminView adminView = new AdminView();
                    AdminController adminController = new AdminController(adminView, username);
                    adminController.start();
                } else if ("standard".equalsIgnoreCase(credenziali.getRuolo())) {
                    UtenteStandardView utenteStandardView = new UtenteStandardView();
                    UtenteStandardController utenteStandardController = new UtenteStandardController(utenteStandardView, username);
                    utenteStandardController.start();
                } else {
                    loginView.showMessage("Ruolo utente non riconosciuto dal sistema.");
                }
            } else {
                loginView.showMessage("Login fallito. Credenziali non valide.");
            }
        } catch (DAOException e) {
            loginView.showMessage("\n[!] " + e.getMessage());
        } catch (IOException e) {
            loginView.showMessage("\n[!] Errore di I/O durante l'operazione: " + e.getMessage() + "\n");
        }
    }

    private void registrazioneUtenteStandard() {
        try {
            String username = loginView.getInput("Username: ");
            String password = loginView.getInput("Password: ");
            String nome = loginView.getInput("Nome: ");
            String cognome = loginView.getInput("Cognome: ");
            String dataNascitaStr = loginView.getInput("Data di Nascita (YYYY-MM-DD): ");
            String residenza = loginView.getInput("Residenza: ");
            String fatturazione = loginView.getInput("Fatturazione (INVIO se coincide con Residenza): ");
            if (fatturazione.isEmpty()) {
                fatturazione = null;
            }
            String contattoTipo = loginView.getInput("Tipo di recapito (email, telefono, cellulare): ");
            String contattoValore = loginView.getInput("Valore recapito: ");

            Date dataNascita = Date.valueOf(dataNascitaStr);

            utenteStandardDAO.registraUtenteStandard(
                    username,
                    password,
                    nome,
                    cognome,
                    dataNascita,
                    residenza,
                    fatturazione,
                    contattoValore,
                    contattoTipo
            );

            loginView.showMessage("Registrazione completata con successo. Ora puoi effettuare il login.");
        } catch (IllegalArgumentException e) {
            loginView.showMessage("Formato data non valido. Usa il formato YYYY-MM-DD.");
        } catch (DAOException e) {
            loginView.showMessage(e.getMessage());
        }
    }
}
