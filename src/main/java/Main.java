import java.util.Scanner;

public class Main {

    public static void main(String[] args) {
        Scanner scanner = new Scanner(System.in);
        int opcion;

        Conexion.probarConexion();

        do {
            System.out.println("       SISTEMA DE BIBLIOTECA");
            System.out.println("1. Gestionar libros");
            System.out.println("2. Gestionar socios");
            System.out.println("3. Gestionar ejemplares");
            System.out.println("4. Gestionar préstamos");
            System.out.println("0. Salir");
            System.out.print("\nSeleccione una opción: ");

            try {
                opcion = Integer.parseInt(scanner.nextLine());
            } catch (NumberFormatException e) {
                System.out.println("Ingresa un número válido.");
                opcion = -1;
                continue;
            }

            switch (opcion) {
                case 1 -> Libro.menu(scanner);
                case 2 -> Socio.menu(scanner);
                case 3 -> Ejemplar.menu(scanner);
                case 4 -> Prestamo.menu(scanner);
                case 0 -> System.out.println("¡Hasta luego!");
                default -> System.out.println(" Opción no válida.");
            }

        } while (opcion != 0);

        scanner.close();
    }
}