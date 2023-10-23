import java.util.Scanner;

public class Lingkaran12 {
    public static void main(String[] args) throws Exception {
        Scanner inp = new Scanner(System.in);
        int r;
        double keliling, luas, phi=3.14;

        System.out.println("Masukkan Jari-jari:");
        r = inp.nextInt();
        keliling = 2*phi*r;
        luas = phi*r*r;

        System.out.println(keliling);
        System.out.println(luas);
    }
}
