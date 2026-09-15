package main.java.model;

import java.sql.Timestamp;

@SuppressWarnings("unused")
public class Commento {
    private String commentatore;
    private Timestamp dataOra;
    private String testo;
    private int annuncio;

    public Commento() {}

    public Commento(String commentatore, Timestamp dataOra, String testo, int annuncio) {
        this.commentatore = commentatore;
        this.dataOra = dataOra;
        this.testo = testo;
        this.annuncio = annuncio;
    }

    public String getCommentatore() {
        return commentatore;
    }

    public void setCommentatore(String commentatore) {
        this.commentatore = commentatore;
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
}
