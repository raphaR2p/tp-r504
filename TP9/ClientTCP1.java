import java.io.*;
import java.net.*;

public class ClientTCP1 {
	public static void main(String[] args) {
		try {
			Socket socket = new Socket("localhost", 12345);
			DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());

			dOut.writeUTF("C'est comment");
			dOut.flush();

			socket.close();
		} catch (Exception e) {
			e.printStackTrace();
		}
	}
}

