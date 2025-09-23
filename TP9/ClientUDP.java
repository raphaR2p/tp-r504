import java.io.*;
import java.net.*;

public class ClientUDP {
	public static void main(String[] args) {
		try {
			String s = "wsh l'equipe";
			byte[] data = s.getBytes();

			InetAddress adresse = InetAddress.getByName("localhost");
			int port = 1234;

			DatagramSocket socket = new DatagramSocket();
			DatagramPacket packet = new DatagramPacket(data, data.length, adresse, port);

			socket.send(packet);

			socket.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

