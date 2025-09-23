import java.io.*;
import java.net.*;

public class ServeurUDP 
{
	public static void main(String[] args)
	{
		try 
		{
			int port = 1234;
			DatagramSocket socket = new DatagramSocket(port);

			byte[] buffer = new byte[1024];
			DatagramPacket packet = new DatagramPacket(buffer, buffer.length);

			socket.receive(packet);

			String message = new String(packet.getData(), 0, packet.getLength());
			System.out.println("Message reçu : " + message);

			socket.close();
		} 
		catch (Exception e) 
		{
			e.printStackTrace();
		}
	}
}

