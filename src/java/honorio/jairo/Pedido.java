/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package honorio.jairo;

/**
 *
 * @author Sistemas
 */
public class Pedido {
//    private int id;
    private String nombreTitular;
    private String pedido;
    private String fechaCompra;

//    public Pedido(int id, String nombreTitular, String pedido, String fechaCompra) {
//        this.id = id;
//        this.nombreTitular = nombreTitular;
//        this.pedido = pedido;
//        this.fechaCompra = fechaCompra;
//    }
    
    public Pedido(String nombreTitular, String pedido, String fechaCompra) {
        this.nombreTitular = nombreTitular;
        this.pedido = pedido;
        this.fechaCompra = fechaCompra;
    }

//    public int getId() {
//        return id;
//    }
//
//    public void setId(int id) {
//        this.id = id;
//    }

    public String getNombreTitular() {
        return nombreTitular;
    }

    public void setNombreTitular(String nombreTitular) {
        this.nombreTitular = nombreTitular;
    }

    public String getPedido() {
        return pedido;
    }

    public void setPedido(String pedido) {
        this.pedido = pedido;
    }

    public String getFechaCompra() {
        return fechaCompra;
    }

    public void setFechaCompra(String fechaCompra) {
        this.fechaCompra = fechaCompra;
    }
    
}
