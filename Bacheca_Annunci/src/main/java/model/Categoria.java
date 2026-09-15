package main.java.model;

@SuppressWarnings("unused")
public class Categoria {
    private int idCategoria;
    private String nomeCategoria;
    private Integer padre;
    private String nomePadre;
    private String amministratore;

    public Categoria() {}

    public Categoria(int idCategoria, String nomeCategoria, Integer padre, String amministratore) {
        this.idCategoria = idCategoria;
        this.nomeCategoria = nomeCategoria;
        this.padre = padre;
        this.amministratore = amministratore;
    }

    public int getIdCategoria() {
        return idCategoria;
    }

    public void setIdCategoria(int idCategoria) {
        this.idCategoria = idCategoria;
    }

    public String getNomeCategoria() {
        return nomeCategoria;
    }

    public void setNomeCategoria(String nomeCategoria) {
        this.nomeCategoria = nomeCategoria;
    }

    public Integer getPadre() {
        return padre;
    }

    public void setPadre(Integer padre) {
        this.padre = padre;
    }

    public String getNomePadre() {
        return nomePadre;
    }

    public void setNomePadre(String nomePadre) {
        this.nomePadre = nomePadre;
    }

    public String getAmministratore() {
        return amministratore;
    }

    public void setAmministratore(String amministratore) {
        this.amministratore = amministratore;
    }
}
