import java.util.Scanner;

public class BioskopWithScanner12 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        String nama, next;
        int baris, kolom, pilih;
        boolean isMenu = true;
        boolean notMenu = false;
        String[][] penonton = new String[4][2];

        while (isMenu != false) {
            System.out.println("Menu 1: Input Data Penonton");
            System.out.println("Menu 2: Tampil Daftar Penonton");
            System.out.println("Menu 3: Exit");
            System.out.print("Pilih menu:  ");
            pilih = sc.nextInt();
            switch (pilih) {
                case 1:
                    isMenu = false;
                    do {
                        System.out.print("Masukkan nama: ");
                        nama = sc.next();
                        System.out.print("Masukkan baris: ");
                        baris = sc.nextInt();
                        System.out.print("Masukkan kolom: ");
                        kolom = sc.nextInt();
                        if (baris > penonton.length || kolom > penonton.length) {
                            System.out.println("Kursi Tidak Tersedia!");
                            notMenu = true;
                            continue;
                        }
                        if (penonton[baris - 1][kolom - 1] != null) {
                            System.out.println("Kursi Sudah Terisi!");
                            notMenu = true;
                            continue;
                        }
                        penonton[baris - 1][kolom - 1] = nama;
                        System.out.print("Inputan penonton lainnya? (y/n): ");
                        next = sc.next();
                        if (next.equals("n")) {
                            notMenu = false;
                            isMenu = true;
                        } else {
                            isMenu = false;
                            notMenu = true;
                        }
                    } while (notMenu != false);
                    break;
                case 2:
                    isMenu = false;
                    do {
                        System.out.println("==================================================");
                        System.out.println("\t\tDaftar Penonton");
                        for (int i = 0; i < penonton.length; i++) {
                            for (int j = 0; j < penonton[i].length; j++) {
                                if (penonton[i][j] == null) {
                                    penonton[i][j] = "***";
                                }
                            }
                            System.out.println("Penonton pada baris ke-" + (i + 1) + ": " + String.join(", ", penonton[i]));
                        }
                        System.out.println("==================================================");
                        System.out.print("Kembali ke Menu Utama?? (y/n): ");
                        next = sc.next();
                        if (next.equals("y")) {
                            notMenu = false;
                            isMenu = true;
                        }
                    } while (notMenu != false);
                    break;
                case 3:
                    isMenu = false;
                    System.out.println("Terima Kasih (^_^)");
            }
        }
    }
}
