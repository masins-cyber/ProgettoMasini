package main.java.main;

import main.java.controller.LoginController;
import main.java.exception.DAOException;

import java.io.IOException;

public class Main {
    public static void main(String[] args) {
        try {
            LoginController loginController = new LoginController();
            loginController.start();
        } catch (DAOException e) {
            System.err.println("\n[ERRORE DATABASE CRITICO] Impossibile proseguire l'esecuzione: " + e.getMessage());
        } catch (IOException e) {
            System.err.println("\n[ERRORE DI I/O] Errore durante le operazioni di input/output: " + e.getMessage());
        } catch (Exception e) {
            System.err.println("\n[ERRORE IMPREVISTO] Si è verificata un'anomalia di sistema: " + e.getMessage());
        }
    }
}