package main.java.model;

import java.sql.Timestamp;

@SuppressWarnings("unused")
public class Messaggio {
    private String mittente;
    private Timestamp dataOra;
    private String testo;
    private int annuncio;
    private String destinatario;

    public Messaggio() {}

    public Messaggio(String mittente, Timestamp dataOra, String testo, int annuncio, String destinatario) {
        this.mittente = mittente;
        this.dataOra = dataOra;
        this.testo = testo;
        this.annuncio = annuncio;
        this.destinatario = destinatario;
    }

    public String getMittente() {
        return mittente;
    }

    public void setMittente(String mittente) {
        this.mittente = mittente;
    }

    public Timestamp getDataOra() {
        return dataOra;
    }

    public void setDataOra(Timestamp dataOra) {
        this.dataOra = dataOra;
    }

    public String getTesto() {
        return testo;
    }

    public void setTesto(String testo) {
        this.testo = testo;
    }

    public int getAnnuncio() {
        return annuncio;
    }

    public void setAnnuncio(int annuncio) {
        this.annuncio = annuncio;
    }

    public String getDestinatario() {
        return destinatario;
    }

    public void setDestinatario(String destinatario) {
        this.destinatario = destinatario;
    }
}