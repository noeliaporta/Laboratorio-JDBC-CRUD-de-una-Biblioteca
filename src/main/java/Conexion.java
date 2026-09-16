import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Conexion {

    // Datos de conexión centralizados — cambiar si tu configuración es diferente
    private static final String URL = "jdbc:mariadb://localhost:3306/Biblioteca_DB";
    private static final String USUARIO = "root";
    private static final String CONTRASENA = ""; // Cambiar si tu MySQL/MariaDB tiene contraseña

    public static Connection getConexion() throws SQLException {
        return DriverManager.getConnection(URL, USUARIO, CONTRASENA);
    }

    public static void probarConexion() {
        try (Connection con = getConexion()) {
            System.out.println("Conexión exitosa a Biblioteca_DB");
        } catch (SQLException e) {
            System.out.println(" Error al conectar: " + e.getMessage());
            System.out.println("   Verificá que MariaDB/MySQL esté corriendo y que la base Biblioteca_DB exista.");
        }
    }
}