import java.util.Scanner;

public class BioskopWithScanner12 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        String nama, next;
        int baris, kolom;
        String[][] penonton = new String[4][2];
    
        while (true) {
            System.out.print("Masukkan nama: ");
            nama = sc.next();
            System.out.print("Masukkan baris: ");
            baris = sc.nextInt();
            System.out.print("Masukkan kolom: ");
            kolom = sc.nextInt();

            penonton[baris-1][kolom-1] = nama;

            System.out.print("Inputan penonton lainnya? (y/n): ");
            next = sc.next();

            if (next.equals("n")) {
                break;
            }
        }
    }
}
