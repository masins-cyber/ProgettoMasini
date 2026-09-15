package main.java.model;

@SuppressWarnings("unused")
public class Monitoraggio {
    private String username;
    private int idAnnuncio;
    private boolean notificato;

    public Monitoraggio() {}

    public Monitoraggio(String username, int idAnnuncio, boolean notificato) {
        this.username = username;
        this.idAnnuncio = idAnnuncio;
        this.notificato = notificato;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public int getIdAnnuncio() {
        return idAnnuncio;
    }

    public void setIdAnnuncio(int idAnnuncio) {
        this.idAnnuncio = idAnnuncio;
    }

    public boolean isNotificato() {
        return notificato;
    }

    public void setNotificato(boolean notificato) {
        this.notificato = notificato;
    }
}
