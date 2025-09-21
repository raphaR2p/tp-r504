import java.io.*;
import java.net.*;

public class ServeurTCP2 {
    public static void main(String[] args) {
        try {
            int port = 12345;
            ServerSocket serveur = new ServerSocket(port);
            System.out.println("Serveur TCP statique en attente sur le port " + port);

            while (true) {
                Socket socket = serveur.accept();
                DataInputStream dIn = new DataInputStream(socket.getInputStream());

                String message = dIn.readUTF();
                System.out.println("Message reçu : " + message);

                socket.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

