import java.util.Scanner;

public class tugas2 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n;

        // pertanyaan 2
        System.out.print("Masukkan inputan: ");
        n = sc.nextInt();
        if (n < 3) {
            System.out.println("Erorr!! Masukkan inputan minimal 3");
        } else {
            for (int i = n; i > 0; i--) {
                for (int j = 0; j < i; j++) {
                    System.out.print("*");
                }
                System.out.println();
            }
        }
    }
}
