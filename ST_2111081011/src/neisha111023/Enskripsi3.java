/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package neisha111023;

/**
 *
 * @author hp
 */
public class Enskripsi3 {

    public static void main(String[] args) {
    char[] kr = {'0', '1', '2', '3', '4', '5', '6', '7', '8', '9', ' ', ' ', 'a', 'b', 'c', 'd', 'e', 'f', 'g', 'h', 'i', 'j', 'k', 'l', 'm', 'n', 'o', 'p', 'q', 'r', 's', 't', 'u', 'v', 'w', 'x', 'y', 'z'};
    String bantul = "";
    String text = "Selamat Datang";

    int geser = 1;
    //enskripsi
    char[] cArray1 = (text.toCharArray());

    for (char c1 : cArray1){
    for (int i = 0; i<kr.length; i++) {
            if (c1 == kr[i]) {
                i = i+(geser);
                if (i>=kr.length) {
                    i = i-kr.length;
                }
                c1 = kr[i];
                bantul = bantul + c1;
            }
        }
    }
    System.out.println ("Sebelum :" + text);
    System.out.println ("Sesudah :" + bantul);
    }
}



























































































