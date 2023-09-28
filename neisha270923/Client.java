/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package neisha270923;
import java.io.*;
import java.net.*;
/**
 *
 * @author hp
 */
public class Client {
    public static void main(String[] args) {
        try (
            Socket socket = new Socket("localhost", 12345);
            PrintWriter out = new PrintWriter(socket.getOutputStream(), true);
            BufferedReader in = new BufferedReader(new InputStreamReader(socket.getInputStream()));
            BufferedReader stdIn = new BufferedReader(new InputStreamReader(System.in))
        ) {
            String serverResponse;
            while ((serverResponse = in.readLine()) != null) {
                System.out.println("Server: " + serverResponse);
                if (serverResponse.startsWith("Selamat datang")) {
                    System.out.print("Anda: ");
                    String userInput = stdIn.readLine();
                    out.println(userInput);
                }
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}