/*
 * To change this template, choose Tools | Templates
 * and open the template in the editor.
 */
package honorio.jairo;

import java.sql.Connection;
import java.sql.DriverManager;

/**
 *
 * @author Sistemas
 */
public class Conexion {

    public static final String STR_DRIVER = "org.apache.derby.jdbc.ClientDriver";
    public static final String STR_CONNECTION = "jdbc:derby://localhost:1527/jahd";
    public static final String STR_USER = "app";
    public static final String STR_PWD = "app";
    private static Conexion instance;
    private PedidoDao pedidoDao;
    private Connection connection;
    private boolean error;

    private Conexion() {
        try {
            Class.forName(STR_DRIVER);
            connection = DriverManager.getConnection(STR_CONNECTION, STR_USER, STR_PWD);
            pedidoDao = new PedidoDao(connection);
            error = false;
        } catch (Exception e) {
            connection = null;
            e.printStackTrace();
//            System.exit(-1);
            error = true;
        }
    }

    public static Conexion getInstance() throws Exception {
        if (instance == null ||instance.error) {
            instance = new Conexion();
        }
        if (instance.error) {
            throw new Exception("No se pudo conectar a la Base de Datos");
        } else {
            return instance;
        }

    }

    public static PedidoDao getPedidoDao() throws Exception {
        return getInstance().pedidoDao;
    }
}
