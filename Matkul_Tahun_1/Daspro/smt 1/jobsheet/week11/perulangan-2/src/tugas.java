import java.util.Scanner;

public class tugas {
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int in;

        // pertanyaan 1
        System.out.print("Masukkan inputan: ");
        in = sc.nextInt(); 
        for (int i = 1; i <= in; i++) {
            for (int j = in; j > i; j--) {
                System.out.print(" ");
            }
            for (int k = 1; k<=i ; k++) {
                System.out.print(k);
            }
            System.out.println();
        }
        // pertanyaan 2
        System.out.print("Masukkan inputan: ");
        in = sc.nextInt(); 
        // pertanyaan 3
        System.out.print("Masukkan inputan: ");
        in = sc.nextInt(); 
    }
}
