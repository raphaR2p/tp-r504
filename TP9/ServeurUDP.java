import java.io.*;
import java.net.*;

public class ServeurUDP {
    public static void main(String[] args) {
        try {
            // On choisit un port (exemple : 12345)
            int port = 12345;
            DatagramSocket socket = new DatagramSocket(port);

            System.out.println("Serveur UDP démarré sur le port " + port);

            // Buffer pour recevoir les données
            byte[] buffer = new byte[1024];
            DatagramPacket packet = new DatagramPacket(buffer, buffer.length);

            // Attente de réception
            socket.receive(packet);

            // Conversion en String
            String message = new String(packet.getData(), 0, packet.getLength());
            System.out.println("Message reçu : " + message);

            socket.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

