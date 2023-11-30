import java.util.Scanner;

public class Percobaan3 {
    static double hitungLaba(double saldo, int tahun){
        if (tahun == 0) {
            return (saldo);
        } else {
            return (1.11 * hitungLaba(saldo, tahun - 1));
        }
    }
    public static void main(String[] args) {
        Scanner sc = new Scanner(System.in);

        int saldoawal, tahun;
        System.out.print("Jumlah saldo awal : ");
        saldoawal = sc.nextInt();
        System.out.print("Lamanya investasi (tahun) : ");
        tahun = sc.nextInt();
        System.out.print("Jumlah saldo setelah " + tahun + " tahun : ");
        System.out.print(hitungLaba(saldoawal, tahun));
    }
}
