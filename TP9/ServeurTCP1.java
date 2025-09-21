import java.io.*;
import java.net.*;

public class ServeurTCP1 {
    public static void main(String[] args) {
        try {
            int port = 12345;
            ServerSocket serveur = new ServerSocket(port);
            System.out.println("Serveur TCP en attente sur le port " + port);

            Socket socket = serveur.accept(); // Attente de connexion
            DataInputStream dIn = new DataInputStream(socket.getInputStream());

            String message = dIn.readUTF(); // lecture de la chaîne
            System.out.println("Message reçu : " + message);

            socket.close();
            serveur.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

