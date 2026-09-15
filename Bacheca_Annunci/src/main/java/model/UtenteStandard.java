package main.java.model;

import java.sql.Date;

@SuppressWarnings("unused")
public class UtenteStandard {
    private String username;
    private String nome;
    private String cognome;
    private Date dataNascita;
    private String indResidenza;
    private String indFatturazione;

    public UtenteStandard() {}

    public UtenteStandard(String username, String nome, String cognome, Date dataNascita, String indResidenza, String indFatturazione) {
        this.username = username;
        this.nome = nome;
        this.cognome = cognome;
        this.dataNascita = dataNascita;
        this.indResidenza = indResidenza;
        this.indFatturazione = indFatturazione;
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

    public String getIndResidenza() {
        return indResidenza;
    }

    public void setIndResidenza(String indResidenza) {
        this.indResidenza = indResidenza;
    }

    public String getIndFatturazione() {
        return indFatturazione;
    }

    public void setIndFatturazione(String indFatturazione) {
        this.indFatturazione = indFatturazione;
    }
}