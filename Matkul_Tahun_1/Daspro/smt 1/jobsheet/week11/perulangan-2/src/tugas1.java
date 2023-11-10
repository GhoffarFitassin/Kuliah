import java.util.Scanner;

public class tugas1 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n;

        // pertanyaan 1
        System.out.print("Masukkan inputan: ");
        n = sc.nextInt();
        if (n < 3) {
            System.out.println("Erorr!! Masukkan inputan minimal 3");
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
    }
}
