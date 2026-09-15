package main.java.model;

import java.sql.Timestamp;

@SuppressWarnings("unused")
public class Annuncio {
    private int idAnnuncio;
    private String titolo;
    private String descrizione;
    private double prezzo;
    private Timestamp dataPubblicazione;
    private boolean venduto;
    private String autore;
    private int categoria;
    private String nomeCategoria;

    public Annuncio() {}

    public Annuncio(int idAnnuncio, String titolo, String descrizione, double prezzo,
                    Timestamp dataPubblicazione, boolean venduto, String autore, int categoria) {
        this.idAnnuncio = idAnnuncio;
        this.titolo = titolo;
        this.descrizione = descrizione;
        this.prezzo = prezzo;
        this.dataPubblicazione = dataPubblicazione;
        this.venduto = venduto;
        this.autore = autore;
        this.categoria = categoria;
    }

    public int getIdAnnuncio() {
        return idAnnuncio;
    }

    public void setIdAnnuncio(int idAnnuncio) {
        this.idAnnuncio = idAnnuncio;
    }

    public String getTitolo() {
        return titolo;
    }

    public void setTitolo(String titolo) {
        this.titolo = titolo;
    }

    public String getDescrizione() {
        return descrizione;
    }

    public void setDescrizione(String descrizione) {
        this.descrizione = descrizione;
    }

    public double getPrezzo() {
        return prezzo;
    }

    public void setPrezzo(double prezzo) {
        this.prezzo = prezzo;
    }

    public Timestamp getDataPubblicazione() {
        return dataPubblicazione;
    }

    public void setDataPubblicazione(Timestamp dataPubblicazione) {
        this.dataPubblicazione = dataPubblicazione;
    }

    public boolean isVenduto() {
        return venduto;
    }

    public void setVenduto(boolean venduto) {
        this.venduto = venduto;
    }

    public String getAutore() {
        return autore;
    }

    public void setAutore(String autore) {
        this.autore = autore;
    }

    public int getCategoria() {
        return categoria;
    }

    public void setCategoria(int categoria) {
        this.categoria = categoria;
    }

    public String getNomeCategoria() {
        return nomeCategoria;
    }

    public void setNomeCategoria(String nomeCategoria) {
        this.nomeCategoria = nomeCategoria;
    }
}