import java.util.Scanner;

public class Gaji12 {
    public static void main(String[] args) {
        Scanner inp = new Scanner(System.in);
        int jmlMasuk, jmlTdkMasuk, totGaji, gaji, potGaji;

        System.out.println("Masukkan Besaran Gaji ");
        gaji = inp.nextInt();
        System.out.println("Masukkan Potongan Gaji ");
        potGaji = inp.nextInt();
        System.out.println("Masukkan Jumlah Hari Masuk Kerja Anda ");
        jmlMasuk = inp.nextInt();
        System.out.println("Masukkan Jumlah Hari Tidak Masuk Kerja Anda ");
        jmlTdkMasuk = inp.nextInt();
        totGaji= (jmlMasuk*gaji)-(jmlTdkMasuk*potGaji);
        System.out.println("Gaji yang anda terima adalah " + totGaji);
    }
}
