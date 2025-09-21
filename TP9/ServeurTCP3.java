import java.io.*;
import java.net.*;

public class ServeurTCP3 {
    public static void main(String[] args) {
        try {
            int port = 12345;
            ServerSocket serveur = new ServerSocket(port);
            System.out.println("Serveur TCP bidirectionnel en attente sur le port " + port);

            while (true) {
                Socket socket = serveur.accept();
                DataInputStream dIn = new DataInputStream(socket.getInputStream());
                DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());

                String message = dIn.readUTF();
                System.out.println("Message reçu : " + message);

                // inversion de la chaîne
                String rev = new StringBuilder(message).reverse().toString();

                dOut.writeUTF(rev);
                dOut.flush();

                socket.close();
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

