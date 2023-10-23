import java.util.Scanner;

public class Segitiga12 {
    public static void main(String[] args) {
        Scanner input = new Scanner(System.in);
        int alas, tinggi;
        float luas;
        System.out.println("Masukkan alas: ");
        alas = input.nextInt();
        System.out.println("Masukkan tinggi: ");
        tinggi = input.nextInt();
        luas = alas * tinggi /2;
        System.out.println("Luas Segitiga = " + luas);
    }
}
