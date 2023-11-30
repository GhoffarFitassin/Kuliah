import java.util.Scanner;

public class Tugas3 {
    static boolean primaRekursif(int p, int f) {
        if (p == 0 || p == 1) {
            return false;
        } else if (p == f) {
            return true;
        } else if (p % f == 0) {
            return false;
        }
        return primaRekursif(p, f + 1);
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);
        int n = 25;
        // boolean isPrima = true;
        System.out.print("Masukkan bilangan: ");
        n = sc.nextInt();
        if (primaRekursif(n, 2)) {
            System.out.print(n + " Bilangan Prima");
        } else {
            System.out.print(n + " Bukan bilangan Prima");
        }
    }
}
