import java.io.*;
import java.net.*;

public class ClientTCP2 {
    public static void main(String[] args) {
        try {
            Socket socket = new Socket("localhost", 12345);
            DataOutputStream dOut = new DataOutputStream(socket.getOutputStream());

            dOut.writeUTF(args[0]); // on envoie l'argument passé
            dOut.flush();

            socket.close();
        } catch (Exception e) {
            e.printStackTrace();
        }
    }
}

