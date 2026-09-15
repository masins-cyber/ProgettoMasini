package main.java.view;

import main.java.model.Categoria;

import java.util.List;
import java.util.Map;
import java.util.Scanner;

public class AdminView {
    private static final Scanner scanner = new Scanner(System.in);

    public int displayMenuAndGetChoice(String adminUsername) {
        System.out.println("\n--- PANNELLO AMMINISTRAZIONE (" + adminUsername + ") ---");
        System.out.println("1. Crea nuova categoria");
        System.out.println("2. Visualizza tutte le categorie");
        System.out.println("3. Genera report vendite globale");
        System.out.println("4. Registra nuovo amministratore");
        System.out.println("5. Logout");
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

    public void mostraCategorie(List<Categoria> categorie) {
        System.out.println("\n--- ALBERO GERARCHICO CATEGORIE ---");
        if (categorie.isEmpty()) {
            System.out.println("Nessuna categoria censita.");
            return;
        }
        for (Categoria c : categorie) {
            String padreInfo;
            if (c.getNomePadre() != null) {
                padreInfo = " [Sottocategoria di: " + c.getNomePadre() + "]";
            } else {
                padreInfo = " [Radice]";
            }

            System.out.println("#" + c.getIdCategoria() + " - " + c.getNomeCategoria() + padreInfo + " (Creato da: " + c.getAmministratore() + ")");
        }
    }

    public void stampaReportVendite(List<Map<String, Object>> report) {
        System.out.println("\n----------------- REPORT VENDITE GLOBALE -----------------");
        if (report.isEmpty()) {
            System.out.println("Nessun dato di vendita disponibile.");
            return;
        }
        System.out.printf("%-15s %-25s %-10s %-10s %-10s\n", "Username", "Nominativo", "Totali", "Venduti", "% Successo");
        for (Map<String, Object> riga : report) {
            System.out.printf("%-15s %-25s %-10d %-10d %-10.2f%%\n",
                    riga.get("username"),
                    riga.get("nominativo"),
                    (int) riga.get("totali"),
                    (int) riga.get("venduti"),
                    (double) riga.get("percentuale"));
        }
    }
}