/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package neisha200923;

import javax.swing.*;
import java.awt.*;
import java.util.concurrent.TimeUnit;


/**
 *
 * @author hp
 */
public class BannerApp {
    public static void main(String[] args) {
        JFrame frame = new JFrame("Banner 2 Tulisan");
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);
        frame.setSize(500, 120);

        JPanel panel = new JPanel();
        frame.add(panel);
        panel.setLayout(null);

        JLabel label1 = new JLabel("Neisha");
        label1.setFont(new Font("Arial", Font.PLAIN, 24));
        label1.setForeground(Color.BLACK);
        panel.add(label1);

        JLabel label2 = new JLabel("Salsabila");
        label2.setFont(new Font("Arial", Font.PLAIN, 24));
        label2.setForeground(Color.BLACK);
        panel.add(label2);

        label1.setBounds(0, 0, 400, 50);
        label2.setBounds(200, 0, 400, 100);

        frame.setVisible(true);

        Thread thread1 = new Thread(new Runnable() {
            public void run() {
                int xPos1 = 0;
                while (true) {
                    label1.setLocation(xPos1, 0);
                    xPos1++;
                    if (xPos1 > frame.getWidth()) {
                        xPos1 = -label1.getWidth();
                    }
                    try {
                        TimeUnit.MILLISECONDS.sleep(10); // Adjust the speed of movement
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        });

        Thread thread2 = new Thread(new Runnable() {
            public void run() {
                int xPos2 = frame.getWidth();
                while (true) {
                    label2.setLocation(xPos2, 0);
                    xPos2--;
                    if (xPos2 < -label2.getWidth()) {
                        xPos2 = frame.getWidth();
                    }
                    try {
                        TimeUnit.MILLISECONDS.sleep(10); // Adjust the speed of movement
                    } catch (InterruptedException e) {
                        e.printStackTrace();
                    }
                }
            }
        });

        thread1.start();
        thread2.start();
    }
}