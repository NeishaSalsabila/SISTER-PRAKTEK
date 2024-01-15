/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package neisha200923;
import javax.swing.*;
import java.awt.*;
import java.awt.event.*;
/**
 *
 * @author hp
 */
public class Banner {
    private JFrame frame;
    private JPanel bannerPanel;
    private JLabel bannerLabel;
    private String bannerText;
    private int bannerPosition;
    private Timer timer;

    public Banner() {
        frame = new JFrame("Banner Example");
        bannerPanel = new JPanel();
        bannerText = "Neisha Salsabila ! ";
        bannerPosition = 0;

        bannerLabel = new JLabel(bannerText);
        bannerLabel.setFont(new Font("Arial", Font.BOLD, 24));

        bannerPanel.setLayout(new BorderLayout());
        bannerPanel.add(bannerLabel, BorderLayout.CENTER);

        frame.add(bannerPanel);
        frame.setSize(400, 100);
        frame.setDefaultCloseOperation(JFrame.EXIT_ON_CLOSE);

        timer = new Timer(100, new ActionListener() {
            @Override
            public void actionPerformed(ActionEvent e) {
                moveBanner();
            }
        });

        timer.start();
    }

    private void moveBanner() {
        bannerPosition++;
        if (bannerPosition > bannerText.length()) {
            bannerPosition = 0;
        }

        String displayText = bannerText.substring(bannerPosition) + bannerText.substring(0, bannerPosition);
        bannerLabel.setText(displayText);
    }

    public static void main(String[] args) {
        SwingUtilities.invokeLater(new Runnable() {
            public void run() {
                new Banner().frame.setVisible(true);
            }
        });
    }

}
