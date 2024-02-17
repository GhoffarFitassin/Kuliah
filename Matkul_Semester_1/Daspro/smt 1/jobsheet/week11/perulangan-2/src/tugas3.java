import java.util.Scanner;

public class tugas3 {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n;
        
        // pertanyaan 3
        System.out.print("Masukkan inputan: ");
        n = sc.nextInt();
        int l = Integer.toString(n).length();
        if (n < 3) {
            System.out.println("Erorr!! Masukkan inputan minimal 3");
        } else {
            for (int i = 1; i <= n; i++) {
                if (i == 1 || i == n) {
                    for (int x = 1; x <= n; x++) {
                        System.out.print(n + " ");
                    }
                } else {
                    System.out.print(n);
                    for (int j = 1; j <= ((n - 1) * (l + 1)) - l; j++) {
                        System.out.print(" ");
                    }
                    System.out.print(n);
                }
                System.out.println();
            }

        }
    }
}
