import java.io.*;
import java.net.*;

public class ClientTCP3 {
	public static void main(String[] args) {
		try {
			Socket socket = new Socket("localhost", 12345);
			DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());
			DataInputStream dIn = new DataInputStream(socket.getInputStream());

			dOut.writeUTF(args[0]);
			dOut.flush();

			String reponse = dIn.readUTF();
			System.out.println("Réponse du serveur : " + reponse);

			socket.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

