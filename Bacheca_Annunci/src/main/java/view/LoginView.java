package main.java.view;

import java.util.Scanner;

public class LoginView {
    private static final Scanner scanner = new Scanner(System.in);

    public int displayLoginMenuAndGetChoice() {
        System.out.println("\n--- Bacheca Annunci ---");
        System.out.println("1. Login");
        System.out.println("2. Registrazione Utente Standard");
        System.out.println("3. Esci");
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
}
