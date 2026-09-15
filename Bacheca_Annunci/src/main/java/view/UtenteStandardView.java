package main.java.view;

import main.java.model.Annuncio;
import main.java.model.Categoria;
import main.java.model.Commento;
import main.java.model.Messaggio;

import java.util.List;
import java.util.Scanner;

public class UtenteStandardView {
    private static final Scanner scanner = new Scanner(System.in);

    public int displayMenuAndGetChoice(String username, int modificatiCount) {
        if (modificatiCount > 0) {
            System.out.println("\n>>> NOTIFICA: " + modificatiCount + " annuncio/i monitorato/i ha subito modifiche! <<<");
        }
        System.out.println("\n--- MENU UTENTE STANDARD (" + username + ") ---");
        System.out.println("1. Visualizza bacheca");
        System.out.println("2. Sezione annuncio");
        System.out.println("3. Sezione monitoraggio");
        System.out.println("4. Sezione interazione");
        System.out.println("5. Gestione recapiti di contatto");
        System.out.println("6. Logout");
        System.out.print("Scegli un'opzione: ");

        try {
            return Integer.parseInt(scanner.nextLine().trim());
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    public int displayMenuSezioneAnnuncio() {
        System.out.println("\n--- SEZIONE ANNUNCIO ---");
        System.out.println("1. Pubblica nuovo annuncio");
        System.out.println("2. I miei annunci");
        System.out.println("3. Modifica un mio annuncio");
        System.out.println("4. Segna annuncio come venduto");
        System.out.println("5. Torna indietro");
        System.out.print("Scegli un'opzione: ");

        try {
            return Integer.parseInt(scanner.nextLine().trim());
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    public int displayMenuSezioneMonitoraggio() {
        System.out.println("\n--- SEZIONE MONITORAGGIO ---");
        System.out.println("1. Attiva monitoraggio annuncio");
        System.out.println("2. Visualizza annunci monitorati");
        System.out.println("3. Torna indietro");
        System.out.print("Scegli un'opzione: ");

        try {
            return Integer.parseInt(scanner.nextLine().trim());
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    public int displayMenuSezioneInterazione() {
        System.out.println("\n--- SEZIONE INTERAZIONE ---");
        System.out.println("1. Visualizza / Scrivi commenti");
        System.out.println("2. Visualizza / Invia messaggi privati");
        System.out.println("3. Torna indietro");
        System.out.print("Scegli un'opzione: ");

        try {
            return Integer.parseInt(scanner.nextLine().trim());
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    public int displayMenuSezioneContatti() {
        System.out.println("\n--- GESTIONE CONTATTI ---");
        System.out.println("1. Aggiungi recapito");
        System.out.println("2. Rimuovi recapito");
        System.out.println("3. Imposta recapito come preferito");
        System.out.println("4. Torna indietro");
        System.out.print("Scegli un'opzione: ");

        try {
            return Integer.parseInt(scanner.nextLine().trim());
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    public int displayMenuAzioneAnnuncio(int idAnnuncio, String autore) {
        System.out.println("\n--- DETTAGLIO ANNUNCIO #" + idAnnuncio + " (Autore: " + autore + ") ---");
        System.out.println("1. Visualizza / Scrivi commento");
        System.out.println("2. Visualizza / Invia messaggio privato");
        System.out.println("3. Attiva monitoraggio annuncio");
        System.out.println("4. Torna al menu iniziale");
        System.out.print("Scegli un'opzione: ");

        try {
            return Integer.parseInt(scanner.nextLine().trim());
        } catch (NumberFormatException e) {
            return -1;
        }
    }

    public String getInput(String prompt) {
        System.out.print(prompt);
        return scanner.nextLine().trim();
    }

    public void showMessage(String message) {
        System.out.println(message);
    }

    public void mostraBacheca(List<Annuncio> annunci) {
        System.out.println("\n--- BACHECA ANNUNCI ATTIVI ---");
        if (annunci.isEmpty()) {
            System.out.println("Nessun annuncio presente al momento.");
            return;
        }
        for (Annuncio a : annunci) {
            System.out.println("#" + a.getIdAnnuncio() + " [" + a.getTitolo() + "] - EUR " + a.getPrezzo() +
                    " | Venditore: " + a.getAutore() + " (Categoria: " + a.getNomeCategoria() + ")");
            System.out.println("    " + a.getDescrizione());
        }
    }

    public void mostraAnnunciMonitorati(List<Annuncio> annunci) {
        System.out.println("\n--- ANNUNCI MONITORATI ---");
        if (annunci.isEmpty()) {
            System.out.println("Non stai monitorando alcun annuncio.");
            return;
        }
        for (Annuncio a : annunci) {
            System.out.println("#" + a.getIdAnnuncio() + " [" + a.getTitolo() + "] - EUR " + a.getPrezzo() +
                    " | Venditore: " + a.getAutore() + " (Categoria: " + a.getNomeCategoria() + ")");
            System.out.println("    " + a.getDescrizione());
        }
    }

    public void mostraCategorie(List<Categoria> categorie) {
        System.out.println("\n--- CATEGORIE DISPONIBILI ---");
        if (categorie == null || categorie.isEmpty()) {
            System.out.println("Nessuna categoria disponibile.");
            return;
        }
        for (Categoria c : categorie) {
            String info;
            if (c.getNomePadre() != null && !c.getNomePadre().isEmpty()) {
                info = " (Sottocategoria di: " + c.getNomePadre() + ")";
            } else {
                info = " [Principale]";
            }
            System.out.println("[" + c.getIdCategoria() + "] " + c.getNomeCategoria() + info);
        }
    }

    public void mostraMieiAnnunci(List<Annuncio> annunci) {
        System.out.println("\n--- I MIEI ANNUNCI ---");
        if (annunci.isEmpty()) {
            System.out.println("Non hai ancora pubblicato annunci.");
            return;
        }
        for (Annuncio a : annunci) {
            String stato;
            if (a.isVenduto()) {
                stato = "[VENDUTO]";
            } else {
                stato = "[ATTIVO]";
            }
            System.out.println("#" + a.getIdAnnuncio() + " " + stato + " " + a.getTitolo() + " - EUR " + a.getPrezzo());
            System.out.println("    " + a.getDescrizione());
        }
    }

    public void mostraCommenti(List<Commento> commenti) {
        System.out.println("\n--- COMMENTI ---");
        if (commenti.isEmpty()) {
            System.out.println("Nessun commento per questo annuncio.");
            return;
        }
        for (Commento c : commenti) {
            System.out.println("[" + c.getDataOra() + "] " + c.getCommentatore() + ": " + c.getTesto());
        }
    }

    public void mostraMessaggi(List<Messaggio> messaggi) {
        System.out.println("\n--- MESSAGGI PRIVATI ---");
        if (messaggi.isEmpty()) {
            System.out.println("Nessun messaggio trovato.");
            return;
        }
        for (Messaggio m : messaggi) {
            System.out.println("[" + m.getDataOra() + "] " + m.getMittente() + " -> " + m.getDestinatario() + ": " + m.getTesto());
        }
    }
}