/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package neisha111023;

/**
 *
 * @author hp
 */
public class Enkrip1 {

    public static void main(String[] args) {
    
        String text = "Selamat Datang";
        String temp = "";
        int tambah = 2;
        for (int i = 0; i < text.length(); i++) {
            int h = (int) (text.charAt(i));
            char t = (char) (h + tambah);
            temp += t;
//            System.out.println(h);
        }
        System.out.println(temp);
    }
}
