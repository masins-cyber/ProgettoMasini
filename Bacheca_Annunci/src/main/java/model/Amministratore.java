package main.java.model;

import java.sql.Date;

@SuppressWarnings("unused")
public class Amministratore {
    private String username;
    private String nome;
    private String cognome;
    private Date dataNascita;

    public Amministratore() {}

    public Amministratore(String username, String nome, String cognome, Date dataNascita) {
        this.username = username;
        this.nome = nome;
        this.cognome = cognome;
        this.dataNascita = dataNascita;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getNome() {
        return nome;
    }

    public void setNome(String nome) {
        this.nome = nome;
    }

    public String getCognome() {
        return cognome;
    }

    public void setCognome(String cognome) {
        this.cognome = cognome;
    }

    public Date getDataNascita() {
        return dataNascita;
    }

    public void setDataNascita(Date dataNascita) {
        this.dataNascita = dataNascita;
    }
}
