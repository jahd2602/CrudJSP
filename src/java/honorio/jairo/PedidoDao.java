/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package honorio.jairo;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

/**
 *
 * @author Sistemas
 */
public class PedidoDao {

    private final Connection connection;
    private final PreparedStatement psCrearTabla;
    private final PreparedStatement psEliminarTabla;
    private final PreparedStatement psListarTodos;
    private final PreparedStatement psCantidad;
    private final PreparedStatement psInsertar;

    PedidoDao(Connection connection) throws SQLException {
        this.connection = connection;
        psCrearTabla = connection.prepareStatement("create table pedido ("
                + "id integer primary key not null generated always "
                + "as identity (start with 1, increment by 1),"
                + "nombretitular varchar (20),"
                + "pedido varchar (20),"
                + "fechacompra varchar (8)"
                + ")");
        psEliminarTabla = connection.prepareStatement("drop table pedido");
        psListarTodos = connection.prepareStatement("select nombretitular, pedido, fechacompra from APP.PEDIDO");
        psCantidad = connection.prepareStatement("SELECT MAX(ID) FROM APP.PEDIDO");
        psInsertar = connection.prepareStatement("INSERT INTO APP.PEDIDO (NOMBRETITULAR, PEDIDO, FECHACOMPRA) VALUES (?,?,?)");
    }

    public void crearTabla() throws SQLException {
        psCrearTabla.clearParameters();
        psCrearTabla.execute();
    }

    public void eliminarTabla() throws SQLException {
        psEliminarTabla.clearParameters();
        psEliminarTabla.execute();
    }

    public ArrayList<Pedido> listarTodos() throws SQLException {
        ResultSet rs = psListarTodos.executeQuery();
        ArrayList<Pedido> pedidos = new ArrayList<Pedido>();
        while (rs.next()) {
            pedidos.add(new Pedido(
                    rs.getString(1), rs.getString(1), rs.getString(1)));
        }
        return pedidos;
    }

    public int cantidad() throws SQLException {
        psCantidad.clearParameters();
        ResultSet rs = psCantidad.executeQuery();
        rs.next();
        return rs.getInt(1);
    }

    public void insertar(Pedido nuevo) throws SQLException {
        psInsertar.clearParameters();
        psInsertar.setString(1, nuevo.getNombreTitular());
        psInsertar.setString(2, nuevo.getPedido());
        psInsertar.setString(3, nuevo.getFechaCompra());
        psInsertar.execute();
    }
}
