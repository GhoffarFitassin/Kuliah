import java.util.Scanner;

public class HargaBayar12 {
    public static void main(String[] args) {
        Scanner inp = new Scanner(System.in);
        int harga, jumlah, jmlHalBuku;
        String merk;
        double dis, total, bayar, jmlDis;

        System.out.println("Masukkan Merek Buku");
        merk=inp.next();
        System.out.println("Masukkan jumlah halaman buku yang dibeli");
        jmlHalBuku=inp.nextInt();
        System.out.println("Masukkan harga buku yang dibeli");
        harga=inp.nextInt();
        System.out.println("Masukkan jumlah buku yang dibeli");
        jumlah=inp.nextInt();
        System.out.println("Masukkan diskon buku yang dibeli");
        dis=inp.nextDouble();

        total=harga*jumlah;
        jmlDis=total*dis;
        bayar=total-jmlDis;
        System.out.println("Diskon yang anda dapatkan adalah " +jmlDis);
        System.out.println("jumlah yang harus dibayar pada buku merk " + merk + " dengan jumlah halaman " +jmlHalBuku+ " adalah " +bayar);
    }
}
