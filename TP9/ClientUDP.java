import java.io.*;
import java.net.*;

public class ClientUDP {
    public static void main(String[] args) {
        try {
            String s = "Ca dit quoi l'equipe";
            byte[] data = s.getBytes();

            InetAddress adresse = InetAddress.getByName("localhost");
            int port = 12345;

            DatagramSocket socket = new DatagramSocket();
            DatagramPacket packet = new DatagramPacket(data, data.length, adresse, port);

            socket.send(packet);

            // Attente de la réponse
            byte[] buffer = new byte[1024];
            DatagramPacket reponse = new DatagramPacket(buffer, buffer.length);
            socket.receive(reponse);

            String msgRecu = new String(reponse.getData(), 0, reponse.getLength());
            System.out.println("Réponse du serveur : " + msgRecu);

            socket.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

