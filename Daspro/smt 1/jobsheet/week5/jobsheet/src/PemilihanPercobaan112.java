import java.util.Scanner;

public class PemilihanPercobaan112 {
    public static void main(String[] args) throws Exception {
        Scanner input12= new Scanner(System.in);

        System.out.print("Masukkan angka: ");
        int angka = input12.nextInt();

        if (angka % 2 == 0) {
            System.out.println("Angka " +angka+ " bilangan genap");
        } else {
            System.out.println("Angka " +angka+ " bilangan ganjil");
        }
    }
}
