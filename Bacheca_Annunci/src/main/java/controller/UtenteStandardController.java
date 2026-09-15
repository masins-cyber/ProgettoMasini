package main.java.controller;

import main.java.dao.*;
import main.java.exception.DAOException;
import main.java.model.Annuncio;
import main.java.model.Categoria;
import main.java.model.Commento;
import main.java.model.Messaggio;
import main.java.view.UtenteStandardView;

import java.io.IOException;
import java.util.List;

public class UtenteStandardController implements Controller {
    private final String username;
    private final UtenteStandardView view;
    private final AnnuncioDAO annuncioDAO;
    private final CommentoDAO commentoDAO;
    private final MessaggioDAO messaggioDAO;
    private final MonitoraggioDAO monitoraggioDAO;
    private final UtenteStandardDAO utenteStandardDAO;

    public UtenteStandardController(UtenteStandardView view, String username) {
        this.username = username;
        this.view = view;
        this.annuncioDAO = new AnnuncioDAO();
        this.commentoDAO = new CommentoDAO();
        this.messaggioDAO = new MessaggioDAO();
        this.monitoraggioDAO = new MonitoraggioDAO();
        this.utenteStandardDAO = new UtenteStandardDAO();
    }

    @Override
    public void start() throws IOException, DAOException {

        try {
            List<Annuncio> modificati = monitoraggioDAO.verificaAnnunciModificati(username);
            if (modificati != null && !modificati.isEmpty()) {
                view.showMessage("\n************************************************************");
                view.showMessage(" ATTENZIONE: " + modificati.size() + " annuncio/i monitorato/i ha subito variazioni!");
                for (Annuncio a : modificati) {
                    view.showMessage(" -> #" + a.getIdAnnuncio() + " [" + a.getTitolo() + "] - Prezzo: "
                            + a.getPrezzo() + " EUR (Venditore: " + a.getAutore() + ")");
                }
                view.showMessage("************************************************************\n");
            }
        } catch (DAOException ignored) {}

        boolean running = true;

        while (running) {
            int modificatiCount = 0;
            try {
                List<Annuncio> modificati = monitoraggioDAO.verificaAnnunciModificati(username);
                if (modificati != null) {
                    modificatiCount = modificati.size();
                }
            } catch (DAOException ignored) {}

            int choice = view.displayMenuAndGetChoice(username, modificatiCount);

            switch (choice) {
                case 1:
                    visualizzaBacheca();
                    break;
                case 2:
                    gestisciSezioneAnnuncio();
                    break;
                case 3:
                    gestisciSezioneMonitoraggio();
                    break;
                case 4:
                    gestisciSezioneInterazione();
                    break;
                case 5:
                    gestisciSezioneContatti();
                    break;
                case 6:
                    view.showMessage("Logout effettuato.");
                    running = false;
                    break;
                default:
                    view.showMessage("Opzione non valida. Riprova.");
            }
        }
    }

    private void gestisciSezioneAnnuncio() {
        boolean back = false;
        while (!back) {
            int choice = view.displayMenuSezioneAnnuncio();
            switch (choice) {
                case 1:
                    pubblicaAnnuncio();
                    break;
                case 2:
                    visualizzaMieiAnnunci();
                    break;
                case 3:
                    modificaAnnuncio();
                    break;
                case 4:
                    segnaAnnuncioVenduto();
                    break;
                case 5:
                    back = true;
                    break;
                default:
                    view.showMessage("Opzione non valida. Riprova.");
            }
        }
    }

    private void gestisciSezioneMonitoraggio() {
        boolean back = false;
        while (!back) {
            int choice = view.displayMenuSezioneMonitoraggio();
            switch (choice) {
                case 1:
                    attivaMonitoraggio();
                    break;
                case 2:
                    visualizzaMonitorati();
                    break;
                case 3:
                    back = true;
                    break;
                default:
                    view.showMessage("Opzione non valida. Riprova.");
            }
        }
    }

    private void gestisciSezioneInterazione() {
        boolean back = false;
        while (!back) {
            int choice = view.displayMenuSezioneInterazione();
            switch (choice) {
                case 1:
                    gestisciCommenti();
                    break;
                case 2:
                    gestisciMessaggi();
                    break;
                case 3:
                    back = true;
                    break;
                default:
                    view.showMessage("Opzione non valida. Riprova.");
            }
        }
    }

    private void gestisciSezioneContatti() {
        boolean back = false;
        while (!back) {
            int choice = view.displayMenuSezioneContatti();
            switch (choice) {
                case 1:
                    aggiungiContatto();
                    break;
                case 2:
                    rimuoviContatto();
                    break;
                case 3:
                    impostaContattoPreferito();
                    break;
                case 4:
                    back = true;
                    break;
                default:
                    view.showMessage("Opzione non valida. Riprova.");
            }
        }
    }

    private void rimuoviContatto() {
        try {
            String tipo = view.getInput("Tipo (email, telefono, cellulare): ");
            String valore = view.getInput("Valore del recapito da rimuovere: ");

            utenteStandardDAO.rimuoviContatto(username, tipo, valore);
            view.showMessage("Recapito rimosso con successo.");
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }

    private void visualizzaBacheca() {
        try {
            List<Annuncio> bacheca = annuncioDAO.visualizzaAnnunciNonVenduti();
            view.mostraBacheca(bacheca);

            if (bacheca.isEmpty()) {
                return;
            }

            String idStr = view.getInput("\nInserisci l'ID dell'annuncio per visualizzarlo/interagire (premi INVIO per tornare al menu): ");
            if (idStr.isEmpty()) {
                return;
            }

            int idAnnuncio = Integer.parseInt(idStr);
            Annuncio scelto = null;
            for (Annuncio a : bacheca) {
                if (a.getIdAnnuncio() == idAnnuncio) {
                    scelto = a;
                    break;
                }
            }

            if (scelto == null) {
                view.showMessage("Nessun annuncio attivo trovato con questo ID.");
                return;
            }

            gestisciAzioneAnnuncio(scelto);

        } catch (NumberFormatException e) {
            view.showMessage("ID annuncio non valido.");
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }

    private void gestisciAzioneAnnuncio(Annuncio annuncio) {
        boolean back = false;
        while (!back) {
            int choice = view.displayMenuAzioneAnnuncio(annuncio.getIdAnnuncio(), annuncio.getAutore());
            switch (choice) {
                case 1:
                    gestisciCommenti(annuncio.getIdAnnuncio());
                    break;
                case 2:
                    gestisciMessaggi(annuncio.getIdAnnuncio(), annuncio.getAutore());
                    break;
                case 3:
                    try {
                        monitoraggioDAO.monitoraAnnuncio(username, annuncio.getIdAnnuncio());
                        view.showMessage("Monitoraggio attivato con successo.");
                    } catch (DAOException e) {
                        view.showMessage(e.getMessage());
                    }
                    break;
                case 4:
                    back = true;
                    break;
                default:
                    view.showMessage("Opzione non valida. Riprova.");
            }
        }
    }

    private void pubblicaAnnuncio() {
        try {
            List<Categoria> categorie = new CategoriaDAO().visualizzaTutteCategorie(false);
            view.mostraCategorie(categorie);
            String titolo = view.getInput("Titolo: ");
            String descrizione = view.getInput("Descrizione: ");
            double prezzo = Double.parseDouble(view.getInput("Prezzo: "));
            int idCategoria = Integer.parseInt(view.getInput("ID Categoria: "));

            annuncioDAO.pubblicazioneAnnuncio(titolo, descrizione, prezzo, username, idCategoria);
            view.showMessage("Annuncio pubblicato con successo!");
        } catch (NumberFormatException e) {
            view.showMessage("Dato numerico non valido.");
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }

    private void visualizzaMieiAnnunci() {
        try {
            List<Annuncio> miei = annuncioDAO.visualizzaAnnunciUtente(username);
            view.mostraMieiAnnunci(miei);
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }

    private void modificaAnnuncio() {
        try {
            int idAnnuncio = Integer.parseInt(view.getInput("ID Annuncio da modificare: "));

            annuncioDAO.verificaModificabilitaAnnuncio(idAnnuncio, this.username);

            String nuovoTitolo = view.getInput("Nuovo Titolo: ");
            String nuovaDescrizione = view.getInput("Nuova Descrizione: ");
            double nuovoPrezzo = Double.parseDouble(view.getInput("Nuovo Prezzo: "));

            annuncioDAO.modificaAnnuncio(idAnnuncio, this.username, nuovoTitolo, nuovaDescrizione, nuovoPrezzo);
            view.showMessage("Annuncio modificato con successo.");

        } catch (NumberFormatException e) {
            view.showMessage("Valore numerico non valido.");
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }

    private void segnaAnnuncioVenduto() {
        try {
            int idAnnuncio = Integer.parseInt(view.getInput("ID Annuncio venduto: "));
            annuncioDAO.annuncioVenduto(idAnnuncio, username);
            view.showMessage("Annuncio contrassegnato come VENDUTO.");
        } catch (NumberFormatException e) {
            view.showMessage("ID annuncio non valido.");
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }

    private void attivaMonitoraggio() {
        try {
            int idAnnuncio = Integer.parseInt(view.getInput("ID Annuncio da monitorare: "));
            monitoraggioDAO.monitoraAnnuncio(username, idAnnuncio);
            view.showMessage("Monitoraggio attivato.");
        } catch (NumberFormatException e) {
            view.showMessage("ID annuncio non valido.");
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }

    private void visualizzaMonitorati() {
        try {
            List<Annuncio> monitorati = monitoraggioDAO.getAnnunciMonitorati(username);
            view.mostraAnnunciMonitorati(monitorati);

            List<Annuncio> modificati = monitoraggioDAO.verificaAnnunciModificati(username);
            if (modificati != null && !modificati.isEmpty()) {
                String risposta = view.getInput("Vuoi azzerare le notifiche per questi annunci? (s/n): ");
                if ("s".equalsIgnoreCase(risposta)) {
                    monitoraggioDAO.resettaFlagNotifica(username, null);
                    view.showMessage("Notifiche azzerate con successo.");
                }
            }
        } catch (DAOException e) {
            view.showMessage("Errore nel recupero degli annunci monitorati: " + e.getMessage());
        }
    }

    private void gestisciCommenti() {
        try {
            int idAnnuncio = Integer.parseInt(view.getInput("ID Annuncio: "));
            gestisciCommenti(idAnnuncio);
        } catch (NumberFormatException e) {
            view.showMessage("ID annuncio non valido.");
        }
    }

    private void gestisciCommenti(int idAnnuncio) {
        try {
            List<Commento> commenti = commentoDAO.visualizzaCommenti(idAnnuncio);
            view.mostraCommenti(commenti);

            String risp = view.getInput("Vuoi lasciare un commento? (s/n): ");
            if ("s".equalsIgnoreCase(risp)) {
                String testo = view.getInput("Testo commento: ");
                commentoDAO.invioCommento(username, idAnnuncio, testo);
                view.showMessage("Commento inviato con successo.");
            }
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }

    private void gestisciMessaggi() {
        try {
            int idAnnuncio = Integer.parseInt(view.getInput("ID Annuncio: "));
            String destinatario = view.getInput("Destinatario: ");
            gestisciMessaggi(idAnnuncio, destinatario);
        } catch (NumberFormatException e) {
            view.showMessage("ID annuncio non valido.");
        }
    }

    private void gestisciMessaggi(int idAnnuncio, String destinatario) {
        try {
            List<Messaggio> messaggi = messaggioDAO.visualizzaMessaggi(idAnnuncio, username);
            view.mostraMessaggi(messaggi);

            String risp = view.getInput("Vuoi inviare un messaggio a " + destinatario + "? (s/n): ");
            if ("s".equalsIgnoreCase(risp)) {
                String testo = view.getInput("Testo messaggio: ");
                messaggioDAO.invioMessaggio(username, destinatario, idAnnuncio, testo);
                view.showMessage("Messaggio inviato con successo.");
            }
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }

    private void aggiungiContatto() {
        try {
            String tipo = view.getInput("Tipo (email, telefono, cellulare): ");
            String valore = view.getInput("Valore: ");
            String pref = view.getInput("Imposta come preferito? (s/n): ");
            boolean preferito = "s".equalsIgnoreCase(pref);

            utenteStandardDAO.registraContatto(username, tipo, valore, preferito);
            view.showMessage("Recapito registrato con successo.");
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }

    private void impostaContattoPreferito() {
        try {
            String tipo = view.getInput("Tipo (email, telefono, cellulare): ");
            String valore = view.getInput("Valore del recapito da rendere preferito: ");

            utenteStandardDAO.impostaContattoPreferito(username, tipo, valore);
            view.showMessage("Recapito impostato come preferito con successo.");
        } catch (DAOException e) {
            view.showMessage(e.getMessage());
        }
    }
}