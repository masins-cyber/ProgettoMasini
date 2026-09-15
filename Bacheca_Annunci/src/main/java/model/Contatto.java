package main.java.model;

@SuppressWarnings("unused")
public class Contatto {
    private String username;
    private String tipo;
    private String valore;
    private boolean preferito;

    public Contatto() {}

    public Contatto(String username, String tipo, String valore, boolean preferito) {
        this.username = username;
        this.tipo = tipo;
        this.valore = valore;
        this.preferito = preferito;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public String getTipo() {
        return tipo;
    }

    public void setTipo(String tipo) {
        this.tipo = tipo;
    }

    public String getValore() {
        return valore;
    }

    public void setValore(String valore) {
        this.valore = valore;
    }

    public boolean isPreferito() {
        return preferito;
    }

    public void setPreferito(boolean preferito) {
        this.preferito = preferito;
    }
}