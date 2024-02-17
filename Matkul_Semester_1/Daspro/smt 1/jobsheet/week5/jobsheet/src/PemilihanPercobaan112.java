import java.util.Scanner;

public class PemilihanPercobaan112 {
    public static void main(String[] args) throws Exception {
        Scanner input12= new Scanner(System.in);

        System.out.print("Masukkan angka: ");
        int angka = input12.nextInt();

        String result = (angka % 2 == 0) ? "genap" : "ganjil";
        System.out.println("Angka " + angka + " bilangan " + result);
}
}
