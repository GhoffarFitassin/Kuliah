import java.util.Scanner;

public class tugas1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n;

        // pertanyaan 1
        System.out.print("Masukkan inputan: ");
        n = sc.nextInt();
        if (n < 3) {
            System.out.println("Masukkan inputan minimal 3");
        } else {
            for (int i = 1; i <= n; i++) {
                for (int j = n; j > i; j--) {
                    System.out.print(" ");
                }
                for (int k = 1; k <= i; k++) {
                    System.out.print(k);
                }
                System.out.println();
            }
        }

        // pertanyaan 2
        System.out.print("Masukkan inputan: ");
        n = sc.nextInt();
        for (int i = n; i > 0; i--) {
            for (int j = 0; j < i; j++) {
                System.out.print("*");
            }
            System.out.println();
        }
        // pertanyaan 3
        System.out.print("Masukkan inputan: ");
        n = sc.nextInt();
    }
}
